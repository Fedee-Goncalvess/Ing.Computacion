package clasesDAO;
import java.util.List;

import modelos.transacciones.*;

public interface MovimientosDAO {
	void GenerarMovimiento();
	List<Movimiento> ListarMovimientos();
	
}
