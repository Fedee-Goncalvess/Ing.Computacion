#ifndef ICONORGB_H_INCLUDED
#define ICONORGB_H_INCLUDED

typedef struct {
    unsigned char R;
    unsigned char G;
    unsigned char B;
}pixel;

pixel ** iconoRGB;

void reservar (pixel ***, int );
void liberar (pixel ***, int );

#endif // ICONORGB_H_INCLUDED
