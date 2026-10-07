Porting de display.c (Mbed → STM32 HAL)
Mbed (original)	STM32 (portado)
DigitalOut displayD4( D4 ); … displayEn( D9 );	Pines configurados en tdse-tp3_01-porting_c_code.ioc como GPIO_Output con User Label D4…D9 (D4_Pin / D4_GPIO_Port … en main.h)
displayD4 = value;	HAL_GPIO_WritePin(D4_GPIO_Port, D4_Pin, (GPIO_PinState)(value != 0));
delay( X ); con X > 1 ms (en displayInit())	HAL_Delay( X );
delay( 1 ); dentro de displayInit()	HAL_Delay( 1 );
delay( 1 ); fuera de displayInit()	systick_delay_us( DISPLAY_DEL_37US );

Asignación de pines (modo 4 bits):

Señal LCD	Pin Arduino	Pin STM32
D4	D4	PB5
D5	D5	PB4
D6	D6	PB10
D7	D7	PA8
RS	D8	PA9
E	D9	PC7
RW	GND	—
Paso 10 – Depuración y verificación

En el LCD se verifica:

Al iniciar: Línea 1 "LCD Display Test", Línea 2 " Porting C code ".
Luego, cada 1 s: Línea 2 "Test Nro: X*****", con X incrementándose cada segundo (por ejemplo, se observó "Test Nro: 109***").
Valores medidos de task_dta_list[index]

Medidos luego de 245066 ejecuciones de app_update() (≈ 245 s de ejecución). Tiempos en µs.

index	Tarea	NOE	LET [µs]	BCET [µs]	WCET [µs]
0	task_test	245066	2	2	37
1	task_display	245066	2	2	6241

g_app_runtime_us = 4 µs (tiempo total de la última pasada del ejecutor cíclico).

Referencias:

NOE: Number of Executions.
LET: Last Execution Time.
BCET: Best-Case Execution Time.
WCET: Worst-Case Execution Time.
Análisis de las restricciones temporales del ejecutor cíclico

El ejecutor cíclico corre todas las tareas cada 1 ms (tick del SysTick), por lo que para cumplir la restricción temporal la suma de los WCET de las tareas debe ser menor que el período:

$$\sum WCET_i < T_{tick} = 1000\ \mu s$$

Con los valores medidos:

$$WCET_{test} + WCET_{display} = 37\ \mu s + 6241\ \mu s = 6278\ \mu s \gg 1000\ \mu s$$

La restricción temporal NO se cumple.

task_test cumple ampliamente: su peor caso (37 µs) ocurre una vez por segundo, cuando formatea el número con snprintf() y envía los mensajes a la interfaz del display.
task_display es la que viola la restricción. En estado ST_DSP_IDLE tarda solo ~2 µs (BCET), pero cuando recibe el evento de actualización redibuja las dos líneas completas en una sola ejecución: 2 posicionamientos de cursor + 32 caracteres. Cada escritura en modo 4 bits son dos nibbles con pulsos de Enable y demoras bloqueantes de 37 µs (≈ 4 × 37 µs = 148 µs por carácter solo en demoras), más el overhead de las llamadas a HAL_GPIO_WritePin(). Esto da el WCET medido de ≈ 6,24 ms, es decir, más de 6 períodos del ejecutor.

Consecuencias:

Una vez por segundo, la pasada del ejecutor se extiende ≈ 6,3 ms. Durante ese tiempo se acumulan ≈ 6 ticks pendientes en g_app_tick_cnt, que app_update() procesa luego en ráfaga (varias pasadas seguidas). No se pierden ticks, pero las tareas se ejecutan con retardo y jitter de hasta ~6 ms respecto de su instante nominal.
Cualquier otra tarea que requiera respuesta en cada tick (por ejemplo, lectura de botones/teclado en las actividades siguientes) quedaría bloqueada durante ese intervalo.

Conclusión: el driver portado funciona correctamente, pero su uso bloqueante dentro de task_display no es compatible con un ejecutor cíclico de 1 ms. La solución, que se aborda en la Actividad 02, es codificar task_display como una máquina de estados no bloqueante que escriba en el display una instrucción o un dato por vez, cada 1 ms, de modo que su WCET quede por debajo del período del tick.
