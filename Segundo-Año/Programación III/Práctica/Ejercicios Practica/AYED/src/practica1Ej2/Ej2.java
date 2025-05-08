package practica1Ej2;
import java.lang.reflect.Array;
import java.util.Scanner;

public class Ej2 {
	public static int[] f(int n) {
		int [] v = new int[n];
		int i;
		for (i=0;i<n;i++) {
			
			v[i]= (i+1)*n;
		}
		return v;
	}
	
	public static void main(String[] args) {
		@SuppressWarnings("resource")
		Scanner in=new Scanner(System.in);
		System.out.print("Introduzca el largo del vector: \n");
		int n= in.nextInt();
		int [] vector = f(n);
		int i=Array.getLength(vector);
		int k;
		for (k=0;k<i;k++) {
			System.out.print(vector[k]);
			System.out.print("\n");
		}
	}

}
