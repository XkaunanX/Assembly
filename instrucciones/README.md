## ¿Qué es una Instrucción?

En el contexto de la programación en ensamblador, una **instrucción** es una operación o comando que la CPU puede ejecutar. Cada instrucción en un programa de ensamblador se traduce en una operación básica, como mover datos, realizar cálculos, o controlar el flujo de ejecución. En el caso de la arquitectura 8086, las instrucciones operan sobre registros y memoria, y generalmente se representan mediante una secuencia de bytes en la memoria.

## Ciclo de Vida de una Instrucción

El ciclo de vida de una instrucción es el proceso completo de ejecución de una instrucción por parte de la CPU. Este ciclo generalmente consta de las siguientes fases:

1. **Búsqueda (Fetch):** La CPU lee la instrucción desde la memoria.
2. **Decodificación (Decode):** La CPU interpreta la instrucción, determinando qué operación debe realizar.
3. **Ejecución (Execute):** La CPU ejecuta la operación especificada por la instrucción.
4. **Acceso a Memoria (Memory Access):** Si la instrucción requiere leer o escribir datos en memoria, se realiza en esta fase.
5. **Escritura de Resultados (Write-back):** Los resultados de la instrucción se escriben en los registros o en memoria.

Este ciclo se repite continuamente a lo largo de la ejecución de un programa.

## CISC vs RISC

Las arquitecturas de computadoras se pueden clasificar principalmente en dos tipos: **CISC** (Complex Instruction Set Computing) y **RISC** (Reduced Instruction Set Computing).

- **CISC (Complex Instruction Set Computing):** En una arquitectura CISC, como la 8086, las instrucciones son más complejas y pueden realizar múltiples operaciones en un solo ciclo de reloj. Esto significa que cada instrucción puede realizar tareas como cargar, almacenar y realizar operaciones aritméticas en un solo paso. Sin embargo, esto puede resultar en un mayor consumo de ciclos de reloj para cada instrucción y una mayor complejidad en la decodificación de instrucciones.

- **RISC (Reduced Instruction Set Computing):** En una arquitectura RISC, las instrucciones son más simples y generalmente requieren un número constante de ciclos de reloj para ejecutarse. Cada instrucción realiza una única operación, lo que permite una ejecución más rápida en muchos casos, pero puede requerir más instrucciones para lograr tareas complejas.

La arquitectura 8086 es un ejemplo de un diseño CISC, con un conjunto de instrucciones más complejo en comparación con los diseños RISC modernos.

## Micródigo

El **micródigo** es un conjunto de instrucciones de bajo nivel que describe cómo una instrucción de alto nivel, como las del lenguaje ensamblador, se traduce en operaciones de la CPU. En las arquitecturas CISC como la 8086, el micródigo es fundamental para descomponer una instrucción compleja en una serie de microoperaciones que se pueden ejecutar en los ciclos de reloj de la CPU.

Por ejemplo, para la instrucción `MOV AX, 10`, el micródigo podría descomponerla en las siguientes microoperaciones:

1. **Leer la instrucción** `MOV AX, 10` desde la memoria.
2. **Decodificar la instrucción** para identificar que el valor 10 debe moverse al registro AX.
3. **Escribir el valor 10** en el registro AX.

En la práctica, el micródigo para una instrucción varía según el tipo de operación y la arquitectura específica de la CPU.

## Traductores del Lenguaje

Los **traductores** son programas que convierten el código fuente escrito en un lenguaje de alto nivel o en ensamblador a un formato que la CPU pueda ejecutar, generalmente código binario. En el caso de la arquitectura 8086, existen varios tipos de traductores:

- **Ensambladores (Assembler):** Son los programas que traducen el código escrito en ensamblador a código de máquina. El ensamblador genera un archivo binario ejecutable, traduciendo cada instrucción de ensamblador en una secuencia de bytes que la CPU puede procesar directamente.
  
  Ejemplo de un ensamblador que puede usarse con la 8086 es **MASM (Microsoft Macro Assembler)**.

## Destino y Fuente

En el contexto de las instrucciones en assembly 8086, **fuente** y **destino** son términos que se utilizan para describir los operandos de una instrucción:

- **Fuente:** Es el valor que se va a operar o copiar en la operación. Por ejemplo, en la instrucción `MOV AX, 10`, el valor `10` es la fuente.
- **Destino:** Es el registro o la ubicación en memoria donde se almacenará el resultado de la operación. En la instrucción `MOV AX, 10`, el registro `AX` es el destino.

