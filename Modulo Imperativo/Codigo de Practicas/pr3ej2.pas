program ejercicio2;
type
  venta=record
    codigo:integer;
    fecha:integer;
    cantVendidas:integer;
  end;
  arbol=^nodo;
  nodo=record
    dato:venta;
    HI:arbol;
    HD:arbol;
  end;
  
  
  informacion=record
     codigo:integer;
     cantidadVendidas:integer;
  end;
  arbol2=^nodo2;
  nodo2=record 
    dato:informacion;
    HI:arbol2;
    HD:arbol2;
  end;

procedure cargaABB (var arb:arbol);

  procedure leeVenta(var v:venta);
  begin
    writeln('ingrese un codigo');
    readln(v.codigo);
    if(v.codigo <> 0)then begin
       writeln('ingrese la cantidad vendidas');
       readln(v.cantVendidas);
       writeln('ingrese la fecha de venta');
       readln(v.fecha);
    end;
  end;
  
  procedure agregaArbol(var a:arbol;info:venta);
  begin
    if(a=nil)then begin
       new(a);
       a^.dato:=info;
       a^.HI:=nil;
       a^.HD:=nil;
    end
    else begin
       if(a^.dato.codigo>=info.codigo)then
           agregaArbol(a^.HI,info)
       else
           agregaArbol(a^.HD,info);
    end;
  end;
  
var
  vent:venta;
begin
  leeVenta(vent);
  while(vent.codigo<>0)do begin
     agregaArbol(arb,vent);
     leeVenta(vent);
  end;
end;

procedure generaNuevo(arl:arbol;var arl2:arbol2);

  procedure vaCargandoNuevo(var aNuevo:arbol2;codi,cantidad:integer);
  begin
    if(aNuevo=nil)then begin
      new(aNuevo);
      aNuevo^.dato.codigo:=codi;
      aNuevo^.dato.cantidadVendidas:=cantidad;
      aNuevo^.HI:=nil;
      aNuevo^.HD:=nil;
    end
    else  begin
     if(aNuevo^.dato.codigo=codi)then
       aNuevo^.dato.cantidadVendidas:=aNuevo^.dato.cantidadVendidas + cantidad
     else 
       if(aNuevo^.dato.codigo>codi)then
           vaCargandoNuevo(aNuevo,codi,cantidad)
       else
           vaCargandoNuevo(aNuevo,codi,cantidad);
    end;
  end;
  
begin
  if(arl<>nil)then begin
    generaNuevo(arl^.HI,arl2);
    vaCargandoNuevo(arl2,arl^.dato.codigo,arl^.dato.cantVendidas);
    generaNuevo(arl^.HD,arl2);
  end;
end;

function cuenta (ab:arbol;cod:integer):integer;
begin
  cuenta:=0;
  if(ab<>nil)then begin
    if(ab^.dato.codigo=cod)then
       cuenta:=cuenta+1; 
    if(ab^.dato.codigo >= cod)then
        cuenta(ab^.HI,cod)
    else
        cuenta(ab^.HD,cod);
  end;
end;

procedure cuentaNuevo (ak:arbol2;codi:integer;var canti:integer);
begin
  if(ak<>nil)then begin
    if(ak^.dato.codigo=codi)then
       canti:=canti+1; 
    if(ak^.dato.codigo > codi)then
        cuentaNuevo(ak^.HI,codi,canti)
    else
        cuentaNuevo(ak^.HD,codi,canti);
  end;
end;

var                                            //programa principal
  arbo:arbol;
  arbolNuevo:arbol2;
  codigoProducto1,codigoProducto2:integer;
  cantidadIncisoB:integer;
  cantidadIncisoC:integer;
begin
  arbo:=nil;
  arbolNuevo:=nil;
  cargaABB(arbo);                                             //A i)
  generaNuevo(arbo,arbolNuevo);                               //A ii)
  readln(codigoProducto1);
  cantidadIncisoB:=cuenta(arbo,codigoProducto1);              //B
  readln(codigoProducto2);
  cuentaNuevo(arbolNuevo,codigoProducto2,cantidadIncisoC);    //C
end.


