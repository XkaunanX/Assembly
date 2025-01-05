# Instrucciones de Assembly 8086

El lenguaje de ensamblador 8086 es el conjunto de instrucciones utilizado para programar en el microprocesador Intel 8086. Estas instrucciones permiten manipular directamente el hardware y ejecutar operaciones de bajo nivel.

## Tipos de Instrucciones en Assembly 8086

Las instrucciones de ensamblador 8086 se pueden clasificar en diferentes tipos según su propósito. A continuación, se describen los principales tipos de instrucciones.

# 1. Instrucciones de Datos

Estas instrucciones permiten mover, cargar, almacenar y manipular datos en los registros o en la memoria. Permiten trabajar con los datos directamente.

- **MOV**: Mueve datos de una fuente a un destino.
- **PUSH**: Coloca un valor en la pila.
- **POP**: Extrae un valor de la pila.

# 2. Instrucciones de Control de Flujo

Las instrucciones de control de flujo permiten alterar el orden de ejecución de las instrucciones, lo que permite crear bucles, saltos y tomar decisiones.

- **JMP**: Realiza un salto incondicional a una dirección especificada.
- **JE / JZ**: Realiza un salto si la bandera de cero está activada, es decir, si los dos valores comparados son iguales.
- **JNE / JNZ**: Realiza un salto si la bandera de cero no está activada, es decir, si los dos valores comparados son diferentes.

# 3. Instrucciones Aritméticas

Estas instrucciones realizan operaciones matemáticas con los valores almacenados en los registros.

- **ADD**: Suma dos valores.
- **SUB**: Resta dos valores.
- **MUL**: Multiplica dos valores.
- **DIV**: Divide un valor entre otro.

# 4. Instrucciones Lógicas

Las instrucciones lógicas permiten realizar operaciones a nivel de bits, como AND, OR, XOR e invertir los bits de un registro con mascaras.

- **AND**: Realiza una operación lógica AND entre dos valores.
- **OR**: Realiza una operación lógica OR entre dos valores.
- **XOR**: Realiza una operación lógica XOR entre dos valores.
- **NOT**: Invierte todos los bits de un valor.

### ¿Qué es una Máscara?
Una máscara es un valor binario utilizado para manipular bits específicos de un registro o una posición de memoria. Las máscaras se emplean para realizar operaciones como:

- **Activación de bits:** Establecer uno o más bits en 1.
- **Desactivación de bits:** Establecer uno o más bits en 0.
- **Conmutación de bits:** Cambiar el estado de uno o más bits (de 1 a 0 o de 0 a 1).
- **Prueba de bits:** Verificar si uno o más bits están en un estado específico.

### Operaciones Comunes con Máscaras
Las máscaras se utilizan junto con operadores lógicos en ensamblador para manipular bits de manera controlada:

#### 1. Activación de Bits (OR)
Para activar bits específicos, se utiliza la operación **OR** (`OR`). Esta operación establece en 1 los bits indicados por la máscara, mientras deja los demás sin cambios.

##### Ejemplo:
- Registro inicial: `00001010` (0x0A)
- Máscara: `00000101` (0x05)
- Resultado: `00001111` (0x0F)

#### 2. Desactivación de Bits (AND)
Para desactivar bits específicos, se utiliza la operación **AND** (`AND`) con el complemento de la máscara. Esto fuerza a 0 los bits indicados por la máscara, dejando los demás sin cambios.

##### Ejemplo:
- Registro inicial: `11101111` (0xEF)
- Máscara: `11110111` (0xF7)
- Resultado: `11100111` (0xE7)

#### 3. Conmutación de Bits (XOR)
Para cambiar el estado de bits específicos, se utiliza la operación **XOR** (`XOR`). Los bits indicados por la máscara se alternan entre 0 y 1, mientras que los demás permanecen sin cambios.

##### Ejemplo:
- Registro inicial: `10101010` (0xAA)
- Máscara: `00001111` (0x0F)
- Resultado: `10100101` (0xA5)

#### 4. Prueba de Bits (AND)
Para verificar el estado de bits específicos, se utiliza la operación **AND** (`AND`). Si el resultado es distinto de 0, significa que al menos uno de los bits indicados por la máscara estaba activo (en 1).

##### Ejemplo:
- Registro inicial: `11001010` (0xCA)
- Máscara: `00001000` (0x08)
- Resultado: `00001000` (0x08) → El bit está activo.

### Máscaras Comunes
#### Máscara de 8 bits
Supongamos que se desea manipular el registro **AL** (8 bits):

- Máscara para activar los bits 0 y 3: `00001001` (0x09 en hexadecimal).
- Máscara para desactivar los bits 1 y 2: `11111011` (0xFB en hexadecimal).
- Máscara para conmutar los bits 7 y 6: `11000000` (0xC0 en hexadecimal).

#### Máscara de 16 bits
Si se trabaja con un registro de 16 bits como **AX**:

- Máscara para activar los bits 15 y 14: `1100000000000000` (0xC000 en hexadecimal).
- Máscara para desactivar los bits 7 y 0: `1111111011111110` (0xFEFE en hexadecimal).

### 5. Instrucciones de Comparación

Estas instrucciones comparan dos valores y establecen las banderas de la CPU en función del resultado de la comparación.

- **CMP**: Compara dos valores.
- **TEST**: Realiza una operación AND entre dos valores, pero solo afecta las banderas sin almacenar el resultado.

### 6. Instrucciones de Entrada y Salida

Estas instrucciones permiten leer y escribir datos en puertos de entrada y salida, facilitando la interacción con los dispositivos periféricos.

- **IN**: Lee un byte desde un puerto de entrada.
- **OUT**: Escribe un byte a un puerto de salida.

# Uso de Máscaras en Assembly 8086




## Notas Adicionales
1. **Combinación de Operaciones:** Las máscaras pueden ser combinadas con múltiples operadores lógicos para realizar operaciones complejas en registros o memoria.
2. **Optimización del Código:** Usar máscaras es una técnica eficiente para manipular datos a nivel de bits sin necesidad de operar sobre valores enteros completos.
3. **Impacto en Banderas:** Operaciones lógicas con máscaras actualizan automáticamente las banderas del procesador, como el Zero Flag (ZF) y el Carry Flag (CF), facilitando condiciones en bucles o decisiones.