Por lo tanto, en las instrucciones de ensamblador, la fuente y el destino son los componentes que especifican los operandos con los que se va a trabajar la CPU.

## Modificación de las Banderas

Al ejecutar una instrucción, el estado de las **banderas** del procesador puede cambiar. Estas banderas son bits especiales en la CPU que reflejan el resultado de las operaciones y se utilizan para controlar el flujo del programa. Dependiendo de la operación, las banderas como el **Carry Flag**, **Zero Flag** o **Overflow Flag** pueden ser modificadas, lo que afecta la ejecución de instrucciones subsecuentes.

## Tipos de Instrucciones en Assembly 8086

Las instrucciones de ensamblador 8086 se pueden clasificar en diferentes tipos según su propósito. A continuación, se describen los principales tipos de instrucciones.

# 1. Instrucciones de Datos

Estas instrucciones permiten mover, cargar, almacenar y manipular datos en los registros o en la memoria. Permiten trabajar con los datos directamente.  
  
**MOV**: Mueve datos de una fuente a un destino.

```plaintext
MOV AX, 1234h       ; Cargar el valor 1234h en el registro AX
MOV BX, 0x3000      ; Dirección de memoria en la RAM donde se va a guardar el valor
MOV [BX], AX        ; Guardar el valor de AX en la RAM en la dirección 0x3000
```
**PUSH**: Coloca un valor en la pila.  
**POP**: Extrae un valor de la pila.  

```assembly
MOV AX, 1234h      ; Cargar el valor 1234h en el registro AX
PUSH AX            ; Colocar el valor de AX en la pila

MOV AX, 5678h      ; Cargar el valor 5678h en el registro AX
PUSH AX            ; Colocar el valor de AX (5678h) en la pila

POP BX             ; Extraer el valor de la pila y guardarlo en BX (será 5678h)
POP AX             ; Extraer el siguiente valor de la pila y guardarlo en AX (será 1234h)
``` 

# 2. Instrucciones de Control de Flujo (Saltos)

Las instrucciones de control de flujo permiten alterar el orden de ejecución de las instrucciones, lo que permite crear bucles, saltos y tomar decisiones.

- **JMP**: Realiza un salto incondicional a una dirección especificada.
- **JE / JZ**: Realiza un salto si la bandera de cero está activada, es decir, si los dos valores comparados son iguales.
- **JNE / JNZ**: Realiza un salto si la bandera de cero no está activada, es decir, si los dos valores comparados son diferentes.

```assembly
MOV AX, 10h         ; Cargar el valor 10h en el registro AX
MOV BX, 10h         ; Cargar el valor 10h en el registro BX

CMP AX, BX          ; Comparar los valores de AX y BX
JE igual            ; Si AX y BX son iguales, saltar a la etiqueta "igual"

MOV DX, 0           ; Si no son iguales, cargar 0 en DX (esto no se ejecutará en este caso)

igual:
MOV DX, 1           ; Si los valores son iguales, cargar 1 en DX
```

# 3. Instrucciones Aritméticas

Estas instrucciones realizan operaciones matemáticas con los valores almacenados en los registros.

- **ADD**: Suma dos valores.
- **SUB**: Resta dos valores.
- **MUL**: Multiplica dos valores.
- **DIV**: Divide un valor entre otro.

## Instruccion ADD

La instrucción `ADD` suma dos operandos y almacena el resultado en el registro `AX`. Este registro es utilizado como destino para almacenar el resultado de la operación, aunque dependiendo de la arquitectura y el contexto, el resultado podría almacenarse en otro registro o en una dirección de memoria.

## Instruccion SUB

La instrucción `SUB` toma dos operandos: el operando de destino y el operando de fuente. Resta el valor del operando de fuente al operando de destino, y coloca el resultado en el operando de destino. A menudo, el operando de destino es un registro, como `AX`, y el operando de fuente puede ser un registro, un valor inmediato o una dirección de memoria.

## Funcionamiento con Complemento a 2

En la arquitectura 8086, la instrucción `SUB` no realiza directamente una operación de resta en términos aritméticos. En lugar de ello, la resta se lleva a cabo sumando el **complemento a 2** del operando de fuente al operando de destino.

El **complemento a 2** de un número se obtiene mediante los siguientes pasos:

