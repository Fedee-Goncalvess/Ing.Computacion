package modelos.user;

import java.time.LocalDateTime;

/**
 * Clase que representa un Usuario.
 * Hereda de la clase Persona y añade atributos específicos del usuario.
 * 
 * @author Santiago
 * @version 1.0
 */
public class Usuario extends Persona {
    private String userName;
    private String contrasena;
    private LocalDateTime creacion;

    /**
     * Devuelve el nombre de usuario.
     * 
     * @return El nombre de usuario.
     */
    public String getUserName() {
        return userName;
    }

    /**
     * Establece el nombre de usuario.
     * 
     * @param userName El nombre de usuario.
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * Devuelve la contraseña del usuario.
     * 
     * @return La contraseña del usuario.
     */
    public String getContrasena() {
        return contrasena;
    }

    /**
     * Establece la contraseña del usuario.
     * 
     * @param contrasena La contraseña del usuario.
     */
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    /**
     * Devuelve la fecha de creación de la cuenta de usuario.
     * 
     * @return La fecha de creación.
     */
    public LocalDateTime getCreacion() {
        return creacion;
    }

    /**
     * Establece la fecha de creación de la cuenta de usuario.
     * 
     * @param creacion La fecha de creación.
     */
    public void setCreacion(LocalDateTime creacion) {
        this.creacion = creacion;
    }
}

