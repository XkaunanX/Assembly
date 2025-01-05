# Interrupciones

Las interrupciones son mecanismos que permiten que el procesador interrumpa su flujo de ejecucion normal para atender una solicitud especial, como la entrada/salida de datos o la gestion de errores.

### 2. Interrupciones de Software

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

### Vectores de Interrupción

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

### Rutinas de Interrupción

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

### Cargar la Interrupción en AH
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

### Interrupciones assemby 8086

1. **Interrupcion INT 21h**
La interrupcion `INT 21h` es una de las mas comunes en el 8086 y se usa para realizar diversas funciones relacionadas con la entrada/salida, el manejo de archivos, y la gestion de memoria.

Existen diferentes funciones que se activan al colocar un valor especifico en el registro `AH`.

3. **Interrupcion INT 10h**
La interrupcion `INT 10h` se utiliza para funciones de video, como el cambio de modo grafico, la manipulacion del cursor, y la escritura en la pantalla.

4. **Interrupcion INT 13h**
La interrupcion `INT 13h` se usa para funciones relacionadas con discos duros, disquetes y la gestion de almacenamiento. Permite leer y escribir sectores en discos.

5. **Interrupcion INT 14h**
La interrupcion `INT 14h` se usa para manejar comunicaciones serie, como la lectura y escritura a traves de puertos serie (COM1, COM2, etc.).


6. **Interrupcion INT 0Dh (Division por cero)**
La interrupcion `INT 0Dh` es un tipo de interrupcion de **error**, que se activa cuando ocurre una division por cero, es decir, cuando un numero se intenta dividir por cero.
El procesador interrumpe la ejecucion y transfiere el control a la rutina de manejo de errores asociada.

