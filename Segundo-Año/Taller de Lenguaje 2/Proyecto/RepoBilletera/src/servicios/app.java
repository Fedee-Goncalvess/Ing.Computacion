package servicios;

import java.awt.CardLayout;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;
import javax.swing.JFrame;
import javax.swing.JPanel;
import Comparadores.ComparadorCantidadActivo;
import Comparadores.ComparadorCantidadMoneda;
import Comparadores.ComparadorNomenclaturaActivo;
import Comparadores.ComparadorNomenclaturaMoneda;
import Comparadores.ComparadorValorDolar;
import Conexión.DatabaseConnection;
import clasesDAO.ActivoFIATDAO;
import clasesDAO.ActivoCriptoDAO;
import clasesDAO.MonedaDAO;
import clasesDAO.MovimientoDAO;
import clasesDAOimp.ActivoCriptoDAOjdbc;
import clasesDAOimp.ActivoFIATDAOjdbc;
import clasesDAOimp.MonedaDAOjdbc;
import clasesDAOimp.MovimientoDAOjdbc;
import modelos.activo.*;
import modelos.moneda.*;
import modelos.transacciones.*;
import vista.ViewRegistrarse;


public class app {
	private static Scanner in = new Scanner(System.in); 
	
    
	public static void main(String[] args) throws SQLException {
		crearTablas();
		 JFrame frame = new JFrame("Registro");
		 frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	        frame.setSize(600, 400);
	        frame.setLocationRelativeTo(null); // Centrar la ventana

	        // Crear el JPanel principal con CardLayout
	        CardLayout cardLayout = new CardLayout();
	        JPanel mainPanel = new JPanel(cardLayout);

	        // Crear las "pantallas"
	        ViewRegistrarse viewRegistrarse = new ViewRegistrarse(cardLayout, mainPanel);
	        //ViewInicio viewInicio = new ViewInicio();

	        // Agregar las pantallas al mainPanel
	        mainPanel.add(viewRegistrarse, "registrarse");
	        //mainPanel.add(viewInicio, "inicio");

	        // Mostrar la vista inicial
	        cardLayout.show(mainPanel, "registrarse");

	        // Agregar el panel principal al frame
	        frame.add(mainPanel);

	        // Hacer visible la ventana
	        frame.setVisible(true);
		
		ejecutarPrograma(); // Ejecuta la lógica del programa
	}
	
    
	
	private static void crearMoneda() {
	    listarMoneda();
	    System.out.println("Indique qué tipo de moneda quiere crear\n[1]:FIAT \n[2]:Cripto\n");
	    System.out.println("Presiona cualquier tecla para volver...");
	    System.out.println("(Verifique que su moneda no esté previamente creada)");

	    int x = 0;
	    while (true) {
	        try {
	            x = in.nextInt();
	            if (x == 1 || x == 2)
	                break; // sigue la ejecución
	            else
	                return ; // cualquier otra cosa
	        } catch (InputMismatchException e) {
	            System.out.println("Por favor, ingrese 1, 2 u otro para salir");
	            in.next(); // para limpiar el buffer
	        }
	    }

	    System.out.println("Complete los campos");
	    String nomenclatura = completarNomenclatura();
	    MonedaDAO dao = new MonedaDAOjdbc();
	    Moneda moneda = dao.existeMonedaBD(nomenclatura);

	    if (moneda != null) {
	        System.out.println("La moneda ya se encuentra en la Base de Datos");
	        return;
	    }

	    in.nextLine();
	    String nombre = completarNombre();
	    double valorDolar = completarValorDolar();
	    double stock = completarStock();

	    System.out.println();
	    if (confirmarCampos()) {
	        if (x == 1) {
	            moneda = new MonedaFIAT(nomenclatura, nombre, stock, valorDolar);
	        } else {
	            moneda = new MonedaCripto(nomenclatura, nombre, stock, valorDolar, Math.random() * 100);
	        }
	       dao.crearMoneda(moneda);
	    } else {
	        System.out.println("Operación Cancelada");
	    }
		
	}

