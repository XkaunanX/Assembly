.MODEL SMALL
.STACK 100h

.DATA
    msg db 'Entrada desde el puerto 60h: $'

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX
    
    ; Leer desde el puerto de entrada 60h y almacenarlo en AL
    IN AL, 60h         ; Lee un byte del puerto 60h

    ; Mostrar mensaje
    MOV AH, 09h        ; Función para mostrar un string
    LEA DX, msg        ; Cargar la dirección del mensaje
    INT 21h            ; Llamada a la interrupción de DOS

    MOV AH, 4Ch        ; Terminar el programa
    INT 21h            ; Llamada a la interrupción de DOS

END MAIN