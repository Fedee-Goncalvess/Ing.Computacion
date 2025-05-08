package Clase3;
import java.util.Scanner;
public class MainProd{
    public static void main (String[]args){
        Scanner in = new Scanner (System.in);
        
        System.out.println("Ingresar Codigo de producto: ");
        int cod = in.nextInt();     
        
        System.out.println("Ingresar Nombre del producto: ");
        String nombre = in.next();
        
        System.out.println("Ingresar una descripcción del producto: ");
        String descripcion = in.next();
        
        System.out.println("Ingresar Marca del producto: ");
        String marca = in.next();
        
        System.out.println("Ingresar cantidad de unidades en Stock: ");
        int cant = in.nextInt();
        
        Producto P = new Producto(cod,nombre,descripcion,marca,cant);
        
        System.out.println(P.infoProducto());
        
        System.out.println("Para agregar stock de un producto introduzca primero su codigo: ");
        int cod2 = in.nextInt(); 
        
        System.out.println("Y la cantidad de unidades a agregar: ");
        int cant2 = in.nextInt();
        
        
    }
}