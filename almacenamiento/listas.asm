.MODEL SMALL
.STACK 100h

.DATA
    ; Definir el primer nodo de la lista con un valor y un puntero nulo
    node1_value DB 10       ; Valor del primer nodo
    node1_next  DW 0        ; Puntero al siguiente nodo (0 = fin de la lista)

    ; Definir el segundo nodo con un valor y un puntero nulo
    node2_value DB 20
    node2_next  DW 0        ; Puntero a null (no hay más nodos)

    ; Mensajes para imprimir
    msg1 DB 'Valor del primer nodo: $'
    msg2 DB 'Valor del segundo nodo: $'

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    ; Imprimir el valor del primer nodo
    MOV AH, 09h
    LEA DX, msg1
    INT 21h

    ; Mostrar el valor del primer nodo
    MOV AL, [node1_value]    ; Cargar el valor del primer nodo
    ADD AL, '0'              ; Convertir el valor a un carácter ASCII
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    ; Imprimir el valor del segundo nodo
    MOV AH, 09h
    LEA DX, msg2
    INT 21h

    MOV AL, [node2_value]    ; Cargar el valor del segundo nodo
    ADD AL, '0'              ; Convertir el valor a un carácter ASCII
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    ; Terminar el programa
    MOV AH, 4Ch
    INT 21h

END MAIN