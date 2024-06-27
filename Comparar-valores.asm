;Comparar valores


    ;Flujo normal
    
    mov ax,10   ;Asigno 10h en ax
    mov bx,10   ;Asigno 20h en bx
    
    cmp ax,bx   ;resta logica ax-bx modifico banderas
    
    jl menor    ;Si ax<bx
    jg mayor    ;Si ax>bx
    je igual    ;Si ax==bx
    

menor:          ;Bloque
    mov dx,1AAAH
    jmp continuar

mayor:          ;Bloque
    mov dx,1BBBH
    jmp continuar

igual:          ;Bloque
    mov dx,1CCCH
    jmp continuar    

continuar:      ;Flujo normal
    mov ah,4CH
    int 21H
   