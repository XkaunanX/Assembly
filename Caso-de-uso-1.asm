ORG 100H

.MODEL SMALL

.STACK 100H

.DATA

   

.CODE

    MOV SI,0100H
    
    MOV CX,05H
    
    MOV BX,0000H
    
    BLOQUE:
    
        MOV AX,[SI]
        
        ADD AX,0H
        
        JL ESNEGATIVO
        
        CONTINUAR:
        
        INC SI
        
        LOOP BLOQUE
        
        JMP FIN 
         
        ESNEGATIVO:
        
            INC BX
            
            JMP CONTINUAR
            
        FIN:
        
        MOV AH,02H
        
        MOV BH,0H
        
        MOV DH,00AH
        
        MOV DL,14H
        
        INT 10H
        
        MOV AH,02H
        
        MOV DL,BL
        
        ADD DL,30H
        
        INT 21H          
        
        RET    
              