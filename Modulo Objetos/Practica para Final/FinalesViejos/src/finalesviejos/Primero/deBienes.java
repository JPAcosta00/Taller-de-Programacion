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
public class deBienes{
    public String descripcion;
    public int cantidad;
    public double costo;
    
    public deBienes(String unaDescripcion, int unaCantidad, double unCosto){
        this.setDescripcion(unaDescripcion);
        this.setCantidad(unaCantidad);
        this.setCosto(unCosto);
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
}
