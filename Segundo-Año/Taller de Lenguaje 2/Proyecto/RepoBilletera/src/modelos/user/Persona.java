package modelos.user;

import java.time.LocalDateTime;
import java.util.List;

/**
 * Clase que representa a una Persona.
 * Contiene información básica de una persona, como nombre, apellido y país.
 * 
 * @author Santiago
 * @version 1.0
 */
public class Persona {
    private String nombre;
    private String apellido;
    private LocalDateTime fechaNacimiento;
    private String pais;
    private int numero;
    private String email;
    private List<CuentaBancaria> cuentasBancarias;

    /**
     * Devuelve el nombre de la persona.
     * 
     * @return El nombre de la persona.
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Establece el nombre de la persona.
     * 
     * @param nombre El nombre de la persona.
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Devuelve el apellido de la persona.
     * 
     * @return El apellido de la persona.
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * Establece el apellido de la persona.
     * 
     * @param apellido El apellido de la persona.
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /**
     * Devuelve la fecha de nacimiento de la persona.
     * 
     * @return La fecha de nacimiento.
     */
    public LocalDateTime getFechaNacimiento() {
        return fechaNacimiento;
    }

    /**
     * Establece la fecha de nacimiento de la persona.
     * 
     * @param fechaNacimiento La fecha de nacimiento.
     */
    public void setFechaNacimiento(LocalDateTime fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    /**
     * Devuelve el país de la persona.
     * 
     * @return El país.
     */
    public String getPais() {
        return pais;
    }

    /**
     * Establece el país de la persona.
     * 
     * @param pais El país.
     */
    public void setPais(String pais) {
        this.pais = pais;
    }

    /**
     * Devuelve el número de la persona.
     * 
     * @return El número.
     */
    public int getNumero() {
        return numero;
    }

    /**
     * Establece el número de la persona.
     * 
     * @param numero El número.
     */
    public void setNumero(int numero) {
        this.numero = numero;
    }

    /**
     * Devuelve el email de la persona.
     * 
     * @return El email.
     */
    public String getEmail() {
        return email;
    }

    /**
     * Establece el email de la persona.
     * 
     * @param email El email.
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Devuelve la lista de cuentas bancarias de la persona.
     * 
     * @return La lista de cuentas bancarias.
     */
    public List<CuentaBancaria> getCuentasBancarias() {
        return cuentasBancarias;
    }

    /**
     * Establece la lista de cuentas bancarias de la persona.
     * 
     * @param cuentasBancarias La lista de cuentas bancarias.
     */
    public void setCuentasBancarias(List<CuentaBancaria> cuentasBancarias) {
        this.cuentasBancarias = cuentasBancarias;
    }
}

