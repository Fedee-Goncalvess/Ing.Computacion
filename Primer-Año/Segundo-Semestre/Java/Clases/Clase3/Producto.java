package Clase3;

public class Producto{

    private int cod;
    private String nombre;
    private String descripcion;
    private String marca;
    private int unidades;

    public Producto(int cod,String nombre,String descripcion,String marca,int unidades){
        this.cod = cod;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.marca = marca;
        this.unidades = unidades;
    }

    public Producto(){
    }

    public void setCod(int unCod){
        this.cod = unCod;
    }

    public int getCod(){
        return cod;
    }

    public void setNombre(String unNombre){
        this.nombre = unNombre;
    }

    public String getNombre(){
        return nombre;
    }

    public void setDescripcion(String unDescripcion){
        this.descripcion = unDescripcion;
    }

    public String getDescripcion(){
        return descripcion;
    }

    public void setMarca(String unMarca){
        this.marca = unMarca;
    }

    public String getMarca(){
        return marca;
    }

    public void setUnidades(int unUnidades){
        this.unidades = unUnidades;
    }

    public int getUnidades(){
        return unidades;
    }
    
    public String infoProducto(){
        String aux = ("Codigo de producto: "+cod+" Nombre: "+nombre+" Descripción: "+descripcion+" Marca: "+marca+ " Unidades disponibles: "+unidades);
        return aux;
    }
}
