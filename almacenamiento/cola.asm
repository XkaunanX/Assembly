.MODEL SMALL
.STACK 100h

.DATA
    ; Definir el tamaño de la cola
    MAX_SIZE DB 3              ; Tamaño máximo de la cola (3 elementos)

    ; Cola (Espacio para los 3 elementos)
    queue DB 3 DUP(0)          ; Inicializar la cola con 0 (tamaño 3)

    ; Índices front y rear
    front DB 0                 ; Índice del frente de la cola
    rear DB 0                  ; Índice del final de la cola

    ; Mensajes de salida
    msg_empty DB 'Cola vacia$'
    msg_full DB 'Cola llena$'
    msg_insert DB 'Elemento insertado: $'
    msg_dequeue DB 'Elemento retirado: $'

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    ; Insertar un elemento en la cola (insertar 5)
    MOV AL, 5                  ; Elemento a insertar
    CALL InsertQueue

    ; Mostrar el mensaje de inserción
    MOV AH, 09h
    LEA DX, msg_insert
    INT 21h

    ; Mostrar el valor insertado
    MOV AH, 02h
    MOV DL, AL
    INT 21h

    ; Retirar un elemento de la cola
    CALL DequeueQueue

    ; Mostrar el mensaje de extracción
    MOV AH, 09h
    LEA DX, msg_dequeue
    INT 21h

    ; Terminar el programa
    MOV AH, 4Ch
    INT 21h

InsertQueue:
    ; Verificar si la cola está llena
    MOV AL, [rear]
    MOV BL, [front]
    CMP AL, BL
    JE  FullQueue           ; Si front == rear, la cola está llena

    ; Insertar el elemento en la cola
    MOV BX, [rear]           ; Obtener el índice del rear
    MOV [queue + BX], AL      ; Insertar el valor en la cola

    ; Incrementar rear
    INC BX
    MOV [rear], BX           ; Actualizar rear
    RET

FullQueue:
    ; Mostrar mensaje de cola llena
    MOV AH, 09h
    LEA DX, msg_full
    INT 21h
    RET

DequeueQueue:
    ; Verificar si la cola está vacía
    MOV AL, [front]
    MOV BL, [rear]
    CMP AL, BL
    JE  EmptyQueue           ; Si front == rear, la cola está vacía

    ; Sacar el valor del frente de la cola
    MOV BX, [front]           ; Obtener el índice del front
    MOV AL, [queue + BX]      ; Obtener el valor del frente

    ; Incrementar front
    INC BX
    MOV [front], BX           ; Actualizar front
    RET

EmptyQueue:
    ; Mostrar mensaje de cola vacía
    MOV AH, 09h
    LEA DX, msg_empty
    INT 21h
    RET

END MAIN