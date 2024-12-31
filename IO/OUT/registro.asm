.MODEL SMALL
.STACK 100h

.DATA
    msg db 'Enviando valor al puerto 60h: $'

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    ; Enviar el valor de AL al puerto de salida 60h
    MOV AL, 0FFh       ; Valor a enviar (por ejemplo, 255)
    OUT 60h, AL        ; Escribe el valor en el puerto 60h

    ; Mostrar mensaje
    MOV AH, 09h        ; Función para mostrar un string
    LEA DX, msg        ; Cargar la dirección del mensaje
    INT 21h            ; Llamada a la interrupción de DOS

    MOV AH, 4Ch        ; Terminar el programa
    INT 21h            ; Llamada a la interrupción de DOS

END MAIN