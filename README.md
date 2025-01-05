# Assembly
Assembly es un lenguaje de programación de bajo nivel que traduce directamente a las instrucciones ejecutables por el procesador. Cada instrucción en assembly corresponde a una operación específica que el hardware puede realizar. Es usado para obtener un control preciso sobre el hardware y optimizar el rendimiento.

## Tamaño de Registros
En el procesador 8086, los registros son de 16 bits, aunque algunos se pueden dividir en partes de 8 bits:

- **Registros de datos:** AX (AH/AL), BX (BH/BL), CX (CH/CL), DX (DH/DL).
- **Registros de puntero e índice:** SP (Stack Pointer), BP (Base Pointer), SI (Source Index), DI (Destination Index).
- **Registros de segmento:** CS (Code Segment), DS (Data Segment), SS (Stack Segment), ES (Extra Segment).
- **Registro de estado:** FLAGS, que contiene indicadores como Zero Flag (ZF), Carry Flag (CF), etc.

Cada registro tiene un tamaño de 16 bits, permitiendo manejar valores entre 0 y 65,535 en decimal o 0x0000 a 0xFFFF en hexadecimal.

```plaintext

                        +-------------------------------------+
                        |              8086                  |
                        +-------------------------------------+
                                 |        |       |
            +-------------------+--------+-------+-------------------+
            |                   |        |       |                   |
    +---------------+    +---------------+   +---------------+   +---------------+
    |    ALU        |    |    Registros  |   |    Bus de      |   |    Unidad de  |
    | (Aritmetica y |    |   Propósito   |   |   Direcciones  |   |   Control     |
    |  Logica)      |    |   General     |   |   y Datos      |   |               |
    +---------------+    +---------------+   +---------------+   +---------------+
            |                   |                   |                   |
    +---------------+    +---------------+   +---------------+   +---------------+
    |     Registros |    |     Registros |   |    Bus de      |   |    Interfaz   |
    |  de Segmentos |    |  de Propósito |   |  Entrada/Salida|   |  Externa      |
    |   (CS, DS, SS,|    |   (AX, BX, CX,|   |  (DMA, Puertos |   |   de Memoria  |
    |    ES)        |    |   DX, SI, DI) |   |   de E/S)      |   |               |
    +---------------+    +---------------+   +---------------+   +---------------+
            |                       |
    +---------------+        +----------------+
    |   Unidad de   |        |    Controlador  |
    |   Buses       |        |   de Interrup-  |
    |   (Direccion, |        |   ciones y      |
    |    Datos)     |        |   de Memoria    |
    +---------------+        +----------------+

```

## CISC
El 8086 pertenece a la arquitectura **CISC** (*Complex Instruction Set Computer*). Sus características principales son:

- **Conjunto de instrucciones extenso:** Permite realizar operaciones complejas con pocas instrucciones.
- **Modos de direccionamiento variados:** Directo, indirecto, basado en registros, indexado, entre otros.
- **Ciclos de instrucción variables:** Dependiendo de la complejidad de cada instrucción.
- **Acceso directo a memoria:** Permite trabajar con datos almacenados en memoria sin moverlos a registros intermedios.

## Paradigma
El paradigma del ensamblador 8086 es **imperativo** y **orientado a la arquitectura**. El programador controla directamente el flujo de ejecución, los registros y la memoria. Esto permite un alto nivel de optimización y eficiencia en el uso del hardware.

## Segmentación y Direcciones Físicas

El procesador 8086 utiliza **segmentación de memoria** para acceder a hasta 1 MB (2^20 direcciones) de memoria física, dividiéndola en segmentos de 64 KB (2^16 direcciones) cada uno. Los segmentos se combinan con un desplazamiento para calcular una dirección física:

### Dirección lógica**: En el 8086, la dirección lógica consiste en un par de valores:
   - Segmento (16 bits)
   - Desplazamiento (offset, 16 bits)

### Dirección Lógica a Dirección Física
La dirección física se calcula así:
```plaintext
Dirección Física = (Segmento × 16) + Desplazamiento
```
Por ejemplo:
- Segmento: 0x1234
- Desplazamiento: 0x5678
- Dirección Física: (0x1234 × 16) + 0x5678 = 0x12340 + 0x5678 = 0x179B8

### Características de la Segmentación
- Cada segmento puede contener hasta 64 KB.
- Los registros de segmento (CS, DS, SS, ES) definen la ubicación base de un segmento.
- Se pueden usar registros como SI y DI para especificar el desplazamiento dentro del segmento.

## Lectura del Hexadecimal
El sistema hexadecimal utiliza 16 símbolos: 0-9 y A-F. Cada dígito hexadecimal representa 4 bits (un nibble). Por ejemplo:

- Decimal: 255
- Binario: 11111111
- Hexadecimal: 0xFF

En el 8086, las direcciones y valores suelen expresarse en hexadecimal para simplificar la representación de datos binarios.
