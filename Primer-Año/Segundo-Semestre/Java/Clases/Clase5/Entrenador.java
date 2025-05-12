package Clase5;

public class Entrenador extends Empleado{

    private int copas;

    public Entrenador(int Copas){
        this.copas = copas;
    }

    public Entrenador(){
    }

    public void setCopas(int Copas){
        this.copas = Copas;
    }

    public int getCopas(){
        return copas;
    }
}
