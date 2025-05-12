package vista;
import java.awt.*;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;

public class viewMisActivos extends JPanel{
	public viewMisActivos(CardLayout cardLayout, JPanel mainPanel) {
		setLayout(new BorderLayout());
		superior();
		centro();
		inferior();
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
	
	public void centro() {
		JPanel panelCentral = new JPanel();
		panelCentral.setLayout(new BorderLayout());
		panelCentral.setBackground(new Color(25,25,25));
		
		JPanel panelBalance = new JPanel();
		panelBalance.setLayout(new FlowLayout(FlowLayout.LEFT));
		panelBalance.setBackground(new Color(25,25,25));

		int resumen= 0;
		JLabel balance = new JLabel("Balance: $" + resumen,resizeIcon("dollar-symbol.png", 50, 50),SwingConstants.CENTER);
		balance.setForeground(Color.WHITE);
		balance.setFont(new Font("Arial", Font.BOLD,24));
		panelBalance.add(balance);
		
		JPanel panelTabla= new JPanel();
		panelTabla.setLayout(new FlowLayout(FlowLayout.CENTER));
		panelTabla.setBackground(new Color(25,25,25));
		
		
		String[] columnas = {"Icono","Cripto","Monto"};
		
		Object[][] datos= {
				{1,"Bitcoin",6960.39},
				{2,"Ethereum",324.30},
				{3,"Dogecoin",159.00},
				{4,"USDT",60.39},
				{5,"Caquita",725.18}
		};
		DefaultTableModel plantilla = new DefaultTableModel(datos,columnas);
		JTable tabla = new JTable(plantilla);
		setTamañoTablas(tabla);
		JScrollPane deslizador = new JScrollPane(tabla);
		
		panelTabla.add(deslizador);

		JPanel panelDescarga = new JPanel();
		panelDescarga.setLayout(new FlowLayout(FlowLayout.CENTER));
		panelDescarga.setBackground(new Color(25,25,25));

		JButton descargar = new JButton("Descargar como CSV");
		descargar.setBackground(new Color(25,25,25)); // Establecer color de fondo del botón
        descargar.setForeground(Color.WHITE); // Establecer color del texto del botón
        panelDescarga.add(descargar);
		
		panelCentral.add(panelBalance,BorderLayout.NORTH);
		panelCentral.add(panelTabla,BorderLayout.CENTER);
		panelCentral.add(panelDescarga,BorderLayout.SOUTH);
		
		add(panelCentral, BorderLayout.CENTER);
	}
	
	public void inferior() {
		JPanel panelInferior = new JPanel();
		panelInferior.setLayout(new FlowLayout(FlowLayout.CENTER));
		panelInferior.setBackground(new Color(25,25,25));
//		panelInferior.setBorder(BorderFactory.createEmptyBorder(10, 0, 20, 0));

		JButton misOperaciones = new JButton("Mis Operaciones");
		misOperaciones.setBackground(new Color (25,25,25));
		misOperaciones.setForeground(Color.WHITE);
		misOperaciones.setPreferredSize(new Dimension(150,70));
		
		JButton cotizaciones = new JButton("Cotizaciones");
		cotizaciones.setBackground(new Color (25,25,25));
		cotizaciones.setForeground(Color.WHITE);
		cotizaciones.setPreferredSize(new Dimension(150,70));
		
		panelInferior.add(misOperaciones);
		panelInferior.add(cotizaciones);
		
		add(panelInferior,BorderLayout.SOUTH);
	}
	
	public void setTamañoTablas(JTable tabla) {
		
		tabla.setRowHeight(30);
		
		TableColumnModel columnas = tabla.getColumnModel();
		columnas.getColumn(0).setPreferredWidth(20);
		columnas.getColumn(1).setPreferredWidth(100);
		columnas.getColumn(2).setPreferredWidth(100);
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
