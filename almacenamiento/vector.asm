.MODEL SMALL
.STACK 100h

.DATA
    vector DB 10, 20, 30, 40, 50  ; Declaramos un vector de 5 elementos
    msg db 'Elemento en la posicion 2: $'

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    ; Mostrar el valor del elemento en la posición 2 del vector
    MOV AL, [vector + 2]  ; Cargar el valor del tercer elemento en AL

    ; Mostrar mensaje
    MOV AH, 09h
    LEA DX, msg
    INT 21h

    ; Terminar el programa
    MOV AH, 4Ch
    INT 21h

END MAIN