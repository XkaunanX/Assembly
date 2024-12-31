.MODEL SMALL
.STACK 0100H

.DATA
mensaje DB 'Valor de BX es: $'

.CODE
ORG 0100H
START:
    MOV BX, 5678H          ; BX = 5678H, usado generalmente como puntero base
    MOV DX, OFFSET mensaje  ; Cargar la dirección de mensaje en DX
    MOV AH, 09H             ; Función para imprimir cadena
    INT 21H                 ; Llamada a interrupción para mostrar mensaje
    MOV AX, 4C00H           ; Terminar el programa
    INT 21H
END START