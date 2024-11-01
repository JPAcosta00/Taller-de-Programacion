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
public class Auto {
    private String nombre; 
    private String patente;
    
    public Auto (String unNombre, String unaPatente){
       this.setNombre(unNombre);
       this.setPatente(unaPatente);
    }
    
    public String toString (){
      String aux = "Dueño: " + this.getNombre() + " ,Patente: " + this.getPatente();
      return aux;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }
}
