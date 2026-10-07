# TP3 – Actividad 04 – System Setup Menu Statechart (C coding)

Proyecto STM32: `tdse-tp3_03-system_setup_menu`

## Paso 01 – Importación, conexionado y verificación del proyecto base

Se importó y compiló el proyecto `tdse-tp3_03-system_setup_menu`. Se conectaron el LCD Display (modo 4 bits, igual que en la Actividad 01) y el teclado de membrana 1 x 4 teclas a la placa NUCLEO-F103RB.

Mediante la depuración se verificó que:

- Al iniciar, `task_system_init()` envía a la interfaz del LCD Display:
  - Línea 1: `"task_system_mode"`
  - Línea 2: `" NORMAL "`
- Al mantener oprimido el botón **B1 USER (Blue PushButton)**, el led **LD2 (Green Led)** se enciende, y al soltarlo se apaga.
- Al oprimir B1, `task_system_update()` alterna el mensaje de la línea 2 entre `" NORMAL "` y `" SETUP "`, y los mensajes se ven correctamente en el LCD Display.

## Paso 03 – Codificación en C del statechart `system_setup_menu`

Se codificó en C el diagrama de estado del modelo `system_setup_menu` (generado en la Actividad 03, Paso 04), según `system_setup_menu.png`.

Archivos modificados:

- `app/src/task_sensor.c`
- `app/inc/task_sensor_attribute.h`
- `app/src/task_system.c`
- `app/inc/task_system_attribute.h`

### Eventos

Los eventos del modelo los genera `task_sensor`, que lee por polling las teclas del teclado de membrana y aplica un statechart de antirrebote de 50 ms por tecla. Al confirmarse la pulsación encola en `task_system` el evento correspondiente:

| Tecla | Evento |
| :-- | :-- |
| Enter | `EV_SYS_ENTER` |
| Next | `EV_SYS_NEXT` |
| Escape | `EV_SYS_ESCAPE` |

El botón B1 sigue generando `EV_SYS_BTN_A`, pero el statechart del menú no tiene transiciones para ese evento y lo descarta. Por eso, con el código nuevo, B1 ya no alterna NORMAL/SETUP ni enciende LD2.

Cambios en `task_sensor.c`:

- Se agregaron las teclas Enter, Next y Escape a `task_sensor_cfg_list[]`.
- Se eliminó el `for` interno de `task_sensor_statechart(index)`, que ignoraba el parámetro `index` y procesaba los 4 botones en cada llamada. Como `task_sensor_update()` ya recorre los botones, cada statechart se ejecutaba 4 veces por tick y el antirrebote efectivo era de ≈ 12,5 ms en lugar de 50 ms.
- Al soltar una tecla ya no se encola `EV_SYS_IDLE` en `task_system`.

### Estados

| Estado | Nivel | Línea 1 | Línea 2 |
| :-- | :-- | :-- | :-- |
| `ST_SYS_MAIN` | Main | `M1: ON , 8, L` | `M2: ON , 8, L` |
| `ST_SYS_MENU_1` | Menu #1 | `Menu #1: Motor` | `> Motor 1` / `> Motor 2` |
| `ST_SYS_MENU_2` | Menu #2 | `Menu #2: Param` | `> Power` / `> Speed` / `> Spin` |
| `ST_SYS_MENU_3` | Menu #3 | `Menu #3: Value` | `> ON`/`> OFF`, `> 0`…`> 9`, `> LEFT`/`> RIGHT` |

Transiciones:

- **Enter:** Main → Menu #1 → Menu #2 → Menu #3. En Menu #3 guarda el valor editado y vuelve a Menu #2.
- **Next:** cambia de opción dentro del nivel, en forma circular (Motor 1 ↔ 2; Power → Speed → Spin; ON ↔ OFF, 0 → … → 9 → 0, LEFT ↔ RIGHT).
- **Escape:** vuelve al nivel anterior. En Menu #3 descarta el valor editado.

### Variables y estructuras

```c
typedef struct {
    power_t  power;   /* POWER_OFF / POWER_ON   */
    uint32_t speed;   /* 0 .. 9                 */
    spin_t   spin;    /* SPIN_LEFT / SPIN_RIGHT */
} motor_cfg_t;
```

En `task_system_dta_t` se agregaron:

- `motors[2]`: arreglo de estructuras con la configuración de cada motor (inicial: ON, 8, L).
- `motor_idx`: motor seleccionado en Menu #1 (0 o 1).
- `param_idx`: parámetro seleccionado en Menu #2 (0 = Power, 1 = Speed, 2 = Spin).
- `temp_val`: copia de trabajo del valor en edición en Menu #3. Se carga al entrar, se modifica con Next y solo se copia a `motors[motor_idx]` con Enter; con Escape se descarta.