	private static boolean listarMoneda(){
		List<Moneda> monedas = new ArrayList<Moneda>();
		MonedaDAO dao = new MonedaDAOjdbc();
		monedas=dao.arrayMonedas();
		if (monedas.isEmpty()) {
			System.out.println("No hay monedas existentes en la base de datos");
			return false;
		}
		System.out.println("Se mostraran las monedas existentes en la base de datos");
		System.out.println("Elija con que criterio quiere que se ordene la muestra: \nNomenclatura [1]\nValor Dólar [2]");
		int opcion = 0;
		while (true) {
			try {
		        opcion = in.nextInt();
		        if (opcion == 1) {
		        	ordenarPorNomenclaturaMoneda(monedas);
		            break; 
		        } else if (opcion == 2) {
		        	ordenarPorValorDolar(monedas);
		            break;
		        } else {
		        	System.out.println("Opción inválida.");
		            return false; 
		        }
		    } catch (InputMismatchException e) {
		    	System.out.println("Por favor, ingrese 1 o 2 para seleccionar el tipo de ordenamiento.");
		    	in.next(); 
		      }
		}
		System.out.println();
		mostrarInformacionMonedas(monedas);
		return true;
	}
	
	private static void mostrarInformacionMonedas(List<Moneda> monedas) {
	    System.out.printf("%-20s %-15s %-20s %-20s %-20s %-15s%n", 
	    		"Nomenclatura", "Tipo", "Nombre", "Cantidad", "Valor en Dólares", "Volatilidad");
	    System.out.println("-------------------------------------------------------------------------------------------------------------------");

	    for (Moneda moneda : monedas) {
	        String tipo = moneda.getTipo();
	        String nombre = moneda.getNombre();
	        String nomenclatura = moneda.getNomenclatura();
	        double cantidad = moneda.getStock();
	        double valorDolar = moneda.getValorDolar();
	        double volatilidad = moneda instanceof MonedaCripto ? ((MonedaCripto) moneda).getVolatilidad() : 0.0;

	        System.out.printf("%-20s %-15s %-20s %-20.8f %-20.8f %-25.2f%n", nomenclatura, tipo, nombre, cantidad, valorDolar, volatilidad);
	    }
	    System.out.println();
	}

	private static void ordenarPorValorDolar(List<Moneda> monedas) {
	    ComparadorValorDolar comparadorValorDolar = new ComparadorValorDolar();
	    Collections.sort(monedas, comparadorValorDolar::compare);
	}
	
	private static void ordenarPorNomenclaturaMoneda(List<Moneda> monedas) {
	    ComparadorNomenclaturaMoneda comparadorNomenclatura = new ComparadorNomenclaturaMoneda();
	    Collections.sort(monedas, comparadorNomenclatura::compare);
	}

	private static void generarStock(){
		MonedaDAO dao = new MonedaDAOjdbc();
		dao.generarStockDAO();
	}
	
	private static void listarStock() {
	    List<Moneda> monedas = new ArrayList<>();
	    MonedaDAO dao = new MonedaDAOjdbc();
	    monedas = dao.arrayMonedas(); // Obtener la lista de monedas
		if (monedas.isEmpty()) {
			System.out.println("No hay monedas existentes en la base de datos");
			return;
		}
	    System.out.println("Se mostraran el stock de Monedas existentes en la base de datos");
	    System.out.println("Elija con que criterio quiere que se ordene la muestra: \nNomenclatura [1]\nCantidad [2]");
	    int opcion = 0;
	    while (true) {
	        try {
	            opcion = in.nextInt();
	            if (opcion == 1) {
	                ordenarPorNomenclaturaMoneda(monedas);
	                break;
	            } else if (opcion == 2) {
	                ordenarPorCantidadMoneda(monedas); // Método que implementarás para ordenar por cantidad
	                break;
	            } else {
	                System.out.println("Opción inválida.");
	                return;
	            }
	        } catch (InputMismatchException e) {
	            System.out.println("Por favor, ingrese 1 o 2 para seleccionar el tipo de ordenamiento.");
	            in.next(); // Limpiar el buffer para evitar bucle infinito
	        }
	    }
	    
	    System.out.println();
	    mostrarInformacionStock(monedas); // Método que implementarás para mostrar el stock
	}

