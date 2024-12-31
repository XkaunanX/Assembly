# Ejemplos de Saltos en Assembly 8086

En Assembly, los **saltos** permiten modificar el flujo de ejecucion del programa. Los saltos pueden ser **incondicionales**, que siempre redirigen el flujo del programa, o **condicionales**, que dependen del resultado de una operacion anterior.

## Tipos de Saltos

1. **Salto Incondicional (`JMP`)**:
   - Redirige la ejecucion a otra instruccion sin evaluar ninguna condicion.

2. **Saltos Condicionales**:
   - **JE (Jump if Equal)**: Salta si los operandos son iguales.
   - **JNE (Jump if Not Equal)**: Salta si los operandos no son iguales.
   - **JG (Jump if Greater)**: Salta si el primer operando es mayor.
   - **JL (Jump if Less)**: Salta si el primer operando es menor.

3. **Bucle (`LOOP`)**:
   - Decrementa el registro `CX` y salta si `CX` no es cero.
