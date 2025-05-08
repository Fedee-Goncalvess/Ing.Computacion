package Conexión;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private Connection conn = null;

    private final String URL = "jdbc:sqlite:billeteraBD.db";

    // metodo para abrir la conexion
    public Connection conectar() {
        try {
            if (conn == null || conn.isClosed()) {
                // Crear una nueva conexión
                conn = DriverManager.getConnection(URL);
                System.out.println("Conexión a la base de datos establecida.");
            }
        } catch (SQLException e) {
            System.out.println("Error al conectar con la base de datos: " + e.getMessage());
        }
        return conn;
    }

    // Método para cerrar la conexión
    public void cerrar() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
                System.out.println("Conexión a la base de datos cerrada.");
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión: " + e.getMessage());
        }
    }
}