	private static void ordenarPorCantidadMoneda(List<Moneda> monedas) {
		ComparadorCantidadMoneda comparadorCantidad = new ComparadorCantidadMoneda();
	    Collections.sort(monedas, comparadorCantidad::compare);
	}

	private static void mostrarInformacionStock(List<Moneda> monedas) {
	    for (Moneda moneda : monedas) {
	    	System.out.printf("Moneda: %s, Stock: %.8f%n", moneda.getNombre(), moneda.getStock());
	    }
	}
	
	private static void mostrarInformacionActivo(List<Activo> activos) {
	    System.out.printf("%-20s %-15s %-20s%n", "Nomenclatura", "Tipo", "Cantidad");
	    System.out.println("-------------------------------------------------------------");

	    for (Activo activo : activos) {
	        String nomenclatura = activo.getNomenclatura();
	        String tipo = activo.getTipo();
	        double cantidad = activo.getCant();

	        // Imprimir los datos de cada activo con el formato deseado
	        System.out.printf("%-20s %-15s %-20.8f%n", nomenclatura, tipo, cantidad);
	    }
	    System.out.println();
	}
	
	private static Activo generarActivos() {
		MonedaDAOjdbc monedaDAO = new MonedaDAOjdbc();
	    System.out.println("Por Favor chequee que el activo que quiere generar exista como moneda en la base de datos");
		if (!listarMoneda()) return null;
	    System.out.println("Ingrese el activo que quiere generar [NOMENCLATURA]: ");
	    String nomenclatura = in.next().toUpperCase();
	    Moneda mon = monedaDAO.existeMonedaBD(nomenclatura);
	    if (mon==null) {
	    	System.out.println("No se encontro la moneda en la base de datos");
	    	return null;
	    }
	    String tipo_activo = mon.getTipo();
	    
	    
	    System.out.println("Ingrese la cantidad de "+ nomenclatura +" que quiere generar: ");
	    double cant = in.nextDouble();
	    
	    if (tipo_activo.equals("FIAT")) {
	    	ActivoFIATDAO activoDAO = new ActivoFIATDAOjdbc();
	    	ActivoFIAT activo = activoDAO.existeActivoFIAT(nomenclatura);
	    	if (activo==null) {
	    		activo = new ActivoFIAT(nomenclatura, cant);
	    		subirActivoFIATBD(activo);
	    	} else {
	    		activoDAO.updateActivoFIAT(activo, cant+activo.getCant());
	    	}
	    	return activo;
	    	
	    }
	    else {
	    	ActivoCriptoDAO activoDAO = new ActivoCriptoDAOjdbc();
	    	ActivoCripto activo = activoDAO.existeActivoCripto(nomenclatura);
	    	if (activo==null) {
	    		activo = new ActivoCripto(nomenclatura, cant);
	    		subirActivoCriptoBD(activo);
	    	} else {
	    		activoDAO.updateActivoCripto(activo, cant+activo.getCant());
	    	}
	    	return activo;
	    }
	}

	private static void ordenarPorNomenclaturaActivo(List<Activo> activos) {
	    ComparadorNomenclaturaActivo comparadorNomenclatura = new ComparadorNomenclaturaActivo();
	    Collections.sort(activos, comparadorNomenclatura::compare);
	}
	
	private static void subirActivoCriptoBD (ActivoCripto activo) {
		ActivoCriptoDAO activoDAO = new ActivoCriptoDAOjdbc();
		activoDAO.crearActivoCripto(activo);
	}
	
