/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalesviejos.Segundo;

/**
 *
 * @author USUARIO
 */
public class ProgramaPrincipal {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Cliente yo = new Cliente(45577804,"juan Pablo", "acosta");
        Poliza pol1 = new Poliza(233,4234,543,565,yo);
        Poliza pol2 = new Poliza(23353,4234,543,565,yo);
        Poliza pol3 = new Poliza(25333,4232434,5473,565,yo);
        Poliza pol4 = new Poliza(233,42334,54543,565,yo);
        Poliza pol5 = new Poliza(233,4275434,754543,565,yo);
        
        Compañia com = new Compañia();
        com.agregaPoliza(pol1,3);
        com.agregaPoliza(pol2,3);
        com.agregaPoliza(pol3,4);
        com.agregaPoliza(pol4,6);
        com.agregaPoliza(pol5,3);
        
        System.out.println("Informacion del DNI 45577805");
        System.out.println(com.infoCliente(45577804));
        com.aumentarCuotas(1.11, 3);
        System.out.println("Se aumento el valor del rubro seguro de vida");
        System.out.print("Cantidad de vencimientos: ");
        System.out.println(com.cantidadAVencer(565, 0));       
    }
    
}
