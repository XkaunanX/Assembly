# Uso de Máscaras en Assembly 8086

## ¿Qué es una Máscara?
Una máscara es un valor binario utilizado para manipular bits específicos de un registro o una posición de memoria. Las máscaras se emplean para realizar operaciones como:

- **Activación de bits:** Establecer uno o más bits en 1.
- **Desactivación de bits:** Establecer uno o más bits en 0.
- **Conmutación de bits:** Cambiar el estado de uno o más bits (de 1 a 0 o de 0 a 1).
- **Prueba de bits:** Verificar si uno o más bits están en un estado específico.

## Operaciones Comunes con Máscaras
Las máscaras se utilizan junto con operadores lógicos en ensamblador para manipular bits de manera controlada:

### 1. Activación de Bits (OR)
Para activar bits específicos, se utiliza la operación **OR** (`OR`). Esta operación establece en 1 los bits indicados por la máscara, mientras deja los demás sin cambios.

#### Ejemplo:
- Registro inicial: `00001010` (0x0A)
- Máscara: `00000101` (0x05)
- Resultado: `00001111` (0x0F)

### 2. Desactivación de Bits (AND)
Para desactivar bits específicos, se utiliza la operación **AND** (`AND`) con el complemento de la máscara. Esto fuerza a 0 los bits indicados por la máscara, dejando los demás sin cambios.

#### Ejemplo:
- Registro inicial: `11101111` (0xEF)
- Máscara: `11110111` (0xF7)
- Resultado: `11100111` (0xE7)

### 3. Conmutación de Bits (XOR)
Para cambiar el estado de bits específicos, se utiliza la operación **XOR** (`XOR`). Los bits indicados por la máscara se alternan entre 0 y 1, mientras que los demás permanecen sin cambios.

#### Ejemplo:
- Registro inicial: `10101010` (0xAA)
- Máscara: `00001111` (0x0F)
- Resultado: `10100101` (0xA5)

### 4. Prueba de Bits (AND)
Para verificar el estado de bits específicos, se utiliza la operación **AND** (`AND`). Si el resultado es distinto de 0, significa que al menos uno de los bits indicados por la máscara estaba activo (en 1).

#### Ejemplo:
- Registro inicial: `11001010` (0xCA)
- Máscara: `00001000` (0x08)
- Resultado: `00001000` (0x08) → El bit está activo.

---

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

---

## Instrucciones Relacionadas y su Uso

### MOV:
Copia datos de un origen a un destino. Esencial para transferir información entre registros, memoria o puertos.
- **Ejemplo:** `MOV AX, BX` (Copia el valor de BX en AX).

### ADD y SUB:
Realizan sumas y restas, respectivamente. Actualizan banderas para operaciones condicionales.
- **Ejemplo ADD:** `ADD AX, 10` (Suma 10 al valor de AX).
- **Ejemplo SUB:** `SUB AX, 5` (Resta 5 al valor de AX).

### INC y DEC:
Incrementan o decrementan un operando en 1.
- **Ejemplo INC:** `INC AX` (Incrementa el valor de AX en 1).
- **Ejemplo DEC:** `DEC AX` (Decrementa el valor de AX en 1).

### CMP:
Compara dos operandos restando el segundo del primero y actualizando banderas.
- **Ejemplo:** `CMP AX, BX` (Compara AX con BX).

### AND, OR, XOR, NOT:
Realizan operaciones lógicas bit a bit.
- **AND:** Limpia bits específicos.
- **OR:** Establece bits específicos.
- **XOR:** Cambia el estado de bits específicos.
- **NOT:** Invierte todos los bits de un operando.

### SHL y SHR:
Realizan desplazamientos lógicos a la izquierda o derecha, respectivamente.
- **Ejemplo SHL:** `SHL AX, 1` (Desplaza AX un bit a la izquierda, multiplicando por 2).
- **Ejemplo SHR:** `SHR AX, 1` (Desplaza AX un bit a la derecha, dividiendo por 2).

### ROL y ROR:
Rotan los bits de un operando a la izquierda o derecha.
- **Ejemplo ROL:** `ROL AX, 1` (Rota los bits de AX una vez a la izquierda).
- **Ejemplo ROR:** `ROR AX, 1` (Rota los bits de AX una vez a la derecha).

---

## Notas Adicionales
1. **Combinación de Operaciones:** Las máscaras pueden ser combinadas con múltiples operadores lógicos para realizar operaciones complejas en registros o memoria.
2. **Optimización del Código:** Usar máscaras es una técnica eficiente para manipular datos a nivel de bits sin necesidad de operar sobre valores enteros completos.
3. **Impacto en Banderas:** Operaciones lógicas con máscaras actualizan automáticamente las banderas del procesador, como el Zero Flag (ZF) y el Carry Flag (CF), facilitando condiciones en bucles o decisiones.
