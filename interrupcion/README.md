# Interrupciones Comunes en Assembly 8086

Las interrupciones son mecanismos que permiten que el procesador interrumpa su flujo de ejecucion normal para atender una solicitud especial, como la entrada/salida de datos o la gestion de errores. En Assembly 8086, las interrupciones mas comunes se usan para manejar funciones del sistema operativo y controlar dispositivos de hardware.

1. **Interrupcion INT 21h**
   - La interrupcion `INT 21h` es una de las mas comunes en el 8086 y se usa para realizar diversas funciones relacionadas con la entrada/salida, el manejo de archivos, y la gestion de memoria.
   - Existen diferentes funciones que se activan al colocar un valor especifico en el registro `AH`.
   - **Sintaxis:**
     ```assembly
     INT 21h  ; Llama a la interrupcion del DOS para realizar una operacion
     ```
   - **Algunas funciones comunes de `INT 21h`:**
     - **AH = 01h**: Leer un caracter desde el teclado.
       ```assembly
       MOV AH, 01h
       INT 21h  ; Lee un caracter del teclado
       ```
     - **AH = 02h**: Imprimir un caracter en la pantalla.
       ```assembly
       MOV AH, 02h
       MOV DL, 'A'  ; Caracter a imprimir
       INT 21h      ; Imprime el caracter en la pantalla
       ```
     - **AH = 4Ch**: Terminar el programa.
       ```assembly
       MOV AH, 4Ch
       INT 21h  ; Termina el programa y regresa al sistema operativo
       ```

2. **Interrupcion INT 10h**
   - La interrupcion `INT 10h` se utiliza para funciones de video, como el cambio de modo grafico, la manipulacion del cursor, y la escritura en la pantalla.
   - **Sintaxis:**
     ```assembly
     INT 10h  ; Llama a la interrupcion de video para realizar una operacion
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
       MOV BH, 00h  ; Pagina de pantalla
       MOV DH, 10h  ; Fila (linea)
       MOV DL, 20h  ; Columna (caracter)
       INT 10h      ; Mueve el cursor
       ```

3. **Interrupcion INT 13h**
   - La interrupcion `INT 13h` se usa para funciones relacionadas con discos duros, disquetes y la gestion de almacenamiento. Permite leer y escribir sectores en discos.
   - **Sintaxis:**
     ```assembly
     INT 13h  ; Llama a la interrupcion de disco
     ```
   - **Algunas funciones comunes de `INT 13h`:**
     - **AH = 02h**: Leer un sector desde un disco.
       ```assembly
       MOV AH, 02h
       MOV AL, 01h  ; Numero de sectores a leer
       MOV CH, 00h  ; Cilindro
       MOV CL, 02h  ; Numero del sector
       MOV DH, 00h  ; Cabeza del disco
       MOV DL, 80h  ; Unidad de disco (por ejemplo, disco 0)
       INT 13h      ; Lee un sector desde el disco
       ```

4. **Interrupcion INT 14h**
   - La interrupcion `INT 14h` se usa para manejar comunicaciones serie, como la lectura y escritura a traves de puertos serie (COM1, COM2, etc.).
   - **Sintaxis:**
     ```assembly
     INT 14h  ; Llama a la interrupcion de comunicacion serial
     ```
   - **Algunas funciones comunes de `INT 14h`:**
     - **AH = 00h**: Iniciar la comunicacion serial.
       ```assembly
       MOV AH, 00h
       MOV BH, 00h  ; Configuracion del puerto COM
       MOV DL, 01h  ; Puerto COM1
       INT 14h      ; Inicia la comunicacion serial
       ```
     - **AH = 01h**: Leer un caracter desde el puerto serial.
       ```assembly
       MOV AH, 01h
       INT 14h  ; Lee un caracter desde el puerto serial
       ```

5. **Interrupcion INT 0Dh (Division por cero)**
   - La interrupcion `INT 0Dh` es un tipo de interrupcion de **error**, que se activa cuando ocurre una division por cero, es decir, cuando un numero se intenta dividir por cero.
   - El procesador interrumpe la ejecucion y transfiere el control a la rutina de manejo de errores asociada.

**Resumen:**
- **INT 21h**: Usada para llamadas del sistema operativo como entrada/salida, gestion de archivos, y terminacion de programas.
- **INT 10h**: Usada para funciones de video, como cambiar el modo de video y mover el cursor.
- **INT 13h**: Usada para funciones de disco, como leer y escribir sectores.
- **INT 14h**: Usada para manejar comunicaciones serie.
- **INT 0Dh**: Activada en caso de errores, como la division por cero.

Estas interrupciones permiten a los programadores interactuar con el sistema operativo, controlar dispositivos de hardware y manejar errores en sus programas.
