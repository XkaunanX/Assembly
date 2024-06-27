;SALTOS CONDICIONALES COMO USAR

org 100

;ejemplo si es cer0

mov ax,7h    ;asigno 7h en ax

cmp ax,7h    ;cmp: resta logica ax - 7h activa solo las banderas
jz escero    ;Ubica ip en funcion de la etiqueta

mov dx,44h   ;si no fuera zero ejecutaria esta intruccion

escero:      ;si es cero el flujo salta hacia aca y continua

mov bx,99h   ;CONTINUA...No vuelve

;ejemplo si no es cero

mov ax,7h

cmp ax,5h
jns noescero

mov bx,0h 

noescero:

mov bx,1000H
mov bx,1911H

;ejemplo Condicional-incondicional

mov ax,4

cmp ax,6
jz true

    mov dx,1AAAh
    jmp continuar
    
true:

    mov dx,1FFFH

continuar:

mov dx,1CCCH