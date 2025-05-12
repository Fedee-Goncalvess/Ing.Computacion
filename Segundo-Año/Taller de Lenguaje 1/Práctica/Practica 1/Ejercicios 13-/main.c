#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <math.h>

int esPrimo(int aux){
    int x = sqrt(aux);
    int a = 2;
    while (a<=x){
        if (aux%a) return 0;
        a++;
    }
    return 1;
}

int main()
{
    int n;
    int cant = 0;
    printf("Ingrese un numero= \n");
    scanf("%d",n);
    while (cant<5){
        if (esPrimo(n)) {
            cant++;
            printf("El numero es primo \n");
        }
        else printf("El numero no es primo");
        printf("Ingrese un numero= \n");
        scanf("%d",n);
    }
    return 0;
}
