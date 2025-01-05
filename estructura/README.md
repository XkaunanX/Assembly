# Segmentación en la Arquitectura de Memoria

## Descripción de la Segmentación

La **segmentación** es una técnica de gestión de memoria en sistemas informáticos, donde la memoria se divide en segmentos lógicos de tamaño variable. A diferencia de la paginación, que divide la memoria en bloques fijos (páginas), la segmentación permite que cada segmento tenga un tamaño diferente según el tipo de datos o el tipo de código que se está almacenando.

La segmentación es útil porque permite organizar la memoria de manera más flexible, adaptándose a las necesidades del programa. Un segmento puede contener diferentes tipos de información, como código ejecutable, datos, o pilas, dependiendo de cómo se haya diseñado el programa.

## Tabla de Segmentos

La **tabla de segmentos** es un componente clave en el sistema de segmentación. Esta tabla almacena la información de los segmentos, como la dirección base (el punto de inicio del segmento en la memoria física) y el límite (el tamaño del segmento). Cada entrada en la tabla de segmentos corresponde a un segmento de memoria y proporciona detalles sobre cómo acceder a él.

En general, la tabla de segmentos permite al procesador realizar la traducción entre direcciones lógicas (las direcciones que utiliza el programa) y direcciones físicas (las direcciones reales en la memoria).

## Fragmentación

La **fragmentación** en la segmentación se puede dividir en dos tipos:

1. **Fragmentación externa**: Ocurre cuando hay espacios libres en la memoria que no pueden ser utilizados porque son demasiado pequeños para contener un segmento completo. Esta situación puede causar que se desperdicie espacio en la memoria, ya que los segmentos no se ajustan completamente a estos espacios libres.
   
2. **Fragmentación interna**: Ocurre cuando un segmento es más grande de lo necesario para almacenar sus datos, dejando espacio no utilizado dentro del segmento. Aunque este tipo de fragmentación puede ser menos común, puede ocurrir en sistemas donde los segmentos tienen tamaños fijos o predefinidos.

La segmentacion sufre de fragmentacion externa.

## Punto de Vista del Usuario

Desde el punto de vista del usuario, la segmentación resuelve varios problemas relacionados con la gestión de la memoria:

- **Flexibilidad**: La segmentación permite que los programas se dividan en bloques lógicos de tamaño variable, lo que facilita el manejo de datos de diferentes tamaños y tipos.
- **Protección y aislamiento**: Los segmentos pueden ser protegidos y aislados, de modo que el acceso a un segmento no afecte a otros segmentos, mejorando la seguridad y estabilidad del sistema.
- **Facilidad de programación**: Los programadores pueden organizar sus programas en segmentos lógicos (como código, datos, pilas), lo que facilita la gestión de los diferentes componentes del programa.

Sin embargo, la fragmentación puede ser un problema, ya que puede llevar a una utilización ineficiente de la memoria, haciendo que el sistema se vuelva más lento a medida que la memoria disponible se fragmenta.

## Paradigma de la Segmentación

La segmentación se basa en el **paradigma estructurado** de programación. Este paradigma organiza los programas en bloques o módulos lógicos, que son los segmentos en la memoria. Cada segmento puede contener un tipo específico de información (por ejemplo, un segmento de código o un segmento de datos), lo que permite una mayor modularidad y organización del programa.

El paradigma estructurado fomenta la creación de programas que son fáciles de entender y mantener. En este contexto, la segmentación ayuda a representar la estructura lógica de un programa en la memoria, permitiendo una administración más intuitiva y eficiente de los recursos.


# Estructura de un programa en assembly 8086

En el 8086, la **memoria** se divide en **segmentos** de hasta 64 KB, y se utilizan registros de segmento para acceder a estas regiones de memoria. Los segmentos permiten organizar el codigo, los datos y la pila, proporcionando una estructura logica que facilita el acceso y la proteccion de la memoria.

## Registros de Segmento en Assembly 8086

En el 8086, hay cuatro registros de segmento principales que controlan el acceso a diferentes partes de la memoria:

### 1. **Code Segment (CS)**

El registro `CS` contiene la direccion base del segmento de codigo, que almacena las instrucciones ejecutables del programa.
Cuando el procesador busca ejecutar una instruccion, utiliza `CS` combinado con el puntero de instruccion (`IP`).
Ejemplo:

```assembly
mov ax, CS        ; Mueve el valor del segmento de codigo al registro AX
mov bx, offset etiqueta
jmp bx            ; Salta a la direccion especificada
```

### 2. **Data Segment (DS)**
El registro DS contiene la direccion base del segmento de datos, donde se almacenan variables y datos estaticos.
Se utiliza para acceder a datos definidos en la seccion .data del programa.

Ejemplo:

```assembly
mov ax, DS        ; Mueve el valor del segmento de datos al registro AX
mov si, offset variable
mov al, [si]      ; Carga el valor de la variable en AL
```

### 3. **Extra Segment (ES)**
El registro ES se utiliza como un segmento adicional para operaciones especiales, como transferencias de datos con instrucciones MOVS, CMPS, SCAS, etc.
A menudo se usa en conjunto con DS para realizar operaciones en bloques de memoria.

Ejemplo:

```assembly
mov ax, ES        ; Mueve el valor del segmento extra al registro AX
mov di, offset destino
mov cx, 10        ; Numero de bytes a copiar
rep movsb         ; Copia datos desde DS:SI a ES:DI
```

### 4. **Stack Segment (SS)**
El registro SS contiene la direccion base del segmento de pila, utilizado para manejar llamadas a subrutinas y almacenamiento temporal de datos.
El puntero de pila (SP) indica el desplazamiento dentro del segmento de pila.

Ejemplo:

```assembly
mov ax, SS        ; Mueve el valor del segmento de pila al registro AX
push ax           ; Guarda el valor en la pila
pop bx            ; Recupera el valor de la pila
```
