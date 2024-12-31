org 100h

.model small
.stack 100h

.code

start:
    ; Establecer un nuevo vector para la interrupción 21h
    mov ah, 25h       ; Función 25h de int 21h (establecer vector de interrupción)
    mov al, 21h       ; Interrupción 21h
    lea dx, new_isr   ; Dirección de la nueva rutina
    int 21h           ; Establecer el nuevo vector

    ; Terminar el programa
    mov ah, 4Ch
    int 21h

new_isr:
    ; Nueva rutina de interrupción para la 21h
    ret

end start