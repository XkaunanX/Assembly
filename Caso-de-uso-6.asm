ORG 100h

msg1 db 'estoy aprendiendo las interrupciones $'

MOV AH,00H
MOV AL,02H
INT 10H

MOV AH,02H
MOV BH,00h
MOV DH,03H
MOV DL,14H
INT 10H

LEA DX, msg1
MOV AH, 09H
INT 21H

RET