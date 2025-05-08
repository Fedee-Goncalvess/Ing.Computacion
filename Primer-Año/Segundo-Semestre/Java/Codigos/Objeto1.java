//OBJETO QUE REFIERE A LA CLASE ABSTRACTA
class Objeto1 extends nombreClaseAbstracta{
    //DECLARACIÓN DE VARIABLES
    private String variableTipoString;
    private int variableTipoInteger;
    private char variableTipoCharacter;
    private boolean variableTipoBoolean;
    
    //CONSTRUCTORES
    Objeto1(){}
    
    Objeto1(String variableTipoString2, int variableTipoInteger2, char variableTipoCharacter2, boolean variableTipoBoolean2){
        //ASIGNACIÓN DE VARIABLES DENTRO DE LA CLASE ABSTRACTA
        super.setVariableTipoString(variableTipoString2);
        super.setVariableTipoInteger(variableTipoInteger2);
        super.setVariableTipoCharacter(variableTipoCharacter2);
        super.setVariableTipoBoolean(variableTipoBoolean2);
        
        //ASIGNACIÓN DE VARIABLES DENTRO DEL PRIMER OBJETO
        this.setVariableTipoString(variableTipoString2);
        this.setVariableTipoInteger(variableTipoInteger2);
        this.setVariableTipoCharacter(variableTipoCharacter2);
        this.setVariableTipoBoolean(variableTipoBoolean2);
    }
    
    ////TODOS LOS MÉTODOS GET
    public String getVariableTipoString(){
        return variableTipoString;
    }
    
    public int getVariableTipoInteger(){
        return variableTipoInteger;
    }
    
    public char getVariableTipoCharacter(){
        return variableTipoCharacter;
    }
    
    public boolean getVariableTipoBoolean(){
        return variableTipoBoolean;
    }
    
    //TODOS LOS MÉTODOS SET
    public void setVariableTipoString(String variableTipoString2){
        variableTipoString = variableTipoString2;
    }
    
    public void setVariableTipoInteger(int variableTipoInteger2){
        variableTipoInteger = variableTipoInteger2;
    }
    
    public void setVariableTipoCharacter(char variableTipoCharacter2){
        variableTipoCharacter = variableTipoCharacter2;
    }
    
    public void setVariableTipoBoolean(boolean variableTipoBoolean2){
        variableTipoBoolean = variableTipoBoolean2;
    }

    //MÉTODOS DE UN MÉTODO ABSTRACTO
    public void nombreMetodoAbstracto(){
        if (super.getVariableTipoInteger()==0)
            //USO DE GENERADORES
            setVariableTipoInteger(Generador.nombreMetodoDelGenerador());
    }
    
    public String toString(String Titulo){
        String aux;
        aux = "El número es " + super.variableTipoInteger +" y el nombre es "+this.getVariableTipoString()+".";
        return aux;
    }
}