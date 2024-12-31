org 100h

.model small
.stack 100h

.data
    mensaje db 'Hola, mundo!$', 0

.code

; Inicialización
start:
    ; Llamar a la función de impresión del mensaje
    call imprimir_mensaje
    
    ; Terminar el programa
    mov ah, 4ch
    int 21h

; Llamada a la función para imprimir el mensaje
imprimir_mensaje:
    ; Mostrar el mensaje en la pantalla
    mov ah, 09h
    lea dx, mensaje
    int 21h
    ret

end start