package modelos.transacciones;

public class movimientoCompra extends Movimiento{
	public movimientoCompra(){
		setFecha();
		setTipo("Compra");
	}
	public movimientoCompra(double cant){
		setCant(cant);
		setFecha();
		setTipo("Compra");
	}
}
