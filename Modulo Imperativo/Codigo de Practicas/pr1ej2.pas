program ejercicio2;
type
  oficina = record
    codigo:integer;
    dni:integer;
    valor:real;
  end;
  vector = array[1..300] of oficina;

procedure cargaVectorOficinas (var ve:vector;var dimL:integer);

  procedure leeOficina (var o:oficina);
  begin 
     writeln('ingrese un codigo');
     readln(o.codigo);
     if(o.codigo <> -1)then begin
        writeln('ingrese un dni');
        readln(o.dni);
        writeln('ingrese un valor');
        readln(o.valor);
        writeln('----------------');
     end;
  end;

var
   ofi:oficina;
begin
   leeOficina(ofi);
   while((dimL < 300)and(ofi.codigo <> -1))do begin
      dimL:=dimL +1;
      ve[dimL]:= ofi;
      leeOficina(ofi);
   end;
end;

procedure metodoIncersion (var v:vector; dim:integer);
var 
  i,j:integer;
  actual:oficina;
begin
  for i:=2 to dim do begin
     actual:=v[i];
     j:=i-1;
     while(j>0)and(v[j].codigo > actual.codigo)do begin
        v[j+1]:=v[j];
        j:=j-1;
     end;
     v[j+1]:=actual;
  end;
end;

{procedure imprime (t:vector; dil:integer);
var
  i:integer;
begin
  for i:=1 to dil do begin
     writeln(t[i].codigo);
     writeln('-----------');
   end;
end;}
procedure metodoSeleccion (var vet:vector; dl:integer);
var
  i,j,pos:integer;
  item:oficina;
begin
  for i:=1 to dl-1 do begin
     pos:=i;
     for j:=i+1 to dl do begin
       if(vet[j].codigo < vet[pos].codigo)then
           pos:=j;
     end;
     item:=vet[pos];
     vet[pos]:=vet[i];
     vet[i]:=item;
  end;
end;

var                                                       //programa principal
  vect:vector;
  dimension:integer;
begin
  dimension:=0;
  cargaVectorOficinas(vect,dimension);
  metodoIncersion(vect,dimension);
  metodoSeleccion(vect,dimension);
  //imprime(vect,dimension);
end.
