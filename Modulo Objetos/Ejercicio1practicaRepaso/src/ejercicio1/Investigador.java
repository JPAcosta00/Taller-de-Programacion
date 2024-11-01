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
public class Investigador{
    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidios [] vecSub = new Subsidios[5];
    private int dimL;
    
    public Investigador (String unNombre, int unaCategoria, String unaEspecialidad){
       this.setNombre(unNombre);
       this.setCategoria(unaCategoria);
       this.setEspecialidad(unaEspecialidad);
       this.dimL = 0;
    }
    
    @Override
    public String toString (){
        String aux = "Nombre del Investigador: " + this.getNombre() + " " + 
                     "Categoria: " + this.getCategoria() + " " + 
                     "Especialidad: " + this.getEspecialidad() + " " + 
                     "Total dinero otorgado por subsidios: " + this.devuelveDinero() + " " ;
        return aux;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    public int devuelveLogica (){
        return this.dimL;
    }
   
    public void agregarSubsidio(Subsidios unSub){
        int dim = this.devuelveLogica();
        if(dim < 5){
           this.vecSub[dim] = unSub;
           this.vecSub[dim].otorgaSub();
           this.dimL++;
        } else System.out.println("No puede pedir mas subsidios");
    }
    
    public double devuelveDinero (){
        int dime = this.devuelveLogica();
        double aux = 0;
        for(int i=0;i<dime;i++){
            aux = aux + this.vecSub[i].getMonto();
        }
        return aux;
    }
   
    public void otorgaEstado (int pos){
        if(this.vecSub[pos].getEstado() == false)
           this.vecSub[pos].setEstado(true);
    }
}
