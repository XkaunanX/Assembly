.MODEL SMALL
.STACK 0100H

.DATA
mensaje DB 'Valor de DI es: $'

.CODE
ORG 0100H
START:
    MOV DI, 2000H         ; DI = 2000H, utilizado para operaciones de destino
    MOV DX, OFFSET mensaje ; Dirección del mensaje
    MOV AH, 09H            ; Función para imprimir
    INT 21H                ; Mostrar el mensaje
    MOV AX, 4C00H          ; Terminar el programa
    INT 21H
END START