	private static void subirActivoFIATBD (ActivoFIAT activo) {
		ActivoFIATDAO activoDAO = new ActivoFIATDAOjdbc();
		activoDAO.crearActivoFIAT(activo);
	}
	
	private static List<Activo> listaTodosActivos(){
		ActivoCriptoDAO critodao = new ActivoCriptoDAOjdbc();
		ActivoFIATDAO FIATdao = new ActivoFIATDAOjdbc();
		List<ActivoFIAT> fiats = FIATdao.arrayActivosFIAT();
		List<ActivoCripto> criptos = critodao.arrayActivosCripto();
		List<Activo> activos = new ArrayList<>(fiats);
		activos.addAll(criptos);
		return activos;
	}
	
	private static void listarActivos(){
	    List<Activo> activos = listaTodosActivos();
	    if (activos.isEmpty()) {
			System.out.println("No hay activos existentes en la base de datos");
			return;
		}
	    System.out.println("Se mostraran los Activos existentes en la base de datos");
		System.out.println("Elija con que criterio quiere que se ordene la muestra: \nNomenclatura [1]\nCantidad [2]");
	    int opcion = 0;
	    while (true) {
	        try {
	            opcion = in.nextInt();
	            if (opcion == 1) {
	                ordenarPorNomenclaturaActivo(activos);
	                break;
	            } else if (opcion == 2) {
	                ordenarPorCantidadActivo(activos); // Método que implementarás para ordenar por cantidad
	                break;
	            } else {
	                System.out.println("Opción inválida.");
	                return;
	            }
	        } catch (InputMismatchException e) {
	            System.out.println("Por favor, ingrese 1 o 2 para seleccionar el tipo de ordenamiento.");
	            in.next(); // Limpiar el buffer para evitar bucle infinito
	        }
	    }
	    
	    System.out.println();
	    mostrarInformacionActivo(activos); // Método que implementarás para mostrar el stock
	    
	}
	
	private static void ordenarPorCantidadActivo(List<Activo> activos) {
		ComparadorCantidadActivo comparadorCantidad = new ComparadorCantidadActivo();
	    Collections.sort(activos, comparadorCantidad::compare);
	}
	
	private static void comprarCripto(){
		MonedaCripto cripto_a_comprar = pedirMonedaCripto();
		if (cripto_a_comprar == null) return;
		
		ActivoCriptoDAO activoCriptoDAO = new ActivoCriptoDAOjdbc();
		ActivoFIATDAO activoFIATDAO = new ActivoFIATDAOjdbc() ;
		
    	
		ActivoFIAT fiat_a_gastar = pedirActivoFIAT();
		if (fiat_a_gastar==null) return;
		
		System.out.println("Seleccione cuanto "+fiat_a_gastar.getNomenclatura()+" quiere gastar: ");
	    double gasto = in.nextDouble();
	    
	    if (gasto>fiat_a_gastar.getCant()) {
	    	System.out.println("ERROR: No le alcanza.");
	    	return; 
	    }
	    	
	    
		MonedaDAO monedaDAO = new MonedaDAOjdbc();
		double valorUDS_fiat = monedaDAO.existeMonedaFIATBD(fiat_a_gastar.getNomenclatura()).getValorDolar();
	    double cantidad_cripto_comprar = cantidadComprar(gasto, valorUDS_fiat, cripto_a_comprar.getValorDolar());
		
	    double nueva_cant = fiat_a_gastar.getCant()-gasto;	
		if ( cantidad_cripto_comprar > cripto_a_comprar.getStock() ) {
	    	System.out.println("ERROR: No hay Stock suficientes de Criptos para realizar la compra.");
	    	return;
	    }
		    
	    if (confirmarCompraCripto(cripto_a_comprar.getNomenclatura(), cantidad_cripto_comprar, fiat_a_gastar.getNomenclatura(), gasto,nueva_cant )) {
	    	ActivoCripto activoCripto = activoCriptoDAO.existeActivoCripto(cripto_a_comprar.getNomenclatura()); 
	    	if (activoCripto==null) {
	    		System.out.println("Creando activo Cripto..");
	    		activoCripto = new ActivoCripto();
	    		activoCripto.setNomenclatura(cripto_a_comprar.getNomenclatura());
	    		activoCripto.setCant(0);
	    		subirActivoCriptoBD(activoCripto);
	    	}
	    	
	    	System.out.println("Actualizando activos..");
	    	activoFIATDAO.updateActivoFIAT(fiat_a_gastar, nueva_cant);
	    	activoCriptoDAO.updateActivoCripto(activoCripto, cantidad_cripto_comprar+activoCripto.getCant());
	    	System.out.println("Actualizando moneda..");
	    	monedaDAO.updateStock(cripto_a_comprar,cripto_a_comprar.getStock()-cantidad_cripto_comprar);
	    	
	    	System.out.println("Cargando movimientos..");
		    Movimiento compra = new MovimientoCompra(cantidad_cripto_comprar,resumenCompra(cripto_a_comprar.getNomenclatura(),fiat_a_gastar.getNomenclatura()), LocalDateTime.now());
		    Movimiento venta = new MovimientoVenta(gasto,resumenVenta(fiat_a_gastar.getNomenclatura(),cripto_a_comprar.getNomenclatura()) , LocalDateTime.now());
		    MovimientoDAO movimientoDAO = new MovimientoDAOjdbc();
		    movimientoDAO.AgregarMovimiento(compra);
		    movimientoDAO.AgregarMovimiento(venta);
	    }
	}
	
