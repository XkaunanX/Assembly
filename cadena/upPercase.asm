;OPERACIONES CON CADENAS - Ejemplo 5: Convertir una cadena a mayúsculas
org 100H

.model small

.data

    string db 'hola, mundo', 0          ; Cadena a convertir a mayúsculas

.code

lea SI, string              ; Cargar SI con la dirección de inicio de la cadena

convertir_mayusculas:
    mov AL, [SI]             ; Cargar el carácter actual de la cadena en AL
    cmp AL, 0                ; Comprobar si llegamos al final de la cadena
    je fin_conversion

    cmp AL, 'a'              ; Comprobar si el carácter es una letra minúscula 'a'
    jl siguiente_caracter    ; Si no, pasar al siguiente carácter
    cmp AL, 'z'              ; Comprobar si el carácter es una letra minúscula 'z'
    jg siguiente_caracter    ; Si no, pasar al siguiente carácter

    sub AL, 20H              ; Convertir el carácter a mayúsculas restando 32 (20H) al valor ASCII
    mov [SI], AL             ; Guardar el carácter convertido en la misma posición de la cadena

siguiente_caracter:
    inc SI                   ; Avanzar al siguiente carácter de la cadena
    jmp convertir_mayusculas  ; Continuar convirtiendo

fin_conversion:
    mov DX, 6666H            ; Mostrar que la conversión ha terminado
    mov AL, 4CH
    int 21H                  ; Finalizar el programa