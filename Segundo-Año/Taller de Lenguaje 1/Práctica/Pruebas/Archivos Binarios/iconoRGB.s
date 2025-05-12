void reservar(pixel *** iconoRGB, int N){
    (*iconoRGB)= (pixel**)malloc (sizeof(pixel*)*N);

    int i;
    for (i=0;i<N;i++){
        (*iconoRGB)[i] = (pixel*)malloc (sizeof(pixel)*N);
    }

}

void liberar(pixel *** iconoRGB,int N){
    int i;
    for (i=0; i<N;i++){
        free((*iconoRGB)[i]);
    }
    free ((*iconoRGB));

}
