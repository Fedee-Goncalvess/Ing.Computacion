package vista;

import java.awt.BorderLayout;
import java.awt.CardLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Image;
import java.awt.Insets;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;
import javax.swing.border.EmptyBorder;

public class ViewCotizaciones extends JPanel{
	public ViewCotizaciones(CardLayout cardLayout, JPanel mainPanel) {
		setLayout(new BorderLayout());
		superior();
		
		inferior(cardLayout, mainPanel);
	}
	
	public void superior() {
		
		
		JPanel bordeSuperior = new JPanel();
		bordeSuperior.setLayout(new BorderLayout());
        setBackground(Color.WHITE);

		JPanel userPanel = new JPanel();
		userPanel.setLayout(new GridBagLayout());
		GridBagConstraints constraints = new GridBagConstraints();
		constraints.insets = new Insets(5,5,5,5);
		constraints.fill = GridBagConstraints.HORIZONTAL;
		
		JLabel icon = new JLabel(resizeIcon("profile-user.png", 50, 50), SwingConstants.CENTER);
		constraints.gridx = 0;
		constraints.gridy = 0;
		constraints.gridwidth = 2;
		constraints.gridheight = 2;
		userPanel.add(icon,constraints);
		
		JLabel user = new JLabel("Nombre Usuario");
		constraints.gridx = 3;
		constraints.gridy = 0;
		constraints.gridwidth = 2;
		constraints.gridheight = 1;
		userPanel.add(user,constraints);
		
		JButton cerrarSesion = new JButton ("Cerrar sesión");
		cerrarSesion.setBackground(new Color (25,25,25));
		cerrarSesion.setForeground(Color.WHITE);
		constraints.gridx = 3;
		constraints.gridy = 1;
		constraints.gridwidth = 2;
		constraints.gridheight = 1;
		userPanel.add(cerrarSesion,constraints);

		JButton DatosPrueba = new JButton ("Generar Datos de Prueba");
		DatosPrueba.setBackground(new Color (25,25,25));
		DatosPrueba.setForeground(Color.WHITE);
		constraints.gridx = 0;
		constraints.gridy = 2;
		constraints.gridwidth = 5;
		constraints.gridheight = 2;
		userPanel.add(DatosPrueba,constraints);
		
		bordeSuperior.add(userPanel,BorderLayout.EAST);
		add(bordeSuperior, BorderLayout.NORTH);
	}

	public void central() {
		
	}
	
	public void inferior(CardLayout cardLayout, JPanel mainPanel) {
		JPanel panelInferior = new JPanel();
		panelInferior.setLayout(new FlowLayout(FlowLayout.CENTER));
		panelInferior.setBackground(new Color(25,25,25));
		panelInferior.setBorder(new EmptyBorder(10, 0, 40, 0));
		
		JButton volver = new JButton("Volver");
		volver.addActionListener(e -> cardLayout.show(mainPanel,"misActivos"));
		volver.setBackground(new Color (25,25,25));
		volver.setForeground(Color.WHITE);
		volver.setPreferredSize(new Dimension(100,40));
		
		panelInferior.add(volver);
		
		add(panelInferior,BorderLayout.SOUTH);
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
