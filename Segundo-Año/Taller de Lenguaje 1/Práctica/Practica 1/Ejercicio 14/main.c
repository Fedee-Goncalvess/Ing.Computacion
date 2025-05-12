#include <stdio.h>
#include <stdlib.h>

int invertir (int n){
    int cifra,aux=0;
    while (n!=0){
        cifra= n%10;
        aux=aux*10+cifra;
        n = n/10;
    }
    return aux;
}

int main()
{
    int n;
    printf("Introducir numero a invertir= ");
    scanf("%d",&n);
    printf("\n %d",invertir(n));
    return 0;
}
