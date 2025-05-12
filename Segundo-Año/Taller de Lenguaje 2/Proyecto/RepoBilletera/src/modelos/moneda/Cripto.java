package modelos.moneda;

public class Cripto extends Moneda{
	private double variación;
	private double volatilidad;
	
	public Cripto () {
		setTipo("Cripto");
	}
	
	public Cripto (String nomenclatura, String nombre, double valor_dolar, double cant, double volatilidad) {
		setNomenclatura(nomenclatura);
		setNombre(nombre);
		setValorDolar(valor_dolar);
		setCant(cant);
		setTipo("Cripto");
		setVolatilidad(volatilidad);
	}
	
	public void setVarión(double variación){
		this.variación = variación;
	}
	
	public void setVolatilidad(double volatilidad){
		this.volatilidad = volatilidad;
	}
	
	public double getVariación(){
		return variación;
	}
	
	public double getVolatilidad(){
		return volatilidad;
	}
	
	public boolean hayStock (double cantidad) {
		if ((this.getCant()-cantidad) < 0 ) {
			return false;
		}
		return true;
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
