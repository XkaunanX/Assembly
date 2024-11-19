Interrupciones Comunes en Assembly 8086

Las interrupciones son mecanismos que permiten que el procesador interrumpa su flujo de ejecución normal para atender una solicitud especial, como la entrada/salida de datos o la gestión de errores. En Assembly 8086, las interrupciones más comunes se usan para manejar funciones del sistema operativo y controlar dispositivos de hardware.

1. **Interrupción INT 21h**
   - La interrupción `INT 21h` es una de las más comunes en el 8086 y se usa para realizar diversas funciones relacionadas con la entrada/salida, el manejo de archivos, y la gestión de memoria.
   - Existen diferentes funciones que se activan al colocar un valor específico en el registro `AH`.
   - **Sintaxis:**
     ```assembly
     INT 21h  ; Llama a la interrupción del DOS para realizar una operación
     ```
   - **Algunas funciones comunes de `INT 21h`:**
     - **AH = 01h**: Leer un carácter desde el teclado.
       ```assembly
       MOV AH, 01h
       INT 21h  ; Lee un carácter del teclado
       ```
     - **AH = 02h**: Imprimir un carácter en la pantalla.
       ```assembly
       MOV AH, 02h
       MOV DL, 'A'  ; Carácter a imprimir
       INT 21h      ; Imprime el carácter en la pantalla
       ```
     - **AH = 4Ch**: Terminar el programa.
       ```assembly
       MOV AH, 4Ch
       INT 21h  ; Termina el programa y regresa al sistema operativo
       ```

2. **Interrupción INT 10h**
   - La interrupción `INT 10h` se utiliza para funciones de video, como el cambio de modo gráfico, la manipulación del cursor, y la escritura en la pantalla.
   - **Sintaxis:**
     ```assembly
     INT 10h  ; Llama a la interrupción de video para realizar una operación
     ```
   - **Algunas funciones comunes de `INT 10h`:**
     - **AH = 00h**: Establecer el modo de video.
       ```assembly
       MOV AH, 00h
       MOV AL, 03h  ; Modo de texto 80x25
       INT 10h      ; Cambia al modo de video 80x25
       ```
     - **AH = 02h**: Mover el cursor.
       ```assembly
       MOV AH, 02h
       MOV BH, 00h  ; Página de pantalla
       MOV DH, 10h  ; Fila (línea)
       MOV DL, 20h  ; Columna (carácter)
       INT 10h      ; Mueve el cursor
       ```

3. **Interrupción INT 13h**
   - La interrupción `INT 13h` se usa para funciones relacionadas con discos duros, disquetes y la gestión de almacenamiento. Permite leer y escribir sectores en discos.
   - **Sintaxis:**
     ```assembly
     INT 13h  ; Llama a la interrupción de disco
     ```
   - **Algunas funciones comunes de `INT 13h`:**
     - **AH = 02h**: Leer un sector desde un disco.
       ```assembly
       MOV AH, 02h
       MOV AL, 01h  ; Número de sectores a leer
       MOV CH, 00h  ; Cilindro
       MOV CL, 02h  ; Número del sector
       MOV DH, 00h  ; Cabeza del disco
       MOV DL, 80h  ; Unidad de disco (por ejemplo, disco 0)
       INT 13h      ; Lee un sector desde el disco
       ```

4. **Interrupción INT 14h**
   - La interrupción `INT 14h` se usa para manejar comunicaciones serie, como la lectura y escritura a través de puertos serie (COM1, COM2, etc.).
   - **Sintaxis:**
     ```assembly
     INT 14h  ; Llama a la interrupción de comunicación serial
     ```
   - **Algunas funciones comunes de `INT 14h`:**
     - **AH = 00h**: Iniciar la comunicación serial.
       ```assembly
       MOV AH, 00h
       MOV BH, 00h  ; Configuración del puerto COM
       MOV DL, 01h  ; Puerto COM1
       INT 14h      ; Inicia la comunicación serial
       ```
     - **AH = 01h**: Leer un carácter desde el puerto serial.
       ```assembly
       MOV AH, 01h
       INT 14h  ; Lee un carácter desde el puerto serial
       ```

5. **Interrupción INT 0Dh (División por cero)**
   - La interrupción `INT 0Dh` es un tipo de interrupción de **error**, que se activa cuando ocurre una división por cero, es decir, cuando un número se intenta dividir por cero.
   - El procesador interrumpe la ejecución y transfiere el control a la rutina de manejo de errores asociada.

**Resumen:**
- **INT 21h**: Usada para llamadas del sistema operativo como entrada/salida, gestión de archivos, y terminación de programas.
- **INT 10h**: Usada para funciones de video, como cambiar el modo de video y mover el cursor.
- **INT 13h**: Usada para funciones de disco, como leer y escribir sectores.
- **INT 14h**: Usada para manejar comunicaciones serie.
- **INT 0Dh**: Activada en caso de errores, como la división por cero.

Estas interrupciones permiten a los programadores interactuar con el sistema operativo, controlar dispositivos de hardware y manejar errores en sus programas.