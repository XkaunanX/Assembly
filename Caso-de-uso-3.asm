ORG 100H

MOV SI,0100H

MOV CX,00FFH

MOV BX,[SI]

BLOQUE:
           
    MOV AX,[SI]
    
    CMP AX,[SI + 1]
    
    jNl ESMENOR 
    
    CONTINUAR:
    
        INC SI    

LOOP BLOQUE 

JMP FIN

ESMENOR:

   MOV BX,[SI+1]
   
   JMP CONTINUAR
   
FIN:

    MOV AX,BX
    
    MOV BH,0
    
    MOV CX,0
    
    INT 10H
    
    RET
    
    