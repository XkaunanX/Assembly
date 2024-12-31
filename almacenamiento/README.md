# Almacenamiento

En Assembly 8086, los vectores y matrices se almacenan como arreglos de datos, tipicamente en el segmento de datos. Cada elemento del arreglo puede ser accedido utilizando su desplazamiento. Aqui tienes una guia general para trabajar con vectores y matrices en Assembly 8086.

## Vectores (Arreglos 1D):
Un vector es esencialmente un arreglo unidimensional, donde los elementos se almacenan de manera consecutiva en la memoria.

Ejemplo de como definir y usar un vector de 5 enteros:
```assembly
.data
vector db 5, 10, 15, 20, 25    ; Un vector con 5 elementos

.code
mov si, 0                     ; El registro SI como indice
mov al, [vector + si]         ; Cargar el primer elemento en el registro AL
```
En el ejemplo anterior, usamos el registro SI para indexar el vector. El elemento en el indice SI se carga en el registro AL. Para acceder a otros elementos, incrementa el registro SI (o usa otros registros de indice).

## Matrices (Arreglos 2D):

Una matriz es un arreglo bidimensional, donde cada fila es un arreglo, y todas las filas se almacenan secuencialmente en la memoria.

Ejemplo de como definir y acceder a una matriz de 2x3:
```assembly
.data
matrix db 1, 2, 3, 4, 5, 6    ; 2 filas, 3 columnas (en memoria como un arreglo 1D)

.code
mov si, 0                     ; Registro SI para la fila
mov di, 2                     ; Registro DI para el indice de columna
mov al, [matrix + si + di]    ; Accediendo al elemento en fila=0, columna=2
En el ejemplo, accedemos al elemento en la primera fila y segunda columna utilizando la formula [matriz + (fila * numero_de_columnas) + columna].
```
Puedes ajustar los registros SI y DI para recorrer todos los elementos de la matriz.

## La Directiva db:
La directiva db (define byte) se utiliza para definir datos de tamaño byte en el segmento de datos. Esto se puede usar para definir valores escalares (por ejemplo, enteros, caracteres), vectores, matrices y otros tipos de datos en memoria.

Ejemplo:
```assembly
data1 db 10     ; Un solo byte con valor 10
vector db 1, 2, 3  ; Un vector de 3 bytes
Cada valor definido usando db ocupa un byte de memoria. Si deseas almacenar tipos de datos mas grandes, como palabras (2 bytes) o doble palabra (4 bytes), debes usar dw o dd, respectivamente.
```
