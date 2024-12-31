org 100h

.model small
.stack 100h

.code

start:
    ; Mostrar un carácter 'B' en la pantalla usando la interrupción 10h
    mov ah, 0Eh       ; Función 0Eh de la interrupción 10h (escribir carácter)
    mov al, 'B'       ; Carácter a mostrar
    int 10h

    ; Terminar el programa
    mov ah, 4Ch
    int 21h

end start