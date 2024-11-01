program ejercicio2;
type
  cadena=string[40];
  prestamo=record
    isbn:integer;
    numeroSocio:integer;
    diaMes:cadena;
    cantDias:integer;
  end;
  
  arbol1=^nodo;
  
  nodo=record
    dato:prestamo;
    HI:arbol1;
    HD:arbol1;
  end;
  
  lista=^nodo3;
  
  nodo3=record
    dato:prestamo;
    sig:lista;
  end;
  
  info=record
    isbn:integer;
    listado:lista;
  end;
  
  arbol2=^noddo;
  
  noddo=record
    dato:info;
    HI:arbol2;
    HD:arbol2;
  end;
  
  registro=record
    isbn:integer;
    cantTotal:integer;
  end;
  
  arbolNuevo=^nodo4;
  
  nodo4=record
    dato:registro;
    HI:arbolNuevo;
    HD:arbolNuevo;
  end;

procedure cargaEstructuras (var arbo1:arbol1;var arbo2:arbol2);

  procedure leePrestamo(var p:prestamo);
  begin
    readln(p.isbn);
    if(p.isbn<>-1)then begin
      readln(p.numeroSocio);
      readln(p.diaMes);
      readln(p.cantDias);
    end;
  end;
  
  procedure cargaPrimero(var a1:arbol1;pr:prestamo);
  begin
    if(a1=nil)then begin
      new(a1);
      a1^.dato:=pr;
      a1^.HI:=nil;
      a1^.HD:=nil
    end
    else 
      if(a1^.dato.isbn > pr.isbn)then
         cargaPrimero(a1^.HI,pr)
      else
         cargaPrimero(a1^.HD,pr);
  end;
  
  procedure cargaSegundo(var a2:arbol2;pres:prestamo);
  
    procedure agregaAdelante(var lis:lista;presta:prestamo);
    var 
      nue:lista;
    begin
      new(nue);
      nue^.dato:=presta;
      nue^.sig:=lis;
      lis:=nue;
    end;
    
  begin
    if(a2=nil)then begin
      new(a2);
      a2^.dato.isbn:=pres.isbn;
      a2^.dato.listado:=nil;
      agregaAdelante(a2^.dato.listado,pres);
      a2^.HI:=nil;
      a2^.HD:=nil;
    end
    else begin
      if(a2^.dato.isbn = pres.isbn)then
         agregaAdelante(a2^.dato.listado,pres)
      else begin
         if(a2^.dato.isbn > pres.isbn)then
            cargaSegundo(a2^.HI,pres)
         else
            cargaSegundo(a2^.HD,pres);
      end;
    end;
  end;
  
var
  pre:prestamo;
begin
  leePrestamo(pre);
  while(pre.isbn<>-1)do begin
     cargaPrimero(arbo1,pre);
     cargaSegundo(arbo2,pre);
     leePrestamo(pre);
  end;
end;

function moduloB(arboluno:arbol1):integer;
begin
  if(arboluno^.HD = nil)then
     moduloB:=arboluno^.dato.isbn
  else 
     moduloB:= moduloB(arboluno^.HD);
end;

function moduloC (arboldos:arbol2):integer;
begin
  if(arboldos^.HI=nil)then
     moduloC:=arboldos^.dato.isbn
  else 
    moduloC:=moduloC(arboldos^.HI);
end;

function moduloD(a:arbol1;num:integer):integer;
begin
  if(a=nil)then
    moduloD:=0
  else begin
    if(a<>nil)then begin
      if(a^.dato.numeroSocio = num)then
        moduloD:= moduloD + 1;
      moduloD:= moduloD + moduloD(a^.HI,num); 
      moduloD:= moduloD + moduloD(a^.HD,num);
    end;
  end;
end;

procedure moduloE(ar:arbol2;nume:integer;var canti:integer);

  procedure calculaPrestamos (li:lista;n:integer;var can:integer);
  begin
    while(li<>nil)do begin
      if(li^.dato.numeroSocio = n)then 
        can:=can+1;
      li:=li^.sig;
    end;
  end;
begin
  if(ar<>nil)then begin
    moduloE(ar^.HI,nume,canti);
    calculaPrestamos(ar^.dato.listado,nume,canti);
    moduloE(ar^.HD,nume,canti);
  end;
end;

procedure moduloF(aUno:arbol1;var arNuevo:arbolNuevo);

  procedure armaRamas(codLibro:integer;var arbolN:arbolNuevo);
  begin
    if(arbolN=nil)then begin
      new(arbolN);
      arbolN^.dato.isbn:=codLibro;
      arbolN^.dato.cantTotal:=1;
      arbolN^.HI:=nil;
      arbolN^.HD:=nil;
    end
    else begin
      if(arbolN^.dato.isbn = codLibro)then
        arbolN^.dato.cantTotal:=arbolN^.dato.cantTotal+1
      else begin
        if(arbolN^.dato.isbn > codLibro)then
           armaRamas(codLibro,arbolN^.HI)
        else
           armaRamas(codLibro,arbolN^.HD);
     end;
    end;
  end;

