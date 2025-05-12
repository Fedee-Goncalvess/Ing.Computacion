package practica1Ej3;

public class Test {

	public static void main(String[] args) {
		Estudiante [] e = new Estudiante[2];
		//Profesor [] p = new Profesor [3];
		e[0]= new Estudiante();
		e[1]= new Estudiante();
		e[1].setNombre("Luciano");
		e[1].setApellido("Soto");
		e[1].setComision(1);
		e[1].setEmail("lucianogeigmail.com");
		e[1].setDireccion(1);
		e[0].setNombre("Tomaas");
		e[0].setApellido("Gamarrrra");
		e[0].setComision(0);
		e[0].setEmail("tomigeigmail.com");
		e[0].setDireccion(2);
		
		int i=0;
		for (;i<2;i++) {
			System.out.printf(e[i].tusDatos());
		}
	}
}