	private static String resumenCompra(String compre, String vendi) {
		return ("compra de "+compre+" usando "+vendi);
	}
	
	private static String resumenVenta(String vendi, String compre) {
		return ("venta de  "+vendi+" para comprar "+compre);
	}
	
	private static boolean confirmarCompraCripto(String nombreCripto, double cantidadCripto, String activoFiat, double cantidadGastada, double cantidadRestante) {
	    
		System.out.println("╔════════════════════════════════════════════════╗");
		System.out.println("║              Confirmación de Compra            ║");
		System.out.println("╠════════════════════════════════════════════════╣");
		System.out.printf("║ Moneda a comprar: %-28s ║%n", nombreCripto);
		System.out.printf("║ Cantidad a comprar: %-26.8f ║%n", cantidadCripto);
		System.out.printf("║ Activo FIAT utilizado: %-23s ║%n", activoFiat);
		System.out.printf("║ Cantidad gastada: %-28.2f ║%n", cantidadGastada);
		System.out.printf("║ Saldo restante en %-5s: %-21.2f ║%n", activoFiat, cantidadRestante);
		System.out.println("╚════════════════════════════════════════════════╝");


	    return confirmarCampos();
	}

	private static double cantidadComprar(double cantidad_gastar, double valorUSD_gastar, double valorUSD_comprar) {
		double cantidadUSD_gastar = cantidad_gastar*valorUSD_gastar;
		double conversion = cantidadUSD_gastar/valorUSD_comprar;
		return conversion;
	}

	private static ActivoFIAT pedirActivoFIAT () {
	    ActivoFIATDAO activoFIATdao = new ActivoFIATDAOjdbc();
	    List<ActivoFIAT> activosFIAT = activoFIATdao.arrayActivosFIAT();
	   
	    if (activosFIAT.isEmpty() || activosFIAT==null) {
	    	System.out.println("ERROR: Usted no cuenta con activos FIAT en su cuenta");
	    	return null;
	    }
	    
	    System.out.println("Activos FIAT disponibles: ");
	    for (Activo act : activosFIAT) 
	    		 System.out.println("Nomenclatura: "+ act.getNomenclatura()+", Cantidad disponible: "+ act.getCant());
	   
	    
	    System.out.println("Seleccione con que Activo FIAT quiere realizar la operacion [Nomenclatura]: ");
	    String nomenclatura = in.next().toUpperCase();
	    
	    ActivoFIAT fiat = activoFIATdao.existeActivoFIAT(nomenclatura);
	    if (fiat==null) {
	    	System.out.println("No se encontró el activo en la base de datos");
	    	return null;
	    }
	    else
	    	return fiat;
	}
	
