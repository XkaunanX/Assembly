;OPERACIONES CON MEMORIA

ORG 100H

.MODEL SMALL

.DATA

    ;DEFINE UN BLOQUE DE DATOS PARA ALMACENAR EL RAMANO DEL ESPACIO EN EL MONTON
    
    heap_size DW 1000H  ;TAMANO DESEADO DEL ESPACIO EN EL MONTO (POR EJEMPLO, 4096 BYTES)

    variable DW 1234H   ;VARIABLE EN MEMORIA

    source_buffer DB 100h DUP(?)  ;BUFFER DE ORIGEN
    
    destination_buffer DB 100h DUP(?) ;BUFFER DE DESTINO

.CODE

    ;BLOQUE PARA RESERVAR MEMORIA HEAP
    
    MOV AX,@DATA       ;INICIALIZA EL SEGMENTO DE DATOS DS
    
    MOV DS,AX       ;CONFIGURO DS
    
    MOV BX,heap_size ;CARGA EL TAMAÑO DEL ESPACIO EN EL MONTON EN BX
    
    MOV AH,48H      ;FUNCION 48H DE MS-DOS PARA RESERVAR ESPACIO EN EL MONTON
    
    INT 21H         ;LLAMA A LA INTERRUPCION 21H PARA RESERVAR ESPACIO EN EL MONTON
    
    ;EL MANEJADOR DEL BLOQUE DE MEMORIA RECIEN RESERVADO ESTARA EN BX DESPUES DE LA LLAMADA A INT 21 H
    
    ;PUEDE USAR ESTE MANEJADOR PARA ACCEDER AL BLOQUE DE MEMORIA RESERVADO
    
    ;BLOQUE PARA LIBERAR MEMORIA HEAP
    
    MOV BX,heap_size ; Coloca el manejador del bloque de memoria reservado en BX 
    
    MOV AH,49H      ;FUNCION 49H DE MS-DOS PARA LIBERAR ESPACIO EN EL MONTON
    
    INT 21H         ;LLAMA A LA INTERRUPCION 21H PARA LIBERAR ESPACIO EN EL MONTON
    
    ;BLOQUE PARA RESERVAR MEMORIA EN LA PILA
    
    MOV AX,1000H    ;TAMANO DESEADO DE LA RESERVA DE ESPACION EN LA PILA
    
    SUB SP,AX       ;RESERVAR ESPACIO EN LA PILA
    
    ;AX contiene el tamano deseado de la reserva de espacio en la pila. 
    ;Luego, se resta este valor del puntero de pila (SP)
    ;lo que hace que la pila crezca en la direccion de memoria mas baja.
    ;Despues de esta operacion, el espacio especificado estara reservado en la pila 
    ;y se puede utilizar para almacenar datos temporales, direcciones de retorno de subrutinas, registros guardados, entre otros
    
    ;BLOQUE PARA LIBERAR ESPACIO EN LA PILA
    
    MOV AX,1000H    ;TAMANO RESERVADO PREVIAMENTE
    
    ADD SP,AX       ;LIBERAR ESPACIO
    
    ;AX contiene el tamano reservado previamente en la pila
    ;Luego, se suma ese valor al puntero de pila SP, 
    ;lo que hace que la pila "retroceda" en la direccion de memoria mas alta
    ;liberando asi el espacio reservado previamente
    
    ;BLOQUE ACCEDER A LA MEMORIA UTILIZANDO PUNTEROS
    
    ;CARGAR LA DIRECCION DE LA VARIABLE EN EL REGISTRO BX(PUNTERO)
    
    MOV BX, OFFSET variable  ;OFFSET: lo que convierte el nombre de la variable en la dirección de memoria donde se encuentra
    
    ;ACCEDER A LA MEMORIA UTILIZANDO EL PUNTERO BX
    
    MOV AX,[BX] ;MOVER EL VALOR ALMACENADO EN LA DIRECCION APUNTADA POR BX A AX
    
    ;AHORA AX CONTIENE EL VALOR DE LA VARIABLE EN MEMORIA

    ;BLOQUE MOVER BLOQUE DE DATOS EN MEMORIA
    
    ;cargar la direccion de origen en SI y la direccion de destino en DI
    
    LEA SI,source_buffer
    
    LEA DI,destination_buffer
    
    ;cargar el contador CX con el numero de bytes a copiar
    
    MOV CX,100H     ;por ejemplo, copiar 256 bytes (100h en hexadecimal)
    
    ;mover el bloque de datos de origen a destino
    
    REP MOVSB
    
    RET
    
