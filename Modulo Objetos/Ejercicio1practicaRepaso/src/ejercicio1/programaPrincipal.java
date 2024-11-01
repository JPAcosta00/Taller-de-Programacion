/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio1;
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
        System.out.println("Ingrese el nombre del proyecto");
        String name = Lector.leerString();
        System.out.println("Ingrese el codigo del proyecto");
        int codigo = Lector.leerInt();
        System.out.println("Ingrese el nombre del director");
        String nombreDirector = Lector.leerString();
        
        System.out.println("1)  Ingrese el nombre de un investigador ");
        String nombreInvestigador = Lector.leerString();
        System.out.println("1)  Ingrese la categoria (1 a 5) del investigador");
        int categoria = Lector.leerInt();
        System.out.println("1)  Ingrese la especialidad de ese investigador");
        String especialidad = Lector.leerString();
        
        Investigador nuevoInvestigador = new Investigador(nombreInvestigador,categoria,especialidad);
        
        System.out.println("1)  Ingrese el monto de un subsidio");
        double monto = Lector.leerDouble();
        System.out.println("1)  Ingrese el motivo de ese subsidio");
        String motivo = Lector.leerString();
        
        Subsidios nuevoSubsidio = new Subsidios(monto,motivo);
        
        nuevoInvestigador.agregarSubsidio(nuevoSubsidio);
        
        Proyecto nuevo = new Proyecto(name,codigo,nombreDirector,nuevoInvestigador);
        
        System.out.println("----------------------------------------------------------");
        
        System.out.println("2)  Ingrese el nombre de un investigador ");
        nombreInvestigador = Lector.leerString();
        System.out.println("2)  Ingrese la categoria (1 a 5) del  investigador");
        categoria = Lector.leerInt();
        System.out.println("2)  Ingrese la especialidad de ese investigador");
        especialidad = Lector.leerString();
        
        Investigador otroInvestigador = new Investigador(nombreInvestigador,categoria,especialidad);
        
        nuevo.agregarInvestigador(otroInvestigador);
        
        System.out.println("----------------------------------------------------------");
        
        System.out.println("3)  Ingrese el nombre de un investigador ");
        nombreInvestigador = Lector.leerString();
        System.out.println("3) Ingrese la categoria (1 a 5) del investigador");
        categoria = Lector.leerInt();
        System.out.println("3)  Ingrese la especialidad de ese investigador");
        especialidad = Lector.leerString();
        
        Investigador otherInvestigador = new Investigador(nombreInvestigador,categoria,especialidad);
        
        nuevo.agregarInvestigador(otherInvestigador);

        String mensaje = nuevo.toString();
        System.out.println("Informacion del proyecto: ");
        System.out.println(mensaje);
    }
}
//corregir no imprime nada, solo carga los tres investigadores.