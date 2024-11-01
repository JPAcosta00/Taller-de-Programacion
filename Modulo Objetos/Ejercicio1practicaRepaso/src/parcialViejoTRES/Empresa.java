/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialViejoTRES;

/**
 *
 * @author USUARIO
 */
public class Empresa {
    private String nombre;
    private String direccion;
    private Director director;
    private Encargado [] sucursales;
    private int cantSucursales;

  
    
    public Empresa (String unNombre, String unaDireccion, Director unDirector, int cantSucursales){
        this.creaVector(cantSucursales);
        this.setCantSucursales(cantSucursales);
        this.setNombre(unNombre);
        this.setDireccion(unaDireccion);
        this.setDirector(unDirector);
        this.inicializaVector();
    }
    
    private void inicializaVector(){
        int dimen = this.getCantSucursales();
        for(int i=0;i<dimen;i++)
            this.sucursales[i] = null;
    }
    
    private void creaVector(int unaCantidad){
        this.sucursales = new Encargado [unaCantidad];
    }
    
    public int getCantSucursales() {
        return this.cantSucursales;
    }

    public void setCantSucursales(int cantSucursales) {
        this.cantSucursales = cantSucursales;
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return this.direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Director getDirector() {
        return this.director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }

    public Encargado[] getSucursales() {
        return this.sucursales;
    }

    public void setSucursales(Encargado[] sucursales) {
        this.sucursales = sucursales;
    }
    
    public void asignarEncargado(int x , Encargado unEncargado){
        Encargado [] vec = this.getSucursales();
        if(vec[x] == null)
            vec[x] = unEncargado;
        else 
            System.out.println("Ya hay un Encargado asignado en la sucursal " + x);
    }
    
    public double retornaDirector (){
        Director unDire = this.getDirector();
        int año = 2023 - unDire.getIngreso();
        double aux = 0;
        if(20 < año){
            unDire.agregaSueldo(0.10);
            double viaticos = unDire.getViaticos();
            unDire.agregaSueldo(viaticos);
            aux = unDire.getSueldo();
        }
        return aux;
    }
    
    public void retornaEncargado (){
        Encargado [] sucur = this.getSucursales();
        int dim = this.getCantSucursales();
        for(int i=0;i<dim;i++){
           int antiguedad = 2023 - sucur[i].getIngreso();
           if(20 < antiguedad)
               sucur[i].aumentoSueldo();
        }
    }
    
    public String toString (){
        Director d = this.getDirector();
        String aux = d.toString() + "\n";
        Encargado [] unVector = this.getSucursales();
        int diml = this.getCantSucursales();
        for(int i=0;i<diml;i++){
           aux = aux + unVector[i].toString() + "\n";
        }
        return aux;
    }
    
    public String representacion(){
        String aux = "DIRECCION DE LA EMPRESA: " + this.getDireccion() + "\n" +  ", NOMBRE: " + this.getNombre() +"\n";
        Director unDi = this.getDirector();
        aux = aux + "DIRECTOR: " + unDi.toString() + "\n";
        Encargado [] unVecto = this.getSucursales();
        int dil = this.getCantSucursales();
        for(int i=0;i<dil;i++){
           if(unVecto[i] != null)
              aux = aux +  "SUCURSAL " + (i+1) + ", ENCARGADO:" + unVecto[i].toString() + "\n";
           else 
              aux = aux + "SUCURSAL " + (i+1) + " No tiene asignado un Encargado." + "\n";
        }
        return aux;
    }
}