1. **Inversión de los bits** del número (complemento a 1).
2. **Suma de 1** al resultado obtenido.

Una vez calculado el complemento a 2 del operando de fuente, la operación de resta se convierte en una operación de suma entre el operando de destino y el complemento a 2 del operando de fuente.

### Ejemplo de la Instrucción SUB

Supongamos que tenemos los siguientes valores:

- `AX = 5`
- `BX = 3`

Cuando ejecutamos la instrucción `SUB AX, BX`, la operación de resta `AX - BX` se convierte en una suma del valor de `AX` con el complemento a 2 de `BX`.

1. El complemento a 2 de `BX = 3` es calculado como sigue:
   - Representación binaria de `BX` (3): `0000 0011`
   - Complemento a 1 de `3`: `1111 1100`
   - Suma de 1 al complemento a 1: `1111 1101` (esto es -3 en complemento a 2).

2. La instrucción `SUB` suma el contenido de `AX` con el complemento a 2 de `BX`: AX + (-BX) = 5 + (-3) = 2

En este caso, el resultado `2` se almacena en el registro `AX`.

## Instrucción MUL

La instrucción **MUL** realiza la multiplicación de un valor por el contenido de un registro de 8 bits o 16 bits. El resultado de la multiplicación se almacena en los registros `AX`, `DX:AX` o `AX:DX`, dependiendo de si se está trabajando con números de 8 bits o 16 bits. El impacto en otros registros depende del tipo de multiplicación realizada:

### 1. **Multiplicación de 8 bits:**

Cuando se realiza una multiplicación de dos valores de 8 bits, el operando de 8 bits se multiplica por el registro `AL` (parte baja de `AX`). El resultado de esta multiplicación se almacena en los registros `AX`, los cuales son de 16 bits.

- **Registros afectados**: La multiplicación de 8 bits solo afectará los registros `AX` (específicamente `AL` y `AH`), sin afectar otros registros como `BX`, `CX`, etc.
- **Posible desbordamiento**: Si el resultado de la multiplicación excede los 8 bits, los registros `AH` y `AL` serán modificados para contener el resultado de 16 bits.

### 2. **Multiplicación de 16 bits:**

Cuando se realiza una multiplicación de dos valores de 16 bits, el operando de 16 bits se multiplica por el valor contenido en `AX`. El resultado de la multiplicación se almacena en los registros `DX:AX`, donde `DX` contiene la parte más significativa del resultado y `AX` contiene la parte menos significativa.

- **Registros afectados**: En una multiplicación de 16 bits, tanto `AX` como `DX` serán afectados, ya que el resultado de la multiplicación puede requerir hasta 32 bits. Los registros `AX` contienen los 16 bits menos significativos, mientras que los registros `DX` contienen los 16 bits más significativos.
- **Posible desbordamiento**: Dado que el resultado puede superar los 16 bits, los registros `DX` y `AX` se usan para almacenar todo el resultado de la multiplicación.

### ¿Por qué la multiplicación afecta otros registros?

- **Tamaño del Resultado**: La razón principal por la que la multiplicación puede afectar otros registros es el tamaño del resultado. En el caso de multiplicaciones de 16 bits, el resultado puede ser un número de 32 bits, lo que requiere dos registros (`DX` y `AX`) para almacenarlo.
- **Registros Predeterminados**: El uso de `AX` y `DX` como registros predeterminados para almacenar el resultado de la multiplicación implica que estos registros pueden verse alterados durante la operación, lo que puede afectar otras partes del programa si se están utilizando estos registros para otros fines.

## Instruccion DIV

La instrucción `DIV` en la arquitectura 8086 se utiliza para realizar una operación de división. La operación puede involucrar números de 8 bits o 16 bits, y el resultado se almacena en un par de registros específicos según el tamaño de los operandos.

## Descripción

La instrucción `DIV` realiza una división de un operando (dividendo) entre otro operando (divisor). Dependiendo del tamaño de los operandos, los registros involucrados varían, pero el resultado siempre se almacena en los registros de destino del procesador.

### Funcionamiento

### División de 8 bits

Cuando se realiza una división de 8 bits, el dividendo se encuentra en los registros `AX`. El registro `AH` contiene la parte alta del dividendo y el registro `AL` contiene la parte baja. El cociente se almacena en el registro `AL`, mientras que el resto se guarda en el registro `AH`.

