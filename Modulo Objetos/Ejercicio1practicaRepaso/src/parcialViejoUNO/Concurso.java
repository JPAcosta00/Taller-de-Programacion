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
public class Concurso {
    private Cancion [][] matriz;
    private int categorias;
    private int canciones;
    
    public Concurso (int cantCategorias, int cantCanciones){
       this.setCategorias(cantCategorias);
       this.setCanciones(cantCanciones);
       this.matriz = new Cancion [cantCategorias][cantCanciones];
       this.inicializaMatriz(this.matriz);
    }
    
    public void inicializaMatriz(Cancion [][] unaMatriz){
       int cate = this.getCategorias();
       int can = this.getCanciones();
       for(int i=0;i<cate;i++){
           for(int j=0;j<can;j++)
               unaMatriz[i][j] = null;
       }
    }

    public Cancion[][] getMatriz() {
        return this.matriz;
    }

    public int getCategorias() {
        return this.categorias;
    }

    public void setCategorias(int categorias) {
        this.categorias = categorias;
    }

    public int getCanciones() {
        return this.canciones;
    }

    public void setCanciones(int canciones) {
        this.canciones = canciones;
    }
    
    public void agregaCancion(Cancion unaCancion, int unaCategoria){
        int cant = this.getCanciones();
        Cancion [][] matris = this.getMatriz();
        int i = 0;
        boolean control = false;
        while((i<cant)&&(control == false)){
           if(matris[unaCategoria-1][i] == null){
               matris[unaCategoria-1][i] = unaCancion;
               control = true;
           }else i++;
        }
    }
    
    public void interpretaCancion(int iden, Estudiante unEstudiante, int unPuntaje){
        int cate = this.getCategorias();
        int can = this.getCanciones();
        Cancion [][] matri = this.getMatriz();
        int i=0;
        boolean control = false;
        while((control == false)&&(i<cate)){
            int j=0;
            while((control == false)&&(j<can)){
                   int identificador = matri[i][j].getIdentificador();
                   if(identificador == iden){
                        int puntaje = matri[i][j].getPuntaje();
                        if(puntaje < unPuntaje){
                            matri[i][j].setEstudiante(unEstudiante);
                            control = true;
                        }
                   } else j++;
            }
            i++;
        } 
    }
    
    public Estudiante buscaGanador (int unIdentificador){
        Estudiante ganador = null;
        int cat = this.getCategorias();
        int can = this.getCanciones();
        Cancion [][] mat = this.getMatriz();
        boolean control = false;
        int i = 0;
        while((i<cat)&&(control == false)){
            int j=0;
            while((j<can)&&(control == false)){
                int identi = mat[i][j].getIdentificador();
                if(identi == unIdentificador){
                   ganador = mat[i][j].getEstudiante();
                   control = true;
                } else j++;
            }
            i++;
        }
        return ganador;
    }
    
    public int masPuntaje (int unaCategoria){
        int max = -1;
        int cancio = this.getCanciones();
        Cancion [][] mate = this.getMatriz();
        for(int i=0;i<cancio;i++){
            int puntaje = mate[unaCategoria-1][i].getPuntaje();
             if(puntaje > max){
                max = puntaje;
             }
        }
        return max;
    }
}
