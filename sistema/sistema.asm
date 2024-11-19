ORG 100H

.MODEL SMALL

.DATA

    fechaYhora DB 20 DUP(?)   ; Espacio para almacenar la fecha (formato DD-MM-YYYY)

.CODE

    MOV AX, @DATA            ; Inicializa el segmento de datos
    MOV DS, AX               ; Cargar el segmento de datos en DS

    ; Obtener la fecha del sistema
    MOV AH, 2AH              ; Función 2AH de la interrupción 21H: Obtener la fecha y hora
    INT 21H                  ; Llamar a la interrupción 21H

    MOV AH, 09H              ; Función 09H: Mostrar una cadena de caracteres
    LEA DX, fechaYhora       ; Cargar la dirección de la cadena de la fecha
    INT 21H                  ; Llamar a la interrupción 21H para mostrar la fecha

    ; Terminar el programa
    MOV AH, 4CH              ; Función para terminar el programa
    INT 21H