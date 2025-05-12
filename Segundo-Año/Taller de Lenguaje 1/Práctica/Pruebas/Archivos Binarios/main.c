#include <stdio.h>
#include <stdlib.h>
#include "iconoRGB.h"

int main(){
    iconoRGB icono;
    reservar(icono,10);
    liberar(icono,10);

    return 0;
}
