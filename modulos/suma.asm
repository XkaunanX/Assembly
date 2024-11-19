org 100h

.model small
.stack 100h

.data
    num1 db 5
    num2 db 10

.code

start:
    ; Cargar los números a sumar
    mov al, [num1]
    mov bl, [num2]
    
    ; Llamar al módulo de suma
    call sumar_numeros

    ; Mostrar el resultado (en AX)
    ; Aquí, se podría agregar código para mostrar el resultado
    ; en pantalla si fuera necesario.

    ; Terminar el programa
    mov ah, 4ch
    int 21h

; Módulo que suma dos números
sumar_numeros:
    add al, bl         ; Sumar el valor en BL al valor en AL
    mov ah, 0          ; Limpiar el registro AH (por si acaso)
    ret

end start