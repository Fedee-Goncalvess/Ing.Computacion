package Clase3;
public class Balanza {
    private double monto;
    private int cant;
    
    Balanza (){}
    
    Balanza (double unMonto, int unCant){
        this.setMonto(unMonto);
        this.setCant(unCant);
    }
    
    void setMonto (double unMonto){
        monto=unMonto;
    }
    
    void setCant (int unCant){
        cant = unCant;
    }
    
    void iniciarCompra(){
        cant = 0;
        monto = 0;
    }
    
    void registrarProducto (double peso, double precio){
        cant++;
        monto = monto + peso*precio;
    }
    
    double devolverMontoAPagar(){ 
        return monto;    
    }
    
    String devolverResumenDeCompra(){
        String aux = ("Total a pagar: "+monto+" por la compra de "+cant+" productos.");
        return aux;
    }
}