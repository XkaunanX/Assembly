org 100h  ; 

.model small ;defino atributos del modelo de memoria

.data ;segmento donde se declara todas las variables/datos a usar
    
    num db 0 ;declaro una variable para obtener el caracter de entrada
    
    ;creo los mensajes que se mostraran en pantalla al usuario
    
    mensaje         db 10 , 13, "Ingrese un numero:" ,"$" ;el 10 significa salto de carro
    mensajeneutro   db 10 , 13, "El numero es NEUTRO" ,"$" ;el 13 significa retorno de carro
    mensajepositivo db 10 , 13, "El numero es positivo, es mayor a 0" ,"$" ;con "$" se indica que termino la linea
    mensajenegativo db 10 , 13, "El numero es NEGATIVO, empiza con '-'" ,"$" 
    
.code       ;segmento para codigo
    inicio: 
    mov ax,@data ;introduzco el segmento de dato a ds
    mov ds,ax
    
    ;muestro un mensaje en pantalla
    mov ah,9h
    lea dx,mensaje
    int 21h
    mov ah,1
    int 21h
    mov num,al
    
    mov al,num
    cmp al,30h
    
    je negativo
    
    jz igual
    
    jnz positivo
    
   .exit
   
   negativo:
        mov ah,9
        lea dx,mensajenegativo
        int 21h
   .exit
                  
   positivo: 
        mov ah,9
        lea dx,mensajepositivo
        int 21h
   .exit
   
   igual:
        mov ah,9
        lea dx,mensajeneutro
        int 21h
   .exit
   