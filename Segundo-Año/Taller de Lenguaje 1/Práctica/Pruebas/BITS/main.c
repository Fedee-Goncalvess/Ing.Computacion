#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void verBits (unsigned);
int main()
{
    unsigned x;

    printf("Ingrese un entero sin signo: ");
    scanf ("%u", &x);

    verBits(x);
    return 0;
}

void verBits (unsigned x){
    int i,k,aux=0;
    for (i=0;i<1;i++){
        aux=x&1;
        x=x>>1;

    }
    printf ("%d",aux);
}
