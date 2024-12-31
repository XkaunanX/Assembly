org 100h

.model small
.stack 100h

.code

start:
    ; Terminar el programa con el código de salida 0
    mov ah, 4Ch
    mov al, 0          ; Código de salida 0
    int 21h

end start