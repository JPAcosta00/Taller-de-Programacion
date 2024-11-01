/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialViejoUNO;
import PaqueteLectura.Lector;
/**
 *
 * @author USUARIO
 */
public class programaPrincipal {
//concurso de canto en una Escuela de Canto.
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Concurso competencia = new Concurso(3,5);
        
        System.out.println("------------------------INGRESO DE LAS CANCIONES----------------------------");
        
        System.out.println("Ingrese el identificador de una cancion");
        int identificador = Lector.leerInt();
        System.out.println("Ingrese el nombre de la cancion");
        String nombre = Lector.leerString();
        System.out.println("Ingrese el compositor de la cancion");
        String compositor = Lector.leerString();
      
        Cancion cancion1 = new Cancion(identificador,nombre,compositor);
        competencia.agregaCancion(cancion1, 1);                                                    //Agrega la cancion 1 en la categoria 1.
        System.out.println("----------------------------------------------------");
        
        System.out.println("Ingrese el identificador de una cancion");
        identificador = Lector.leerInt();
        System.out.println("Ingrese el nombre de la cancion");
        nombre = Lector.leerString();
        System.out.println("Ingrese el compositor de la cancion");
        compositor = Lector.leerString();
        
        Cancion cancion2 = new Cancion(identificador,nombre,compositor);
        competencia.agregaCancion(cancion2,1);
        System.out.println("----------------------------------------------------");
        
        System.out.println("Ingrese el identificador de una cancion");
        identificador = Lector.leerInt();
        System.out.println("Ingrese el nombre de la cancion");
        nombre = Lector.leerString();
        System.out.println("Ingrese el compositor de la cancion");
        compositor = Lector.leerString();
        
        Cancion cancion3 = new Cancion(identificador,nombre,compositor);
        competencia.agregaCancion(cancion3, 2);
        System.out.println("----------------------------------------------------");
        
        System.out.println("Ingrese el identificador de una cancion");
        identificador = Lector.leerInt();
        System.out.println("Ingrese el nombre de la cancion");
        nombre = Lector.leerString();
        System.out.println("Ingrese el compositor de la cancion");
        compositor = Lector.leerString();
        
        Cancion cancion4 = new Cancion(identificador,nombre,compositor);
        competencia.agregaCancion(cancion4, 1);
        System.out.println("----------------------------------------------------");
        
        System.out.println("Ingrese el identificador de una cancion");
        identificador = Lector.leerInt();
        System.out.println("Ingrese el nombre de la cancion");
        nombre = Lector.leerString();
        System.out.println("Ingrese el compositor de la cancion");
        compositor = Lector.leerString();
        
        Cancion cancion5 = new Cancion(identificador,nombre,compositor);
        competencia.agregaCancion(cancion5, 2);
        System.out.println("----------------------------------------------------");
        
        System.out.println("-------------------------INGRESO DE LOS ALUMNOS-----------------------------");
        
        System.out.println("Ingrese el identificador de la cancion");
        int unIdentificador = Lector.leerInt();
        while(unIdentificador != 0){
            System.out.println("Ingrese el nombre del estudiante");
            String nombreEstudiante = Lector.leerString();
            System.out.println("Ingrese el apellido del estudiante");
            String apellido = Lector.leerString();
            System.out.println("Ingrese el dni del estudiante");
            int dni = Lector.leerInt();
            
            Estudiante unEstudiante = new Estudiante(nombreEstudiante,apellido,dni);
            
            System.out.println("Ingrese el puntaje otorgado");
            int puntaje = Lector.leerInt();
            
            competencia.interpretaCancion(unIdentificador, unEstudiante, puntaje);
            System.out.println("------------------------------------------------------------");
            
            System.out.println("Ingrese el identificador de la cancion");
            unIdentificador = Lector.leerInt();       
        }
        
        System.out.println(" ");
        System.out.println("Ingrese el identificador de una cancion para buscar si hay un ganador");
        int unIden = Lector.leerInt();
        Estudiante info = competencia.buscaGanador(unIden);
        if(info != null){
            String unNombre = info.getNombre();
            String unApellido = info.getApellido();
            int unDni = info.getDni();
            System.out.println("El ganador es: " + unNombre + "" + unApellido + ", y su DNI es " + unDni);
        } else System.out.println("No hay ganador para esa cancion.");
        
    }
   
}
