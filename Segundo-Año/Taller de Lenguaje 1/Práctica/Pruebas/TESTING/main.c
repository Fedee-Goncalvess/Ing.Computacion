#include <stdio.h>
#include <stdlib.h>

int main()
{
    union numero{
    int x;
    float y;
    };


    union numero valor;

    printf(" sizeof union= %d\n",sizeof valor);

    valor.x = 1100000001.111;
    printf("Asigno 10.34 en el campo (int) \n");
    printf("    (int) valor.x = %d\n", valor.x);
    printf(" (double) valor.y = %f\n", valor.y);


    valor.y = 1100000001.111;
    printf("Asigno 10.34 en el campo (double) \n");
    printf("    (int) valor.x = %d\n", valor.x);
    printf(" (double) valor.y = %f\n", valor.y);





    return 0;
}
