package Clase3;

class Triangulo{
    private double lado1;
    private double lado2;
    private double lado3;
    private String relleno;
    private String linea;

    public Triangulo(double lado1,double lado2,double lado3,String relleno,String linea){
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.relleno = relleno;
        this.linea = linea;
    }

    public Triangulo(){
    }

    public void setLado1(double unlado1){
        this.lado1 = unlado1;
    }

    public double getLado1(){
        return lado1;
    }

    public void setLado2(double unlado2){
        this.lado2 = unlado2;
    }

    public double getLado2(){
        return lado2;
    }

    public void setLado3(double unlado3){
        this.lado3 = unlado3;
    }

    public double getLado3(){
        return lado3;
    }

    public void setRelleno(String unrelleno){
        this.relleno = unrelleno;
    }

    public String getRelleno(){
        return relleno;
    }

    public void setLinea(String unlinea){
        this.linea = unlinea;
    }

    public String getLinea(){
        return linea;
    }

    double calcularArea (){
        double s = (lado1+lado2+lado3)/2;
        double aux= Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
        return aux;
    }

    double calcularPerimetro (){
        double aux = lado1 + lado2 +lado3;
        return aux;
    }

    String imrpimirValores (){
        String aux = ("Los lados valen: "+lado1+" "+lado2+" "+lado3+"   "+"Y sus colores relleno y linea: "+relleno+" "+linea); 
        return aux;
    }
}
