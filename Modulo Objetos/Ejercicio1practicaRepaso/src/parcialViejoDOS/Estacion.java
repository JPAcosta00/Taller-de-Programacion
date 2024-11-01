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
public class Estacion {
    private String direccion;
    private double precio;
    private Surtidor [] vector;
    
    public Estacion (String unaDireccion, double unPrecio){
        this.vector = new Surtidor [6];
        this.inicializa();
        this.setDireccion(unaDireccion);
        this.setPrecio(unPrecio);
    }
    
    private void inicializa(){
        for(int i=0;i<6;i++)
            this.vector[i] = null;
    }

    public String getDireccion() {
        return this.direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public double getPrecio() {
        return this.precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public Surtidor[] getVector() {
        return this.vector;
    }
    
    public void generaVenta(int numSurtidor, int unDni, int cantidadM3, String formaPago){
        Surtidor [] vec = this.getVector();
        Ventas [] ven = vec[numSurtidor-1].getVentas();
        int canti = vec[numSurtidor-1].getCantidad();
        int i=0;
        boolean control = false;
        while((i<canti)&&(control == false)){
            if(ven[i] == null){
               ven[i].setDni(unDni);
               ven[i].setCantidadm3(cantidadM3);
               double monto = this.getPrecio() * cantidadM3;
               ven[i].setMonto(monto);
               ven[i].setFormaPago(formaPago);
               control = true;
            } else i++;
        }
    }
    
    public void fueraDeServicio(int x){
        Surtidor [] ve = this.getVector();
        for(int i=0;i<6;i++){
           int cantidades = ve[i].calculaCantidad();
           if(cantidades < x)
               ve[i].setEstado(false);
        }
    }
    
    public Ventas mayorMonto(){
        Surtidor [] ves = this.getVector();
        double max = -1;
        Ventas auxiliar = null;
        for(int i=0;i<6;i++){
           Ventas unaVenta = ves[i].calculaMayor();
           double unMonto = unaVenta.getMonto();
           if( max <unMonto){
              auxiliar = unaVenta;
              max = unMonto;
           }
        }
        return auxiliar;
    }
    
    @Override
    public String toString(){
       String aux = "Estacion de Servicio" + this.getDireccion() + this.getPrecio() + "\n";
       Surtidor [] vecto = this.getVector();
       for(int i=0;i<6;i++){
           if(vecto[i] == null)
               aux = aux + "NADA" + "\n";
           else
               aux = aux + "Surtidor: " + (i+1) + "Estado:" + vecto[i].getEstado() + "Ventas: "+ vecto[i].toString() + "\n";
       }
       return aux;
    }

}
