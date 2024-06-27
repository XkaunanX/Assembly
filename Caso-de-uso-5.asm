ORG 100H

.MODEL SMALL

.STACK 100H

.DATA

.CODE
     
     MOV AX,@DATA
     
     MOV DS,AX
     
     MOV AX,1FFFH
     
     MOV [0020H],AX
     
     MOV BX,[0020H]
     
.EXIT