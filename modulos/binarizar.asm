org 100h

.model small
.stack 100h

.data
    numero db 12       ; Número que vamos a convertir

.code

start:
    ; Cargar el número a convertir
    mov al, [numero]

    ; Llamar al módulo de conversión a binario
    call convertir_a_binario

    ; Terminar el programa
    mov ah, 4ch
    int 21h

; Módulo para convertir un número a su representación binaria
convertir_a_binario:
    mov cl, 8              ; Definir 8 bits para la conversión
    mov bl, al             ; Copiar el número a BL
    convertir_loop:
        shl bl, 1          ; Desplazar el número a la izquierda
        jc bit_1           ; Si el bit desplazado es 1, saltar a bit_1
        mov dl, '0'        ; Si el bit es 0, cargar '0' en DL
        jmp imprimir_bit

    bit_1:
        mov dl, '1'        ; Si el bit es 1, cargar '1' en DL

    imprimir_bit:
        mov ah, 02h        ; Llamar a la interrupción para imprimir el bit
        int 21h
        loop convertir_loop ; Repetir para los 8 bits

    ret

end start