program ejercicio1;
type
   subCodigo=1..300;
   oficina=record
     codigo:integer;
     dni:integer;
     valor:real;
   end;
   vector=array[subCodigo]of oficina;
   
procedure cargaVector(var vec:vector;var dim:integer);

  procedure leeOficina(var o:oficina);
  begin
    writeln('ingrese un codigo de oficina');
    readln(o.codigo);
    if(o.codigo <> -1)then begin
      writeln('ingrese el dni del propietario');
      readln(o.dni);
      writeln('ingrese el valor de las expensas');
      readln(o.valor);
    end;
  end;
  
var
  ofi:oficina;
begin
  leeOficina(ofi);
  while(ofi.codigo <> -1)and(dim < 300)do begin
    dim:=dim+1;
    vec[dim]:=ofi;
    leeOficina(ofi);
  end;
end;

procedure ordenaVector(var ve:vector;diml:integer);
var
  i,j,pos:subCodigo;
  item:oficina;
begin
  for i:=1 to diml-1 do begin
    pos:=i;
    for j:=i+1 to diml do begin
      if(ve[j].codigo < ve[pos].codigo)then 
        pos:=j;
    end; 
    item:=ve[pos];
    ve[pos]:=ve[i];
    ve[i]:=item;
  end;
end;

procedure busqueda(v:vector;dl:integer;cod:integer;var okey:boolean;var dni:integer);
var
  pri,ult,medio:integer;
begin
  pri:=1;
  ult:=dl;
  medio:=(pri + ult)div 2;
  while(pri <= ult)and(cod <> v[medio].codigo)do begin
    if(cod < v[medio].codigo)then
      ult:=medio-1
    else
      pri:=medio+1;
    medio:=(pri + ult)div 2;
    if(pri <= ult)and(cod = v[medio].codigo)then  begin
      okey:=true;
      dni:=v[medio].dni;
    end;
  end;
end;

function calculaMonto(ve:vector; dil:integer):real;
begin
  if(dil = 0)then
    calculaMonto:=0
  else  
    if(dil > 0)then 
      calculaMonto:= calculaMonto + ve[dil].valor + calculaMonto(ve,dil-1);
end;

var                                                                           //Programa Principal
  dimension:integer;
  codigo:integer;
  ok:boolean;
  vecto:vector;
  propietario:integer;
  montoTotal:real;
begin
  propietario:=0;
  ok:=false;
  dimension:=0;
  cargaVector(vecto,dimension);
  ordenaVector(vecto,dimension);
  writlen('ingresa el codigo de una oficina a buscar');
  readln(codigo);
  busqueda(vecto,dimension,codigo,ok,propietario);
  if(ok = true)then
    writeln('dni del propietario de la oficina:',codigo,'=',propietario)
  else
    writeln('no se encontro la oficina');
  montoTotal:= calculaMonto(vecto,dimension);
end.

//corregir, solo carga los datos en el vector
