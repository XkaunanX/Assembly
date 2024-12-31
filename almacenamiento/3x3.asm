ORG 0100H              ; Dirección de inicio del programa

.MODEL SMALL           ; Definir el modelo de memoria como pequeño (pequeño segmento de código y datos)
.DATA                  ; Sección de datos

; Definición de la matriz 3x3 (cada valor de 16 bits)
matriz DW 3 DUP(3 DUP(?)) ; Definir una matriz de 3x3, con valores sin inicializar

.CODE                  ; Sección de código

MOV AX, @DATA          ; Cargar la dirección de los datos en AX
MOV DS, AX             ; Cargar DS con la dirección base de los datos

; Inicializar la matriz con valores consecutivos (1, 2, 3, ..., 9)
MOV SI, OFFSET matriz  ; Cargar la dirección base de la matriz en SI (puntero)
MOV CX, 0003H          ; Número de filas (3 filas)

FILA_LOOP:            ; Bucle para recorrer las filas de la matriz
    MOV DI, SI         ; Cargar la dirección base de la fila actual en DI (puntero)
    MOV BX, 1          ; Valor inicial a asignar (empieza en 1)
    MOV DX, 3          ; Número de columnas de la matriz (3 columnas)
    
    COLUMNA_LOOP:     ; Bucle para recorrer las columnas de la matriz
        MOV [DI], BX   ; Asignar el valor de BX a la posición actual de la matriz
        ADD BX, 0001H  ; Incrementar BX para el siguiente valor
        ADD DI, 2      ; Avanzar al siguiente elemento de la columna (cada valor ocupa 2 bytes)
        LOOP COLUMNA_LOOP ; Continuar con el bucle para todas las columnas

    ADD SI, 6          ; Avanzar al inicio de la siguiente fila (3 columnas * 2 bytes por columna = 6 bytes)
    LOOP FILA_LOOP     ; Continuar con el bucle para todas las filas

; Acceder a un elemento específico de la matriz (ejemplo: fila 2, columna 1)
MOV SI, OFFSET matriz  ; Cargar la dirección base de la matriz en SI
ADD SI, 4              ; Avanzar a la segunda fila (6 bytes por fila, 2 * 3 columnas = 6 bytes)
ADD SI, 2              ; Avanzar a la segunda columna (2 bytes por columna)
MOV AX, [SI]           ; Cargar el valor del elemento en AX (fila 2, columna 1)

; Modificar un valor específico de la matriz (ejemplo: fila 2, columna 1)
MOV SI, OFFSET matriz  ; Cargar la dirección base de la matriz en SI
ADD SI, 4              ; Avanzar a la segunda fila (6 bytes por fila)
ADD SI, 2              ; Avanzar a la segunda columna (2 bytes por columna)
MOV AX, 100            ; Nuevo valor a asignar al elemento (100)
MOV [SI], AX           ; Asignar el nuevo valor (100) al elemento en la matriz