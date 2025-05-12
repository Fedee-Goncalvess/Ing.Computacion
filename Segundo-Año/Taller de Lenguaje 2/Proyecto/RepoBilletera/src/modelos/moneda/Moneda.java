package modelos.moneda;
import java.util.LinkedList;

import modelos.transacciones.*;

public abstract class Moneda {
	private String nomenclatura;
	private String nombre;
	private double cant;
	private String tipo;
	private double valor_dolar;
	private LinkedList<Movimiento> historial;
	
	public String getNomenclatura() {
		return nomenclatura;
	}
	public void setNomenclatura(String nomenclatura) {
		this.nomenclatura = nomenclatura;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public double getCant() {
		return cant;
	}
	public void setCant(double cant) {
		this.cant = cant;
	}
	public double getValorDolar() {
		return valor_dolar;
	}
	public void setValorDolar(double valorDolar) {
		this.valor_dolar = valorDolar;
	}
	public double convertirDolar() {
		return cant * valor_dolar;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public abstract void liberarCant();
	public abstract void reservarCant();
	public abstract void agregarMovimiento();
}
