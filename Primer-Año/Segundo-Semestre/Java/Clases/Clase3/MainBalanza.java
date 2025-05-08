package Clase3;
import java.util.Scanner;

public class MainBalanza {
    public static void main (String[]args){
        Scanner in = new Scanner(System.in);
        Balanza B = new Balanza();
        double valor;
        double peso;
        B.iniciarCompra();
        System.out.println ("Para comenzar, registre un producto en la balanza.");
        
        System.out.println ("Introduzca el peso del producto: ");
        peso = in.nextDouble();
        while (peso != 0){
            System.out.println ("Introduzca el valor del producto: ");
            valor = in.nextDouble();
            
            B.registrarProducto(peso,valor);
            
            System.out.println ("Introduzca el peso de otro producto o introduzca 0 para terminar: ");
             peso = in.nextDouble();
        }
        
        System.out.println(B.devolverResumenDeCompra());
    }
}   
