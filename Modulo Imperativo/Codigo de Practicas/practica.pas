procedure OrdenacionVectores;
type
  vecto=array[1..10] of integer;
  

procedure inicializa(var vec:vector);
var
  i:integer;
begin
  for i:=1 to 10 do 
    vec[i]:=0;
end;

procedure cargaVector(var v:vector);
var
  i:integer;
  numero:integer;
begin
  for i:=1 to 10 do begin
    writeln('ingrese un numero');
    readln(numero);
    v[i]:=numero
  end;
end;

procedure metodoSeleccion(var vect:vector);
var
  i,j,pos:integer;
  item:integer;
  diml:integer;
begin
  diml:=10;
  for i:=1 to (diml-1) do begin
    pos:=vect[i];
    for j:=(i+1) to diml do begin
      if(vect[j] < vect[pos])then 
        pos:=j;
    end;
    item:=vect[pos];
    vect[pos]:=vect[i];
    vect[i]:=item;
  end;
end;

procedure eliminaEntrePuntos(var vt:vector;posInf,posSup:integer);
var
  salto:integer;
  i:integer;
  diml:integer;
begin
  diml:=10;
  salto:=posSup - posInf;
  for i:=(posSup + 1) to diml do 
    vt[i-salto]:=vt[i];
  diml:=diml - salto;
end;

procedure cuentaEntreDos (a:arbol;codigo1,codigo2:integer;var cant:integer);
begin
  if(a <>  nil)then begin
    if(a^.dato.codigo >= codigo1)and(a^.dato.codigo =< codigo2)then begin
       cant:=cant+1;
       cuentaEntreDos(a^.HI,codigo1,codigo2,cant);
       cuentaEntreDos(a^.HD,codigo1,codigo2,cant);
    end
    else begin
      if(a^.dato.codigo >= codigo1)then 
        cuentaEntreDos(a^.HI,codigo1,codigo2,cant)
      else
        cuentaEntreDos(a^.HD,codigo1,codigo2,cant);
    end;
  end;
end;

procedure retorna(a:arbol;var lis:lista;puntoX,puntoY:integer);

  procedure agregaAdelante(var l:lista;info:venta);
  var
    nue:lista;
  begin
    new(nue);
    nue^.dato:=info;
    nue^.sig:=l;
    l:=nue;
  end;
  
begin
  if(a <> nil)then begin
    if(a^.dato.numeroFactura >= puntoX)then begin
      if(a^.dato.numeroFactura <= puntoY)then begin
        agregaAdelante(lis,a^.dato);
        retorna(a^.HI,lis,puntoX,puntoY);
        retorna(a^.HD,lis,puntoX,puntoY);
      end
      else
        retorna(a^.HI,lis,puntoX,puntoY);
    end
    else
      retorna(a^.HD,lis,puntoX,puntoY);
  end;
end;

var
  ve:vector;
  posInferior,posSuperior:integer;
  arb:arbol;
  cod1,cod2:integer;
  cantidad:integer;
begin
  cantidad:=0;
  arb:=nil;
  inicializa(ve);
  cargaVector(ve);
  metodoSeleccion(ve);
  writeln('ingrese una posicion INFERIOR para eliminar');
  readln(posInferior);
  writeln('ingrese una posicion SUPERIOR para eliminar');
  readln(posSuperior);
  eliminaEntrePuntos(ve,posInferior,posSuperior);
  cuentaEntreDos(arb,cod1,cod2,cantidad);
  retorna(arb,listaVentas,x,y);
end.
