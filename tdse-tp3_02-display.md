El sistema implementa una arquitectura de planificación cooperativa basada en eventos y tiempo (Event-Triggered System), donde el microcontrolador gestiona la ejecución periódica de tareas y la comunicación con un display LCD aislando la lógica de aplicación de la manipulación del hardware.

**Arquitectura Base y Planificación**

* **app.c y app_it.c:** Conforman el núcleo del planificador. El sistema inicializa una lista de tareas (`task_cfg_list`) y utiliza la interrupción del temporizador del hardware (SysTick) para decrementar un contador global (`g_app_tick_cnt`), determinando cuándo deben ejecutarse las funciones de actualización en el bucle principal. También calcula y registra el tiempo de ejecución en el mejor y peor de los casos (BCET y WCET) para cada tarea.


* **systick.c:** Provee una función de retardo bloqueante a nivel de microsegundos (`systick_delay_us`) leyendo continuamente el registro físico del contador SysTick para calcular el tiempo transcurrido.


* **display.c y display.h:** Constituyen el *driver* de bajo nivel para el hardware del LCD. Implementan la secuencia estándar de inicialización y las rutinas para escribir comandos o caracteres manipulando los niveles eléctricos de los pines de control (RS, EN, RW) y el bus de datos (D4-D7).



**Lógica de Aplicación y Abstracción**

* **task_display_attribute.h y task_test_attribute.h:** Definen las variables de control, los eventos, las enumeraciones de estados y un buffer de memoria de 2 filas por 16 columnas (`ddram`) que simula la pantalla internamente.


* **task_display_interface.c:** Actúa como un puente de comunicación seguro. Expone la función `put_event_task_display` para que cualquier tarea externa pueda insertar cadenas de texto en el buffer interno del display y levantar una bandera (`flag = true`) notificando que hay nueva información pendiente de ser procesada.



**Comportamiento de task_test_statechart(void)**
Esta función opera como un generador de estímulos temporizados. En cada llamada, incrementa un contador global de iteraciones y decrementa una variable de retardo (`tick`). Cuando la variable `tick` llega a cero, el ciclo se reinicia y la función formatea el número de iteraciones en una cadena de texto, enviándola de forma asíncrona hacia el buffer de la segunda línea de la pantalla mediante llamadas a `put_event_task_display`.

**Comportamiento de task_display_statechart(void)**
Esta rutina implementa una máquina de estados finitos (FSM) no bloqueante encargada de refrescar el hardware físico del LCD basándose en eventos.

* **Estado ST_DSP_IDLE:** La máquina permanece pasiva evaluando constantemente si la bandera de actualización (`p_task_display_dta->flag`) fue encendida y si el evento reportado es `EV_DSP_UPDATE`. De cumplirse ambas condiciones, transita al estado de actualización.


* **Estado ST_DSP_UPDATE:** Al ingresar, la tarea apaga inmediatamente la bandera para evitar re-entradas. Luego, resetea sus coordenadas y utiliza las funciones del *driver* (`displayCharPositionWrite` y `displayStringWrite`) para transferir físicamente los caracteres almacenados en su memoria interna (`ddram`) hacia la pantalla real. Una vez completada la transmisión, retorna al estado de reposo.
