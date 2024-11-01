/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio3;
import PaqueteLectura.Lector;
/**
 *
 * @author USUARIO
 */
public class programaPrincipal {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        System.out.println("----------------------------EVENTO OCACIONAL-------------------------------");
        System.out.println("Ingrese el nombre de la banda");
        String nombreBanda = Lector.leerString();
        System.out.println("Ingrese la cantidad de temas a tocar");
        int cantidadTemas = Lector.leerInt();
        System.out.println("Ingrese el nombre del contratante");
        String nombreContratante = Lector.leerString();
        System.out.println("Ingrese el dia");
        int dia = Lector.leerInt();
        
        EventoOcasional evento = new EventoOcasional(nombreBanda,cantidadTemas,nombreContratante,dia);
        
        evento.agregarTema("Bastara, de los Cafres");
        evento.agregarTema("Lo nuestro tiene magia, de Cruzando el Charco");
        evento.agregarTema("Fruto, de Milo J");
        evento.agregarTema("Toy en el mic, de Milo J");
        evento.agregarTema("Toco y me voy, del Bananero");
        
        evento.actuar();
        
        System.out.println("---------------------------------GIRA-----------------------------------------");
        System.out.println("Ingrese el nombre de la banda");
        nombreBanda = Lector.leerString();
        System.out.println("Ingrese la cantidad de temas a tocar");
        cantidadTemas = Lector.leerInt();
        System.out.println("Ingrese el nombre de la gira");
        String nombreGira = Lector.leerString();
        System.out.println("Ingrese la cantidad de fechas de la gira");
        int cantFechas = Lector.leerInt();
        
        Gira nueva = new Gira(nombreBanda,cantidadTemas,nombreGira,cantFechas);
        
        System.out.println("------------------------INGRESO DE FECHAS--------------------------------");
        System.out.println("Ingrese la ciudad de la fecha a agregar");
        String ciudad = Lector.leerString();
        System.out.println("ingrese el dia de la fecha a agregar");
        dia = Lector.leerInt();
        Fecha NF = new Fecha(ciudad,dia);
        nueva.agregaFecha(NF);
        System.out.println("----------------------------------------------------------");
        
        System.out.println("Ingrese la ciudad de la fecha a agregar");
        ciudad = Lector.leerString();
        System.out.println("ingrese el dia de la fecha a agregar");
        dia = Lector.leerInt();
        Fecha NF1 = new Fecha(ciudad,dia);
        nueva.agregaFecha(NF1);
        
        System.out.println("----------------------------------------------------------");
        
        nueva.agregarTema("Costumbres, de Ke Personajes");
        nueva.agregarTema("Me vas a extrañar, de Damas Gratis");
        nueva.agregarTema("Latidos, de Matias Valdez");
        nueva.agregarTema("SOMOS NOSOTROS, de J Rei");
        nueva.agregarTema("Yo te propongo, de Rombai");
        
        nueva.actuar();
    }
}
