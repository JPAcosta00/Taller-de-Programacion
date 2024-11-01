/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialViejoDOS;

/**
 *
 * @author USUARIO
 */
public class Ventas {
    private int dni;
    private int cantidadm3;
    private double monto;
    private String formaPago;
    
    public Ventas (int unDni, int unaCantidad, double unMonto, String unPago){
        this.setDni(unDni);
        this.setCantidadm3(unaCantidad);
        this.setFormaPago(unPago);
        this.setMonto(unMonto);
    }
    
    public String toString(){
        String auxi = "Dni: " + this.getDni() + " , Cantidad M3: " + this.getCantidadm3() + " , Monto: " + this.getMonto() + ", forma de pago: " + this.getFormaPago();
        return auxi;   
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getCantidadm3() {
        return cantidadm3;
    }

    public void setCantidadm3(int cantidadm3) {
        this.cantidadm3 = cantidadm3;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getFormaPago() {
        return formaPago;
    }

    public void setFormaPago(String formaPago) {
        this.formaPago = formaPago;
    }
    
    
}
