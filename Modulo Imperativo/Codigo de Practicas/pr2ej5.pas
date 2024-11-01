program ejercicio5;
type 

   Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
   var
     medio:indice;
   begin
     medio:=(ini + fin)div 2;
     if(ini < fin)and(dato <> v[medio])then begin
        if(ini<=fin)and(dato = v[medio])then
           pos:=medio;
        else 
           pos:=-1;
        else begin
           if(dato < v[medio])then 
             fin:=medio-1
           else
             ini:=medio+1;
           medio:=(ini + fin)div 2;
           busquedaDicotomica(v,ini,fin,dato,pos);
        end;
     end;
   end;
   
var                                                                 //programa principal 
  vecto:vector;
  inicia,finaliza:indice;
  info:integer;
  posi:indice;
begin
  inicia:=1;
  finaliza:=20;
  readln(info);
  busquedaDicotomica(vecto,inicia,finaliza,info,posi);
end;


//REVISAR
