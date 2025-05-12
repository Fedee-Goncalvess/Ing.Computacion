import java.util.Scanner;
public class crearClase {
    public static void main (String[] args){
        Scanner in = new Scanner(System.in); //no olvidar

        System.out.println("Ingrese el nombre de la clase: ");
        String nombreClase = capitalize(in.next());
        
        
        System.out.println("Ingrese cantidad de atributos: ");
        int cantidad=in.nextInt();
        String[][] vectorS=new String[cantidad][2];

        for (int i=0;i<cantidad; i++){
            System.out.println("Ingrese tipo de la variable "+(i+1));
            vectorS[i][0]=in.next();
            System.out.println("Ingrese nombre de la variable "+(i+1));
            vectorS[i][1]=in.next();
        }

        // IMPRESION DEL PROGRAMA

        System.out.println("----- CÓDIGO A COPIAR -----");
        System.out.println();
        for(int i=0;i<cantidad;i++){
            System.out.println(vectorS[i][0]);
            System.out.println(vectorS[i][1]);
            System.out.println();
        }
        // Declaración de la clase y variables
        System.out.println("public class "+nombreClase+"{");
        System.out.println();
        for (int i=0;i<cantidad; i++){
            System.out.println("private "+vectorS[i][0]+ " " +vectorS[i][1]+";");
        }
        System.out.println();

        
        // Constructor con todas las variables
        System.out.print("public "+nombreClase+"(");
        for (int i=0;i<cantidad; i++){
            System.out.print(vectorS[i][0]+" "+vectorS[i][1]);
            if (i==cantidad-1) // Si llega al final
                System.out.println("){");
            else 
                System.out.print(",");
        }
        for (int i=0;i<cantidad; i++){
            System.out.println("this."+vectorS[i][1]+ " = " +vectorS[i][1]+";");
        }
        System.out.println("}");
        System.out.println();

        // Constructor nulo
        System.out.println("public "+nombreClase+"(){");
        System.out.println("}");
        System.out.println();

        // Sets y gets
        for (int i=0;i<cantidad; i++){
            //Set
            System.out.println("public void set"+ capitalize(vectorS[i][1]) + "(" +vectorS[i][0] +" "+vectorS[i][1] + "){");
            System.out.println("this."+vectorS[i][1]+ " = " +vectorS[i][1]+";");
            System.out.println("}");
            System.out.println();

            //Get
            System.out.println("public "+vectorS[i][0]+" get"+ capitalize(vectorS[i][1]) + "(){");
            System.out.println("return "+vectorS[i][1]+";");
            System.out.println("}");
            System.out.println(); 
        }

        
    }

    public static String capitalize(String str)
    {
        if (str == null || str.length() == 0) {
            return str;
        }

        return str.substring(0, 1).toUpperCase() + str.substring(1);
    }

}