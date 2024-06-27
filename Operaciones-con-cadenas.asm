;OPERACIONES CON CADENAS
org 100H

.model small

.data

    ;ejemplo 1
    cadena_origen db 'hola, mundo', 0   ;cadena origen
    tamano_cadena equ $ - cadena origen ;calcular el tamano de la cadena 
    
    cadena_destino db 20 dup(0)         ;cadena de destino con tamano suficiente
    
    ;ejemplo 2
    cadena1 db 'hola', 0                ;cadena 1
    cadena2 db ',mundo',0               ;cadena 2
    
    cadena_concatenada db 30 dup(0)     ;cadena de destino con tamano suficiente
    
    ;ejemplo 3
    
    primer_cadena db 'hola', 0      ;primera cadena
    
    segunda_cadena db 'hola', 0     ;segunda cadena
    
    ;ejemplo 4
    
    cadena db 'hola, mundo', 0  ;cadena en la que buscaremos el caracter
    
    caracter_a_buscar db ',' ;caracter que quiero buscar

    ;ejemplo 5
    
    string db 'hola, mundo', 0 ;cadena a convertir a mayusculas

.code
    
    ;ejemplo 1 copiar una cadena en otra
    
    mov AX,@data
    
    mov DS,AX   ;cargo ds con la direccion base de los datos
    
    lea SI,cadena_origen    ;Asigno la direccion de inicio de la cadena de origen en SI
    
    lea DI,cadena_destino   ;Asigno la direccion de inicio de la cadena de destino en DI
    
copiar_cadena:

    mov AL,[SI]         ;Cargar el caracter actual de la cadena de origen en AL
    
    mov [DI],AL         ;Guardar el caracter en la cada de destino
    
    inc SI              ;Avanzar al siguiente caracter de la cadena de origen
    
    inc DI              ;Avanzar al siguiente espacio de memoria en la cadena de destino
    
    cmp AL,0H           ;Comprobar si hemos llegado al final de la cadena
    
    jne copiar_cadena   ;si no, continuar copiando
     
    ;si hemos llegado al final de la cadena, terminara el bucle
    jmp fin
    
fin:
    
   ;ejemplo 2 concatenar 2 cadenas
   
   lea SI,cadena1               ;Cargar SI con la direccion de inicio de la primera cadena
   
   lea DI,cadena_concatenada    ;Cargar DI con la direccion de inicio de la cadena concatenada
   
copiar_cadena1:                 ;Bloque para copiar la primera caderna
    
    mov AL,[SI]                 ;Cargar el caracter actual de la primera cadena en AL
    
    mov [DI],AL                 ;Guardar el caracter en la cadena concatenada
     
    inc SI                      ;avanzar al siguiente caracter de la primera cadena  
      
    inc DI                      ;Avanzar al siguiente espacio de memoria en la cadena concatenada
                                
    cmp Al,0                    ;Comprobar si hemos llegado al final de la primera cadena
    
    jne copiar_cadena1          ;si no llegamos al final, continuar copiando
    
    lea SI,cadena2              ;Cargar SI con la direccion de inicio de la segunda cadena
    
copiar_cadena2:                 ;BLOQUE SEGUNDA CADENA
    
    mov AL,[SI]                 ;cargar el caracter actual de la segunda cadena en AL
    
    mov [DI],AL                 ;Guardar el caracter en la cadena concatenada
    
    inc SI                      ;Avanzar al siguiente caracter de la segunda cadena
    
    inc DI                      ;Avanzar al siguiente espacio de memoria en la cadena concatenada
    
    cmp AL,0h                   ;Compruebo si llege al final de la cadena
    
    jne copiar_cadena2          ;si no llegue repito
    
    jmp finalizado              ;termino 
    
finalizado:
    
    ;ejemplo 3 comparar 2 cadenas
    
    lea SI,primer_cadena        ;Cargar SI con la direccion de inicio de la primera cadena
    
    lea DI,segunda_cadena       ;Cargar DI con la direccion de inicio de la segunda cadena
    
comparar_cadenas:               ;BLOQUE DONDE COMPARO

    mov AL,[SI]                 ;Cargar el caracter actual de la primera cadena en AL
   
    mov BL,[DI]                 ;Cargar el caracter actuan de la segunda cadena en BL
   
    cmp AL,BL                   ;Comparar los caracteres
   
    jne cadenas_diferentes      ;Si los caracteres son diferentes salta hacia la etiqueta cadenas diferentes
   
    cmp AL,0H                   ;Compruebo si llege al final de la cadena que se representa con el 0
    
    je cadenas_iguales          ;si llege al final, las cadenas son iguales por lo que salto a esa etiqueta y salgo de el bucle que compara
    
    inc SI                      ;Avanzar al siguiente caracter de la primera cadena
    
    inc DI                      ;avanzar al siguiente caracter de la segunda cadena
    
    jmp comparar_cadenas        ;Volver a comparar los siguientes caracteres
    

cadenas_iguales:    ;Bloque son iguales
    
   mov DX,8888H 
    
   jmp completado
   
cadenas_diferentes: ;Bloque son distintos

    mov DX,5555H
    
    jmp completado    
    
completado:    
    
    ;ejemplo 4 encontrar un caracter
    
    lea SI,cadena               ;Cargar SI con la direcion base de los datos
    
    
    mov AL,caracter_a_buscar    ;Cargar AL con el caracter que queremos buscar
    
buscar_caracter:
        
    mov BL,[SI] ;cargar el caracter actual de la cadena en BL
        
    cmp BL,AL   ;comparar el caracter actual con el caracter que estamos buscando
        
    je encontrado  ;Salto condicional si es 0 porque son iguales
        
    cmp BL,0    ;comprobar si llegamos al final de la cadena
        
    je no_encontrado    ;salto condicional si es 0 porque llego al final de la cadena
        
    inc SI      ;avanzar al siguiente caracter de la cadena
        
    jmp buscar_caracter     ;Volver a buscar el siguiente caracter
        
encontrado:  ;BLOQUE SI LO ENCONTRE
    
    mov DX,4444H
    
    jmp finalizacion
    
no_encontrado:

    mov DX,7777H   ;BLOQUE SI NO LO ENCONTRE
    
    jmp finalizacion
    
finalizacion:  

    ;ejemplo 5 convertir a mayusculas los caracteres de una cadena


    lea SI,string ;cargar SI con la direccion de inicio de la cadena
    
convertir_mayusculas:

    mov AL,[SI] ;cargo el caracter actual de la cadena en AL
    
    cmp AL,0
    
    je fin_conversion
        
    cmp AL,'a' ;comprobar si el caracter es una letra minuscula 'a'
    
    jl siguiente_caracter   ;si no, pasar al siguiente caracter
    
    cmp AL,'z'  ;comprobar si el caracter es una letra minuscula 'z'
    
    jg siguiente_caracter   ;si no, pasar al siguiente caracter
        
    sub al,20H   ;convertir el caracter a mayusculas restando 32(20h) al calor ASCII
    
    mov [SI],al ;guardar el caracter convertido en la misma posicion de la cadena
    
siguiente_caracter:

    inc SI      ;avanzar al siguiente caracter de la cadena
    
    jmp convertir_mayusculas ;volver a convertir el siguiente caracter
    
fin_conversion:

    mov DX,6666H
    
    mov AL,4CH
    
    int 21H
    