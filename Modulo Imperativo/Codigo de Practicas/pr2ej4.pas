program ejercicio4;
type
  subNumeros=1..99;
  vector=array[1..20]of subNumeros;
  

procedure cargaVector(var vec:vector;var dimL:integer);
var
  num:subNumeros;
begin
  randomize;
  num:=random(99);
  if(dimL<20)then begin
    vec[dimL]:=num;
    dimL:=dimL+1;
    cargaVector(vec,dimL);
  end;
end;

procedure devuelveMaximo (ve:vector;dl:integer;var indic:integer;var max:subNumeros);
begin
  if(indic < dl)then begin
    if(ve[dl] > max)then 
       max:=ve[dl];
    indic:=indic+1;
    devuelveMaximo(ve,dl,indic,max);
  end;
end;

procedure devuelveSuma (v:vector;dim:integer;var indi:integer;var sum:integer);
begin
  if(indi<dim)then begin
    sum:=sum + v[indi];
    indi:=indi+1;
    devuelveSuma(v,dim,indi,sum);
  end;
end;

var                                          //programa principal
  vecto:vector;
  dl:integer;
  maximo:subNumeros;
  indice:integer;
  suma:integer;
begin
  suma:=0;
  indice:=1;
  maximo:=1;
  dl:=0;
  cargaVector(vecto,dl);                      //inciso A
  devuelveMaximo(vecto,dl,indice,maximo);     //inciso B
  indice:=1;
  devuelveSuma(vecto,dl,indice,suma);         //inciso C
end.
