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
public class Compañia {
    public Dato[] rubros;
    
    public Compañia(){
        this.rubros = new Dato[10];
        for(int i=0; i<9; i++){
            this.rubros[i] = new Dato();
        }
    }
    public void agregaPoliza(Poliza unaPo, int unRubro){
        this.rubros[unRubro].agregaPoliza(unaPo);
    }
    
    public String infoCliente(int unDNI){
        String cadena = " ";
        for(int i=0; i<9; i++){
            cadena += this.rubros[i].devuelveInformacion(unDNI);
        }
        return cadena;
    }
    
    public void aumentarCuotas(double unPorcentaje, int unRubro){
        this.rubros[unRubro].aumentaCuota(unPorcentaje);
    }
    
    public int cantidadAVencer(int mes, int año){
        int cantidad = 0;
        for(int i=0; i<9; i++){
            this.rubros[i].cuentaVencimientos(cantidad,mes,año);
        }
        return cantidad;
    }
}
