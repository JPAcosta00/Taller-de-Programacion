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
public class Proyecto {
    private String nombre;
    private int codigo;
    private String nombreDirector;
    private Investigador [] vector = new Investigador[50];
    private int dimension;
    
    public Proyecto (String unNombre, int unCodigo, String unDirector, Investigador unInvestigador){
        this.setCodigo(unCodigo);
        this.setNombre(unNombre);
        this.setNombreDirector(unDirector);
        this.dimension = 0;
        this.agregarInvestigador(unInvestigador);
    }
    
    @Override
    public String toString(){
        String aux = "Nombre del proyecto: " + this.getNombre() + " " + "\n" +
                     "Nombre del director: " + this.getNombreDirector() + " " + "\n" +
                     "Codigo del proyecto: " + this.getCodigo() + " " + "\n" +
                     "Dinero total otorgado: " + this.dineroTotalOtorgado() + " " + "\n" +
                     "-------------------------------------------------------------------" + "\n";
        int dim = this.devuelveDimension();
        for(int i = 0; i<dim;i++){
           aux = aux + this.vector[i].toString() + "\n" +
                "-------------------------------------" + "\n";
        }
        return aux;
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return this.codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return this.nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }
    
    public int devuelveDimension (){
      return this.dimension;
    }

   public void agregarInvestigador(Investigador unInvestigador){
      int dim = this.devuelveDimension();
      if(dim<50){
         this.dimension++;
         this.vector[dim] = unInvestigador;
      }else System.out.println("No se puede agregar mas investigadores al proyecto.");
   }
   
   public Investigador deuvelveInvestigador (String unNombre){
      Investigador aux = null;
      int diml = this.devuelveDimension();
      int i = 0;
      boolean control = false;
      String nom = null;
      while((i<diml)&&(control == false)){
          nom = this.vector[i].getNombre();
          if( nom.equals(unNombre)){
              aux = this.vector[i];
              control = true;
          } else 
              i++;
      }  
      return aux;
   }
   
   public double dineroTotalOtorgado(){
      int dime = this.devuelveDimension();
      double aux = 0;
      for(int i=0;i<dime;i++){
         aux = aux + this.vector[i].devuelveDinero();
      }
      return aux;
   }
   
   public void otorgarTodos (String unNombre){
       Investigador auxiliar = this.deuvelveInvestigador(unNombre);
       int dimen = auxiliar.devuelveLogica();
       for(int i=0;i<dimen;i++){
          auxiliar.otorgaEstado(i);
       }
   }
}
