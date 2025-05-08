package clasesDAO;
import java.sql.SQLException;
import java.util.List;
import modelos.moneda.*;

public interface MonedaDAO {
	void crearMoneda(Moneda moneda) throws SQLException;
	Moneda readMoneda(String alias) throws SQLException;
	void updateMoneda(Moneda moneda) throws SQLException;
	void deleteMoneda() throws SQLException;
	List<Moneda> arrayMonedas();
}
