Instrucciones CALL y RET en Assembly 8086

1. **CALL**
   - La instrucción `CALL` se utiliza para realizar una **llamada a una subrutina** o función.
   - Cuando se ejecuta un `CALL`, el procesador hace lo siguiente:
     1. **Empuja la dirección de retorno** en la pila. Esta es la dirección de la instrucción que sigue a la llamada (`CALL`), para que luego se pueda regresar a ese punto de ejecución.
     2. **Cambia el flujo de control** al inicio de la subrutina, haciendo que el procesador comience a ejecutar el código en la dirección de la subrutina indicada.
   - La sintaxis básica de `CALL` es:
     ```assembly
     CALL direccion_de_subrutina
     ```
   - Ejemplo:
     ```assembly
     CALL MiSubrutina   ; Llama a la subrutina MiSubrutina
     ```

2. **RET**
   - La instrucción `RET` se utiliza para **regresar de una subrutina** a la instrucción que sigue a la llamada (`CALL`).
   - Cuando se ejecuta un `RET`, el procesador realiza los siguientes pasos:
     1. **Extrae la dirección de retorno** desde la pila (la dirección que fue empujada por el `CALL`).
     2. **Ajusta el puntero de instrucción (IP)** a la dirección extraída, lo que hace que el procesador retome la ejecución del programa justo después de la llamada.
   - La sintaxis básica de `RET` es:
     ```assembly
     RET
     ```
   - Si se pasaron parámetros a la subrutina a través de la pila, se puede usar `RET N` para limpiar esos parámetros de la pila, donde `N` es el número de bytes que deben limpiarse.
   - Ejemplo básico:
     ```assembly
     RET   ; Regresa a la instrucción siguiente a la llamada
     ```

   - Ejemplo con parámetros:
     ```assembly
     RET 4  ; Limpia 4 bytes de la pila (por ejemplo, si se pasaron 2 parámetros de 2 bytes cada uno)
     ```

**Resumen del flujo de ejecución:**
1. **CALL**:
   - Empuja la dirección de retorno en la pila.
   - Salta al inicio de la subrutina.

2. **RET**:
   - Extrae la dirección de retorno de la pila.
   - Regresa a la instrucción siguiente al `CALL`.

**Ejemplo completo:**

```assembly
; Llamada a subrutina y retorno

CALL MiSubrutina     ; Llama a la subrutina MiSubrutina

; Después de la llamada
MiSubrutina:
    ; Cualquier código de la subrutina
    RET              ; Regresa al punto después del CALL

; Aquí el flujo de ejecución continúa después del RET