	private static MonedaCripto pedirMonedaCripto () {		
		MonedaDAO monedaDAO = new MonedaDAOjdbc(); 
		List<MonedaCripto> monedasCripto = monedaDAO.arrayMonedasCripto();
		if (monedasCripto.isEmpty()) {
			System.out.println("---[ERROR]--- No hay monedas criptos en la base de datos.");
			return null;
		}
		System.out.println("Monedas cripto disponibles: ");
		for (MonedaCripto aux : monedasCripto) 
			System.out.println("Nomenclatura: "+ aux.getNomenclatura()+", Cantidad disponible: "+ aux.getStock());
		
	
		System.out.println("\nSeleccione la cripto que quiere comprar [Nomenclatura]: ");
		String nomenclatura = in.next().toUpperCase();		
		MonedaCripto cripto = monedaDAO.existeMonedaCriptoBD(nomenclatura);
		if (cripto==null) {
			
			System.out.println("---[ERROR]--- La moneda no exite en la Base de datos.");
			return null;
		}
		return cripto;
	}
	
	private static boolean confirmarSwap(String esperada, double cantidadRecibir, String convertir, double cantidadGastada, double cantidadRestante) {
	    
	    System.out.println("╔════════════════════════════════════════════════╗");
	    System.out.println("║              Confirmación de SWAP              ║");
	    System.out.println("╠════════════════════════════════════════════════╣");
	    System.out.printf("║ Cripto a recibir: %-28s ║%n", esperada);
	    System.out.printf("║ Cantidad a recibir: %-26.8f ║%n", cantidadRecibir);
	    System.out.printf("║ Cripto a intercambiar: %-23s ║%n", convertir);
	    System.out.printf("║ Cantidad cambiada: %-27.2f ║%n", cantidadGastada);
	    System.out.printf("║ Saldo restante en %s: %-23.2f ║%n", convertir, cantidadRestante);
	    System.out.println("╚════════════════════════════════════════════════╝");

	    return confirmarCampos();
	}

	private static void swap(){
				
		ActivoCripto aconvertir = pedirActivoCripto("Seleccione que Activo Cripto quiere convertir [Nomenclatura]: ");
		if (aconvertir==null) return;
		ActivoCripto esperada = pedirActivoCripto("Seleccione que Activo Cripto espera recibir [Nomenclatura]: ");
		if (esperada==null) return;
		
		System.out.println("Seleccione cuanto "+aconvertir.getNomenclatura()+" quiere convertir: ");
	    double gasto = in.nextDouble();
		
	    if (gasto>aconvertir.getCant()) {
	    	System.out.println("ERROR: No tiene las criptos suficientes.");
	    	return; 
	    }
	
	    double nueva_cant = aconvertir.getCant()-gasto;	
	    
	    
	    MonedaDAO monedaDAO = new MonedaDAOjdbc();
	    double aconvertir_enUSD = monedaDAO.existeMonedaCriptoBD(aconvertir.getNomenclatura()).getValorDolar();
	    double esperada_enUSD = monedaDAO.existeMonedaCriptoBD(esperada.getNomenclatura()).getValorDolar();
		double cant_recibir = cantidadComprar(gasto,aconvertir_enUSD, esperada_enUSD);
		
		if (confirmarSwap(esperada.getNomenclatura(), cant_recibir, aconvertir.getNomenclatura(), gasto, nueva_cant)) {
			System.out.println("Actualizando activos..");
			ActivoCriptoDAO criptoDAO = new ActivoCriptoDAOjdbc();
			criptoDAO.updateActivoCripto(aconvertir, aconvertir.getCant()-gasto);
			criptoDAO.updateActivoCripto(esperada, esperada.getCant() + cant_recibir);
			System.out.println("Cargando movimientos..");
		    Movimiento in = new MovimientoSwap(cant_recibir, resumenSwap(esperada.getNomenclatura(),aconvertir.getNomenclatura()), LocalDateTime.now());
		    Movimiento out = new MovimientoSwap(gasto*(-1),resumenSwap(aconvertir.getNomenclatura(),esperada.getNomenclatura()) , LocalDateTime.now());
		    MovimientoDAO movimientoDAO = new MovimientoDAOjdbc();
		    movimientoDAO.AgregarMovimiento(in);
		    movimientoDAO.AgregarMovimiento(out);
			
		}
	}
	
