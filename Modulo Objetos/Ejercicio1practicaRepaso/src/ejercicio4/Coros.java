/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio4;

/**
 *
 * @author USUARIO
 */
public class Coros {
    private String nombre;
    private Director director;
    private Coristas [] coroSemicircular;
    private Coristas [][] coroPorHileras;
    private int cantidad;
    
    public Coros (String unNombre,Director unDirector, int cantCoristas){
        this.setCantidad(cantCoristas);
        this.coroPorHileras = new Coristas[cantCoristas][cantCoristas];
        this.inicializaHileras(this.getCoroPorHileras());
        this.coroSemicircular = new Coristas[cantCoristas];
        this.inicializaSemicircular(this.getCoroSemicircular());
        this.setDirector(unDirector);
        this.setNombre(unNombre);
    }
  
    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Director getDirector() {
        return this.director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }

    public Coristas[] getCoroSemicircular() {
        return coroSemicircular;
    }

    public Coristas[][] getCoroPorHileras() {
        return this.coroPorHileras;
    }

    public int getCantidad() {
        return this.cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    public void inicializaHileras(Coristas [][] unaMatriz){
        int canti = this.getCantidad();
        for(int i=0;i<canti;i++){
            for(int j=0;j<canti;j++)
                unaMatriz[i][j] = null;
        }
    }
    
    public void inicializaSemicircular(Coristas [] unVector){
        int canti = this.getCantidad();
        for(int i=0;i<canti;i++)
            unVector[i] = null;
    }

    public void agregaCoristaSemi (Coristas unCorista){
        int cant = this.getCantidad();
        Coristas [] vector = this.getCoroSemicircular();
        int i = 0;
        boolean control = false;
        while((i <cant)&&(control == false)){
           if(vector[i] == null){
              vector[i] = unCorista;
              control = true;
           } else i++;
        }
    }
    
    public boolean estaLlenoSemi(){
       int cantidad = this.getCantidad();
       Coristas [] vec = this.getCoroSemicircular();
       int cuenta = 0;
       for(int i=0;i<cantidad;i++){
          if(vec[i] != null)
              cuenta++;
       }
       if(cuenta == cantidad)
           return true;
       else 
           return false;
    }
    
    public boolean estaLlenoHileras(){
       int cantida = this.getCantidad();
       int compara = cantidad * cantidad;
       Coristas [][] mat = this.getCoroPorHileras();
       int cuenta = 0;
       int i = 0;
       while(i<cantida){
         int j=0;
         while(j<cantida){
             if(mat[i][j] != null)
                 cuenta++;
             j++;
         }
         i++;
       }
       if(cuenta == compara)
           return true;
       else 
           return false;
    }
    
    public void agregaCoristaHilera(Coristas unCorista){
       int can = this.getCantidad();
       Coristas [][] matriz = this.getCoroPorHileras();
       int i=0;
       int j;
       boolean control = false;
       while((i < can)&&(control == false)){
          j=0;
          while((j < can)&&(control == false)){
              if(matriz[i][j] == null){
                  matriz[i][j]= unCorista;
                  control = true;   
              } else j++;
          }
          i++;
       }
    }
}
