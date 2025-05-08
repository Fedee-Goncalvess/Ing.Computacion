#include <stdio.h>
#include <stdlib.h>
//♔♕♖♗♘♙
//♚♛♜♝♞♟

//typedef union {
//    char peonN
//    char reyN
//    char reinaN
//    char caballoN
//    char torreN
//    char alfilN
//
//    char peonB
//    char reyB
//    char reinaB
//    char caballoB
//    char torreB
//    char alfilB
//}_pieza;

typedef struct{
  //  _pieza p
    char id;
}pieza;

typedef struct {
    char x;
    int y;
}posicion;

typedef struct{
    posicion pos;
    pieza p;

}casilla;


void inicializarTablero(casilla tab[][8]);
int hayPieza(pieza);
void imprimirTablero(casilla tab[][8]);
void moverPieza(casilla tab[][8],posicion,posicion);

void turno(casilla tab[][8],int *fin){
    posicion pos;
    posicion prox;
    printf("Ingrese posicion de pieza \n ");
    printf("x= ");
    scanf("%d",&(pos.x));
//    if (pos.x!=-1){
//        *fin=pos.x;
//    }else{
    printf ("\n");
    printf("y= ");
    scanf("%d",&(pos.y));

    printf("Ingrese posicion a ir \n ");
    printf("x= ");
    scanf("%d \n",&(prox.x));
    printf ("\n");
    printf("y= ");
    scanf("%d \n",&(prox.y));

    moverPieza(tab,pos,prox);
    //}
}

int hayRey(casilla tab[][8]){
    int i,k,aux=0;
    for (i=0;i<8;i++){
        for (k=0;k<8;k++){
            if (tab[i][k].p.id=='K'){
                aux++;
            }
        }
    }
    if (aux==2){
        return 1;
    }else return 0;
}
int main()
{
    casilla tablero[8][8]={' '};
    inicializarTablero(tablero);
    imprimirTablero(tablero);
    int fin = 0;
    turno(tablero,&fin);
    while (hayRey(tablero) && !fin){
        imprimirTablero(tablero);
        turno(tablero,&fin);
    }

    return 0;
}

void inicializarTablero(casilla tab[][8]){
    int i;
    for (i=0;i<8;i++){
        tab[1][i].p.id = '1';
        tab[6][i].p.id = '0';
    }
    tab[0][0].p.id= '5';
    tab[7][0].p.id= '4';
    tab[0][1].p.id= '3';
    tab[7][1].p.id= '2';
    tab[0][2].p.id= '7';
    tab[7][2].p.id= '8';
    tab[0][3].p.id= 'K';
    tab[7][3].p.id= 'K';
    tab[0][4].p.id= 'Q';
    tab[7][4].p.id= 'Q';
    tab[0][5].p.id= '7';
    tab[7][5].p.id= '8';
    tab[0][6].p.id= '3';
    tab[7][6].p.id= '2';
    tab[0][7].p.id= '5';
    tab[7][7].p.id= '4';
}

void moverPieza(casilla tab[][8],posicion act,posicion prox){
    if (hayPieza(tab[prox.x][prox.y].p)){
        casilla aux;

        tab[prox.x][prox.y].p.id=tab[act.x][act.y].p.id;
    }else {
        tab[prox.x][prox.y].p.id=tab[act.x][act.y].p.id;
    }
}

int hayPieza(pieza p){
    if (p.id!= 'v'){
        return 1;
    }else{
        return 0;
    }
}

void imprimirTablero(casilla tab[][8]){
    int i,k;
    for (i=0;i<8;i++){
        for (k=0;k<8;k++){
            if (hayPieza(tab[i][k].p)){
                printf("|%c|",tab[i][k].p.id);
            }else printf("| | ");
        }
        printf ("\n");
    }
}
