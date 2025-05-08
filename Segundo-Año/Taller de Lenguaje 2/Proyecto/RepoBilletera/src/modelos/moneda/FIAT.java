package modelos.moneda;

public class FIAT extends Moneda{

	public FIAT () {
		setTipo("FIAT");
	}
	
	public FIAT (String nomenclatura, String nombre, double valor_dolar, double cantidad) {
		super.setNomenclatura(nomenclatura);
		super.setNombre(nombre);
		super.setValorDolar(valor_dolar);
		super.setTipo("FIAT");
		super.setCant(cantidad);
	}
	
	public void recibirTransferencia(double transferencia) {
		
	}
	
	@Override
	public void liberarCant() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void reservarCant() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void agregarMovimiento() {
		// TODO Auto-generated method stub
		
	}

}
