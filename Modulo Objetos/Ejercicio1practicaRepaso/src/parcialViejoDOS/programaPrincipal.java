/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialViejoDOS;
import PaqueteLectura.Lector;
/**
 *
 * @author USUARIO
 */
public class programaPrincipal {
//ESTACION GNC
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("Ingrese la direccion de la estacion de servicio");
        String unaDireccion = Lector.leerString();
        System.out.println("Ingrese el precio por m3");
        double unPrecio = Lector.leerDouble();
        
        Estacion nuevaEstacion = new Estacion(unaDireccion,unPrecio);
        
        nuevaEstacion.generaVenta(1, 34235426, 16, "efectivo");
        nuevaEstacion.generaVenta(3, 3443226, 10, "debito");
        nuevaEstacion.generaVenta(4, 3427668, 8, "tarjeta");
        nuevaEstacion.generaVenta(5, 5435676, 16, "efectivo");
        nuevaEstacion.generaVenta(5, 34656526, 18, "debito");
        
        String msj = nuevaEstacion.toString();
        System.out.println(msj);
    }
    
}