	private static String resumenSwap(String in, String out) {
		return ("Intercambio de " +in+" por "+out);
	}
	
	private static ActivoCripto pedirActivoCripto (String motivo) {
	    ActivoCriptoDAO activoCriptodao = new ActivoCriptoDAOjdbc();
	    List<ActivoCripto> activosCripto = activoCriptodao.arrayActivosCripto();
	   
	    if (activosCripto.isEmpty() || activosCripto==null) {
	    	System.out.println("ERROR: Usted no cuenta con activos Cripto en su cuenta");
	    	return null;
	    }
	    
	    System.out.println("Activos Cripto disponibles: ");
	    for (Activo act : activosCripto) 
	    		 System.out.println("Nomenclatura: "+ act.getNomenclatura()+", Cantidad disponible: "+ act.getCant());
	   
	    
	    System.out.println(motivo);
	    String nomenclatura = in.next().toUpperCase();
	    
	    ActivoCripto Cripto = activoCriptodao.existeActivoCripto(nomenclatura);
	    if (Cripto==null) {
	    	System.out.println("No se encontró el activo Cripto en la base de datos");
	    	return null;
	    }
	    else
	    	return Cripto;
	}

	private static String completarNombre() {
		System.out.println("Nombre: ");
		String nombre = in.nextLine();
		return nombre;
	}
	
	private static String completarNomenclatura() {
		System.out.println("Nomenclatura: ");
		String nomenclatura = in.next();
		while (nomenclatura.length()>5) {
			System.out.println("[ERROR]: La nomenclatura debe ser de maximo 5 caracteres");
			nomenclatura = in.next();
		}
		return nomenclatura.toUpperCase();
	}
	
	private static double completarValorDolar() {
		System.out.println("valor en Dolar: ");
		return in.nextDouble();
	}
	
	private static double completarStock() {
		System.out.println("Stock: ");
		return in.nextDouble();
	}
	
	private static boolean confirmarCampos() {
		System.out.println("Confirmar campos [Y/N]");
		String entrada = in.next();
		while (true){
			switch (entrada.toUpperCase()) {
			case "Y":
				return true;
			case "N":
				return false;
			default:
				System.out.println("Entrada incorrecta");
				System.out.println("Confirmar campos [Y/N]");
				entrada = in.next();
				break;
			}
		}
	}
	
	private static void imprimirTerminal() {
		System.out.println("--Ingrese función a ejecutar--\n");
		System.out.println("[1].Crear Moneda");
		System.out.println("[2].Listar Monedas");
		System.out.println("[3].Generar Stock");
		System.out.println("[4].Listar Stock");
		System.out.println("[5].Generar Mis Activos");
		System.out.println("[6].Listar Mis Activos");
		System.out.println("[7].Comprar Criptomoneda");
		System.out.println("[8].Swap Criptomoneda");
		System.out.println("[0].Terminar programa");
	}
	
