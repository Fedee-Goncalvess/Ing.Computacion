#include <stdio.h>
int main(){
/*char c= 97;
int x= '@';
printf("char c= %c\n", x);
printf("int x= %d\n", x);               ejercicio A
printf("char c= %c\n", c);
printf("int x= %d\n", c);
*/

/*
float x=0.357;
double y=999999999999.35753575;

x=y;

printf("double y=  %lf\n",y);
printf("float x=  %f\n",x);
*/

int x = 2*32+10%2-1;

int y = 2*32;
y=y+10%2;
y=y-1;

printf("int x= %d\n", x);
printf("int y= %d\n", y);







return 0;
}
/*a) Cuando se asigna un Char a un int, o al reves, se guarda en binario el
mismo numero. Luego, la mascara lo interpreta tanto como numero, o caracter.

No presenta warning

b)La diferencia es que el double admite mas bits para almacenar numeros mas grandes decimales.

Si se le asigna un numero muy grande double al float se trunca.

C)
*/


