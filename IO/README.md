**IN**
   - La instrucción `IN` se utiliza para **leer datos desde un puerto de entrada** (I/O).
   - El procesador lee el valor de un puerto de entrada especificado y lo coloca en un registro. Los puertos de entrada y salida se utilizan para interactuar con dispositivos como teclados, pantallas, y otros periféricos.
   - La sintaxis básica de `IN` es:
     ```assembly
     IN AL, puerto  ; Lee un byte desde el puerto especificado y lo coloca en AL
     ```
   - Ejemplo:
     ```assembly
     IN AL, 60h      ; Lee un byte desde el puerto 60h (generalmente usado para teclado)
     ```

**OUT**
   - La instrucción `OUT` se utiliza para **enviar datos a un puerto de salida**.
   - El procesador toma el valor de un registro y lo envía al puerto de salida especificado, permitiendo la comunicación con dispositivos externos.
   - La sintaxis básica de `OUT` es:
     ```assembly
     OUT puerto, AL  ; Envía el valor en AL al puerto especificado
     ```
   - Ejemplo:
     ```assembly
     OUT 60h, AL     ; Envía el valor en AL al puerto 60h (generalmente usado para teclado)
     ```

**Resumen:**
- **IN** lee datos desde un puerto de entrada y los coloca en un registro.
- **OUT** envía datos desde un registro a un puerto de salida.

**Ejemplo de IN y OUT:**
```assembly
IN AL, 60h   ; Lee un byte desde el puerto 60h y lo coloca en AL
OUT 60h, AL  ; Envía el valor de AL al puerto 60h