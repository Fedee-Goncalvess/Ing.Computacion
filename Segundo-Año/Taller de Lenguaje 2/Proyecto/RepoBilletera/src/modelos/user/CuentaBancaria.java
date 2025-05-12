package modelos.user;

/**
 * Clase que representa una Cuenta Bancaria.
 * Contiene información sobre la cuenta, como el CVU/CBU y el banco asociado.
 * 
 * @author Santiago
 * @version 1.0
 */
public class CuentaBancaria {
    private String nombre;
    private int CVU;
    private String banco;
    private String alias;

    /**
     * Devuelve el nombre asociado a la cuenta bancaria.
     * 
     * @return El nombre de la cuenta.
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Establece el nombre asociado a la cuenta bancaria.
     * 
     * @param nombre El nombre de la cuenta.
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Devuelve el CVU/CBU de la cuenta bancaria.
     * 
     * @return El CVU/CBU.
     */
    public int getCVU() {
        return CVU;
    }

    /**
     * Establece el CVU/CBU de la cuenta bancaria.
     * 
     * @param CVU El CVU/CBU de la cuenta.
     */
    public void setCVU(int CVU) {
        this.CVU = CVU;
    }

    /**
     * Devuelve el banco asociado a la cuenta bancaria.
     * 
     * @return El banco.
     */
    public String getBanco() {
        return banco;
    }

    /**
     * Establece el banco asociado a la cuenta bancaria.
     * 
     * @param banco El banco.
     */
    public void setBanco(String banco) {
        this.banco = banco;
    }

    /**
     * Devuelve el alias de la cuenta bancaria.
     * 
     * @return El alias de la cuenta.
     */
    public String getAlias() {
        return alias;
    }

    /**
     * Establece el alias de la cuenta bancaria.
     * 
     * @param alias El alias de la cuenta.
     */
    public void setAlias(String alias) {
        this.alias = alias;
    }
}
