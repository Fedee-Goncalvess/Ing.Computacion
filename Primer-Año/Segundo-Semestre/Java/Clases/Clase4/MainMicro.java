package Clase4;
import java.util.Scanner;
public class MainMicro{
    public static void main (String[]args){
        Scanner in = new Scanner(System.in);
        int num;
        
        System.out.println("Se creó un nuevo micro con dirección a Mar Del Plata");
        Micro M = new Micro("ABC123","MarDelPlata","5:00am");
        
        System.out.println("Introduzca el numero de asiento");
        num = in.nextInt();
        while ((num != -1) && (!M.estaLleno())){
            if (M.numeroValido(num)){
                if (M.asientoOcupado(num)){
                    System.out.println("El asiento elegido ya está ocupado.");                
                    System.out.println("El  primer asiento disponible es: "+M.asientoLibre());
                } else {
                    M.ocuparAsiento(num);
                    System.out.println("¡Su asiento fue elegido con exito!");
                }
            } else {System.out.println("No es un número válido.");
            }
            if (!M.estaLleno()){
                System.out.println("Introduzca el numero de asiento");
                num = in.nextInt();
            }
        }
        
        System.out.println("El micro tiene un total de "+M.asientosOcupados()+" asientos ocupados.");
    }
}