/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialViejoTRES;
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
         System.out.println("-------------------CRECION DEL DIRECTOR----------------------------");
         System.out.println("ingrese el nombre del director de la empresa");
         String nombre = Lector.leerString();
         System.out.println("ingrese su dni ");
         int dni = Lector.leerInt();
         System.out.println("ingrese el año de ingreso");
         int ingreso = Lector.leerInt();
         System.out.println("ingrese el sueldo basico ");
         double sueldo = Lector.leerDouble();
         System.out.println("ingrese los viaticos ");
         double viaticos = Lector.leerDouble();
         
         Director nuevoDirector = new Director (nombre,dni,ingreso,sueldo,viaticos);
         
         System.out.println("--------------------CREACION DE LA EMPRESA------------------------");
         
         System.out.println("ingrese el nombre de la empresa");
         String nombreEmpresa = Lector.leerString();
         System.out.println("ingrese la direccion de la empresa");
         String direccion = Lector.leerString();
         
         Empresa nuevaEmpresa = new Empresa (nombreEmpresa,direccion,nuevoDirector,5);
         
         
         System.out.println("--------------------INGRESO DE LOS ENCARGAOS----------------------");
         
         System.out.println("ingrese el nombre del encargado");  
         String nombreEncargado = Lector.leerString();
         System.out.println("Ingrese su dni");
         dni = Lector.leerInt();
         System.out.println("Ingrese el año de ingreso");
         ingreso = Lector.leerInt();
         System.out.println("Ingrese el sueldo basico a cobrar");
         sueldo = Lector.leerDouble();
         System.out.println("Ingrese la cantidad de empleados a cargo");
         int cant = Lector.leerInt();
         
         Encargado uno = new Encargado(nombreEncargado,dni,ingreso,sueldo,cant);
         nuevaEmpresa.asignarEncargado(1, uno);
         System.out.println("---------------------------------------------------------------");
         
         System.out.println("ingrese el nombre del encargado");  
         nombreEncargado = Lector.leerString();
         System.out.println("Ingrese su dni");
         dni = Lector.leerInt();
         System.out.println("Ingrese el año de ingreso");
         ingreso = Lector.leerInt();
         System.out.println("Ingrese el sueldo basico a cobrar");
         sueldo = Lector.leerDouble();
         System.out.println("Ingrese la cantidad de empleados a cargo");
         cant = Lector.leerInt();
         
         Encargado dos = new Encargado(nombreEncargado,dni,ingreso,sueldo,cant);
         nuevaEmpresa.asignarEncargado(2, dos);
         System.out.println("---------------------------------------------------------------");

         
         System.out.println("ingrese el nombre del encargado");  
         nombreEncargado = Lector.leerString();
         System.out.println("Ingrese su dni");
         dni = Lector.leerInt();
         System.out.println("Ingrese el año de ingreso");
         ingreso = Lector.leerInt();
         System.out.println("Ingrese el sueldo basico a cobrar");
         sueldo = Lector.leerDouble();
         System.out.println("Ingrese la cantidad de empleados a cargo");
         cant = Lector.leerInt();
         
         Encargado tres = new Encargado(nombreEncargado,dni,ingreso,sueldo,cant);
         nuevaEmpresa.asignarEncargado(3,tres);
         System.out.println("---------------------------------------------------------------");
         
         String msj = nuevaEmpresa.representacion();
         System.out.println(msj);
    }
    
}
