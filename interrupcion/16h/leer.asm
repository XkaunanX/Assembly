org 100h

.model small
.stack 100h

.code

start:
    ; Leer un carácter desde el teclado sin eco (función 00h de int 16h)
    mov ah, 00h
    int 16h           ; Lee un carácter sin mostrarlo

    ; Terminar el programa
    mov ah, 4Ch
    int 21h

end start