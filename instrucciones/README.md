# MOV: 
Copia el valor de un operando a otro. Es una de las instrucciones más comunes para mover datos entre registros, memoria o entrada/salida.

Sintaxis:
MOV destino, origen

Ejemplo:
MOV AX, 10 ; Copia el valor 10 al registro AX
MOV BX, AX ; Copia el valor de AX a BX
MOV [SI], AX ; Copia el valor de AX a la dirección de memoria apuntada por SI

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
Realiza una división sin signo entre el acumulador (AX) y el operando. El cociente va a AL y el residuo a AH.

Sintaxis:
DIV operando

Ejemplo:
DIV BX ; Divide AX entre BX y guarda el cociente en AL y el residuo en AH

# NEG: 
Negación del operando, cambia su signo (opuesto).

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
Envía el valor de un registro a un puerto de salida.

Sintaxis:
OUT puerto, registro

Ejemplo:
OUT 60h, AL ; Envía el valor de AL al puerto 60h

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
Desplazamiento lógico a la izquierda. Multiplica el operando por 2.

Sintaxis:
SHL operando, número_de_bits

Ejemplo:
SHL AX, 1 ; Desplaza el valor de AX 1 bit a la izquierda

# SHR: 
Desplazamiento lógico a la derecha. Divide el operando por 2.

Sintaxis:
SHR operando, número_de_bits

Ejemplo:
SHR AX, 1 ; Desplaza el valor de AX 1 bit a la derecha

# ROL: 
Rotación a la izquierda de los bits de un operando. El bit más significativo se mueve al menos significativo.

Sintaxis:
ROL operando, número_de_bits

Ejemplo:
ROL AX, 1 ; Rota los bits de AX una vez a la izquierda

# ROR: 
Rotación a la derecha de los bits de un operando. El bit menos significativo se mueve al más significativo.

Sintaxis:
ROR operando, número_de_bits

Ejemplo:
ROR AX, 1 ; Rota los bits de AX una vez a la derecha

# BT: 
Testea un bit específico de un operando y actualiza las banderas de acuerdo a su valor.

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
Busca el primer bit establecido en 1 en un operando, comenzando desde el bit más significativo.

Sintaxis:
BSR destino, operando

Ejemplo:
BSR AX, BX ; Busca el primer bit 1 en BX, comenzando desde el bit más significativo

# TEST: 
Realiza una operación lógica AND entre dos operandos y actualiza las banderas, pero no almacena el resultado.

Sintaxis:
TEST operando1, operando2

Ejemplo:
TEST AX, BX ; Realiza una AND entre AX y BX

# AND: 
Realiza una operación lógica AND entre dos operandos.

Sintaxis:
AND destino, fuente

Ejemplo:
AND AX, BX ; Realiza una AND entre AX y BX, guardando el resultado en AX

# OR: 
Realiza una operación lógica OR entre dos operandos.

Sintaxis:
OR destino, fuente

Ejemplo:
OR AX, BX ; Realiza una OR entre AX y BX, guardando el resultado en AX

# XOR: 
Realiza una operación lógica XOR entre dos operandos.

Sintaxis:
XOR destino, fuente

Ejemplo:
XOR AX, BX ; Realiza una XOR entre AX y BX, guardando el resultado en AX

# NOT: 
Realiza una operación lógica NOT en un operando (inversión de bits).

Sintaxis:
NOT operando

Ejemplo:
NOT AX ; Invierte los bits de AX