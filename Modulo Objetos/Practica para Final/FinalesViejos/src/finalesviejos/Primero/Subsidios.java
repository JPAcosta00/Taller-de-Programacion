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
public abstract class Subsidios {
    private String nombreInvestigador;
    private String nombrePlanTrabajo;
    private String FechaSolicitud;
    
    public Subsidios (String unInvestigador, String unPlan, String unaFecha){
        this.setNombreInvestigador(unInvestigador);
        this.setNombrePlanTrabajo(unPlan);
        this.setFechaSolicitud(unaFecha);
    }
    
    public String ToString(){
        return ("Nombre de Investigador: " + this.getNombreInvestigador() + " Plan de trabajo: " + this.getNombrePlanTrabajo() + " Fecha de solicitud: " + this.getFechaSolicitud());
    }

    public String getNombreInvestigador() {
        return nombreInvestigador;
    }

    public void setNombreInvestigador(String nombreInvestigador) {
        this.nombreInvestigador = nombreInvestigador;
    }

    public String getNombrePlanTrabajo() {
        return nombrePlanTrabajo;
    }

    public void setNombrePlanTrabajo(String nombrePlanTrabajo) {
        this.nombrePlanTrabajo = nombrePlanTrabajo;
    }

    public String getFechaSolicitud() {
        return FechaSolicitud;
    }

    public void setFechaSolicitud(String FechaSolicitud) {
        this.FechaSolicitud = FechaSolicitud;
    }
}
