ORG 100H

.MODEL SMALL

.DATA

    nombre_programa DB 'EXEC.EXE', 0  ; Nombre del programa a ejecutar

.CODE

    MOV AX, @DATA            ; Inicializar el segmento de datos
    MOV DS, AX               ; Cargar el segmento de datos en DS

    ; Ejecutar un proceso
    MOV AH, 4BH              ; Función 4BH de la interrupción 21H: Ejecutar un programa
    MOV DX, OFFSET nombre_programa ; Cargar la dirección del nombre del programa en DX
    INT 21H                  ; Llamar a la interrupción para ejecutar el programa

    ; Terminar el programa
    MOV AH, 4CH              ; Función para terminar el programa
    INT 21H