Cada pantalla se escribe con una función auxiliar que completa la línea con espacios hasta 16 caracteres, para borrar el contenido anterior del LCD. Las líneas se guardan en buffers estáticos, de modo que siguen siendo válidas cuando `task_display` las procesa en ticks posteriores.

## Paso 04 – Depuración y verificación de restricciones temporales

Mediante la depuración se verificó en el LCD Display:

- Al iniciar se muestra la pantalla Main con la configuración de ambos motores.
- Enter, Next y Escape recorren los cuatro niveles del menú según el diagrama.
- Los valores guardados con Enter en Menu #3 se reflejan en la pantalla Main; los descartados con Escape no.

### Valores medidos de `task_dta_list[index]`

Durante la medición se recorrieron todos los niveles del menú con Enter, Next y Escape, guardando y descartando valores, para ejercitar los caminos de ejecución más costosos.

Medidos luego de ≈ 389 000 ejecuciones de `app_update()` (≈ 389 s de ejecución). Tiempos en **µs**.

| index | Tarea | NOE | LET [µs] | BCET [µs] | WCET [µs] |
| :---: | :-- | ---: | ---: | ---: | ---: |
| 0 | `task_sensor` | 389303 | 13 | 13 | 14 |
| 1 | `task_system` | 389318 | 2 | 2 | 190 |
| 2 | `task_actuator` | 389339 | 2 | 2 | 3 |
| 3 | `task_display` | 389209 | 2 | 2 | 78 |

`g_app_runtime_us` = 19 µs (= 13 + 2 + 2 + 2, suma de los LET de la última pasada del ejecutor cíclico).

Nota: los valores de NOE difieren levemente entre tareas porque fueron leídos con el programa en ejecución (en distintos instantes).

Referencias:
- **NOE**: Number of Executions.
- **LET**: Last Execution Time.
- **BCET**: Best-Case Execution Time.
- **WCET**: Worst-Case Execution Time.

### Análisis de las restricciones temporales del ejecutor cíclico

Para cumplir la restricción temporal, la suma de los WCET de todas las tareas debe ser menor que el período del tick:

$$\sum WCET_i < T_{tick} = 1000\ \mu s$$

Con los valores medidos:

$$\sum WCET_i = 14 + 190 + 3 + 78 = 285\ \mu s < 1000\ \mu s$$

**La restricción temporal se cumple**, con una utilización del período en el peor caso medido de 28,5 % y una holgura de 715 µs. En el caso típico (sin eventos) la utilización es de 19 µs / 1000 µs ≈ 1,9 %.

- `task_system` es la tarea de mayor WCET (190 µs). Ese valor ocurre solo en las transiciones del menú, cuando da formato a las líneas con `vsnprintf` y encola dos mensajes para el display. Sin eventos solo consulta su cola y retorna (2 µs).
- `task_display` tiene un WCET de 78 µs porque escribe en el LCD una sola instrucción o dato por tick (código no bloqueante). Si escribiera líneas completas con el driver bloqueante, su WCET sería de varios milisegundos (≈ 6,2 ms según lo medido en la Actividad 01) y la restricción dejaría de cumplirse.
- `task_sensor` tiene un tiempo prácticamente constante (13–14 µs), ya que en cada tick lee por polling todas las teclas y actualiza su statechart de antirrebote.
- `task_actuator` tiene un costo despreciable (≤ 3 µs).

### Comparación con la medición previa

En una medición anterior, sin navegar el menú, se obtuvo:

| index | Tarea | BCET [µs] | WCET [µs] |
| :---: | :-- | ---: | ---: |
| 0 | `task_sensor` | 42 | 42 |
| 1 | `task_system` | 2 | 2 |
| 2 | `task_actuator` | 2 | 2 |
| 3 | `task_display` | 2 | 2 |

Diferencias con la medición actual:

- **`task_sensor` bajó de 42 µs a 13–14 µs.** Esto es consistente con la eliminación del `for` interno de `task_sensor_statechart()`, que hacía procesar cada botón 4 veces por tick.
- **En la medición previa se obtuvo WCET = BCET en todas las tareas**, porque no se generaron eventos y cada tarea recorrió siempre el mismo camino. Ese WCET no representaba el peor caso real. En la medición actual, al navegar el menú, aparecen los WCET de `task_system` (190 µs) y `task_display` (78 µs).

El WCET informado sigue siendo el **peor caso observado**, no una cota garantizada. La holgura de 715 µs da un margen amplio ante caminos de ejecución no observados.