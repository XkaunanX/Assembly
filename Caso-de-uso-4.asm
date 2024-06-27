ORG 100H

.MODEL SMALL

.STACK 100H

.DATA

    MSG DB 'A$'
    
.CODE

    MOV AX,100H
    
    CMP AX,100H
    
    JZ  CERO
    
    MOV BX,1FFFH
    
    MOV DX,1FFFH
    
    MOV CX,1FFFH
    
    CERO:
    
        MOV AX,1FFFH