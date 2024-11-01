program ejercicio4;
type
  reclamo=record
    codigo:integer;
    dni:integer;
    anio:integer;
    tipo:string;
  end;
  
  arbol=^nodo;
  
  lista=^noddo;
  
  noddo=record
    dato:reclamo;
    sig:lista;
  end;
  
  info=record
    dni:integer;
    cantidad:integer;
    reclamos:lista;
  end;
  
  nodo=record
    dato:info;
    HI:arbol;
    HD:arbol;
  end;
  
  listado=^nodo1;
  
  nodo1=record
    dato:integer;
    sig:listado;
  end;
  
procedure cargaInfo(var inf:arbol);

  procedure leeReclamos(var r:reclamo);
  begin
    readln(r.codigo);
    if(r.codigo <> -1)then begin
       readln(r.dni);
       readln(r.anio);
       readln(r.tipo);
    end;
  end;
  
  procedure armaRamas(var ar:arbol;re:reclamo);
    
    procedure agregaReclamo(var lis:lista;recla:reclamo);
    var
      nue:lista;
    begin
      new(nue);
      nue^.dato:=recla;
      nue^.sig:=lis;
      lis:=nue;
    end;
    
  begin
    if(ar = nil)then begin
      new(ar);
      ar^.dato.cantidad:=1;
      ar^.dato.dni:=re.dni;
      ar^.dato.reclamos:=nil;
      agregaReclamo(ar^.dato.reclamos,re);
      ar^.HI:=nil;
      ar^.HD:=nil;
    end
    else begin
      if(ar^.dato.dni = re.dni)then begin
        ar^.dato.cantidad:=ar^.dato.cantidad+1;
        agregaReclamo(ar^.dato.reclamos,re);
      end
      else begin
        if(ar^.dato.dni >= re.dni)then
          armaRamas(ar^.HI,re)
        else 
          armaRamas(ar^.HD,re);
      end;
    end;
  end;
  
var
  rec:reclamo;
begin
  leeReclamos(rec);
  while(rec.codigo <> -1)do begin
    armaRamas(inf,rec);
    leeReclamos(rec);
  end;
end;

function incisoB(a:arbol;documento:integer):integer;
begin
  if(a=nil)then
    incisoB:=0
  else begin
    if(a^.dato.dni = documento)then 
      incisoB:= a^.dato.cantidad
    else begin
      if(a^.dato.dni >= documento)then 
         incisoB:=incisoB(a^.HI,documento)
      else
         incisoB:=incisoB(a^.HD,documento);
    end;
  end;
end;

procedure incisoC(arb:arbol;var cant:integer;doc1,doc2:integer);
begin
  if(arb = nil)then
    cant:=0
  else begin
    if(arb^.dato.dni >= doc1)and(arb^.dato.dni <= doc2)then
       cant:= cant + arb^.dato.cantidad + incisoC(arb^.HI,cant,doc1,doc2) + incisoC(arb^.HD,cant,doc1,doc2)
    else begin
      if(arb^.dato.dni >= doc1)then
         incisoC(arb^.HI,cant,doc1,doc2)
      else
         incisoC(arb^.HD,cant,doc1,doc2);
    end;
  end;
end;

procedure incisoD(ab:arbol;var li:Listado;fecha:integer);

  procedure analizaReclamos(l:lista;var listad:listado;fech:integer);
  
    procedure cargaDato(var ele:listado;codi:integer);
    var
      nue:listado;
    begin
      new(nue);
      nue^.dato:=codi;
      nue^.sig:=ele;
      ele:=nue;
    end;
    
  begin
    while(l<>nil)do begin
       if(l^.dato.anio = fech)then
         cargaDato(listad,l^.dato.codigo);
       l:=l^.sig;
    end;
  end;
  
begin
  if(ab <> nil)then begin
    incisoD(ab^.HI,li,fecha);
    analizaReclamos(ab^.dato.reclamos,li,fecha);
    incisoD(ab^.HD,li,fecha);
  end;
end;

var                                                           //programa principal
  informacion:arbol;
  dni:integer;
  cuenta:integer;
  docu1,docu2:integer;
  cantidadEntreDni:integer;
  lisAnios:listado;
  anio:integer;
begin
  lisAnios:=nil;
  cuenta:=0;
  cantidadEntreDni:=0;
  informacion:=nil;
  cargaInfo(informacion);
  readln(dni);
  cuenta:=incisoB(informacion,dni);
  readln(docu1);
  readln(docu2);
  incisoC(informacion,cantidadEntreDni,docu1,docu2);
  readln(anio);
  incisoD(informacion,lisAnios,anio);
end.


//da error en la linet 118 "overloaded" 
