program parcial;
type
  subDia=1..31;
  subMes=1..12;
  compra=record
    codigoJuego:integer;
    codigoCliente:integer;
    dia:subDia;
    mes:subMes;
  end;
  
  arbol=^nodo;
  
  nodo=record
    dato:compra;
    HI:arbol;
    HD:arbol;
  end;
  
  vector=array[subMes]of integer;
  
  lista=^nodo1;
  
  detalle=record
    codigoJuego:integer;
    Dia:subDia;
    Mes:subMes;
  end;
  
  nodo1=record
    dato:detalle;
    sig:lista;
  end;
  
  infoCliente=record
    codigo:integer;
    compras:lista;
  end;

procedure inicializaVector(var vec:vector);
var
  i:subMes;
begin
  for i:=1 to 12 do 
    vec[i]:=0;
end;

procedure cargaInformacion (var ar:arbol;var ve:vector);

  procedure leeCompra(var c:compra);
  begin
    c.codigoCliente:=Random(100);
    if(c.codigoCliente <> 0)then begin
      c.dia:=Random(31)+1;
      c.mes:=Random(12)+1;
      c.codigoJuego:=Random(2000)+1;
    end;
  end;
  
  procedure cargaArbol(var a:arbol;comp:compra);
  begin
    if(a = nil)then begin
      new(a);
      a^.dato:=comp;
      a^.HI:=nil;
      a^.HD:=nil;
    end
    else  begin
      if(a^.dato.codigoCliente >= comp.codigoCliente)then 
         cargaArbol(a^.HI,comp)
      else
         cargaArbol(a^.HD,comp);
    end;
  end;
  
var
  com:compra;
begin
  leeCompra(com);
  while(com.codigoCliente <> 0)do begin
    cargaArbol(ar,com);
    ve[com.mes]:=ve[com.mes]+1;
    leeCompra(com);
  end;
end;

procedure incisoB(arbo:arbol;codi:integer;var inf:infoCliente);

  procedure agregaCompra(var lis:lista; juego:integer;day:subDia;month:subMes);
  var
    nue:lista; 
  begin
    new(nue);
    nue^.dato.codigoJuego:=juego;
    nue^.dato.dia:=day;
    nue^.dato.mes:=month;
    nue^.sig:=lis;
    lis:=nue;
  end;
 
begin
  if(arbo <> nil)then begin
    if(arbo^.dato.codigoCliente = codi)then
       agregaCompra(inf.compras,arbo^.dato.codigoJuego,arbo^.dato.dia,arbo^.dato.mes)
    else begin
       if(arbo^.dato.codigoCliente >= codi)then
          incisoB(arbo^.HI,codi,inf)
       else
          incisoB(arbo^.HD,codi,inf);
    end;
  end;
end;

procedure ordenaVector(var v:vector);                  //ordena vector seleccionando
var
  i,j,pos:subMes;
  item:integer;
begin
  for i:=1 to 11 do begin
    pos:=i;
    for j:=i+1 to 12 do begin
      if(v[j]>v[pos])then 
         pos:=j;
    end;
    item:=v[pos];
    v[pos]:=v[i];
    v[i]:=item;
  end;
end;

var                                                    //programa principal.
  vecto:vector;
  informacionCompras:arbol;
  codigo:integer;
  comprasDelCliente:infoCliente;
begin
  informacionCompras:=nil;
  inicializaVector(vecto);
  cargaInformacion(informacionCompras,vecto);
  readln(codigo);
  comprasDelCliente.codigo:=codigo;
  incisoB(informacionCompras,codigo,comprasDelCliente);
  ordenaVector(vecto);
end.
