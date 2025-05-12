#include <stdio.h>
#include <stdlib.h>

int main()
{
    /*
    Se pueden hacer iterativos con floats
    SOLO si la condicion de corte es > ó <

    Con != falla
    */
    /*Escriba cuatro instrucciones
    diferentes de C que sumen 1
    a la variable entera x.*/

enum {UNO, DOS, TRES, CUATRO} p;
int suma=0, V[]={1,2,3,4,5,6,7,8,9};
for (p=UNO; p<CUATRO; p++)
    suma=suma + V[p];

printf("%d",suma);
    return 0;
}
