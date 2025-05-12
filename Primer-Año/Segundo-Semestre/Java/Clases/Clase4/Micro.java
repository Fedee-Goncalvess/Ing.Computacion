package Clase4;

public class Micro{
    private int dimF=6;
    private String patente;
    private String destino;
    private String horaSalida;
    private boolean  ass [];
    private int ocupados;

    public Micro(String patente,String destino,String horaSalida){
        this.patente = patente;
        this.destino = destino;
        this.horaSalida = horaSalida;
        int i;
        ass = new boolean[dimF];
        for (i=0;i<dimF;i++){
            ass[i]=false;
        }
        this.ocupados = 0;
    }

    public Micro(){
    }

    public void setPatente(String unPatente){
        this.patente = unPatente;
    }

    public String getPatente(){
        return patente;
    }

    public void setDestino(String unDestino){
        this.destino = unDestino;
    }

    public String getDestino(){
        return destino;
    }

    public void setHoraSalida(String unHoraSalida){
        this.horaSalida = unHoraSalida;
    }

    public String getHoraSalida(){
        return horaSalida;
    }
    
    public int asientosOcupados(){
        return ocupados;
    }
    
    public boolean estaLleno(){
        return (ocupados == dimF);
    }
    
    public boolean numeroValido(int num){
        return ((num<=dimF)&&(num>0));
    }
    
    public boolean asientoOcupado(int num){
        num--;
        boolean aux = ass[num];
        return aux;
    }
    
    public void ocuparAsiento(int num){
        num--;
        ass[num] = true;
        ocupados++;
    }
    
    public void liberarAsiento (int num){
        num--;
        ass[num] = false;
        ocupados--;
    }
    
    public int asientoLibre(){
        int i=1;
        while (asientoOcupado(i)){
            i++;
        }
        return i;
    }
}