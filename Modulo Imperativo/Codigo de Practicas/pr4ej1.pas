program ejercicio1;
type
  venta=record
    codigoVenta:integer;
    codigoProducto:integer;
    cantUnidades:integer;
    precioUnitario:real;
  end;
  
  productos=record
    codigoP:integer;
    cantidad:integer;
    montoTotal:real;
  end;
  
  arbol=^nodo;
  
  nodo=record
    dato:productos;
    HI:arbol;
    HD:arbol;
  end;


procedure cargaProductos (var ar:arbol);

  procedure leeVenta(var v:venta);
  begin
    readln(v.codigoVenta);
    if(v.codigoVenta<>-1)then begin
      readln(v.codigoProducto);
      readln(v.cantUnidades);
      readln(v.precioUnitario);
    end;
  end;
  
  procedure agregaRama(var a:arbol;ve:venta);
  begin
    if(a=nil)then begin
      new(a);
      a^.dato.cantidad:=ve.cantUnidades;
      a^.dato.codigoP:=ve.codigoProducto;
      a^.dato.montoTotal:=ve.precioUnitario;
      a^.HI:=nil;
      a^.HD:=nil;
    end
    else begin
      if(a^.dato.codigoP = ve.codigoProducto)then begin
         a^.dato.cantidad:=a^.dato.cantidad + ve.cantUnidades;
         a^.dato.montoTotal:=a^.dato.montoTotal + (ve.cantUnidades * ve.precioUnitario);
      end
      else
        if(a^.dato.codigoP > ve.codigoProducto)then
           agregaRama(a^.HI,ve)
        else 
           agregaRama(a^.HD,ve);
     end;
  end;

var                                                   
  ven:venta;
begin
  leeVenta(ven);
  while(ven.codigoVenta<>-1)do begin
    agregaRama(ar,ven);
    leeVenta(ven);
  end;
end;

procedure Imprimir(arbo:arbol);

  procedure imprimeInfo(produ:productos);
  begin
    writeln(produ.codigoP);
    writeln(produ.cantidad);
    writeln(produ.montoTotal);
  end;
  
begin
  if(arbo=nil)then
    writeln('arbol vacio')
  else
    if(arbo<>nil)then begin
      Imprimir(arbo^.HI);
      imprimeInfo(arbo^.dato);
      Imprimir(arbo^.HD);
    end;
end;

procedure moduloC(arl:arbol;var codigoMas:integer;var mas:integer);

   procedure actualizaMaximo(cantid:integer;var codigMas:integer;var ms:integer);
   begin
     if(cantid >= mas)then begin
       codigMas:=arl^.dato.codigoP;
       ms:=arl^.dato.cantidad;
    end;
   end;
   
begin
  if(arl<>nil)then begin
    moduloC(arl^.HI,codigoMas,mas);                                  //hoja menor
    actualizaMaximo(arl^.dato.cantidad,codigoMas,mas);
    moduloC(arl^.HD,codigoMas,mas);                                 //hoja mayor
  end;
end;

procedure moduloD(ab:arbol;cod:integer;var cant:integer);
begin
  if(ab<>nil)then begin
    if(ab^.dato.codigoP > cod)then begin
      cant:=cant+1;
      moduloD(ab^.HI,cod,cant);
      moduloD(ab^.HD,cod,cant);
    end
    else
      moduloD(ab^.HD,cod,cant);
  end;
end;

function moduloE(arl:arbol;cod1,cod2:integer):real;
begin
  if(arl = nil)then 
    moduloE:=0
  else 
    if(arl^.dato.codigoP > cod1)then 
        moduloE:= moduloE + arl^.dato.montoTotal + moduloE(arl^.HI,cod1,cod2)+ moduloE(arl^.HD,cod1,cod2)
    else 
       if(arl^.dato.codigoP < cod2)then
          moduloE:=moduloE(arl^.HD,cod1,cod2);
end;

var                                                      //programa principal
  arbolProductos:arbol;
  codMas:integer;
  max:integer;
  cantidadMenores:integer;
  codigoD:integer;
  codE1,codE2:integer;
  montoTotal:real;
begin 
  cantidadMenores:=0;
  max:=-1;
  codMas:=0;
  arbolProductos:=nil;
  cargaProductos(arbolProductos);
  Imprimir(arbolProductos);
  moduloC(arbolProductos,codMas,max);
  readln(codigoD);
  moduloD(arbolProductos,codigoD,cantidadMenores);
  readln(codE1);
  readln(codE2);
  montoTotal:=moduloE(arbolProductos,codE1,codE2);
end.


