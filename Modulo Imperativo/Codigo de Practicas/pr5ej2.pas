program ejercicio2;
type

  subAnio=2010..2018;
  cadena=string[80];
  
  auto=record
    patente:integer;
    fabricacion:subAnio;
    marca:cadena;
    modelo:cadena;
  end;
  
  arbol1=^nodo1;
  
  nodo1=record
    dato:auto;
    HI:arbol1;
    HD:arbol1;
  end;
  
  arbol2=^nodo2;
  
  lista=^nodo;
  
  nodo=record
    dato:auto;
    sig:lista;
  end;
  
  info=record
    marca:cadena;
    autos:lista;
  end;
  
  nodo2=record
    dato:info;
    HI:arbol2;
    HD:arbol2;
  end;
  
  listado=^noddo;
  
  noddo=record
    dato:auto;
    sig:listado;
  end;
  
  vecAutos=array[subAnio]of listado;

procedure incializaVector(var vect:vecAutos);
var
  i:subAnio;
begin
  for i:=2010 to 2018 do 
    vect[i]:= nil;
end;

procedure cargaEstructuras(var arb1:arbol1;var arb2:arbol2);

  procedure leeAuto(var a:auto);
  begin
    readln(a.patente);
    if(a.patente <> -1)then begin
      readln(a.fabricacion);
      readln(a.marca);
      readln(a.modelo);
    end;
  end;
  
  procedure cargaUno (var a1:arbol1;rec:auto);
  begin
    if(a1 = nil)then begin
      new(a1);
      a1^.dato:=rec;
      a1^.HI:=nil;
      a1^.HD:=nil;
    end
    else begin
      if(a1^.dato.patente >= rec.patente)then
        cargaUno(a1^.HI,rec)
      else
        cargaUno(a1^.HD,rec);
    end;
  end;
  
  
  procedure cargaDos (var a2:arbol2;reg:auto);
  
    procedure armaNodos(var lis:lista;info:auto);
    var
      nue:lista;
    begin
      new(nue);
      nue^.dato:=info;
      nue^.sig:=lis;
      lis:=nue;
    end;
    
  begin
    if(a2 = nil)then begin
      new(a2);
      a2^.dato.marca:=reg.marca;
      a2^.dato.autos:=nil;
      armaNodos(a2^.dato.autos,reg);
      a2^.HI:=nil;
      a2^.HD:=nil;
    end
    else begin
      if(a2^.dato.marca = reg.marca)then
        armaNodos(a2^.dato.autos,reg)
      else begin
        if(a2^.dato.marca >= reg.marca)then
            cargaDos(a2^.HI,reg)
        else
            cargaDos(a2^.HD,reg);
      end;
    end;
  end;
  
var
  aut:auto;
begin
  leeAuto(aut);
  while(aut.patente <> -1)do begin
    cargaUno(arb1,aut);
    cargaDos(arb2,aut);
    leeAuto(aut);
  end;
end;

procedure incisoB(a:arbol1;mar:cadena;var cant:integer);
begin
  if(a <> nil)then begin
    incisoB(a^.HI,mar,cant);
    if(a^.dato.marca = mar)then
       cant:=cant+ 1;
    incisoB(a^.HD,mar,cant);
  end;
end;

procedure incisoC(ar:arbol2;mark:cadena;var canti:integer);

  procedure cuentaAutos(l:lista;var ca:integer);
  begin
    while(l<>nil)do begin
      ca:=ca+1;
      l:=l^.sig;
    end;
  end;
  
begin
  if(ar <> nil)then begin
    if(ar^.dato.marca = mark)then
      cuentaAutos(ar^.dato.autos,canti)
    else begin
      if(ar^.dato.marca >= mark)then
         incisoC(ar^.HI,mark,canti)
      else 
        incisoC(ar^.HD,mark,canti);
    end;
  end;
end;

procedure incisoD(ab1:arbol1;var ve:vecAutos);

  procedure cargaListados(var ele:listado;au:auto);
  var
    nue:listado;
  begin
    new(nue);
    nue^.dato:=au;
    nue^.sig:=ele;
    ele:=nue;
  end;
  
begin
  if(ab1 <> nil)then begin
    incisoD(ab1^.HI,ve);
    cargaListados(ve[ab1^.dato.fabricacion],ab1^.dato);
    incisoD(ab1^.HD,ve);
  end;
end;

procedure incisoE(aUno:arbol1;pate:integer;var mode:cadena);
begin
  if(aUno = nil)then 
     writeln('arbol vacio')
  else begin
    if(aUno^.dato.patente = pate)then
      mode:=aUno^.dato.modelo
    else begin
      if(aUno^.dato.patente >= pate)then
        incisoE(aUno^.HI,pate,mode)
      else
        incisoE(aUno^.HD,pate,mode);
    end;
  end
end;

procedure incisoF(aDos:arbol2;paten:integer;var model:cadena;var okey:boolean);

  procedure busca(liste:lista;pat:integer;var mo:cadena;var oka:boolean);
  begin
    while(liste <> nil)and(oka = false)do begin
      if(liste^.dato.patente = pat)then begin
        mo:=liste^.dato.modelo;
        oka:= true;
      end;
      busca(liste^.sig,pat,mo,oka;
    end;
  end;

begin
  if(aDos <> nil)and(okey = false)then begin
    incisoF(aDos^.HI,paten,model,okey);
    busca(aDos^.dato.autos,paten,model,okey);
    incisoF(aDos^.HD,paten,model,okey);
  end;
end;

var                                                     //programa principal
  ar1:arbol1;
  ar2:arbol2;
  marca:cadena;
  cantidadB:integer;
  cantidadC:integer;
  vecto:vecAutos;
  patente:integer;
  modeloE:cadena;
  modeloF:cadena;
  ok:boolean;
begin
  ok:=false;
  cantidadC:=0;
  cantidadB:=0;
  ar1:=nil;
  ar2:=nil;
  incializaVector(vecto);
  cargaEstructuras(ar1,ar2);
  readln(marca);
  incisoB(ar1,marca,cantidadB);
  readln(marca);
  incisoC(ar2,marca,cantidadC);
  incisoD(ar1,vecto);
  readln(patente);
  incisoE(ar1,patente,modeloE);
  readln(patente);
  incisoF(ar2,patente,modeloF,ok);
  if(ok = false)then
    writeln('no hay modelo de auto con patente:',patente);
end.

//consultar si esta bien el inciso F y E
