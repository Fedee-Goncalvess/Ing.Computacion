//CLASE ABSTRACTA
abstract class nombreClaseAbstracta{
    //DECLARACIÓN DE VARIABLES
    protected String variableTipoString;
    protected int variableTipoInteger;
    protected char variableTipoCharacter;
    protected boolean variableTipoBoolean;
    
    //CONSTRUCTORES
    nombreClaseAbstracta(){}
    
    nombreClaseAbstracta(String variableTipoString2, int variableTipoInteger2, char variableTipoCharacter2, boolean variableTipoBoolean2){
        //ASIGNACIÓN DE VARIABLES DENTRO DE LA CLASE ABSTRACTA
        this.setVariableTipoString(variableTipoString2);
        this.setVariableTipoInteger(variableTipoInteger2);
        this.setVariableTipoCharacter(variableTipoCharacter2);
        this.setVariableTipoBoolean(variableTipoBoolean2);
    }
    
    //TODOS LOS MÉTODOS GET
    protected String getVariableTipoString(){
        return variableTipoString;
    }
    
    protected int getVariableTipoInteger(){
        return variableTipoInteger;
    }
    
    protected char getVariableTipoCharacter(){
        return variableTipoCharacter;
    }
    
    protected boolean getVariableTipoBoolean(){
        return variableTipoBoolean;
    }
    
    //TODOS LOS MÉTODOS SET
    protected void setVariableTipoString(String variableTipoString2){
        variableTipoString = variableTipoString2;
    }
    
    protected void setVariableTipoInteger(int variableTipoInteger2){
        variableTipoInteger = variableTipoInteger2;
    }
    
    protected void setVariableTipoCharacter(char variableTipoCharacter2){
        variableTipoCharacter = variableTipoCharacter2;
    }
    
    protected void setVariableTipoBoolean(boolean variableTipoBoolean2){
        variableTipoBoolean = variableTipoBoolean2;
    }
    
    //MÉTODOS ABSTRACTOS
    public abstract void nombreMetodoAbstracto();
}