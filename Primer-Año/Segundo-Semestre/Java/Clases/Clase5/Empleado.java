package Clase5;

public abstract class Empleado{

    private String nombre;
    private int dni;
    private double sueldo;

    public Empleado(String Nombre,int DNI,double Sueldo){
        this.nombre = nombre;
        this.dni = dni;
        this.sueldo = sueldo;
    }

    public Empleado(){
    }

    public void setNombre(String Nombre){
        this.nombre = Nombre;
    }

    public String getNombre(){
        return nombre;
    }

    public void setDni(int DNI){
        this.dni = DNI;
    }

    public int getDni(){
        return dni;
    }

    public void setSueldo(double Sueldo){
        this.sueldo = Sueldo;
    }

    public double getSueldo(){
        return sueldo;
    }
    
    public abstract double calcularSueldoACobrar();
    
    
    }
