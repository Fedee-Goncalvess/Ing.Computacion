package practia1Ej5;

import java.lang.reflect.Array;

public class Ej5 {

	public static int[] maxmin1 (int [] a) {
		int cont = 0;
		int [] minMax = {-99,99,0};
		int i = 0;
		int k = Array.getLength(a);
		for (i=0;i<k;i++) {
			if (minMax[0] < a[i]) minMax[0] =a[i];
			if (minMax[1] > a[i]) minMax[1] =a[i];
			minMax[2]+=a[i];
			cont++;
		} 
		
		minMax[2]=minMax[2]/cont;
		
		return minMax;
	}
	
	public static int[]  metodo1 (int [] a) {
		
		int [] x = maxmin1(a);
		return x;
	}  
	
	public static void metodo2(int [] a, ParametroReferencial b) {
		int cont = 0;
		int i = 0;
		b.max = -99;
		b.min = 99;
		b.prom = 0;
		int k = Array.getLength(a);
		for (i=0;i<k;i++) {
			if (b.max < a[i])  b.max=a[i];
			if (b.min > a[i])  b.min=a[i];
			b.prom+=a[i];
			cont++;
		}
		b.prom = b.prom/cont;
	}
	
	public static void metodo3 () {
		
		//FALTA METODO 3. DEVOLVER SIN PARAMETROS NI RETURN
		
	}
	
	public static void main(String[] args) {
		
		int [] a = {2,8,6,4,3};
		System.out.print("Metodo 1 \n");
		int [] x = metodo1(a);
		System.out.print("Maximo de Array= "+x[0]+"\n");
		System.out.print("Minimo de Array= "+x[1]+"\n");
		System.out.print("Promedio de Array= "+x[2]+"\n");
		
		ParametroReferencial  pr = new ParametroReferencial();
		System.out.print("Metodo 2 \n");
		metodo2(a,pr);
		System.out.print("Maximo de Array= "+pr.max+"\n");
		System.out.print("Minimo de Array= "+pr.min+"\n");
		System.out.print("Promedio de Array= "+pr.prom+"\n");
	}

}
