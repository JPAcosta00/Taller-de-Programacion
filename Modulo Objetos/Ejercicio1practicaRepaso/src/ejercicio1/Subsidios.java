/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio1;

/**
 *
 * @author USUARIO
 */
public class Subsidios {
    private double monto;
    private String motivo;
    private boolean estado;
    
    public Subsidios (double unMonto, String unMotivo){
        this.setMonto(unMonto);
        this.setMotivo(unMotivo);
        this.setEstado(false);
    }
    
    public void setEstado (boolean unEstado){
       this.estado = unEstado;
    }
    
    public boolean getEstado(){
       return this.estado;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }
    
    public void otorgaSub (){
        this.estado = true;
    }
}
