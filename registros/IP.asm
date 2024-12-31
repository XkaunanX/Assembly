.MODEL SMALL
.STACK 0100H

.DATA
mensaje DB 'Valor de IP y FLAGS: $'

.CODE
ORG 0100H
START:
    MOV AX, 1000H          ; Establece una dirección para comenzar a ejecutar
    MOV IP, AX             ; Copia a IP la dirección
    MOV DX, OFFSET mensaje ; Dirección del mensaje
    MOV AH, 09H            ; Función para imprimir
    INT 21H                ; Mostrar mensaje
    MOV AX, 4C00H          ; Terminar el programa
    INT 21H
END START