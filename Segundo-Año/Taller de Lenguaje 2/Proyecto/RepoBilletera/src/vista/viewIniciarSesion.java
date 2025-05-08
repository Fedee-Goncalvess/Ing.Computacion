package vista;
import java.awt.*;
import javax.swing.*;

public class viewIniciarSesion extends JPanel {
	public viewIniciarSesion(CardLayout cardLayout, JPanel mainPanel){
		setLayout(new BorderLayout());
        setBackground(Color.WHITE);
        
        bordeSuperior();
        
		JPanel campos = new JPanel();
	    GridBagConstraints constraints = new GridBagConstraints();
	    centro(campos,constraints, cardLayout, mainPanel);
	  	   	   	        	   		
		add(campos,BorderLayout.CENTER);
				
	}
	
	public void bordeSuperior(){
		JLabel titulo = new JLabel("Iniciar Sesión", resizeIcon("coin.png", 50, 50), SwingConstants.CENTER);
		titulo.setFont(new Font("Arial",Font.BOLD, 24));
		titulo.setBorder(BorderFactory.createEmptyBorder(20,20,0,0));
		
		add(titulo,BorderLayout.NORTH);
	}
	
	public void centro(JPanel campos, GridBagConstraints constraints,CardLayout cardLayout, JPanel mainPanel){
	    campos.setLayout(new GridBagLayout());
	    campos.setBackground(new Color(25,25,25));
	        	    
	    constraints.fill = GridBagConstraints.HORIZONTAL;
	    constraints.insets = new Insets (5,5,5,5);
	    
	    botonesCentro(campos, constraints, cardLayout, mainPanel);
	    labelsCentro(campos, constraints);
	    
	    JTextField userText = new JTextField(20);
	    constraints.gridx = 2;
	    constraints.gridy = 0; 
	    constraints.gridwidth = 1; 
	    campos.add(userText, constraints);	       
	   	        
	    JPasswordField password = new JPasswordField(20);
	    constraints.gridx = 2; // Empieza en la columna 2
	    constraints.gridy = 1; 
	    constraints.gridwidth = 1; // Solo ocupa una columna
	    campos.add(password, constraints);
	        
	}
	
	public void botonesCentro(JPanel campos, GridBagConstraints constraints,CardLayout cardLayout, JPanel mainPanel){
		 JButton login = new JButton("Log In");
		 login.setBackground(new Color(25,25,25)); // Establecer color de fondo del botón
	     login.setForeground(Color.WHITE); // Establecer color del texto del botón
		 constraints.gridx = 0;
		 constraints.gridy = 2;
		 constraints.gridwidth = 2; // Ocupa 2 columnas
		 campos.add(login, constraints);
		        
		 JButton signup = new JButton("Registrarse");
		 signup.addActionListener(e -> cardLayout.show(mainPanel,"registrarse"));
		 signup.setBackground(new Color(25,25,25)); // Establecer color de fondo del botón
	     signup.setForeground(Color.WHITE); // Establecer color del texto del botón
		 constraints.gridx = 2;
		 constraints.gridy = 2;
		 constraints.gridwidth = 2; // Ocupa 2 columnas
		 campos.add(signup, constraints);
	}
	
	public void labelsCentro(JPanel campos, GridBagConstraints constraints){
		JLabel userLabel = new JLabel("Usuario: ");
        userLabel.setForeground(Color.WHITE);    
	    constraints.gridx = 0; 
	    constraints.gridy = 0;
	    constraints.gridwidth = 2; 
	    campos.add(userLabel, constraints);
	    
	    JLabel passwordLabel = new JLabel("Contraseña: ");
        passwordLabel.setForeground(Color.WHITE);    
	    constraints.gridx = 0;
	    constraints.gridy = 1;
	    constraints.gridwidth = 2;  // Ocupa dos columnas
	    campos.add(passwordLabel, constraints);
	    
	    JLabel registrarse= new JLabel("¿Aún no estas registrado?");
	    registrarse.setForeground(Color.LIGHT_GRAY);    

	    constraints.gridx = 2;
	    constraints.gridy = 4;
	    campos.add(registrarse, constraints);
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
