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
public class Surtidor {
    private boolean estado;
    private Ventas [] ventas;
    private int cantidad;
    
    public Surtidor(int capacidad){
       this.setEstado(true);
       this.setCantidad(capacidad);
       this.ventas = new Ventas [capacidad];
       this.inicializaVentas();
    }
    
    public String toString (){
       Ventas [] vent = this.getVentas();
       int dimen = this.getCantidad();
       String aux = null;
       for(int i=0;i<dimen;i++){
          aux = aux + vent[i].toString() + "\n";
       }
       return aux;
    }
    
    private void inicializaVentas(){
        int cant = this.getCantidad();
        for(int i=0;i<cant;i++)
            this.ventas[i] = null;
    }

    public boolean getEstado() {
        return this.estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public Ventas[] getVentas() {
        return this.ventas;
    }

    public int getCantidad() {
        return this.cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    public int calculaCantidad(){
       Ventas [] v = this.getVentas();
       int canti = this.getCantidad();
       int suma = 0;
       for(int i=0;i<canti;i++){
          suma = suma + v[i].getCantidadm3();
       }
       return suma;
    }
    
    public Ventas calculaMayor(){
       Ventas [] v = this.getVentas();
       int canti = this.getCantidad();
       double maxi = -1;
       Ventas aux = null;
       for(int i=0;i<canti;i++){
           double mon =  v[i].getMonto();
           if(maxi < mon){
              aux = v[i];
              maxi = mon;
           }
       }
       return aux;
    }
}
