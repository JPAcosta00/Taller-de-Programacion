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
public class Cliente {
    public int DNI;
    public String nombre;
    public String apellido;
    
    public Cliente(int unDNI, String unNombre, String unApellido){
        this.setNombre(unNombre);
        this.setDNI(unDNI);
        this.setApellido(unApellido);
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
}
