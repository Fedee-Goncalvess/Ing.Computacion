package clasesDAOimp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import clasesDAO.MonedaDAO;
import modelos.moneda.Cripto;
import modelos.moneda.FIAT;
import modelos.moneda.Moneda;
import Conexión.DatabaseConnection;

public class MonedaDAOimp implements MonedaDAO{
	
	 private DatabaseConnection conn = new DatabaseConnection();
	
	@Override
	public void crearMoneda(Moneda moneda) throws SQLException {
		String sql = "INSERT INTO moneda (nomenclatura, nombre, cantidad, tipo, volatilidad, valor_dolar) VALUES (?, ?, ? ,?, ? ,?)"; //COMANDO SQL
		
		try (Connection connection =conn.conectar();
			PreparedStatement st = connection.prepareStatement(sql)) {
			
			st.setString(1, moneda.getNomenclatura());
			st.setString(2, moneda.getNombre());
			st.setDouble(3, moneda.getCant());
			st.setString(4, moneda.getTipo());
			//st.setDouble(5, moneda.getVolatilidad());
			st.setDouble(6, moneda.getValorDolar());
	
			int res = st.executeUpdate();
			
			if (res != 0) {
				System.out.println("Moneda insertada en base de datos");
			}else {
				System.out.println("No se insertó correctamente");
			}	
		}catch (SQLException e){
			System.out.println("Error al insertar moneda: "+ e.getMessage());
		}
	}

	@Override
	public Moneda readMoneda(String alias) throws SQLException {
		String sql = "SELECT nomenclatura, nombre, cantidad, tipo, volatilidad, valor_dolar FROM moneda WHERE nomenclatura = ?";
		
		try (Connection connection =conn.conectar();
			PreparedStatement st = connection.prepareStatement(sql)){
			
			st.setString(1, sql);
			
			try (ResultSet rs = st.executeQuery()){
				String nomenclatura;
				String nombre;
				double valor_dolar;
				double cantidad;
				double volatilidad;
				if (rs.next()) {
					String tipo = rs.getString(4);
					if (tipo.equals("CRIPTO")) {
						nomenclatura = rs.getNString("nomenclatura");
						nombre = rs.getNString("nombre");
						valor_dolar  = rs.getDouble("valor_dolar");
						cantidad = rs.getDouble("cantidad");
						volatilidad = rs.getDouble("volatilidad");
						
						Moneda cripto = new Cripto(nomenclatura, nombre, valor_dolar, cantidad, volatilidad);
						
						return cripto;
						
					}else if (tipo.equals("FIAT")){
						nomenclatura = rs.getNString("nomenclatura");
						nombre = rs.getNString("nombre");
						valor_dolar  = rs.getDouble("valor_dolar");
						cantidad = rs.getDouble("cantidad");
						
						Moneda fiat= new FIAT(nomenclatura, nombre, valor_dolar, cantidad); 
						
						return fiat;
					}
				}
			}catch (SQLException e) {
				System.out.println("");
			}
			
			
		}catch(SQLException e){
			System.out.println("Error al leer moneda: "+e.getMessage());
		}
		
		return null;
	}

	@Override
	public void updateMoneda(Moneda moneda) throws SQLException {
		String sql = "UPDATE moneda SET nomenclatura = ?, nombre = ?, cantidad = ?, tipo = ?, volatilidad = ?, valor_dolar = ? WHERE nomenclatura = ?";
		try (Connection connection = conn.conectar();
			PreparedStatement st= connection.prepareStatement(sql)){
			
			st.setString(1, moneda.getNomenclatura());
			st.setString(2, moneda.getNombre());
			st.setDouble(3, moneda.getCant());
			st.setString(4, moneda.getTipo());
			//st.setDouble(5, moneda.getVolatilidad());
			st.setDouble(6, moneda.getValorDolar());
			
			int res = st.executeUpdate();
			
			if (res != 0) {
				System.out.println("Moneda actualizada en base de datos");
			}else {
				System.out.println("No se actualizó correctamente");
			}	
		}catch(SQLException e) {
			System.out.println("Error al actualizar moneda: "+ e.getMessage());
		}
	}

	@Override
    public List<Moneda> arrayMonedas(){
    	List<Moneda> monedas = new ArrayList<>();
    	String sql = "SELECT nomenclatura, nombre, cantidad, tipo, volatilidad, valor_dolar FROM moneda";
    	Moneda moneda = null;
        
        // Conectar a la base de datos
        try (Connection connection = conn.conectar();
             PreparedStatement st = connection.prepareStatement(sql)) {
        	// Ejecutar la consulta
            ResultSet rs = st.executeQuery();

            // Recorrer los resultados
            while (rs.next()) {
                String nomenclatura = rs.getString("nomenclatura");
                String nombre = rs.getString("nombre");
                double cantidad = rs.getDouble("cantidad");
                String tipo = rs.getString("tipo");
                double volatilidad = rs.getDouble("volatilidad");
                double valorDolar = rs.getDouble("valor_dolar");
                
                // Crear objeto Moneda y añadirlo a la lista
                if (tipo.equals("FIAT")) {
                	 moneda = new FIAT (nomenclatura, nombre, valorDolar,cantidad);
                }else {
                	 moneda = new Cripto (nomenclatura, nombre, valorDolar ,cantidad, volatilidad);
                }
                
                monedas.add(moneda);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener las monedas: " + e.getMessage());
        }
        
        return monedas;
	}

	@Override
	public void deleteMoneda() throws SQLException {
		// TODO Auto-generated method stub
		
	}
    
}
