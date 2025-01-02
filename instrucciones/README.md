# Instrucciones comunes

# MOV: 
Copia el valor de un operando a otro. Es una de las instrucciones mas comunes para mover datos entre registros, memoria o entrada/salida.

Sintaxis:
MOV destino, origen

Ejemplo:
MOV AX, 10 ; Copia el valor 10 al registro AX
MOV BX, AX ; Copia el valor de AX a BX
MOV [SI], AX ; Copia el valor de AX a la direccion de memoria apuntada por SI

# XCHG: 
Intercambia el valor de dos operandos. Puede usarse con registros o con memoria.

Sintaxis:
XCHG operando1, operando2

Ejemplo:
XCHG AX, BX ; Intercambia el valor de AX con BX

# ADD: 
Suma dos operandos y almacena el resultado en el primer operando.

Sintaxis:
ADD destino, fuente

Ejemplo:
ADD AX, BX ; Suma el valor de BX al valor de AX y guarda el resultado en AX

# SUB: 
Resta el segundo operando del primero y guarda el resultado en el primer operando.

Sintaxis:
SUB destino, fuente

Ejemplo:
SUB AX, 5 ; Resta 5 al valor de AX

# DIV: 
Realiza una division sin signo entre el acumulador (AX) y el operando. El cociente va a AL y el residuo a AH.

Sintaxis:
DIV operando

Ejemplo:
DIV BX ; Divide AX entre BX y guarda el cociente en AL y el residuo en AH

# NEG: 
Negacion del operando, cambia su signo (opuesto).

Sintaxis:
NEG operando

Ejemplo:
NEG AX ; Cambia el signo de AX

# IN: 
Lee un valor de un puerto de entrada y lo coloca en un registro.

Sintaxis:
IN registro, puerto

Ejemplo:
IN AL, 60h ; Lee el valor del puerto 60h y lo coloca en AL

# OUT: 
Envia el valor de un registro a un puerto de salida.

Sintaxis:
OUT puerto, registro

Ejemplo:
OUT 60h, AL ; Envia el valor de AL al puerto 60h

# INC: 
Incrementa el valor de un operando en 1.

Sintaxis:
INC operando

Ejemplo:
INC AX ; Incrementa el valor de AX en 1

# DEC: 
Decrementa el valor de un operando en 1.

Sintaxis:
DEC operando

Ejemplo:
DEC AX ; Decrementa el valor de AX en 1

# CMP: 
Compara dos operandos restando el segundo del primero, actualizando las banderas sin almacenar el resultado.

Sintaxis:
CMP operando1, operando2

Ejemplo:
CMP AX, BX ; Compara los valores de AX y BX

# SHL: 
Desplazamiento logico a la izquierda. Multiplica el operando por 2.

Sintaxis:
SHL operando, numero_de_bits

Ejemplo:
SHL AX, 1 ; Desplaza el valor de AX 1 bit a la izquierda

# SHR: 
Desplazamiento logico a la derecha. Divide el operando por 2.

Sintaxis:
SHR operando, numero_de_bits

Ejemplo:
SHR AX, 1 ; Desplaza el valor de AX 1 bit a la derecha

# ROL: 
Rotacion a la izquierda de los bits de un operando. El bit mas significativo se mueve al menos significativo.

Sintaxis:
ROL operando, numero_de_bits

Ejemplo:
ROL AX, 1 ; Rota los bits de AX una vez a la izquierda

# ROR: 
Rotacion a la derecha de los bits de un operando. El bit menos significativo se mueve al mas significativo.

Sintaxis:
ROR operando, numero_de_bits

Ejemplo:
ROR AX, 1 ; Rota los bits de AX una vez a la derecha

# BT: 
Testea un bit especifico de un operando y actualiza las banderas de acuerdo a su valor.

Sintaxis:
BT operando, bit

Ejemplo:
BT AX, 3 ; Testea el bit 3 de AX

# BSF: 
Busca el primer bit establecido en 1 en un operando y lo coloca en el destino.

Sintaxis:
BSF destino, operando

Ejemplo:
BSF AX, BX ; Busca el primer bit 1 en BX y lo coloca en AX

