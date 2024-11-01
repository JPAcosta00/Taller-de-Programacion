/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio2;

/**
 *
 * @author USUARIO
 */
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private int horaApertura;
    private int horaCierre;
    private Auto  [][] vector;
    private int pisos;
    private int plazas;
    
    public Estacionamiento (String unNombre, String unaDireccion){
        this.setDireccion(unaDireccion);
        this.setNombre(unNombre);
        this.setHoraApertura(8);
        this.setHoraCierre(21);
        this.setPisos(5);
        this.setPlazas(10);
        this.vector = new Auto [5][10];
        this.inicializaEstacionamiento(this.vector);
    }
    
    public Estacionamiento (String unNombre, String unaDireccion, int apertura, int cierre, int numPisos, int numPlazas){
        this.setDireccion(unaDireccion);
        this.setNombre(unNombre);
        this.setHoraApertura(8);
        this.setHoraCierre(21);
        this.setPisos(numPisos);
        this.setPlazas(numPisos);
        this.vector = new Auto [numPisos][numPlazas];
        this.inicializaEstacionamiento(this.vector);
    }
    
    @Override
    public String toString(){
       String aux = " ";
       int cantPisos = this.getPisos();
       int cantPlazas = this.getPlazas();
       for(int i=0;i<cantPisos;i++){
          for(int j=0;j<cantPlazas;j++){
                aux = aux + "Piso " + (i+1) + "    " + "Plaza " + (j+1);
                if(this.vector[i][j] == null)
                    aux = aux + "  libre" + "\n" + 
                           "----------------------------------------------------------------" + "\n";
                else 
                    aux = aux + "  " +this.vector[i][j].toString() + "\n" +
                           "----------------------------------------------------------------" + "\n" ;
          }  
       }
       return aux;
    }
    
    public void agregaAuto(Auto unAuto, int unPiso, int unaPlaza){
        if(this.vector[unPiso-1][unaPlaza-1] == null)
            this.vector[unPiso-1][unaPlaza-1]=unAuto;
        else System.out.println("Ese espacio esta ocupado");
    }  

    public int getPisos() {
        return pisos;
    }

    public void setPisos(int pisos) {
        this.pisos = pisos;
    }

    public int getPlazas() {
        return plazas;
    }

    public void setPlazas(int plazas) {
        this.plazas = plazas;
    }
    
    public void inicializaEstacionamiento(Auto [][] vec){
        int pisos2 = this.getPisos();
        int plazas2 = this.getPlazas();
        
        for(int i=0;i<pisos2;i++){
            for(int j=0;j<plazas2;j++)
                this.vector[i][j]=null;
        }
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(int horaApertura) {
        this.horaApertura = horaApertura;
    }

    public int getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(int horaCierre) {
        this.horaCierre = horaCierre;
    }
    
    public String devuelveLugar (String unaPatente){
       String aux = "Auto Inexistente";
       int numPisos = this.getPisos();
       int numPlazas = this.getPlazas();
       boolean control = false;
       int i = 0;
       while((i < numPisos)&&(control == false)){
           int j = 0;
           while((j < numPlazas)&&(control == false)){
                String pate =this.vector[i][j].getPatente();
                if(pate.equals(unaPatente)){
                    aux = "El auto de patente " + unaPatente + " esta en el piso " + (i+1) + ", en la plaza " + (j+1);
                    control = true;
                } else j++;
           }
           i++;
       }
       return aux;
    }
    
    public int devuelveCantidad(int unaPlaza){
       int nPisos = this.getPisos();
       int cantidad = 0;
       for(int i=0;i<nPisos;i++){
           if(this.vector[i][unaPlaza-1] != null)
               cantidad = cantidad + 1;
       }
       return cantidad;
    }
    
}
