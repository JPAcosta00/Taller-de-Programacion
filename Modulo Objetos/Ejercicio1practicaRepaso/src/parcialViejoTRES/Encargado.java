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
public class Encargado {
    private String nombre;
    private int dni;
    private int ingreso;
    private double sueldo;
    private int cantEmpleados;
    
    public Encargado (String unNombre, int unDni, int unIngreso, double unSueldo, int unaCantidad) {
        this.setNombre(unNombre);
        this.setDni(unDni);
        this.setIngreso(unIngreso);
        this.setSueldo(unSueldo);
        this.setCantEmpleados(unaCantidad);
    }
    
    public String toString (){
       String aux = "Nombre: " + this.getNombre() + ", DNI: " + this.getDni() + ", sueldo a cobrar: " + this.getSueldo();
       return aux;
    }
    
    public double aumentoSueldo (){
        this.sueldo = this.sueldo + 0.10;                             //agrega 10%
        double adicional = this.getCantEmpleados() * 1000;            
        this.sueldo = this.sueldo + adicional;                       //agrega adicional
        return this.sueldo;
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

    public int getCantEmpleados() {
        return this.cantEmpleados;
    }

    public void setCantEmpleados(int cantEmpleados) {
        this.cantEmpleados = cantEmpleados;
    }
    
    
}
