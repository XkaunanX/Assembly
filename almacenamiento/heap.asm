; OPERACIONES CON MEMORIA

ORG 100H               ; Dirección de inicio del programa

.MODEL SMALL           ; Definir el modelo de memoria como pequeño (pequeño segmento de código y datos)

.DATA                  ; Sección de datos

; Define un bloque de datos para almacenar el tamaño del espacio en el montón
heap_size DW 1000H     ; Tamaño deseado del espacio en el montón (por ejemplo, 4096 bytes)

variable DW 1234H      ; Variable en memoria (un valor de ejemplo)

source_buffer DB 100h DUP(?)  ; Buffer de origen (100h bytes no inicializados)

destination_buffer DB 100h DUP(?) ; Buffer de destino (100h bytes no inicializados)

.CODE                  ; Sección de código

; BLOQUE PARA RESERVAR MEMORIA EN EL MONTÓN

MOV AX, @DATA          ; Inicializa el segmento de datos DS
MOV DS, AX             ; Configura DS para apuntar a la sección de datos

MOV BX, heap_size      ; Carga el tamaño del espacio en el montón en BX
MOV AH, 48H            ; Función 48H de MS-DOS para reservar espacio en el montón
INT 21H                ; Llama a la interrupción 21H para reservar espacio en el montón

; El manejador del bloque de memoria recién reservado estará en BX después de la llamada a INT 21H
; Puedes usar este manejador para acceder al bloque de memoria reservado

; BLOQUE PARA LIBERAR MEMORIA EN EL MONTÓN

MOV BX, heap_size      ; Coloca el manejador del bloque de memoria reservado en BX
MOV AH, 49H            ; Función 49H de MS-DOS para liberar espacio en el montón
INT 21H                ; Llama a la interrupción 21H para liberar espacio en el montón

; BLOQUE PARA RESERVAR MEMORIA EN LA PILA

MOV AX, 1000H          ; Tamaño deseado de la reserva de espacio en la pila (4096 bytes)
SUB SP, AX             ; Reservar espacio en la pila restando el tamaño deseado del puntero de pila (SP)

; La pila crece hacia la dirección de memoria más baja.
; Después de esta operación, el espacio especificado estará reservado en la pila
; y se puede utilizar para almacenar datos temporales, direcciones de retorno de subrutinas, registros guardados, etc.

; BLOQUE PARA LIBERAR ESPACIO EN LA PILA

MOV AX, 1000H          ; Tamaño reservado previamente (4096 bytes)
ADD SP, AX             ; Liberar espacio sumando el tamaño previamente reservado al puntero de pila (SP)

; Al sumar el tamaño al puntero de pila (SP), se "retrocede" en la dirección de memoria más alta, 
; liberando así el espacio reservado previamente en la pila.

; BLOQUE PARA ACCEDER A LA MEMORIA UTILIZANDO PUNTEROS

; Cargar la dirección de la variable en el registro BX (como puntero)
MOV BX, OFFSET variable  ; OFFSET: Convierte el nombre de la variable en la dirección de memoria donde se encuentra

; Acceder a la memoria utilizando el puntero BX
MOV AX, [BX]             ; Mover el valor almacenado en la dirección apuntada por BX a AX

; Ahora AX contiene el valor de la variable en memoria (en este caso, 1234H)

; BLOQUE PARA MOVER UN BLOQUE DE DATOS EN MEMORIA

; Cargar la dirección de origen en SI y la dirección de destino en DI
LEA SI, source_buffer     ; Cargar la dirección de origen del buffer en SI
LEA DI, destination_buffer ; Cargar la dirección de destino del buffer en DI

; Cargar el contador CX con el número de bytes a copiar (100h bytes = 256 bytes)
MOV CX, 100H             ; Por ejemplo, copiar 256 bytes (100h en hexadecimal)

; Mover el bloque de datos de origen a destino
REP MOVSB                ; Usar REP MOVSB para mover los bytes de source_buffer a destination_buffer

RET                      ; Retornar al sistema operativo o a la llamada anterior