- **Dividendo**: `AX` (16 bits).
- **Cociente**: `AL` (8 bits).
- **Resto**: `AH` (8 bits).

### División de 16 bits

Para una división de 16 bits, el dividendo se encuentra en los registros `DX:AX`. El registro `DX` contiene la parte alta del dividendo y el registro `AX` contiene la parte baja. El cociente se almacena en el registro `AX` y el resto en el registro `DX`.

- **Dividendo**: `DX:AX` (32 bits).
- **Cociente**: `AX` (16 bits).
- **Resto**: `DX` (16 bits).

### Consideraciones

- **División por cero**: Si el divisor es cero, la instrucción `DIV` generará una excepción de división por cero, lo que detendría la ejecución del programa.
- **Rango de valores**: Es importante verificar que los registros de destino sean lo suficientemente grandes para contener tanto el cociente como el resto. En el caso de divisiones de 16 bits, el registro `AX` puede almacenar un cociente de hasta 65535, mientras que el registro `DX` se utiliza para almacenar el resto.

# 4. Instrucciones Lógicas

Las instrucciones lógicas permiten realizar operaciones a nivel de bits, como AND, OR, XOR e invertir los bits de un registro con máscaras.

- **AND**: Realiza una operación lógica AND entre dos valores.
- **OR**: Realiza una operación lógica OR entre dos valores.
- **XOR**: Realiza una operación lógica XOR entre dos valores.
- **NOT**: Invierte todos los bits de un valor.  

## Operaciones logicas y mascaras
Una máscara es un valor binario utilizado para manipular bits específicos de un registro o una posición de memoria. Las máscaras se emplean para realizar operaciones como:

- **Activación de bits:** Establecer uno o más bits en 1.
- **Desactivación de bits:** Establecer uno o más bits en 0.
- **Conmutación de bits:** Cambiar el estado de uno o más bits (de 1 a 0 o de 0 a 1).
- **Prueba de bits:** Verificar si uno o más bits están en un estado específico.

## Operaciones Comunes con Máscaras
Las máscaras se utilizan junto con operadores lógicos en ensamblador para manipular bits de manera controlada:

### 1. Activación de Bits (OR)
Para activar bits específicos, se utiliza la operación **OR** (`OR`). Esta operación establece en 1 los bits indicados por la máscara, mientras deja los demás sin cambios.

### 2. Desactivación de Bits (AND)
Para desactivar bits específicos, se utiliza la operación **AND** (`AND`) con el complemento de la máscara. Esto fuerza a 0 los bits indicados por la máscara, dejando los demás sin cambios.

### 3. Conmutación de Bits (XOR)
Para cambiar el estado de bits específicos, se utiliza la operación **XOR** (`XOR`). Los bits indicados por la máscara se alternan entre 0 y 1, mientras que los demás permanecen sin cambios.

### 4. Prueba de Bits (AND)
Para verificar el estado de bits específicos, se utiliza la operación **AND** (`AND`). Si el resultado es distinto de 0, significa que al menos uno de los bits indicados por la máscara estaba activo (en 1).

## Máscaras Comunes

### Máscara de 8 bits
Supongamos que se desea manipular el registro **AL** (8 bits):

- Máscara para activar los bits 0 y 3: `00001001` (0x09 en hexadecimal).
- Máscara para desactivar los bits 1 y 2: `11111011` (0xFB en hexadecimal).
- Máscara para conmutar los bits 7 y 6: `11000000` (0xC0 en hexadecimal).

### Máscara de 16 bits
Si se trabaja con un registro de 16 bits como **AX**:

- Máscara para activar los bits 15 y 14: `1100000000000000` (0xC000 en hexadecimal).
- Máscara para desactivar los bits 7 y 0: `1111111011111110` (0xFEFE en hexadecimal).

# 5. Instrucciones de Comparación

Estas instrucciones comparan dos valores y establecen las banderas de la CPU en función del resultado de la comparación.

- **CMP**: Compara dos valores.
- **TEST**: Realiza una operación AND entre dos valores, pero solo afecta las banderas sin almacenar el resultado.

# 6. Instrucciones de Entrada y Salida

Estas instrucciones permiten leer y escribir datos en puertos de entrada y salida, facilitando la interacción con los dispositivos periféricos.

- **IN**: Lee un byte desde un puerto de entrada.
- **OUT**: Escribe un byte a un puerto de salida.
