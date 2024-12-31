.MODEL SMALL
.STACK 100h

.DATA
    ; Declarar una matriz 2x2 (4 elementos)
    matrix DB 1, 2
           DB 3, 4

    msg db 'Elemento en la posicion [1,1]: $'

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    ; Cargar el valor de la posición [1,1] (primer elemento de la matriz)
    MOV AL, [matrix]
    
    ; Mostrar mensaje
    MOV AH, 09h
    LEA DX, msg
    INT 21h

    ; Terminar el programa
    MOV AH, 4Ch
    INT 21h

END MAIN