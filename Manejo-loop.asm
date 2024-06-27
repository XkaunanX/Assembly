;LOOP

ORG 100H

.MODEL SMALL

.STACK 100H

.DATA
    
    MSG DB 'HOLA MUNDO $'   ;EL MENSAJE

.CODE

    MOV CX,0005H            ;ASIGNO 00005H EN CX
    
    MOV AH,09H              ;CONFIGURO 21H
    
    MOV DX,OFFSET MSG       ;CARGO LA DIRECCION DEL MENSAJE EN DX
    
    BLOQUE:                 ;BLOQUE A REPETIR
               
        INT 21H             ;MUESTRO EL MENSAJE EN PANTALLA
    
    LOOP BLOQUE             ;DECREMENTA CX REPITE MIENTRAS CX <> 0

.EXIT