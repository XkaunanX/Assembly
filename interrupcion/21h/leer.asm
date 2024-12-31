org 100h

.model small
.stack 100h

.code

start:
    ; Leer un carácter desde el teclado (función 01h de int 21h)
    mov ah, 01h
    int 21h           ; Espera un carácter

    ; Mostrar el carácter leído
    mov dl, al        ; El carácter leído está en AL, lo pasamos a DL
    mov ah, 02h
    int 21h           ; Muestra el carácter

    ; Terminar el programa
    mov ah, 4Ch
    int 21h

end start