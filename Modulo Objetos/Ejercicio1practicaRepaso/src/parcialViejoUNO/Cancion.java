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
public class Cancion {
    private int identificador;
    private String nombre;
    private String compositor;
    private int puntaje;
    private Estudiante estudiante;
    
    public Cancion(int unIdentificador, String unNombre, String unCompositor){
        this.estudiante = null;
        this.setIdentificador(unIdentificador);
        this.setCompositor(unCompositor);
        this.setNombre(unNombre);
        this.setPuntaje(0);
    }

    public Estudiante getEstudiante() {
        return this.estudiante;
    }

    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }

    public int getIdentificador() {
        return identificador;
    }

    public void setIdentificador(int identificador) {
        this.identificador = identificador;
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCompositor() {
        return this.compositor;
    }

    public void setCompositor(String compositor) {
        this.compositor = compositor;
    }

    public int getPuntaje() {
        return this.puntaje;
    }

    public void setPuntaje(int puntaje) {
        this.puntaje = puntaje;
    }
    
    
}
