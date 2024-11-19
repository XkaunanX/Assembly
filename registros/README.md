# Registros del CPU 8086

Este conjunto de ejemplos demuestra cómo se utilizan los diferentes registros del procesador 8086. Los registros del 8086 se dividen en registros de propósito general, de segmento, de puntero, de índice y de estado. En estos ejemplos, se explica la función de cada uno de estos registros.

## Registros de Propósito General

- **AX**: Acumulador, utilizado para operaciones aritméticas y de entrada/salida.
- **BX**: Base, utilizado generalmente como puntero a datos en segmentos de datos.
- **CX**: Contador, se utiliza principalmente para el conteo en bucles e iteraciones.
- **DX**: Datos, se utiliza para operaciones aritméticas y entrada/salida (por ejemplo, con puertos).

## Registros de Índice

- **SI**: Índice fuente, usado para operaciones con datos en memoria.
- **DI**: Índice destino, se usa para operaciones con cadenas de caracteres y otros datos.

## Registros de Puntero y Base

- **SP**: Puntero de pila, apunta al tope de la pila.
- **BP**: Base de pila, usado para acceder a datos locales en la pila.

## Registros de Segmento

- **CS**: Registro de segmento de código, que contiene la dirección base del segmento de código.
- **DS**: Registro de segmento de datos, que contiene la dirección base del segmento de datos.
- **ES**: Registro de segmento extra, usado para operaciones adicionales.
- **SS**: Registro de segmento de pila, contiene la dirección base de la pila.

## Registros de Estado

- **IP**: Puntero de instrucción, contiene la dirección de la siguiente instrucción a ejecutar.
- **FLAGS**: Registro de estado, que contiene información sobre el estado del procesador.

### Flags en el Registro **FLAGS**

El registro **FLAGS** contiene varios bits que indican el estado de las operaciones realizadas. Los principales flags son:

- **CF (Carry Flag)**: Se establece si hubo un acarreo en una operación de suma o una toma prestada en una operación de resta.
- **PF (Parity Flag)**: Indica si el número de bits con valor 1 en el resultado de una operación es par o impar.
- **AF (Auxiliary Carry Flag)**: Se establece si hubo un acarreo desde el bit 3 hacia el bit 4 en una operación de suma o resta.
- **ZF (Zero Flag)**: Se establece si el resultado de una operación es cero.
- **SF (Sign Flag)**: Se establece si el resultado de una operación es negativo.
- **TF (Trap Flag)**: Se utiliza para la depuración del programa. Si se establece, el procesador ejecuta una interrupción después de cada instrucción.
- **IF (Interrupt Flag)**: Controla la habilitación o deshabilitación de las interrupciones.
- **DF (Direction Flag)**: Indica la dirección de las operaciones de cadenas. Si está establecido, las operaciones avanzan de manera decreciente (de derecha a izquierda).
- **OF (Overflow Flag)**: Se establece si ocurre un desbordamiento en una operación aritmética.
- **IOPL (Input/Output Privilege Level)**: Bits 12 y 13, indican el nivel de privilegio para operaciones de entrada/salida.
- **NT (Nested Task Flag)**: Indica si una tarea está anidada dentro de otra tarea.
- **RF (Resume Flag)**: Se utiliza para control de tareas en el procesador.
- **VM (Virtual 8086 Mode Flag)**: Indica si el procesador está operando en modo virtual 8086.
- **AC (Alignment Check Flag)**: Se establece cuando ocurre un error de alineación de datos.
- **NC (Not Used)**: No se utiliza en la mayoría de los sistemas actuales.
- **TF (Trap Flag)**: Ya descrito, utilizado para la depuración de la ejecución.

Cada uno de estos flags puede ser utilizado por el procesador para determinar cómo manejar el flujo de ejecución de un programa, especialmente en el caso de saltos condicionales, manejo de errores y control de interrupciones.