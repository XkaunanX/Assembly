org 100h

.model small
.stack 100h

.code

start:
    ; Preparar los parámetros para leer un sector
    mov ah, 02h         ; Función 02h de int 13h (leer sector)
    mov al, 01h         ; Número de sectores a leer
    mov ch, 00h         ; Cabeza 0
    mov cl, 02h         ; Primer sector
    mov dh, 00h         ; Pista 0
    mov dl, 80h         ; Unidad de disco (usualmente 80h para el disco duro principal)
    lea bx, buffer      ; Dirección del buffer donde leer los datos
    int 13h             ; Llamar a la interrupción

    ; Terminar el programa
    mov ah, 4Ch
    int 21h

buffer db 512 dup(0)   ; Buffer de 512 bytes para almacenar el sector leído

end start