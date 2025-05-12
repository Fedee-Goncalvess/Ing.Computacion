package vista;
import javax.swing.*;
import java.awt.*;

public class frameIniciarSesion extends JFrame {
    public frameIniciarSesion() {
        setTitle("Iniciar Sesión");
        setSize(800, 600);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        
        JPanel panel = new JPanel();
        panel.setLayout(new GridBagLayout());
        
        GridBagConstraints constraints = new GridBagConstraints();
        constraints.fill = GridBagConstraints.HORIZONTAL;
        constraints.insets = new Insets (5,5,5,5);
        
        JLabel userLabel = new JLabel("Usuario: ");
        
        constraints.gridx = 0; 
        constraints.gridy = 0;
        constraints.gridwidth = 2; 
        panel.add(userLabel, constraints);
        
  
        JTextField userText = new JTextField(20);
        constraints.gridx = 2; 
        constraints.gridwidth = 1; 
        panel.add(userText, constraints);
        
        
        JLabel passwordLabel = new JLabel("Contraseña: ");
        constraints.gridx = 0;
        constraints.gridy = 1;
        constraints.gridwidth = 2;  // Ocupa dos columnas
        panel.add(passwordLabel, constraints);
        
        JPasswordField password = new JPasswordField(20);
        constraints.gridx = 2; // Empieza en la columna 2
        constraints.gridwidth = 1; // Solo ocupa una columna
        panel.add(password, constraints);
        
        JButton login = new JButton("Log In");
        constraints.gridx = 0;
        constraints.gridy = 2;
        constraints.gridwidth = 2; // Ocupa 2 columnas
        panel.add(login, constraints);
        
        JButton signup = new JButton("Registrarse");
        constraints.gridx = 2;
        constraints.gridy = 2;
        constraints.gridwidth = 2; // Ocupa 2 columnas
        panel.add(signup, constraints);
        
        JLabel registrarse= new JLabel("¿Aún no estas registrado?");
        constraints.gridx = 2;
        constraints.gridy = 4;
        panel.add(registrarse, constraints);
        
        
        
        // Añadir el panel al frame
        add(panel);
    }

    public static void main(String[] args) {
        frameIniciarSesion frame = new frameIniciarSesion();
        frame.setVisible(true);
    }
}
