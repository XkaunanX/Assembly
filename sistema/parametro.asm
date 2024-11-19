ORG 100H

.MODEL SMALL

.DATA

    mensaje DB 'Parametro 1: $'

.CODE

    MOV AX, @DATA            ; Inicializar el segmento de datos
    MOV DS, AX               ; Cargar el segmento de datos en DS

    ; Mostrar el primer parámetro de la línea de comando
    MOV AH, 09H              ; Función 09H de la interrupción 21H: Mostrar una cadena
    MOV DX, [BP+2]           ; Cargar la dirección del primer parámetro en DX
    INT 21H                  ; Llamar a la interrupción 21H para mostrar el parámetro

    ; Mostrar el segundo parámetro de la línea de comando
    MOV DX, [BP+4]           ; Cargar la dirección del segundo parámetro en DX
    INT 21H                  ; Llamar a la interrupción 21H para mostrar el parámetro

    ; Terminar el programa
    MOV AH, 4CH              ; Función para terminar el programa
    INT 21H