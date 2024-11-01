/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pruebajava;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author USUARIO
 */
public class Persona {
    private String nombre;
    private int DNI;
    private int edad; 
    
    public Persona(String unNombre, int unDNI, int unaEdad){
        nombre = unNombre;
        DNI = unDNI;
        edad = unaEdad; 
    }
    
    public Persona(){
     
    }

    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setDNI(int unDNI) {
        DNI = unDNI;
    }

    public void setEdad(int unaEdad) {
        edad = unaEdad;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre + ", mi DNI es " + DNI + " y tengo " + edad + " años.";
        return aux;
    }
}
public class PruebaJava {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       GeneradorAleatorio.iniciar();
       Persona [] vector = new Persona [14];
      
       int EDAD;
       int dimension = 0;
       String NOMBRE;
       int DNI;
                
       EDAD = GeneradorAleatorio.generarInt(100);                                //carga Vector de personas
       while((EDAD != 0)&(dimension < 15)){
           NOMBRE = GeneradorAleatorio.generarString(10);
           DNI = GeneradorAleatorio.generarInt(10000);
           vector[dimension].setEdad(EDAD);
           vector[dimension].setNombre(NOMBRE);
           vector[dimension].setDNI(DNI);
           dimension++;
           EDAD = GeneradorAleatorio.generarInt(100);
       }
       
       
       int contador = 0;
       int min = 9999;
       String msj = null;
       for(int i=0;i<=dimension;i++){                                                    //recorre vector calculando incisos
         int edad = vector[i].getEdad();
         int dni = vector[i].getDNI();
         if(edad == 65)
             contador++;
         if(dni <= min){
           msj = vector[i].toString();
           min = dni;
         }
        }
       System.out.println("Cantidad de personas mayores de 65 años: " + contador);
       System.out.println("Representacion de la persona con menor DNI: " + msj);
    }
    
}
