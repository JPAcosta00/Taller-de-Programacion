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
public class deEstadias extends Subsidios{
    public String destino;
    public double costoPasajes;
    public int cantDias;
    public double montoHotel;
    
    public deEstadias(String unDestino, double unCosto, int unaCantidad, double unMonto, String unInvestigador, String unPlan, String unaFecha){
        super(unInvestigador, unPlan, unaFecha);
        this.setDestino(unDestino);
        this.setCostoPasajes(unCosto);
        this.setCantDias(unaCantidad);
        this.setMontoHotel(unMonto);
    }
    
    public double devuelveMontoTotalEstadia(){
        double Monto_total_subsidio_estadia = (this.getCostoPasajes() + this.getCantDias() * this.getMontoHotel());
        return Monto_total_subsidio_estadia;
    }
    
    public String ToString(){
        String cadena = super.ToString() + " Monto total de estadia: " + this.devuelveMontoTotalEstadia() + "\nLugar Destino: " + this.getDestino() + " Dias de estadia: " + this.getCantDias();
        return cadena;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public double getCostoPasajes() {
        return costoPasajes;
    }

    public void setCostoPasajes(double costoPasajes) {
        this.costoPasajes = costoPasajes;
    }

    public int getCantDias() {
        return cantDias;
    }

    public void setCantDias(int cantDias) {
        this.cantDias = cantDias;
    }

    public double getMontoHotel() {
        return montoHotel;
    }

    public void setMontoHotel(double montoHotel) {
        this.montoHotel = montoHotel;
    }
}
