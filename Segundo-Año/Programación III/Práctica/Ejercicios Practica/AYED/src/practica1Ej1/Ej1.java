package practica1Ej1;
import java.util.Scanner;

public class Ej1 {
	public static void Metodo1 (int a,int b) {
		int i=a;
		for (;i<=b;i++) {
			System.out.print(i);
			System.out.print("\n");
		}
	}
	public static void Metodo2 (int a, int b) {	
		int i=a;
		while(i!=b) {
			System.out.print(i);
			System.out.print("\n");
			i++;
		} 
	}
	public static void Metodo3 (int a,int b) {
		if (a!=b) {
			Metodo3(a+1,b);
			System.out.print(a);
			System.out.print("\n");
		}else {
			System.out.print(a);
			System.out.print("\n");
		}
	}
	public static void main(String[] args) {
		@SuppressWarnings("resource")
		Scanner in= new Scanner(System.in);
		System.out.print("Introduzca numero a: \n");
		int a= in.nextInt();
		System.out.print("Introduzca numero b: \n");
		int b= in.nextInt();
		System.out.print("Metodo a elegir \n");
		int metodo= in.nextInt();
		switch (metodo) {
		case 1: Metodo1(a,b);
		case 2: Metodo2(a,b);
		case 3: Metodo3(a,b);
		}
	}

}
