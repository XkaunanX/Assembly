org 100h

.model small
.stack 100h

.data
    num1 db 12
    num2 db 8

.code

start:
    ; Cargar los números a comparar
    mov al, [num1]
    mov bl, [num2]

    ; Llamar al módulo para obtener el máximo
    call obtener_maximo

    ; Terminar el programa
    mov ah, 4ch
    int 21h

; Módulo para obtener el máximo entre dos números
obtener_maximo:
    cmp al, bl      ; Comparar los dos números
    jge maximo      ; Si AL es mayor o igual que BL, AL es el máximo
    mov al, bl      ; De lo contrario, BL es el máximo
maximo:
    ret

end start