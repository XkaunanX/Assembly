;OPERACIONES CON CADENAS - Ejemplo 4: Buscar un carácter en una cadena
org 100H

.model small

.data

    cadena db 'hola, mundo', 0          ; Cadena en la que buscaremos el carácter
    caracter_a_buscar db ','            ; Carácter que quiero buscar

.code

lea SI, cadena               ; Cargar SI con la dirección base de los datos
mov AL, caracter_a_buscar    ; Cargar AL con el carácter que queremos buscar

buscar_caracter:
    mov BL, [SI]             ; Cargar el carácter actual de la cadena en BL
    cmp BL, AL               ; Comparar el carácter actual con el que estamos buscando
    je encontrado            ; Si son iguales, saltar a encontrado
    cmp BL, 0                ; Comprobar si llegamos al final de la cadena
    je no_encontrado         ; Si es 0, significa que hemos llegado al final
    inc SI                   ; Avanzar al siguiente carácter de la cadena
    jmp buscar_caracter      ; Volver a buscar el siguiente carácter

encontrado:
    mov DX, 4444H            ; Mostrar si el carácter ha sido encontrado
    jmp finalizacion

no_encontrado:
    mov DX, 7777H            ; Mostrar si no se ha encontrado el carácter
    jmp finalizacion

finalizacion:
    mov AL, 4CH
    int 21H  ; Terminar el programa