program parcial;
type
  subDia=0..31;
  subMes=1..12;
  subHoras=1..8;
  registro=record
    numeroEmpleado:integer;
    dia:subDia;
    mes:subMes;
    horas:subHoras;
  end;
  
  arbol=^nodo;
  
  nodo=record
    dato:registro;
    HI:arbol;
    HD:arbol;
  end;
  
  lista=^noddo;
  
  noddo=record
    dato:registro;
    sig:lista;
  end;
  
procedure cargaInformacion(var infoEm:arbol);

  procedure leeRegistro(var r:registro);
  begin
    readln(r.dia);
    if(r.dia <> 0)then begin
       readln(r.numeroEmpleado);
       readln(r.mes);
       readln(r.horas);
    end;
  end;
  
  procedure cargaRamas(var ar:arbol;regi:registro);
  begin
    if(ar = nil)then begin
      new(ar);
      ar^.dato:=regi;
      ar^.HI:=nil;
      ar^.HD:=nil
    end
    else begin
      if(ar^.dato.numeroEmpleado >= regi.numeroEmpleado)then 
         cargaRamas(ar^.HI,regi)
      else 
         cargaRamas(ar^.HD,regi);
    end;
  end;
  
var
  reg:registro;
begin
  leeRegistro(reg);
  while(reg.dia <> 0)do begin
    cargaRamas(infoEm,reg);
    leeRegistro(reg);
  end;
end;

procedure incisoB(a:arbol;pos1,pos2:integer;var lis:lista);

  procedure agregaAdelante(var l:lista;info:registro);
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
    if(a^.dato.numeroEmpleado >= pos1)then begin
       if(a^.dato.numeroEmpleado <= pos2)then begin
         agregaAdelante(lis,a^.dato);
         incisoB(a^.HI,pos1,pos2,lis);
         incisoB(a^.HD,pos1,pos2,lis);
       end
       else
         incisoB(a^.HI,pos1,pos2,lis);
    end
    else 
      incisoB(a^.HD,pos1,pos2,lis);
  end;
end;

procedure incisoC(arbo:arbol;var cant:integer);
begin
  if(arbo <> nil)then begin
    incisoC(arbo^.HI,cant);
    cant:= cant + arbo^.dato.horas;
    incisoC(arbo^.HD,cant);
  end;
end;

var                                                              //Programa Principal
  infoEmpleados:arbol; 
  x,y:integer;
  list:lista;
  cantidad:integer;
begin
  cantidad:=0;
  list:=nil;
  infoEmpleados:=nil;
  cargaInformacion(infoEmpleados);
  readln(x);
  readln(y);
  incisoB(infoEmpleados,x,y,list);
  incisoC(infoEmpleados,cantidad);
end.
