/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalesviejos.Primero;

/**
 *
 * @author USUARIO
 */
public class AlmacenamientoBienes extends Subsidios{
    public deBienes[] vector;
    public int dimLogica;
    public int N;
    
    public AlmacenamientoBienes(int dimFisica, String unInvestigador, String unPlan, String unaFecha){
        super(unInvestigador, unPlan, unaFecha);
        this.setN(dimFisica);
        this.vector = new deBienes[this.getN()];                              //Instancia el vector de bienes vacio
        this.dimLogica = 0;                                                   //y su dimension logica vacia
    }
    
    public double devuelveMontoTotalBien(){
        double Monto_total_subsidio_bienes= 0;
        for(int i=0;i<this.getDimLogica(); i++){
            Monto_total_subsidio_bienes += this.vector[i].getCantidad() * this.vector[i].getCosto();
        }
        return Monto_total_subsidio_bienes;
    }
    
    public String devuelveDescripciones(){
        String des = " ";
        for(int i=0;i<this.getDimLogica(); i++){
            des = des + "   ,  "+ this.vector[i].getDescripcion();
        }
        return des;
    }
    
    public String ToString(){
        String cadena = super.ToString() + " " + this.devuelveMontoTotalBien() + "\n  Descripcion de los vienes solicitados" + this.devuelveDescripciones();
        return cadena;
    }
    
    public void agregarBien(deBienes dato){
        if(this.getDimLogica() < this.getN()){
            this.vector[this.dimLogica] = dato;
            this.dimLogica++;
        }
    }
    
    public int getDimLogica(){
        return this.dimLogica;
    }

    public deBienes[] getVector() {
        return vector;
    }


    public int getN() {
        return N;
    }

    public void setN(int N) {
        this.N = N;
    }
}
