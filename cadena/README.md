En Assembly 8086, las cadenas se manejan típicamente como secuencias de bytes almacenados en memoria, donde cada carácter de la cadena es representado por un valor ASCII. A continuación, se describen las operaciones más comunes para trabajar con cadenas de caracteres.

1. **MOVSB (Move String Byte)**
   - La instrucción `MOVSB` mueve un byte desde la dirección de memoria apuntada por `SI` (Source Index) a la dirección de memoria apuntada por `DI` (Destination Index).
   - Esta instrucción incrementa o decrementa automáticamente los registros `SI` y `DI` según el valor de la bandera `DF` (Direction Flag). Si `DF` está claro, `SI` y `DI` se incrementan; si está establecido, `SI` y `DI` se decrementan.
   - **Sintaxis:**
     ```assembly
     MOVSB
     ```
   - **Ejemplo:**
     ```assembly
     MOV SI, OFFSET cadenaOrigen  ; Dirección de origen
     MOV DI, OFFSET cadenaDestino ; Dirección de destino
     MOVSB                       ; Copia un byte de cadenaOrigen a cadenaDestino
     ```

2. **MOVSW (Move String Word)**
   - La instrucción `MOVSW` es similar a `MOVSB`, pero mueve una palabra (2 bytes) desde la dirección de memoria apuntada por `SI` a la dirección de memoria apuntada por `DI`.
   - Esta instrucción también ajusta automáticamente los registros `SI` y `DI`.
   - **Sintaxis:**
     ```assembly
     MOVSW
     ```
   - **Ejemplo:**
     ```assembly
     MOV SI, OFFSET cadenaOrigen  ; Dirección de origen
     MOV DI, OFFSET cadenaDestino ; Dirección de destino
     MOVSW                       ; Copia una palabra (2 bytes) de cadenaOrigen a cadenaDestino
     ```

3. **LODSB (Load String Byte)**
   - La instrucción `LODSB` carga un byte desde la dirección de memoria apuntada por `SI` al registro `AL`. Luego, `SI` se incrementa o decrementa dependiendo de la bandera `DF`.
   - **Sintaxis:**
     ```assembly
     LODSB
     ```
   - **Ejemplo:**
     ```assembly
     MOV SI, OFFSET cadena        ; Dirección de la cadena
     LODSB                        ; Carga un byte de la cadena en AL
     ```

4. **LODSW (Load String Word)**
   - Similar a `LODSB`, pero carga una palabra (2 bytes) desde la dirección de memoria apuntada por `SI` al registro `AX`. Después de la operación, `SI` se ajusta automáticamente.
   - **Sintaxis:**
     ```assembly
     LODSW
     ```
   - **Ejemplo:**
     ```assembly
     MOV SI, OFFSET cadena        ; Dirección de la cadena
     LODSW                        ; Carga una palabra (2 bytes) de la cadena en AX
     ```

5. **STOSB (Store String Byte)**
   - La instrucción `STOSB` almacena el valor de `AL` en la dirección de memoria apuntada por `DI`. Luego, `DI` se ajusta según el valor de la bandera `DF`.
   - **Sintaxis:**
     ```assembly
     STOSB
     ```
   - **Ejemplo:**
     ```assembly
     MOV DI, OFFSET cadenaDestino ; Dirección de destino
     MOV AL, 'A'                  ; Valor a almacenar
     STOSB                        ; Almacena AL en cadenaDestino
     ```

6. **STOSW (Store String Word)**
   - Similar a `STOSB`, pero almacena el valor de `AX` (una palabra de 2 bytes) en la dirección de memoria apuntada por `DI`. Después de la operación, `DI` se ajusta automáticamente.
   - **Sintaxis:**
     ```assembly
     STOSW
     ```
   - **Ejemplo:**
     ```assembly
     MOV DI, OFFSET cadenaDestino ; Dirección de destino
     MOV AX, 'AB'                 ; Valor a almacenar
     STOSW                        ; Almacena AX en cadenaDestino
     ```

7. **SCASB (Scan String Byte)**
   - La instrucción `SCASB` compara un byte almacenado en `AL` con el byte en la dirección de memoria apuntada por `DI`. Luego, `DI` se ajusta según la bandera `DF`. El resultado de la comparación afecta las banderas de estado.
   - **Sintaxis:**
     ```assembly
     SCASB
     ```
   - **Ejemplo:**
     ```assembly
     MOV AL, 'A'                  ; Valor a buscar
     MOV DI, OFFSET cadenaDestino ; Dirección de la cadena
     SCASB                        ; Compara AL con el byte en cadenaDestino
     ```

8. **SCASW (Scan String Word)**
   - Similar a `SCASB`, pero compara una palabra (2 bytes) en `AX` con la palabra en la dirección de memoria apuntada por `DI`.
   - **Sintaxis:**
     ```assembly
     SCASW
     ```
   - **Ejemplo:**
     ```assembly
     MOV AX, 'AB'                 ; Valor a buscar
     MOV DI, OFFSET cadenaDestino ; Dirección de la cadena
     SCASW                        ; Compara AX con la palabra en cadenaDestino
     ```

9. **CMPSB (Compare String Byte)**
   - La instrucción `CMPSB` compara un byte desde la dirección de memoria apuntada por `SI` con el byte en la dirección de memoria apuntada por `DI`.
   - Luego, `SI` y `DI` se ajustan automáticamente y las banderas de estado se modifican según el resultado de la comparación.
   - **Sintaxis:**
     ```assembly
     CMPSB
     ```
   - **Ejemplo:**
     ```assembly
     MOV SI, OFFSET cadena1       ; Dirección de la primera cadena
     MOV DI, OFFSET cadena2       ; Dirección de la segunda cadena
     CMPSB                        ; Compara los bytes de las dos cadenas
     ```

10. **CMPSW (Compare String Word)**
    - Similar a `CMPSB`, pero compara una palabra (2 bytes) en las direcciones de memoria apuntadas por `SI` y `DI`.
    - **Sintaxis:**
      ```assembly
      CMPSW
      ```
    - **Ejemplo:**
      ```assembly
      MOV SI, OFFSET cadena1       ; Dirección de la primera cadena
      MOV DI, OFFSET cadena2       ; Dirección de la segunda cadena
      CMPSW                        ; Compara las palabras de las dos cadenas
      ```

**Resumen:**
- **MOVSB / MOVSW**: Mueve un byte o palabra desde una cadena de origen a una cadena de destino.
- **LODSB / LODSW**: Carga un byte o palabra desde una cadena en `SI` a un registro.
- **STOSB / STOSW**: Almacena el valor de un registro en una cadena en `DI`.
- **SCASB / SCASW**: Compara un byte o palabra con el valor en la cadena en `DI`.
- **CMPSB / CMPSW**: Compara los bytes o palabras de dos cadenas.