# BSR: 
Busca el primer bit establecido en 1 en un operando, comenzando desde el bit mas significativo.

Sintaxis:
BSR destino, operando

Ejemplo:
BSR AX, BX ; Busca el primer bit 1 en BX, comenzando desde el bit mas significativo

# TEST: 
Realiza una operacion logica AND entre dos operandos y actualiza las banderas, pero no almacena el resultado.

Sintaxis:
TEST operando1, operando2

Ejemplo:
TEST AX, BX ; Realiza una AND entre AX y BX

# AND: 
Realiza una operacion logica AND entre dos operandos.

Sintaxis:
AND destino, fuente

Ejemplo:
AND AX, BX ; Realiza una AND entre AX y BX, guardando el resultado en AX

# OR: 
Realiza una operacion logica OR entre dos operandos.

Sintaxis:
OR destino, fuente

Ejemplo:
OR AX, BX ; Realiza una OR entre AX y BX, guardando el resultado en AX

# XOR: 
Realiza una operacion logica XOR entre dos operandos.

Sintaxis:
XOR destino, fuente

Ejemplo:
XOR AX, BX ; Realiza una XOR entre AX y BX, guardando el resultado en AX

# NOT: 
Realiza una operacion logica NOT en un operando (inversion de bits).

Sintaxis:
NOT operando

Ejemplo:
NOT AX ; Invierte los bits de AX

# Uso de Máscaras en Assembly 8086

Este documento describe el concepto y uso de máscaras en el lenguaje ensamblador del procesador 8086.

# ¿Qué es una Máscara?
Una máscara es un valor binario utilizado para manipular bits específicos de un registro o una posición de memoria. Las máscaras se emplean comúnmente para realizar operaciones de:

- **Activación de bits:** Establecer uno o más bits en 1.
- **Desactivación de bits:** Establecer uno o más bits en 0.
- **Conmutación de bits:** Cambiar el estado de uno o más bits (de 1 a 0 o de 0 a 1).
- **Prueba de bits:** Verificar si uno o más bits están en un estado específico.

## Operaciones Comunes con Máscaras
Las máscaras se utilizan junto con operadores lógicos en ensamblador:

### 1. Activación de Bits
Para activar bits específicos, se utiliza la operación **OR** (`OR`):

- Máscara: Los bits que se quieren activar se establecen en 1.
- Resultado: Los bits en la posición 1 de la máscara se activan (1), mientras que los demás permanecen sin cambios.

### 2. Desactivación de Bits
Para desactivar bits específicos, se utiliza la operación **AND** (`AND`) con el complemento de la máscara:

- Máscara: Los bits que se quieren desactivar se establecen en 0.
- Resultado: Los bits en la posición 0 de la máscara se desactivan (0), mientras que los demás permanecen sin cambios.

### 3. Conmutación de Bits
Para cambiar el estado de bits específicos, se utiliza la operación **XOR** (`XOR`):

- Máscara: Los bits que se quieren conmutar se establecen en 1.
- Resultado: Los bits en la posición 1 de la máscara cambian su estado, mientras que los demás permanecen sin cambios.

### 4. Prueba de Bits
Para comprobar el estado de bits específicos, se utiliza la operación **AND** (`AND`):

- Máscara: Los bits que se quieren comprobar se establecen en 1.
- Resultado: Si el resultado es distinto de 0, los bits estaban activos.

## Ejemplo de Máscaras Comunes

### Máscara de 8 bits
Supongamos que se desea manipular el registro **AL** (8 bits):

- Máscara para activar los bits 0 y 3: `00001001` (0x09 en hexadecimal).
- Máscara para desactivar los bits 1 y 2: `11111011` (0xFB en hexadecimal).
- Máscara para conmutar los bits 7 y 6: `11000000` (0xC0 en hexadecimal).

### Máscara de 16 bits
Si se trabaja con un registro de 16 bits como **AX**:

- Máscara para activar los bits 15 y 14: `1100000000000000` (0xC000 en hexadecimal).
- Máscara para desactivar los bits 7 y 0: `1111111011111110` (0xFEFE en hexadecimal).
