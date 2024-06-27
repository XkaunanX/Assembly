;MANEJO DE LA PILA
ORG 100H

.MODEL SMALL

.STACK 100H

.DATA 

.CODE
     
    ;MUEVE EL PUNTERO DE PILA AL SEGMENTO DE PILA 
     
    MOV AX,@DATA
    
    MOV DS,AX
    
    MOV SS,AX
    
    MOV SP,100H
    
    ;PUSHE UN VALOR EN LA PILA
    
    MOV AX,1234H
    
    PUSH AX 
    
    ;PUSHEA OTRA PALABRA EN LA PILA
    
    MOV AX,5678H
    
    PUSH AX
    
    ;POP DOS PALABRAS DE LA PILA
    
    POP AX
    
    POP BX
    
    ;TERMINA EL PROGRAMA
    
    MOV AX,4C00H
    
    INT 21H
    
    
    
    
