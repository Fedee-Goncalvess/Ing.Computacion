package vista;

import java.awt.BorderLayout;
import java.awt.CardLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Image;
import java.awt.Insets;

import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

public class viewRegistrarse extends JPanel{
	public viewRegistrarse(CardLayout cardLayout, JPanel mainPanel){
		setLayout(new BorderLayout());
        setBackground(Color.WHITE);
	    GridBagConstraints constraints = new GridBagConstraints();
        
		bordeSuperior();
		centro(constraints);	    
				
	}
	
	public void bordeSuperior(){
		JLabel titulo = new JLabel("Registrarse", resizeIcon("coin.png", 50, 50), SwingConstants.CENTER);
		titulo.setFont(new Font("Arial",Font.BOLD, 24));
		titulo.setBorder(BorderFactory.createEmptyBorder(20,20,0,0));
		
		add(titulo,BorderLayout.NORTH);
	}
	
	public void centro(GridBagConstraints constraints) {
		JPanel campos = new JPanel();
	    campos.setLayout(new GridBagLayout());
	    campos.setBackground(new Color(25,25,25));
	     
	    camposCentro(campos, constraints);
	    botonesCentro(campos, constraints);
	    
	    
	}
	
	public void camposCentro(JPanel campos, GridBagConstraints constraints){
		constraints.fill = GridBagConstraints.HORIZONTAL;
	    constraints.insets = new Insets (5,5,5,5);
	    
	    JLabel nombreLabel = new JLabel("Nombre: ");
        nombreLabel.setForeground(Color.WHITE);    
	    constraints.gridx = 0; 
	    constraints.gridy = 0;
	    constraints.gridwidth = 2; 
	    campos.add(nombreLabel, constraints);
	    
	    JLabel apellidoLabel = new JLabel("Apellido: ");
        apellidoLabel.setForeground(Color.WHITE);    
	    constraints.gridx = 0; 
	    constraints.gridy = 1;
	    constraints.gridwidth = 2; 
	    campos.add(apellidoLabel, constraints);
	        
	    JLabel mailLabel = new JLabel("Email: ");
        mailLabel.setForeground(Color.WHITE);    
	    constraints.gridx = 0; 
	    constraints.gridy = 2;
	    constraints.gridwidth = 2; 
	    campos.add(mailLabel, constraints);	        
	        
	    JLabel passwordLabel = new JLabel("Contraseña: ");
	    passwordLabel.setForeground(Color.WHITE);    
	    constraints.gridx = 0;
	    constraints.gridy = 3;
	    constraints.gridwidth = 2;  // Ocupa dos columnas
	    campos.add(passwordLabel, constraints);
	  
	    JTextField nombreText = new JTextField(20);
	    constraints.gridx = 2;
	    constraints.gridy = 0;
	    constraints.gridwidth = 1; 
	    campos.add(nombreText, constraints);
	        
	    JTextField apellidoText = new JTextField(20);
	    constraints.gridx = 2; 
	    constraints.gridy = 1;
	    constraints.gridwidth = 1; 
	    campos.add(apellidoText, constraints);

	    JTextField mailText = new JTextField(20);
	    constraints.gridx = 2;
	    constraints.gridy = 2;
	    constraints.gridwidth = 1; 
	    campos.add(mailText, constraints);
	        
	    JPasswordField password = new JPasswordField(20);
	    constraints.gridx = 2; // Empieza en la columna 2
	    constraints.gridy = 3;
	    constraints.gridwidth = 1; // Solo ocupa una columna
	    campos.add(password, constraints);
	    
	    JCheckBox confirmo = new JCheckBox("Acepto términos y condiciones");
	    confirmo.setBackground(new Color(25,25,25)); 
        confirmo.setForeground(Color.WHITE);
	    constraints.gridx = 0; 
	    constraints.gridy = 4;
	    campos.add(confirmo,constraints);
	}
	
	public void botonesCentro(JPanel campos, GridBagConstraints constraints) {
		JButton registrar = new JButton("Registrar");
	    registrar.setBackground(new Color(25,25,25)); // Establecer color de fondo del botón
        registrar.setForeground(Color.WHITE); // Establecer color del texto del botón
                
	    constraints.gridx = 2;
	    constraints.gridy = 4;
	    campos.add(registrar, constraints);
	        
		add(campos,BorderLayout.CENTER);
	}
	
	 private ImageIcon resizeIcon(String path, int width, int height) {
	        java.net.URL imgURL = getClass().getResource(path);
	        if (imgURL != null) {
	            ImageIcon icon = new ImageIcon(imgURL);
	            Image image = icon.getImage(); // Transformar a Image
	            Image newimg = image.getScaledInstance(width, height, java.awt.Image.SCALE_SMOOTH); // Redimensionar
	            return new ImageIcon(newimg);  // Transformar de nuevo a ImageIcon
	        } else {
	            System.err.println("Couldn't find file: " + path);
	            return null;
	        }
	    }
}
