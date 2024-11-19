# Ejemplos de Tipos de Direccionamiento en Emu8086

En estos ejemplos se muestran los diferentes tipos de direccionamiento que se pueden usar en Assembly 8086. Utilizamos el formato `.MODEL SMALL` para definir la estructura del programa y la segmentación de memoria.

## Tipos de Direccionamiento

1. **Directo**: Accede a una dirección de memoria específica.
2. **Indirecto**: Usa un registro para apuntar a una dirección de memoria.
3. **Inmediato**: Utiliza un valor constante como operando.
4. **De Registro**: Utiliza registros como operandos.
5. **Indexado**: Usa registros de índice (`SI`, `DI`) combinados con un desplazamiento.
6. **Basado**: Usa registros base (`BP`, `BX`) para acceder a datos.
7. **Basado Indexado**: Combina registros base e índice para acceder a memoria.
