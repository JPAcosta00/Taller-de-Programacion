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
public class Poliza {
    public double monto;
    public double valorCuota;
    public int fechaComienzo;
    public int fechaFin;
    public Cliente cliente;
    
    public Poliza(){}
    
    public Poliza(double unMonto, double unValor, int comienzo, int fin, Cliente unCliente){
        this.setMonto(unMonto);
        this.setValorCuota(unValor);
        this.setFechaComienzo(comienzo);
        this.setFechaFin(fin);
        this.setCliente(unCliente);
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public double getValorCuota() {
        return valorCuota;
    }

    public void setValorCuota(double valorCuota) {
        this.valorCuota = valorCuota;
    }

    public int getFechaComienzo() {
        return fechaComienzo;
    }

    public void setFechaComienzo(int fechaComienzo) {
        this.fechaComienzo = fechaComienzo;
    }

    public int getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(int fechaFin) {
        this.fechaFin = fechaFin;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
}
