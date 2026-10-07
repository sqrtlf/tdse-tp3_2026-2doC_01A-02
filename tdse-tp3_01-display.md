Se dividirá el desarrollo en tres fases técnicas fundamentales: configuración de hardware, modelado de comportamiento y adaptación del código fuente.

## 1. System Setup (Configuración base)

El primer paso es preparar la capa física en STM32CubeIDE para que el microcontrolador pueda comunicarse con la pantalla de forma eficiente.

* **Identificar la interfaz:** Determina si el LCD utiliza un bus de datos paralelo (que requiere múltiples pines GPIO), o un bus serie como I2C o SPI.
* **Configuración del periférico:** Abre el archivo de configuración `.ioc` de tu proyecto, habilita el protocolo correspondiente y ajusta las velocidades de reloj según la hoja de datos (*datasheet*) del LCD.
* **Generación de código:** Al guardar, el motor inicializará los periféricos a través de la Capa de Abstracción de Hardware (HAL) dejándolos listos para transmitir.

## 2. Statechart (Modelado de Estados)

Para mantener las buenas prácticas de la materia y evitar bloquear el procesador con bucles de espera estáticos (`HAL_Delay`), diseñaremos una Máquina de Estados Finitos (FSM) utilizando Itemis Create.

* **Estado de Inicialización (Init):** Gobernarás la secuencia estricta de comandos (encendido, configuración del cursor, limpieza de pantalla) requerida al arrancar.
* **Estado de Reposo (Idle):** El sistema esperará pasivamente a que un evento o temporizador le indique que existe nueva información para mostrar.
* **Estado de Escritura (Update):** El sistema gestionará el envío de caracteres manejando los retardos lógicos de forma asíncrona mediante el conteo de *ticks*.

## 3. C Coding (Porting y Abstracción)

El concepto central del *porting* es lograr que una librería genérica de LCD funcione en tu hardware específico sin contaminar la lógica pura con código propietario de ST.

* **Aislamiento de lógica:** Las rutinas del display (posicionar el cursor, imprimir texto) deben permanecer genéricas y estándar.
* **Creación de Wrappers (Puentes):** Debes escribir funciones intermedias que conecten las órdenes genéricas de la librería con las llamadas físicas reales (por ejemplo, encapsular `HAL_I2C_Master_Transmit` o la manipulación de pines GPIO dentro de una función genérica `lcd_write_byte`).
* **Integración final:** Vincula el código C exportado de tu statechart dentro de tu función principal de actualización para que asuma el control lógico del periférico.
