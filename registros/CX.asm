.MODEL SMALL
.STACK 0100H

.DATA
mensaje DB 'Contador en CX es: $'

.CODE
ORG 0100H
START:
    MOV CX, 5               ; CX = 5, contador para bucles
Bucle:
    MOV DX, OFFSET mensaje   ; Cargar la dirección del mensaje
    MOV AH, 09H              ; Función para imprimir cadena
    INT 21H                  ; Mostrar mensaje
    LOOP Bucle               ; Decrementar CX y repetir si no es cero
    MOV AX, 4C00H            ; Terminar el programa
    INT 21H
END START