package practica1Ej3;

public class Profesor {
	String nombre;
	String apellido;
	String email;
	int catedra;
	int facultad;
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCatedra() {
		return catedra;
	}
	public void setCatedra(int catedra) {
		this.catedra = catedra;
	}
	public int getFacultad() {
		return facultad;
	}
	public void setFacultad(int facultad) {
		this.facultad = facultad;
	}
	public String tusDatos() {
		return "Profesor "+this.getNombre()+" "+this.getApellido()+"\n"+"Email "+this.getEmail()+"\n"
				+"Catedra "+this.getCatedra()+"\n"+"Facultad "+this.getFacultad()+"\n";
	}
}
