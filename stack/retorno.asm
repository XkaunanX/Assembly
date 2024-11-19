ORG 100H

.MODEL SMALL
.DATA

mensaje DB 'Se regreso de la funcion: $'

.CODE

; FUNCION PRINCIPAL
START:
    MOV AX, @DATA        ; Inicializar el segmento de datos
    MOV DS, AX

    ; Llamar a una subrutina
    CALL Funcion         ; Llamar a la subrutina Funcion

    ; Mostrar el mensaje
    MOV AH, 9
    LEA DX, mensaje
    INT 21H

    MOV AH, 4Ch          ; Terminar el programa
    INT 21H

; FUNCION
Funcion:
    ; Aquí se realiza algún procesamiento
    MOV AX, 5            ; Cargar valor 5 en AX

    ; Regresar a la función principal
    RET                  ; Retorna de la función (usa el valor en el stack para la dirección de retorno)