# Equivalentes Thévenin y Norton
## Condiciones
- **Dipolo**: Dos terminales
- **Lineal**: Todos los elementos en su interior son lineales
- **Activo**: Se debe conectar al menos una fuente independiente.


# Fasores
Se puede representar a una función senoidal a partir de la parte real o imaginaria de una función compleja, llamada fasor. El fasor es una función matemática armónica dependiente del tiempo
## Número Complejo
Debido a la linealidad del circuito, la respuesta del mismo va a ser en una misma pulsación. Esto hace posible omitir el término dependiente del tiempo.
Ya que todas están a una misma pulsación, el término dependiente del tiempo  no afecta la relación entre los fasores. 
# Inducción
## Puntos Homólogos
La polaridad inducida en un punto es igual a la autoinducida en el punto homólogo

La ubicación de este punto homólogo está dada por el sentido de enrollado del inductor. Es decir, ambos puntos homólogos deben estar situados donde el enrollado de ambas bobinas tengan el mismo sentido.

# Curva de Regulación

## Justificaciones
### Fuente de Corriente Real
La corriente de la fuente real **depende de la tensión**, por lo que la corriente va en el eje vertical y la tensión va en el eje horizontal. La corriente que entrega entre A y B varía en función de la tensión entre A y B. 


Tensión = 0
Corriente de cortocircuito = Fuente

Tensión = 


**IMPORTANTE**
	No está bien decir que la corriente **~~depende de la resistencia~~** ya que el elemento que se analiza podría no tener resistencia, incluso podría ser otra fuente. 

### Fuente de Tensión Real
La tensión de la fuente real **depende de la corriente**, por lo que la tensión va en el eje vertical y la corriente va en el eje horizontal. La tensión que entrega entre A y B varía en función de la tensión entre A y B. 

**IMPORTANTE**
	No está bien decir que la corriente **~~depende de la resistencia~~** ya que el elemento que se analiza podría no tener resistencia, incluso podría ser otra fuente. 


# Poliarmónicas

## Poliarmónica con término constante
Si se tiene una constante en una fuente poliarmonica, **no se puede usar las expresiones de las impedancias de un capacitor/inductor justificando que w=0**. 
La expresiones de impedancias **solo funcionan en los casos de corrientes o tensiones senoidales**. 

Para justificar los términos constantes se utilizan las ecuaciones constitutivas. 

Ecuaciones Constitutivas
**Capacitor**
$$i = C \cdot \frac{du}{dt}$$
$$u = \frac{1}{C} \int i \, dt
$$
**Inductor**
$$u = L \cdot \frac{di}{dt}
$$
$$i = \frac{1}{L} \int u \, dt
$$
## Superposición
Se puede estudiar un circuito donde actúan más de una fuente, analizando por separado cada fuente y finalmente sumar los efectos  de cada fuente **solo si el circuito es lineal**
### Linealidad 
**Un circuito es lineal si está linealmente relacionado su respuesta con su excitación**
Formado por elementos lineales.
# Instrumentos
## Amperimetro
Mide corriente y **debe de ser colocado en serie** 
Se debe abrir el circuito y hacer la conexión con el amperimetro
El amperimetro ideal no tiene resistencia interna. Pero el amperimetro real sí.

## Voltímetro
Mide tensión y **debe ser colocado en paralelo** 
