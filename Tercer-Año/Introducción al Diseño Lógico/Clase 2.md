# Tabla de Verdad
Evaluar las filas donde la salida F = 1
Aquí vemos que variables interactuan en la tabla.
Hacer una suma booleana de las salidas verdaderas para encontrar la ecuación booleana final
Esto se puede hacer tanto con F o con F negado. Para hacer con F debe hacerse una Suma de Productos y para utilizar F negado se debe hacer un producto de Sumas

SOP o POS
Suma de Productos -> Sum Of Products
	AND para cada caso que salida sea 1
	Suma de los productos
Producto de Sumas -> Products Of Sums
	AND para cada caso que salida sea 0
	Suma de productos para salida negada
	Negar lo obtenido y aplicar DeMorgan para obtener POS


---
# Código de Gray

Forma de representar código binario para que, en un disco, no hayan errores de lectura por problemas físicos.

Para hacer esta tabla primero. 
1. LSB con valores y el resto en 0.
2. Cuando no quedan combinaciones, se copia la última imagen a la fila siguiente, y el bit siguiente al modificado se pone en 1. 
3. Se repite el proceso.
---
# Representación de las funciones lógicas

Al representar una función lógica de al menos 2 variables se tiene un gráfico, en el que recorriendo entre vértices adyacentes, solo se modifica el valor de una variable. **Similar al código gray**

Para representar en el gráfico que la función vale 1 se utiliza una cruz, caso contrario un circulo.

Si se agrupan los vértices adyacentes donde una variable no cambia, se puede simplificar la función lógica.

![[Pasted image 20250331100348.png]]

![[Pasted image 20250331101330.png]]
Utilizar el códgio gray nos garantiza ver adyacencias en el gráfico y en las tablas, permitiendo simplificar aún más las funciones lógicas. Por eso es más eficiente utilizarlo

---
# Mapas de Karnaugh ó K - Maps
![[Pasted image 20250331105411.png]]

De esta forma, utilizando codigo gray, se pueden agrupar resultados, mostrando adyacencia y resumir la función lógica
![[Pasted image 20250331105533.png]]

