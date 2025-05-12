package modelos.user;

import java.time.LocalDateTime;

/**
 * Clase que representa un Usuario dado de baja.
 * Hereda de la clase Usuario y añade un comentario y una fecha de baja.
 * 
 * @author Santiago
 * @version 1.0
 */
public class UsuarioDeBaja extends Usuario {
    private String comentario;
    private LocalDateTime fechaDeBaja;

    /**
     * Devuelve el comentario asociado a la baja del usuario.
     * 
     * @return El comentario de la baja.
     */
    public String getComentario() {
        return comentario;
    }

    /**
     * Establece el comentario asociado a la baja del usuario.
     * 
     * @param comentario El comentario de la baja.
     */
    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    /**
     * Devuelve la fecha en la que el usuario fue dado de baja.
     * 
     * @return La fecha de baja.
     */
    public LocalDateTime getFechaDeBaja() {
        return fechaDeBaja;
    }

    /**
     * Establece la fecha en la que el usuario fue dado de baja.
     * 
     * @param fechaDeBaja La fecha de baja.
     */
    public void setFechaDeBaja(LocalDateTime fechaDeBaja) {
        this.fechaDeBaja = fechaDeBaja;
    }
}
