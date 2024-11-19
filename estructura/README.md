# Paginación Segmentada en Assembly 8086

En el procesador **8086**, la memoria se organiza utilizando un esquema de **segmentación** en lugar de paginación. Sin embargo, el concepto de **paginación segmentada** se desarrolló en procesadores posteriores como el 80286 y el 80386 para manejar mejor la memoria. Aun así, es útil entender cómo funcionan los **segmentos** en el 8086, ya que es la base para el manejo de memoria.

En el 8086, la **memoria** se divide en **segmentos** de hasta 64 KB, y se utilizan registros de segmento para acceder a estas regiones de memoria. Los segmentos permiten organizar el código, los datos y la pila, proporcionando una estructura lógica que facilita el acceso y la protección de la memoria.

## Registros de Segmento en Assembly 8086

En el 8086, hay cuatro registros de segmento principales que controlan el acceso a diferentes partes de la memoria:

### 1. **Code Segment (CS)**

El registro `CS` contiene la dirección base del segmento de código, que almacena las instrucciones ejecutables del programa.
Cuando el procesador busca ejecutar una instrucción, utiliza `CS` combinado con el puntero de instrucción (`IP`).
Ejemplo:

mov ax, CS        ; Mueve el valor del segmento de código al registro AX
mov bx, offset etiqueta
jmp bx            ; Salta a la dirección especificada

### 2. **Data Segment (DS)**
El registro DS contiene la dirección base del segmento de datos, donde se almacenan variables y datos estáticos.
Se utiliza para acceder a datos definidos en la sección .data del programa.

Ejemplo:

mov ax, DS        ; Mueve el valor del segmento de datos al registro AX
mov si, offset variable
mov al, [si]      ; Carga el valor de la variable en AL

### 3. **Extra Segment (ES)**
El registro ES se utiliza como un segmento adicional para operaciones especiales, como transferencias de datos con instrucciones MOVS, CMPS, SCAS, etc.
A menudo se usa en conjunto con DS para realizar operaciones en bloques de memoria.

Ejemplo:

mov ax, ES        ; Mueve el valor del segmento extra al registro AX
mov di, offset destino
mov cx, 10        ; Número de bytes a copiar
rep movsb         ; Copia datos desde DS:SI a ES:DI
### 4. **Stack Segment (SS)**
El registro SS contiene la dirección base del segmento de pila, utilizado para manejar llamadas a subrutinas y almacenamiento temporal de datos.
El puntero de pila (SP) indica el desplazamiento dentro del segmento de pila.

Ejemplo:

mov ax, SS        ; Mueve el valor del segmento de pila al registro AX
push ax           ; Guarda el valor en la pila
pop bx            ; Recupera el valor de la pila

# ¿Cómo Funciona la Segmentación en el 8086?
En el 8086, una dirección de memoria se calcula usando un registro de segmento y un desplazamiento:

# Dirección Física = (Registro de Segmento * 16) + Desplazamiento
Por ejemplo, si CS = 0x1000 y IP = 0x0100 

Dirección Física = (0x1000 * 16) + 0x0100 = 0x10000 + 0x0100 = 0x10100