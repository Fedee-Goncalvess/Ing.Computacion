package modelos.transacciones;

public class movimientoVenta extends Movimiento{
	public movimientoVenta(){
		setFecha();
		setTipo("Venta");
	}
	public movimientoVenta(double cant){
		setCant(cant);
		setFecha();
		setTipo("Venta");
	}
}
