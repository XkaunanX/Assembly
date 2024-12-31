# Ejemplos de Tipos de Direccionamiento en Emu8086

En estos ejemplos se muestran los diferentes tipos de direccionamiento que se pueden usar en Assembly 8086. Utilizamos el formato `.MODEL SMALL` para definir la estructura del programa y la segmentacion de memoria.

## Tipos de Direccionamiento

1. **Directo**: Accede a una direccion de memoria especifica.
2. **Indirecto**: Usa un registro para apuntar a una direccion de memoria.
3. **Inmediato**: Utiliza un valor constante como operando.
4. **De Registro**: Utiliza registros como operandos.
5. **Indexado**: Usa registros de indice (`SI`, `DI`) combinados con un desplazamiento.
6. **Basado**: Usa registros base (`BP`, `BX`) para acceder a datos.
7. **Basado Indexado**: Combina registros base e indice para acceder a memoria.
