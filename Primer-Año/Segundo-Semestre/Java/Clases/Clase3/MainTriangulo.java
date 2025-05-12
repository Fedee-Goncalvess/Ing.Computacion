package Clase3;
import java.util.Scanner;
public class  MainTriangulo{
    public static void main (String[] args){
        Scanner in = new Scanner (System.in);
        
        System.out.println ("Introducir el tamaño del primer lado del triangulo: ");
        double lado1 = in.nextDouble();
        
        System.out.println ("Introducir el tamaño del segundo lado del triangulo: ");
        double lado2 = in.nextDouble();
        
        System.out.println ("Introducir el tamaño del tercer lado del triangulo: ");
        double lado3 = in.nextDouble();
        
        System.out.println ("Introducir el color del relleno del triangulo: ");
        String relleno = in.next();
        
        System.out.println ("Introducir el color de l linea del triangulo: ");
        String linea = in.next();
        
        Triangulo T = new Triangulo (lado1, lado2, lado3, relleno, linea);
        System.out.println ("El area del triangulo es de: "+T.calcularArea());
        System.out.println ("El perimetro del triangulo es de: "+ T.calcularPerimetro());
        System.out.println (T.imrpimirValores());
    }
}