/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalesviejos.Primero;

/**
 *
 * @author USUARIO
 */
public class ProgramaPrincipal {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String Investigador = "juan pablo";
        String Plan = "acompañamiento";
        String Fecha = "9 de diciembre de 2018";
        
        System.out.println("Prueba del susbsidio de Estadias");
        String Destino = "Canada";
        int Cantidad = 10;
        double Costo = 150;
        double MontoHotel = 45;
        
        deEstadias SUB = new deEstadias(Destino,Costo,Cantidad,MontoHotel,Investigador,Plan,Fecha);
        
        System.out.println(SUB.ToString());
        
        System.out.println("Prueba del subsidio de Bienes");
        AlmacenamientoBienes SUB2 = new AlmacenamientoBienes(3,Investigador,Plan,Fecha);
        
        deBienes AUX1 = new deBienes("Esto es una descripcion de AUX 1",3,120);
        deBienes AUX2 = new deBienes("Esto es una descripcion de AUX 2",1,170);
        deBienes AUX3 = new deBienes("Esto es una descripcion de AUX 3",5,150);
        SUB2.agregarBien(AUX1);
        SUB2.agregarBien(AUX2);
        SUB2.agregarBien(AUX3);
        System.out.println(SUB2.ToString());
    }
    
}
