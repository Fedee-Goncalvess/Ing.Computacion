package modelos.transacciones;

public class movimientoSwap extends Movimiento{
	public movimientoSwap() {
		setFecha();
		setTipo("Swap");
	}
	
	public movimientoSwap(double cant) {
		setCant(cant);
		setFecha();
		setTipo("Swap");
	}
}
