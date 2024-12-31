.MODEL SMALL
.STACK 0100H

.DATA
mensaje DB 'Valor de DX es: $'

.CODE
ORG 0100H
START:
    MOV DX, 9              ; DX = 9, utilizado en operaciones de entrada/salida
    MOV DX, OFFSET mensaje ; Cargar dirección del mensaje en DX
    MOV AH, 09H            ; Función para mostrar mensaje
    INT 21H                ; Llamada a la interrupción para imprimir
    MOV AX, 4C00H          ; Terminar el programa
    INT 21H
END START