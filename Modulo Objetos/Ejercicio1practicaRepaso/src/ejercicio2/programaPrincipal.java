/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio2;
import PaqueteLectura.Lector;
/**
 *
 * @author USUARIO
 */
public class programaPrincipal {
    public static void main(String[] args) {
        System.out.println("Ingrese el nombre del estacionamiento");
        String nombreEstacionamiento = Lector.leerString();
        System.out.println("Ingrese la direccion del estacionamiento");
        String direccionEstacionamiento = Lector.leerString();
        System.out.println("Ingrese la hora de apertura del estacionamiento");
        int horaApertura = Lector.leerInt();
        System.out.println("Ingrese la hora de cierre del estacionamiento");
        int horaCierre = Lector.leerInt();
        
        Estacionamiento nuevo = new Estacionamiento(nombreEstacionamiento,direccionEstacionamiento,horaApertura,horaCierre,3,3);
        
        System.out.println("Ingrese el nombre del dueño del auto a agregar");
        String name = Lector.leerString();
        System.out.println("Ingrese la patente del auto a agregar");
        String paten = Lector.leerString();
        Auto car = new Auto(name,paten);
        
        nuevo.agregaAuto(car, 1, 1);
        System.out.println("-----------------------------------------------------");
        
        System.out.println("Ingrese el nombre del dueño del auto a agregar");
        name = Lector.leerString();
        System.out.println("Ingrese la patente del auto a agregar");
        paten = Lector.leerString();
        Auto car2 = new Auto(name,paten);
        
        nuevo.agregaAuto(car2, 2, 2);
        System.out.println("-----------------------------------------------------");
        
        System.out.println("Ingrese el nombre del dueño del auto a agregar");
        name = Lector.leerString();
        System.out.println("Ingrese la patente del auto a agregar");
        paten = Lector.leerString();
        Auto car3 = new Auto(name,paten);
        
        nuevo.agregaAuto(car3, 3, 3);
        System.out.println("-----------------------------------------------------------");
        
        System.out.println("Ingrese el nombre del dueño del auto a agregar");
        name = Lector.leerString();
        System.out.println("Ingrese la patente del auto a agregar");
        paten = Lector.leerString();
        Auto car4 = new Auto(name,paten);
        
        nuevo.agregaAuto(car4, 1, 2);
        System.out.println("------------------------------------------------------------");
        
        System.out.println("Ingrese el nombre del dueño del auto a agregar");
        name = Lector.leerString();
        System.out.println("Ingrese la patente del auto a agregar");
        paten = Lector.leerString();
        Auto car5 = new Auto(name,paten);
        
        nuevo.agregaAuto(car5, 1, 3);
        System.out.println("--------------------------------------------------------------");
        
        System.out.println("Ingrese el nombre del dueño del auto a agregar");
        name = Lector.leerString();
        System.out.println("Ingrese la patente del auto a agregar");
        paten = Lector.leerString();
        Auto car6 = new Auto(name,paten);
        
        nuevo.agregaAuto(car6, 2, 1);  
        
        System.out.println("-----------------------Imprime Estacionamiento Entero-----------------------------------------");
        String msj = nuevo.toString(); 
        System.out.println(msj);
        
        int canti = nuevo.devuelveCantidad(1);
        System.out.println("Cantidad de autos en la plaza 1 = " + canti);
        
        System.out.println("Ingrese la patente de un auto a buscar");
        String unaPatente = Lector.leerString();
        String mensaje = nuevo.devuelveLugar(unaPatente);
        System.out.println(mensaje);
    }
}
