package Clase5;

public class Jugador extends Empleado{

    private int partidos;
    private int goles;

    public Jugador(int Partidos,int Goles){
        this.partidos = partidos;
        this.goles = goles;
    }

    public Jugador(){
    }

    public void setPartidos(int Partidos){
        this.partidos = Partidos;
    }

    public int getPartidos(){
        return partidos;
    }

    public void setGoles(int Goles){
        this.goles = Goles;
    }

    public int getGoles(){
        return goles;
    }
    
    public double calcularSueldoACobrar(){
        double  aux = super.getSueldo();
        if (goles/partidos > 0.5){
            aux*=2;
        }
        
        
        return aux;
    }
}