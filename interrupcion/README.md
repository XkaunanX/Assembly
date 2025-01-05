# Interrupciones

Las interrupciones son mecanismos que permiten que el procesador interrumpa su flujo de ejecucion normal para atender una solicitud especial, como la entrada/salida de datos o la gestion de errores.

## Interrupciones de Software

Las interrupciones de software son generadas por el propio programa mediante instrucciones específicas. Estas interrupciones son utilizadas para solicitar servicios del sistema operativo o realizar otras tareas críticas. A través de las interrupciones de software, los programas pueden ejecutar funciones que requieren acceso al sistema, como operaciones de entrada/salida o la gestión de recursos del sistema.

```plaintext
+---------------------------+
|     Usuario / Aplicación  |
+---------------------------+
           |
 (Interrupción de software)
           |
           v
+---------------------------+     (Llamada al sistema)
|    Espacio de Usuario     |--------------------------+
+---------------------------+                          |
           |                                           v
           v                                   +---------------------------+
+---------------------------+                  |      Kernel (núcleo)      |
|    Interrupción de        |----------------> |     Espacio del Kernel    |
|     Software (Syscall)    |                  +---------------------------+
+---------------------------+                          |
           |                                           |
           v                                           v
+---------------------------+                  +---------------------------+
|  Ejecución del Sistema    |                  |   Acceso a Hardware       |
|  (funciones del sistema)  |                  +---------------------------+
+---------------------------+
```

## Vectores de Interrupción

El 8086 tiene una tabla de vectores de interrupción, que es un conjunto de direcciones de memoria que apuntan a las rutinas encargadas de gestionar cada interrupción. Cada vector corresponde a un tipo de interrupción, y cuando se genera una interrupción, el procesador consulta esta tabla para determinar qué rutina debe ejecutarse.

```plaintext
+---------------------------------------------------------------+
| Tabla de Vectores de Interrupción del 8086                    |
+---------------------------------------------------------------+
| Vector | Dirección de la Rutina de Interrupción                |
+---------------------------------------------------------------+
| 0x00   | Dirección de la rutina para la interrupción 0x00     |
| 0x01   | Dirección de la rutina para la interrupción 0x01     |
| 0x02   | Dirección de la rutina para la interrupción 0x02     |
| 0x03   | Dirección de la rutina para la interrupción 0x03     |
| 0x04   | Dirección de la rutina para la interrupción 0x04     |
| 0x05   | Dirección de la rutina para la interrupción 0x05     |
| 0x06   | Dirección de la rutina para la interrupción 0x06     |
| 0x07   | Dirección de la rutina para la interrupción 0x07     |
| ...    | ...                                                   |
| 0xFF   | Dirección de la rutina para la interrupción 0xFF     |
+---------------------------------------------------------------+
```

## Rutinas de Interrupción

Cuando ocurre una interrupción, el procesador guarda el contexto actual de la ejecución y salta a la dirección de la rutina asociada con la interrupción correspondiente. Esta rutina es responsable de manejar el evento de la interrupción. Después de ejecutar la rutina, el procesador retorna al flujo de ejecución original, restaurando el contexto previo a la interrupción.

```plaintext
+------------------+       +------------------+
|    Nuevo         |------>|    Listo         |
+------------------+       +------------------+
                                    |
                                    v
                           +------------------+         +------------------+
                           |   En Ejecucion   |  -->    |   Terminado      |
                           +------------------+         +------------------+
                              |          ^
                              v          |
                           +------------------+
                           |   Bloqueado      |
                           +------------------+                      
```

## Proceso de Carga y Ejecución de una Interrupción en 8086

#### Cargar la Interrupción en AH
Para ejecutar una interrupción en el 8086, primero se debe cargar el número de la interrupción en el registro **AH** o en un registro específico según la interrupción que se desea generar. El número de la interrupción generalmente corresponde a un valor entre 0 y 255, que es el identificador de la rutina de interrupción deseada.

Por ejemplo, para cargar el número de la interrupción en AH:

- El registro **AH** es utilizado para almacenar el número de la interrupción que se desea ejecutar.
- El número de interrupción es almacenado en **AH**, mientras que **AL** y otros registros pueden usarse para pasar parámetros a la rutina de interrupción.

### Ejecutar la Interrupción
Una vez que el número de la interrupción se ha cargado en el registro **AH**, el siguiente paso es ejecutar la interrupción mediante la instrucción **`INT`** (Interrupt). La instrucción `INT` genera una interrupción software que consulta la tabla de vectores de interrupción para determinar la rutina que debe ser ejecutada.

Cuando se ejecuta la instrucción `INT`, el procesador guarda su contexto actual (como los registros y el contador de programa) y salta a la dirección de memoria que está asociada al número de interrupción que se ha cargado previamente. Esta dirección está definida en la tabla de vectores de interrupción.

