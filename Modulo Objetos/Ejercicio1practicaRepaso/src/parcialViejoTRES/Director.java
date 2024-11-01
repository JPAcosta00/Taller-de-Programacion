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
public class Director {
    private String nombre;
    private int dni;
    private int ingreso;
    private double sueldo;
    private double viaticos;
    
    public Director(String unNombre, int unDni, int unIngreso, double unSueldo, double unMontoV){
        this.setNombre(unNombre);
        this.setDni(unDni);
        this.setIngreso(unIngreso);
        this.setSueldo(unSueldo);
        this.setViaticos(unMontoV);
    }
    
    public String toString (){
        String aux = "Nombre: " + this.getNombre() + ", DNI: " + this.getDni() + ", Sueldo a cobrar: " + this.getSueldo();
        return aux;
    }
    
    public void agregaSueldo(double porciento){
       this.sueldo = this.sueldo + porciento;                  //agrega 10%
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return this.dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getIngreso() {
        return this.ingreso;
    }

    public void setIngreso(int ingreso) {
        this.ingreso = ingreso;
    }

    public double getSueldo() {
        return this.sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public double getViaticos() {
        return this.viaticos;
    }

    public void setViaticos(double viaticos) {
        this.viaticos = viaticos;
    }
    
    
}
