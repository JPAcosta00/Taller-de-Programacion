program ejercicio3;
type
  subNota=-1..10;
  subMateria=1..30;
  
  finales=record
    codAlumno:integer;
    codMateria:subMateria;
    nota:subNota;
  end;

  vector=array[1..30]of subNota;
  info=record
    codigo:integer;
    materias:vector;
    dimL:integer;
  end;
  
  arbol=^nodo;
  
  nodo=record
    dato:info;
    HI:arbol;
    HD:arbol;
  end;
  
  lista=^nodo3;
  
  info3=record
    codMateria:subMateria;
    nota:subNota;
  end;
  
  nodo3=record
    dato:info3;
    sig:lista;
  end;
  
  vectorMaterias=array[subMateria]of lista;

  listado=^noodo;
  
  nuevaInfo=record
    codigo:integer;
    promedio:real;
  end;
  
  noodo=record
    dato:nuevaInfo;
    sig:listado;
  end;

procedure inicializaSegundo(var vs:vectorMaterias);
var
  i:subMateria;
begin
  for i:=1 to 30 do 
     vs[i]:=nil;
end;
   
procedure cargaEstructuras(var prime:arbol;var segun:vectorMaterias);

  procedure leeFinales (var f:finales);
  begin
    readln(f.nota); 
    if(f.nota <> -1)then begin
      readln(f.codAlumno);
      readln(f.codMateria);
    end;
  end;
  
  procedure cargaPrimero(var pr:arbol;registro:finales);
  begin
    if(pr=nil)then begin
      new(pr);
      pr^.dato.codigo:=registro.codAlumno;
      pr^.dato.materias[registro.codMateria]:=registro.nota;
      pr^.dato.dimL:=1;
      pr^.HI:=nil;
      pr^.HD:=nil;
    end
    else begin
         if(pr^.dato.codigo = registro.codAlumno)then begin
            pr^.dato.materias[registro.codMateria]:=registro.nota;
            pr^.dato.dimL:=pr^.dato.dimL+1;
         end
         else begin
           if(pr^.dato.codigo > registro.codAlumno)then
             cargaPrimero(pr^.HI,registro)
           else
             cargaPrimero(pr^.HD,registro);
         end;
    end;
  end;
  
  procedure cargaSegundo(var lisMateria:lista;fina:finales);
  var
    nue:lista;
  begin
    new(nue);
    nue^.dato.codMateria:=fina.codMateria;
    nue^.dato.nota:=fina.nota;
    nue^.sig:=lisMateria;
    lisMateria:=nue;
  end;
  
var
  fin:finales;
begin
  leeFinales(fin);
  while(fin.nota <> -1)do begin
    if(fin.nota >= 4 )then
      cargaPrimero(prime,fin);
    cargaSegundo(segun[codMateria],fin);
    leeFinales(fin);
  end;
end;

procedure moduloB(arb:arbol;var li:listado;codA:integer);

  procedure agregaDatos(var l:listado;infor:info);
  
    procedure calculaPromedio(ve:vector;dimen:integer;var sum:integer);
    var
      i:integer;
    begin
      for i:=1 to dimen do 
        sum:=sum + ve[i];
    end;
    
  var
    nue:listado;
    pro:real;
    suma:integer;
  begin
    suma:=0;
    calculaPromedio(infor.materias,infor.dimL,suma);
    pro:=suma/infor.dimL;
    new(nue);
    nue^.dato.codigo:=infor.codigo;
    nue^.dato.promedio:=pro;
    nue^.sig:=l;
    l:=nue;
  end;
  
begin
  if(arb=nil)then
    li^.dato.codigo:=-1
  else begin
    if(arb^.dato.codigo > codA)then begin
       agregaDatos(li,arb^.dato);
       moduloB(arb^.HI,li,codA);
       moduloB(arb^.HD,li,codA);
    end
    else 
       moduloB(arb^.HD,li,codA);
  end;
end;

function moduloC(a:arbol;cod1,cod2,val:integer):integer;
  
  procedure calculaAprobados(vec:vector;dimen:integer;var ap:integer);
  var
    i:integer;
  begin
    for i:=1 to dimen do 
      ap:=ap+1;
  end;
  
var
  apro:integer;
begin 
  apro:=0;
  if(a=nil)then
    moduloC:=0
  else
     if(a^.dato.codigo > cod1)then begin
        calculaAprobados(a^.dato.materias,a^.dato.dimL,apro);
        if(apro = val)then
           moduloC:= moduloC+1 + moduloC(a^.HI,cant,cod1,cod2,val)+ moduloC(a^.HD,cant,cod1,cod2,val);
     end
     else
       if(a^.dato.codigo < cod2)then
           moduloC:= moduloC(a^.HD,cant,cod1,cod2,val);
  end;
end;

var                                   //programa principal
  primero:arbol;
  segundo:vectorMaterias;
  list:listado;
  codigoAlumno:integer;
  codigo1,codigo2:integer;
  valor:integer;
  cantidadIncisoC:integer;
begin
  cantidadIncisoC:=0;
  list:=nil;
  primero:=nil;
  inicializaSegundo(segundo);
  cargaEstructuras(primero,segundo);
  readln(codigoAlumno);
  moduloB(primero,list,codigoAlumno);
  readln(codigo1);
  readln(codigo2);
  readln(valor);
  cantidadIncisoC:= moduloC(primero,codigo1,codigo2,valor);                     //revisar
end.



