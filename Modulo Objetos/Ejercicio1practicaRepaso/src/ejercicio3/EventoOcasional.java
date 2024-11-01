/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio3;

/**
 *
 * @author USUARIO
 */
public class EventoOcasional extends Recitales {
    private String nombreContratante;
    private int dia;
    
    public EventoOcasional(String unNombreBanda, int cantTemas, String unContratante, int unDia){
        super(unNombreBanda,cantTemas);
        this.setDia(unDia);
        this.setNombreContratante(unContratante);
    }
    
    @Override
    public void actuar(){
        String aux = "Nombre del contratante: " + this.getNombreContratante() + " , dia del Evento Ocasional: " + this.getDia();
        System.out.println(aux);
        System.out.println("Informacion de los temas a tocar:");
        super.actuar();
    }

    public String getNombreContratante() {
        return this.nombreContratante;
    }

    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public int getDia() {
        return this.dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    @Override
    public double calcularCosto() {                                                   //no sirve porque nos dijeron que saquemos la parte de los motivos del ejercicio.
        double aux = 0.0;
        return aux;
    }
}
