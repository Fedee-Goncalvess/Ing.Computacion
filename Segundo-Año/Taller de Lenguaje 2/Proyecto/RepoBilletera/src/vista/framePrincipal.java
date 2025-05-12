package vista;
import java.awt.*;
import javax.swing.*;

public class framePrincipal extends JFrame{
	
	public framePrincipal() {
		setTitle("SF");
		setSize(800,600);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        
        JPanel mainPanel = new JPanel();
        mainPanel.setLayout(new CardLayout());
        CardLayout cardLayout = (CardLayout) mainPanel.getLayout();
        viewIniciarSesion iniciarSesion = new viewIniciarSesion(cardLayout, mainPanel);
        viewRegistrarse registrarse = new viewRegistrarse(cardLayout, mainPanel);
        viewMisActivos misActivos = new viewMisActivos(cardLayout, mainPanel);
        mainPanel.add(iniciarSesion, "iniciarSesion");        
        mainPanel.add(registrarse, "registrarse");
//        mainPanel.add(misActivos,"misActivos");
        add(mainPanel);
	}
	
	public static void main(String[] args) {
		framePrincipal frame = new framePrincipal();
		frame.setVisible(true);
	}
}

