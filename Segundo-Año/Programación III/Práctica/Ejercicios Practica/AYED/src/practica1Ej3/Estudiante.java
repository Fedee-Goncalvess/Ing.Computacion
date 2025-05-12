package practica1Ej3;

public class Estudiante {
	String nombre;
	String apellido;
	int comision;
	String email;
	int direccion;
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
	public int getComision() {
		return comision;
	}
	public void setComision(int comision) {
		this.comision = comision;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getDireccion() {
		return direccion;
	}
	public void setDireccion(int direccion) {
		this.direccion = direccion;
	}

	public String tusDatos() {
		return "Estudiante "+this.getNombre()+"\n"+"Apellido "+this.getApellido()+"\n"+
				"Comisión "+this.getComision()+"\n"+"Email "+this.getEmail()+"\n"+
				"Direccion "+this.getDireccion()+"\n";
	}
	
	
}
