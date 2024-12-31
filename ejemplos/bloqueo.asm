INCLUDE EMU8086.INC

.MODEL SMALL

.DATA   
        SIZE EQU 10
        ENCABEZADO DB '________________Bloqueo de seguridad________________','$'
        MENSAJE1 DB 13, 10, 'Introduce tu ID:$'
        MENSAJE2 DB 13, 10, 'Introduce tu Contrase�a:$'
        MENSAJE3 DB 13, 10, 'ERROR: ID no encontrado!$'
        MENSAJE4 DB 13, 10, 'Contrase�a incorrecta! Acceso denegado$'
        MENSAJE5 DB 13, 10, '�Correcto! Bienvenido al sistema seguro$'
        MENSAJE6 DB 13, 10, '�Contrase�a demasiado larga!$'
        
        ID_TEMPORAL DW 1 DUP(?),0
        CONTRASE�A_TEMP DB 1 DUP(?)
        
        TAMA�O_ID = $-ID_TEMPORAL
        TAMA�O_CONTRASE�A = $-CONTRASE�A_TEMP
        
        ID  DW 'A150', 'B255', 'CE20', 'BB71', 'D111', 'E500', 'F432', 'EC12', '5321', '9876'
        CONTRASE�A DB 1, 2, 3, 4, 7, 10, 11, 13, 12, 14
    
.CODE

PROCESO_PRINCIPAL PROC
            MOV AX,@DATA   ; Iniciar segmento de datos
            MOV DS,AX
            MOV AX,0000H

ENCABEZADO_IMAGEN:
            LEA DX,ENCABEZADO
            MOV AH,09H
            INT 21H                ; Mostrar encabezado

SOLICITUD_ID:
            LEA DX,MENSAJE1
            MOV AH,09H
            INT 21H                ; Mostrar mensaje "Introduce tu ID"

LECTURA_ID:
            MOV BX,0
            MOV DX,0
            LEA DI,ID_TEMPORAL
            MOV DX,TAMA�O_ID
            CALL OBTENER_CADENA    ; Llamada a la subrutina para leer el ID

VERIFICAR_ID:
            MOV BL,0
            MOV SI,0

VUELTA_ID:
            MOV AX,ID[SI] 
            MOV DX,ID_TEMPORAL
            CMP DX,AX
            JE  SOLICITUD_CONTRASE�A
            INC BL
            ADD SI,4
            CMP BL,SIZE
            JB  VUELTA_ID

ERROR_ID:
            LEA DX,MENSAJE3
            MOV AH,09H
            INT 21H                ; Mostrar mensaje de error "ID no encontrado"
            JMP SOLICITUD_ID        ; Volver a solicitar el ID

SOLICITUD_CONTRASE�A:
            LEA DX,MENSAJE2
            MOV AH,09H
            INT 21H                ; Mostrar mensaje "Introduce tu Contrase�a"

LECTURA_CONTRASE�A:
            CALL LEER_NUMERO
            CMP CL,0FH
            JAE CONTRASE�A_LARGA
            MOV BH,00H
            MOV DL,CONTRASE�A[BX]
            CMP CL,DL
            JE  ACCESO_CORRECTO

CONTRASE�A_INCORRECTA:
            LEA DX,MENSAJE4
            MOV AH,09H
            INT 21H                ; Mostrar mensaje de "Contrase�a incorrecta"
            JMP SOLICITUD_ID        ; Volver a solicitar el ID

ACCESO_CORRECTO:
            LEA DX,MENSAJE5
            MOV AH,09H
            INT 21H                ; Mostrar mensaje "�Correcto! Bienvenido"
            JMP TERMINAR            ; Terminar el programa

CONTRASE�A_LARGA:
            LEA DX,MENSAJE6
            MOV AH,09H
            INT 21H                ; Mostrar mensaje "�Contrase�a demasiado larga!"
            JMP SOLICITUD_CONTRASE�A

DEFINIR_LEER_NUMERO
DEFINIR
