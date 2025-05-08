package modelos.transacciones;
import java.time.LocalDateTime;

public abstract class Movimiento {
	private double cant;
	private LocalDateTime fecha;
	private int id;
	protected String tipo;
	
	public double getCant() {
		return cant;
	}
	public void setCant(double cant) {
		this.cant = cant;
	}
	public LocalDateTime getFecha() {
		return fecha;
	}
	public void setFecha() {
		this.fecha = LocalDateTime.now();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getTipo(){
		return tipo;
	}
	public void setTipo(String tipo){
		this.tipo = tipo;
	}
}
