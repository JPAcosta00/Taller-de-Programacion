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
public abstract class Recitales {
    private String nombreBanda;
    private String [] listaTemas;
    private int dimTemas;
    private int dimF;
    
    public Recitales (String unaBanda, int unosTemas){
       this.setNombreBanda(unaBanda);
       this.listaTemas = new String[unosTemas];
       this.dimF = unosTemas;
       this.dimTemas = 0;
       this.inicializaTemas(this.listaTemas);
    }
    
    public void inicializaTemas(String [] temas){
       int dimFI = this.getDimF();
       for(int i=0;i<dimFI;i++)
          this.listaTemas[i] = null;
    }
    
    public void actuar(){
       int logica = this.getDimTemas();
       String [] lista = getListaTemas();
       for(int i=0;i<logica;i++){
          String nombre = lista[i];
          System.out.println("Y ahora tocaremos " + nombre);
          System.out.println("---------------------------------------------------");
       }
    }

    public String[] getListaTemas() {
        return this.listaTemas;
    }

    public void setListaTemas(String[] listaTemas) {
        this.listaTemas = listaTemas;
    }

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }
    
    public int getDimF(){
        return this.dimF;
    }
    
    public void agregarTema(String unTema){
        int dimenF = this.getDimF();
        int dimenL = this.getDimTemas();
        if(dimenL < dimenF ){
           this.listaTemas[this.getDimTemas()] = unTema;
           this.dimTemas++;
        }else 
           System.out.println("No se puede agregar otro tema a la lista.");
    }

    public int getDimTemas() {
        return dimTemas;
    }
    
    public abstract double calcularCosto();
}