La rutina de interrupción es responsable de manejar el evento (como una solicitud de entrada/salida, una operación matemática, etc.). Una vez que la rutina ha completado su tarea, el procesador retoma la ejecución normal del programa, restaurando el contexto que había guardado antes de la interrupción.

### Ejemplo de Secuencia
1. Cargar el número de la interrupción en AH (por ejemplo, cargar `0x21` para manejar una interrupción del sistema de E/S).
2. Ejecutar la instrucción `INT` con el número cargado en AH.
3. El procesador salta a la rutina de interrupción correspondiente.
4. Una vez completada la rutina de interrupción, el procesador retorna al punto donde fue interrumpido.

## Lista de interrupciones comunes

## 1. **Interrupción INT 21h**

La interrupción `INT 21h` es una de las más comunes en el 8086. Esta interrupción se utiliza para realizar diversas funciones de sistema operativo relacionadas con:

- Entrada/salida de caracteres
- Manejo de archivos (crear, eliminar, abrir, cerrar)
- Control de dispositivos de entrada/salida
- Gestión de memoria
- Funciones de consola y pantalla

Es la interrupción más utilizada en DOS.

## 2. **Interrupción INT 10h**

La interrupción `INT 10h` se utiliza para funciones relacionadas con la gestión del video, como:

- Cambiar el modo gráfico
- Manipulación del cursor (mover, ocultar, mostrar)
- Escribir texto en la pantalla
- Leer la posición del cursor
- Control de la paleta de colores

Es esencial para la manipulación de la pantalla en sistemas de gráficos o consola.

## 3. **Interrupción INT 13h**

La interrupción `INT 13h` se utiliza para funciones relacionadas con discos duros, disquetes y almacenamiento en general. Algunas de sus funciones incluyen:

- Leer y escribir sectores en discos
- Formatear discos
- Detectar el tipo de unidad de disco
- Obtener el número de serie de un disco

Es crucial para el manejo del almacenamiento y la interacción con los dispositivos de disco en sistemas operativos.

## 4. **Interrupción INT 14h**

La interrupción `INT 14h` se usa para la comunicación a través de puertos serie, como en puertos COM1, COM2, etc. Algunas de las funciones que ofrece son:

- Leer y escribir datos a través del puerto serie
- Configuración de la velocidad de transmisión (baud rate)
- Manejo de errores en la comunicación serie

Es fundamental para el manejo de dispositivos como módems y terminales de texto.

## 5. **Interrupción INT 0Dh (División por Cero)**

La interrupción `INT 0Dh` se activa cuando ocurre un error matemático de división por cero. Cuando el procesador intenta realizar una operación de división y el divisor es cero, se genera esta interrupción. El procesador detiene la ejecución y transfiere el control a la rutina de manejo de errores.

## 6. **Interrupción INT 08h (Temporizador del Sistema)**

La interrupción `INT 08h` está relacionada con el temporizador del sistema. Esta interrupción se genera automáticamente a intervalos regulares para proporcionar una base para la temporización del sistema. Es utilizada principalmente para realizar tareas de programación de tiempo y mantener la sincronización del sistema.

## 7. **Interrupción INT 09h (Teclado)**

La interrupción `INT 09h` está asociada con la lectura de teclas del teclado. Se genera cuando se presiona una tecla y el sistema necesita procesar la entrada del teclado. Permite la gestión de la entrada de texto, así como la detección de teclas especiales como "Shift", "Ctrl", "Alt" y las teclas de función.

## 8. **Interrupción INT 04h (Desbordamiento de Pila)**

La interrupción `INT 04h` se activa cuando ocurre un desbordamiento de pila (stack overflow). Esto sucede si se realizan demasiadas llamadas a funciones recursivas o se almacenan más datos en la pila de lo que puede manejar. El procesador interrumpe la ejecución y transfiere el control a la rutina de manejo de errores asociada.

## 9. **Interrupción INT 0Ah (Desbordamiento de BCD)**

La interrupción `INT 0Ah` se activa cuando se produce un desbordamiento de BCD (Binary Coded Decimal). Se refiere a la condición en la que los valores de los números decimales codificados en binario exceden el rango que puede manejar el procesador. Esta interrupción es especialmente relevante en sistemas que trabajan con datos en formato BCD.

## 10. **Interrupción INT 1Bh (Control de Puertos Paralelos)**

La interrupción `INT 1Bh` se utiliza para interactuar con puertos paralelos, como aquellos usados para impresoras. Permite el control y manejo de la comunicación con dispositivos conectados a puertos paralelos, facilitando operaciones como la escritura y lectura de datos.

