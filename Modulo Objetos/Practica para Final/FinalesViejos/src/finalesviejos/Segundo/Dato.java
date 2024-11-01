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
public class Dato {
    public int dimension;
    public Poliza[] vector;
    
    public Dato(){
        vector = new Poliza[200];
        dimension = 0;
        for(int i=0; i<dimension;i++){
            this.vector[i] = new Poliza();
        }
    }
    
    public void agregaPoliza(Poliza unaPoliza){
        if(this.dimension+1 < 200){
            this.vector[dimension]= unaPoliza;
            this.dimension++;
        }else{
            System.out.println("No hay lugar en el rubro");
        }
    } 
    public String devuelveInformacion(int dni){
        String cad = " ";
        for(int i=0; i<dimension;i++){
            if(this.vector[i].cliente.getDNI() == dni){
                cad += "MontoAsegurado: " + this.vector[i].getMonto() + " valor de cuota mensual: " + this.vector[i].getValorCuota() + " fecha de comienzo: " + this.vector[i].getFechaComienzo() + " fecha de fin: " + this.vector[i].getFechaFin() + "\n";
            }
        }
        return cad;
    }
    public void aumentaCuota(double porcentaje){
        for(int i=0; i<this.dimension;i++){
            this.vector[i].valorCuota *= porcentaje;
        }
    }
    public void cuentaVencimientos(int cant, int mes, int año){
        for(int i=0; i<this.dimension;i++){
             if(this.vector[i].fechaFin == (mes + año)){
                 cant++;
             }
        }
    }
}
