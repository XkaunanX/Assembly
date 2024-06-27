;SALTOS CONDICIONALES

;dos registros son iguales?

mov ax,1000h

mov bx,1000h

cmp ax,bx
je son_iguales  ;comparan si el valor es igual

;si llego aca no son iguales
mov dx,1111H
 
jmp fin1 
 
son_iguales: ;continua aca si son iguales

mov dx,2222H

fin1: ;sigo el flujo  

;---------------------------------------

;dos registros son distintos

mov ax,5555H
mov bx,5555H

cmp ax,bx
jne no_son_iguales

;si llego aca si son iguales
mov dx,3333H
jmp fin2

no_son_iguales:

mov dx,4444H

fin2:  ;sigo el flujo

;----------------------------------------

