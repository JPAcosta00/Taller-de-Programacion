/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialViejoUNO;

/**
 *
 * @author USUARIO
 */
public class Estudiante {
    private String nombre;
    private String apellido;
    private int dni;
    
    public Estudiante(String unNombre, String unApellido, int unDni){
       this.setNombre(unNombre);
       this.setApellido(unApellido);
       this.setDni(unDni);
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return this.apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getDni() {
        return this.dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }
    
}
