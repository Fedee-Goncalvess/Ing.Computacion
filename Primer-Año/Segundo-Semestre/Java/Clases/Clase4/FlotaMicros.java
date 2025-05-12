package Clase4;

public class FlotaMicros{
    private int dimF=3;
    private Micro [] Flota;
    private int cant;
    
    FlotaMicros(){
        int i;
        Flota = new Micro[dimF];
        cant = 0;
    }
    
    boolean estaCompleta(){
        return (cant==dimF);
    }
    
    void agregarMicro(Micro m){
        Flota [cant] = m;
        cant++;
    }
    
    void eliminarMicro (String patente){
        int i=0;
        while (!Flota[i].getPatente().equals(patente)){
            i++;
        }
        Flota [i]=null;
        cant--;
        Flota[i] = Flota[cant];
    }
    
    Micro buscarMicroPorPatente(String patente){
        Micro aux=null;
        int i=0;
        while ((i<dimF)&&!(Flota[i].getPatente()).equals(patente)){
            i++;
        }
        if (i<dimF){
            aux= Flota[i];
        }
        return aux;
    }
    
    Micro buscarMicroPorDestino (String dest){
        Micro aux=null;
        int i=0;
        while ((i<dimF)&& !(Flota[i].getDestino()).equals(dest)){
            i++;
        }
        if (i<=dimF){
            aux= Flota[i];
        }
        return aux;
    }
}