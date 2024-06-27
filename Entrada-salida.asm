;ENTRADA Y SALIDA

ORG 100H                ;DIRECCION DE ORIGEN

.MODEL SMALL            ;MODELO DE MEMORIA

.DATA                   ;SEGMENTO DE DATOS

    mensaje DB 'El numero ingresado es: $' ;MENSAJE A MOSTRAR
    
    buffer DB 10 DUP(?) ;BUFFER PARA ALMACENAR EL VALOR LEIDO

.CODE                   ;SEGMENTO DE CODIGO
                        
    MOV AX,@DATA        ;ASIGNO LA DIRECCION BASE DE DATOS EN AX("REGISTRO ACUMULADOR")
    
    MOV DS,AX           ;ASGNO AX EN DS("REGISTRO SEGMENTO DE DATOS") 
    
    ;lee un numero desde la entrada estandar 
    
    MOV AH,01H          ;ASIGNO 1H EN AH: FUNCION DE LA INTERRUPCION 21H ("LEER UN CARACTER")
    
    LEA DX,buffer       ;CARGAR DX("REGISTRO DE DATOS") CON LA DIRECCION DEL BUFFER
    
    INT 21H             ;LLAMAR A LA INTERRUPCION 21H("S.O: DOS") PARA LEER UN CARACTER DESDE LA ENTRADA ESTANDAR
    
    ;EN ESTE PUNTO EL VALOR LEIDO SE ENCUENTRA EN EL BUFFER
    
    
    MOV AH,9H
    
    MOV DX,OFFSET mensaje
    
    INT 21H
    
    ;MOSTRAR EL VALOR INGRESADO EN LA SALIDA ESTANDAR
    
    MOV AH,9H          ;DOS: MOSTRAR UNA CADENA
    
    LEA DX,buffer       ;CARGAR DX CON LA DIRECCION DEL BUFFER
    
    INT 21H             ;EJECUTO LA INTERRUPCION
    
    MOV AH,4CH          ;FUNCION PARA TERMINAR EL PROGRAMA
                        
    INT 21H
    
    
    
    