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
public class Gira extends Recitales{
    private String nombreGira;
    private Fecha [] vecFechas;
    private int dimenF;
    
    public Gira (String unNombreBanda, int cantTemas, String unNombreGira, int cantFechas){
      super(unNombreBanda,cantTemas);
      this.setNombreGira(unNombreGira);
      this.vecFechas = new Fecha[cantFechas];
      this.setDimenF(cantFechas);
    }
    
    @Override
    public void actuar(){
      Fecha [] vector = this.getVecFechas();
      int dimenFisica = this.getDimenF();
      for(int i=0;i<dimenFisica;i++){
          if(vector[i] != null){
            System.out.println("Buenas noches " + vector[i].getCiudad());
            super.actuar();
            System.out.println("-----------------------------------------");
          } else System.out.println("Fecha " + i+1 + "libre.");
      }
    }

    public Fecha[] getVecFechas() {
        return vecFechas;
    }

    public void setVecFechas(Fecha[] vecFechas) {
        this.vecFechas = vecFechas;
    }

    public int getDimenF() {
        return dimenF;
    }

    public void setDimenF(int dimenF) {
        this.dimenF = dimenF;
    }

    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }
   
    public void agregaFecha (Fecha unaFecha){
        int dia = unaFecha.getDia();
        if(vecFechas[dia-1] == null){
            this.vecFechas[dia] = unaFecha;
        }else System.out.println("No se puede agregar otra fecha a la gira");
    }
    
    @Override
    public double calcularCosto(){
        double costo = this.getDimenF();
        costo = costo * 30000;
        return costo;
    }
}
