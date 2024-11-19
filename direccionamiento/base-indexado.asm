.MODEL SMALL
.STACK 0100H

.DATA
valores DW 5555H, 6666H, 7777H

.CODE
ORG 0100H
START:
    MOV BX, OFFSET valores ; Dirección base en BX
    MOV SI, 2              ; Índice para acceder al tercer elemento
    MOV AX, [BX+SI*2]      ; Direccionamiento basado indexado: AX = contenido en [BX + SI*2]
    MOV DX, AX
    MOV AH, 4CH
    INT 21H                ; Salida del programa
END START