	private static void ejecutarPrograma() throws SQLException {
		imprimirTerminal(); 
        int comando = in.nextInt();
        System.out.println();
        
        while (comando!= 0) {
        	switch(comando) {
        	case 1:
        		crearMoneda();
        		break;
        	case 2:
        		listarMoneda();
        		break;
        	case 3:
        		generarStock();
        		break;
        	case 4:
        		listarStock();
        		break;
        	case 5:
        		generarActivos();
        		
        		break;
        	case 6:
        		listarActivos();
        		break;
        	case 7:
        		comprarCripto();
        		break;
        	case 8:
        		swap();
        		break;
        	}
        	imprimirTerminal();
        	comando = in.nextInt();
        	System.out.println();
        }
        System.out.println("Programa Terminado");
	}

	private static void crearTablas() {
	    try (Connection conn = DatabaseConnection.getInstance().conectar();
	         Statement stmt = conn.createStatement()) {

	        // Tabla PERSONA
	        String personaTable = """
	            CREATE TABLE IF NOT EXISTS PERSONA (
	                ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	                NOMBRE VARCHAR(50) NOT NULL,
	                APELLIDO VARCHAR(50) NOT NULL
	            );
	        """;

	        // Tabla USUARIO
	        String usuarioTable = """
	            CREATE TABLE IF NOT EXISTS USUARIO (
	                ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	                ID_PERSONA INTEGER NOT NULL,
	                EMAIL VARCHAR(50) NOT NULL,
	                PASSWORD VARCHAR(50) NOT NULL,
	                ACEPTA_TERMINOS BOOLEAN NOT NULL,
	                FOREIGN KEY(ID_PERSONA) REFERENCES PERSONA(ID)
	            );
	        """;

	        // Tabla MONEDA
	        String monedaTable = """
	            CREATE TABLE IF NOT EXISTS MONEDA (
	                ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	                TIPO TEXT NOT NULL CHECK(TIPO IN ('FIAT', 'Cripto')),
	                NOMBRE TEXT NOT NULL CHECK(length(NOMBRE) <= 50),
	                NOMENCLATURA TEXT NOT NULL CHECK(length(NOMENCLATURA) <= 5),
	                VALOR_DOLAR REAL NOT NULL DEFAULT 1,
	                VOLATILIDAD REAL DEFAULT 0,
	                STOCK REAL DEFAULT 0,
	                NOMBRE_ICONO TEXT NOT NULL
	            );
	        """;

	        // Tabla ACTIVO_CRIPTO
	        String activoCriptoTable = """
	            CREATE TABLE IF NOT EXISTS ACTIVO_CRIPTO (
	                ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	                ID_USUARIO INTEGER NOT NULL,
	                ID_MONEDA INTEGER NOT NULL,
	                CANTIDAD REAL NOT NULL DEFAULT 0,
	                FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID),
	                FOREIGN KEY(ID_MONEDA) REFERENCES MONEDA(ID)
	            );
	        """;

	        // Tabla ACTIVO_FIAT
	        String activoFiatTable = """
	            CREATE TABLE IF NOT EXISTS ACTIVO_FIAT (
	                ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	                ID_USUARIO INTEGER NOT NULL,
	                ID_MONEDA INTEGER NOT NULL,
	                CANTIDAD REAL NOT NULL DEFAULT 0,
	                FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID),
	                FOREIGN KEY(ID_MONEDA) REFERENCES MONEDA(ID)
	            );
	        """;

	        // Tabla TRANSACCION
	        String transaccionTable = """
	            CREATE TABLE IF NOT EXISTS TRANSACCION (
	                ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	                RESUMEN TEXT NOT NULL,
	                FECHA_HORA DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	                ID_USUARIO INTEGER NOT NULL,
	                FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID)
	            );
	        """;

	        // Ejecutar las sentencias SQL para crear las tablas
	        stmt.execute(personaTable);
	        stmt.execute(usuarioTable);
	        stmt.execute(monedaTable);
	        stmt.execute(activoCriptoTable);
	        stmt.execute(activoFiatTable);
	        stmt.execute(transaccionTable);

	        System.out.println("Tablas creadas exitosamente o ya existen.");

	    } catch (SQLException e) {
	        System.out.println("Error al crear las tablas: " + e.getMessage());
	    }
	}

}