begin
  if(aUno<>nil)then begin
    moduloF(aUno^.HI,arNuevo);
    armaRamas(aUno^.dato.isbn,arNuevo);
    moduloF(aUno^.HD,arNuevo);
  end;
end;

procedure moduloG(aDos:arbol2;var otroArbol:arbolNuevo);

  procedure cargaOtro(rec:info;var otroAr:arbolNuevo);
  
    procedure agregaHoja(numLibro:integer;var otroA:arbolNuevo);
    begin
      if(otroA=nil)then begin
        new(otroA);
        otroA^.dato.isbn:=numLibro;
        otroA^.dato.cantTotal:=1;
        otroA^.HI:=nil;
        otroA^.HD:=nil;
      end
      else begin
        if(otroA^.dato.isbn = numLibro)then
           otroA^.dato.cantTotal:=otroA^.dato.cantTotal +1
        else begin
           if(otroA^.dato.isbn > numLibro)then
             agregaHoja(numLibro,otroA^.HI)
           else
             agregaHoja(numLibro,otroA^.HD);
        end;
      end;
    end;
    
  begin
    while(rec.listado<>nil)do begin
      agregaHoja(rec.isbn,otroAr);
      rec.listado:=rec.listado^.sig;
    end;
  end;
  
begin
   if(aDos<>nil)then begin
     moduloG(aDos^.HI,otroArbol);
     cargaOtro(aDos^.dato,otroArbol);
     moduloG(aDos^.HD,otroArbol);
   end;
end;

procedure moduloH(otroA:arbolNuevo);
begin
  if(otroA<>nil)then begin
    moduloH(otroA^.HI);
    writeln(otroA^.dato.isbn);
    writeln(otroA^.dato.cantTotal);
    moduloH(otroA^.HD);
  end;
end;

function moduloI(atro:arbolNuevo;is1,is2:integer):integer;
begin
  if(atro=nil)then
    moduloI:=0
  else begin
    if(atro^.dato.isbn >= is1)and(atro^.dato.isbn =< is2)then
      moduloI:=moduloI+1 + moduloI(atro^.HI,is1,is2) + moduloI(atro^.HD,is1,is2)
    else begin
      if(atro^.dato.isbn >= is1)then 
        moduloI:=moduloI(atro^.HI,is1,is2)
      else
        moduloI:=moduloI(atro^.HD,is1,is2);
   end;
  end;
end;

function moduloJ (arDos:arbol2;dato1,dato2:integer):integer;

  procedure cuentaPrestamos(ls:lista;var cant:integer);
  begin
    while(ls<>nil)do begin
      cant:=cant+1;
      ls:=ls^.sig;
    end;
  end;
  
var
  cuenta:integer;
begin
  if(arDos=nil)then
    moduloJ:=0
  else begin
    if(arDos^.dato.isbn >= dato1)then begin
      cuentaPrestamos(arDos^.dato.listado,cuenta);
      moduloJ:= moduloJ + cuenta + moduloJ(arDos^.HI,dato1,dato2) + moduloJ(arDos^.HD,dato1,dato2);
    end
    else begin
      if(arDos^.dato.isbn <= dato2)then
        moduloJ:=moduloJ(arDos^.HD,dato1,dato2);
    end;
  end;
end;

var                                           //programa principal
  ar1:arbol1;
  ar2:arbol2;
  IsbnMasGrande:integer;
  IsbnMasChico:integer;
  numeroSocio:integer;
  prestamoSocio:integer;
  cantidadSocio:integer;
  aNuevo:arbolNuevo;
  aOtro:arbolNuevo;
  cantidadUno:integer;
  isbn1,isbn2:integer;
  cantidadDos:integer;
begin 
  cantidadDos:=0;
  cantidadUno:=0;
  IsbnMasGrande:=0;
  IsbnMasChico:=0;
  prestamoSocio:=0;
  aOtro:=nil;
  aNuevo:=nil;
  prestamoSocio:=0;
  cantidadSocio:=0;
  ar1:=nil;
  ar2:=nil;
  cargaEstructuras(ar1,ar2);
  if(ar1<>nil)then
    IsbnMasGrande:= moduloB(ar1);
  if(ar2<>nil)then
    IsbnMasChico:= moduloC(ar2);
  readln(numeroSocio);
  prestamoSocio:=moduloD(ar1,numeroSocio);
  readln(numeroSocio);
  moduloE(ar2,numeroSocio,cantidadSocio);
  moduloF(ar1,aNuevo);
  moduloG(ar2,aOtro);
  moduloH(aOtro);
  readln(isbn1);
  readln(isbn2);
  cantidadUno:= moduloI(aOtro,isbn1,isbn2);
  readln(isbn1);
  readln(isbn2);
  cantidadDos:= moduloJ(ar2,isbn1,isbn2);
end.

//consultar no compila por variables "no usadas"

//revisar I y J

