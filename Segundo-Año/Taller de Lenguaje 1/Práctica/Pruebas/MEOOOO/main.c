#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct dataBinario{
    int pos;
    int lon;
};

int funcion(char * nombre_texto, char * nombre_binario)
{
    FILE *texto;
    texto= fopen(nombre_texto,"r");
    if (!texto){
        printf("ERRROR WACHIN");
        return 2;
    }

    FILE *binario;
    binario = fopen(nombre_binario,"wb");
    if (!binario){
        printf("ERRROW WACHOU");
        fclose(texto);
        return 3;
    }

    char car = fgetc(texto);
    int largo=0;
    int pos=0;
    while (!feof(texto)){
        if (car=='\n'){
            mandarDataWachin(largo,pos,binario);
            largo = 0;
            pos = ftell(texto);
        }
        largo++
        car = fgetc(texto);
    }
    return 1;
}

void mandarDataWachin(int largo, int pos,binario){
    struct dataBinario data;
    data.lon=largo;
    data.pos= pos;
    fwrite(&data,sizeof(struct dataBinario),1,binario);
}
