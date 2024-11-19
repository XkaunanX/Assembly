Operaciones sobre la Pila en Assembly 8086

1. **PUSH**
   - La instrucción `PUSH` coloca un valor en la parte superior de la pila.
   - El valor se coloca en la dirección de memoria apuntada por el puntero de pila (SP), y luego el puntero de pila se decrece.
   - Ejemplo: `PUSH AX` empuja el valor contenido en el registro AX a la pila.

2. **POP**
   - La instrucción `POP` extrae un valor de la parte superior de la pila.
   - El valor se recupera de la dirección de memoria apuntada por el puntero de pila (SP), y luego el puntero de pila se incrementa.
   - Ejemplo: `POP BX` saca el valor del registro BX de la pila.

3. **PUSHF**
   - La instrucción `PUSHF` coloca el contenido del registro de bandera (Flags) en la pila.
   - Esto permite guardar el estado de las banderas antes de realizar ciertas operaciones.
   - Ejemplo: `PUSHF` guarda el valor de las banderas en la pila.

4. **POPF**
   - La instrucción `POPF` recupera el valor del registro de bandera (Flags) desde la pila.
   - Esto restaura el estado de las banderas a como estaba antes de que se ejecutara el `PUSHF`.
   - Ejemplo: `POPF` restaura las banderas desde la pila.

5. **ENTER**
   - La instrucción `ENTER` prepara la pila para una llamada a una subrutina, guardando el marco de la pila.
   - Generalmente se utiliza para establecer el espacio de almacenamiento para las variables locales en subrutinas.
   - Ejemplo: `ENTER 10, 0` establece un marco de pila de 10 bytes para variables locales.

6. **LEAVE**
   - La instrucción `LEAVE` deshace los efectos de la instrucción `ENTER`, restaurando el puntero de pila (SP) al estado anterior.
   - Se usa generalmente al finalizar una subrutina.
   - Ejemplo: `LEAVE` limpia el marco de pila de la subrutina.