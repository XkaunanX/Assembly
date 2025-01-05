# Instrucciones en Assembly 8086

Este documento proporciona una introducción a las instrucciones en el lenguaje de ensamblador para la arquitectura 8086. Explica el ciclo de vida de una instrucción, las diferencias entre los tipos de arquitecturas CISC y RISC, conceptos clave como destino y fuente, además de ejemplos de **micródigo** y **traductores**.

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

- **Compiladores:** Aunque generalmente se asocian con lenguajes de alto nivel, los compiladores también pueden generar código de ensamblador para ser procesado por el ensamblador. Por ejemplo, un compilador C puede generar código ensamblador que luego será ensamblado y ejecutado por la CPU 8086.

- **Enlazadores (Linkers):** Una vez que el código fuente se ha traducido en código de máquina, el enlazador se encarga de juntar los diferentes módulos generados por el ensamblador, resolviendo referencias a funciones y variables, para generar el archivo ejecutable final.

## Destino y Fuente

En el contexto de las instrucciones en assembly 8086, **fuente** y **destino** son términos que se utilizan para describir los operandos de una instrucción:

- **Fuente:** Es el valor que se va a operar o copiar en la operación. Por ejemplo, en la instrucción `MOV AX, 10`, el valor `10` es la fuente.
- **Destino:** Es el registro o la ubicación en memoria donde se almacenará el resultado de la operación. En la instrucción `MOV AX, 10`, el registro `AX` es el destino.

Por lo tanto, en las instrucciones de ensamblador, la fuente y el destino son los componentes que especifican los operandos con los que se va a trabajar la CPU.

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

```plaintext
MOV AX, 1234h      ; Cargar el valor 1234h en el registro AX
PUSH AX            ; Colocar el valor de AX en la pila

MOV AX, 5678h      ; Cargar el valor 5678h en el registro AX
PUSH AX            ; Colocar el valor de AX (5678h) en la pila

POP BX             ; Extraer el valor de la pila y guardarlo en BX (será 5678h)
POP AX             ; Extraer el siguiente valor de la pila y guardarlo en AX (será 1234h)
``` 
