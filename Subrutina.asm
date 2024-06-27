;SUBRUTINA

.code
    org 100h   
    
main:
    mov ax,1h           ;asigno 1h en ax
    
    call mi_subrutina   ;LLamo a subrutina
    
    mov ax,2h           ;asigno 2h en ax
    
    ;fin del programa
    
    mov ah,4ch          ;asigno en ah el valor para terminar el programa
    
    int 21h             ;ejecuto interrupcion y finalizo
    
mi_subrutina:           ;bloque de subrutina
    mov bx,1FFFH
ret
    
   