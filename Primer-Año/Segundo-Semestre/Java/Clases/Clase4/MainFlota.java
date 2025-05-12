package Clase4;

import java.util.Scanner;
public class MainFlota{
    public static void main (String[]args){
        Scanner in = new Scanner(System.in);
        
        FlotaMicros F = new FlotaMicros();
        String pat;
        String destino;
        String hora;
        
        System.out.println("Introduzca patente del micro");
        pat = in.next();
        while (!(pat.equals("ZZZ000"))&&(!F.estaCompleta())){
            System.out.println("Introduzca destino del micro");
            destino = in.next();
            System.out.println("Introduzca hora de salida del micro");
            hora = in.next();
            Micro M = new Micro(pat,destino,hora);
            System.out.println("Micro cargado con exito!");
            F.agregarMicro(M);
            System.out.println(" ");
            System.out.println(" ");
            System.out.println("Introduzca patente del micro");
            pat = in.next();
        }
        
        System.out.println("Introduzca patente del micro a eliminar");
        pat = in.next();
        
        F.eliminarMicro(pat);
        System.out.println("Eliminado Correctamente.");
        System.out.println(" ");
            System.out.println(" ");
            
        System.out.println("Introduzca destino del micro a buscar");
        destino = in.next();
        if (F.buscarMicroPorDestino(destino)!=null){
            System.out.println("Patente del micro que va hacia "+destino+": "+F.buscarMicroPorDestino(destino).getPatente());
            System.out.println("Hora de salida: "+F.buscarMicroPorDestino(destino).getHoraSalida());        
        }
    }
}
