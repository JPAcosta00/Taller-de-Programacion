program ejericio3;
type 
  information=record
    legajo:integer;
    promedio:real;
  end; 
 
  incisoF=^nod;
  
  nod=record
    dato:information;
    sig:incisoF;
  end;
  info=record
    codigo:integer;
    nota:integer;
  end;
  lista=^nodo;
  
  nodo=record
    dato:info;
    sig:lista;
  end;
  
  alumno=record
    legajo:integer;
    dni:integer;
    ingreso:integer;
    codigos:integer;
    notas:integer;
    materias:lista;
  end;

  arbol=^noddo;
  
  noddo=record
    dato:alumno;
    HI:arbol;
    HD:arbol;
  end;
  
  informacion=record
     dni:integer;
     ingreso:integer;
  end;
  
  incisoB=^nodoB;
  
  nodoB=record
    dato:informacion;
    sig:incisoB;
  end;

procedure cargaAlumnos(var arl:arbol);

  procedure leeAlumno(var am:alumno);
  
    procedure armaNotas(cod:integer;nota:integer;var mater:lista);
     
        procedure agregarAdelante(var l:lista;codi,no:integer);
        var
          nue:lista;
        begin
          new(nue);
          nue^.dato.codigo:=codi;
          nue^.dato.nota:=no;
          nue^.sig:=l;
          l:=nue;
        end;
        
    begin
      mater:=nil;
      writeln('ingrese un codigo de materia');
      readln(cod);
      while(cod<>-1)do begin
         writeln('ingrese la nota de la materia');
         readln(nota);
         agregarAdelante(mater,cod,nota);
         writeln('ingrese un codigo de materia');
         readln(cod);
      end;
    end;
    
  begin
    writeln('Ingrese numero de legajo');
    readln(am.legajo);
    if(am.legajo<>0)then begin
      writeln('ingrese DNI');
      readln(am.dni);
      writeln('ingrese año de ingreso'):
      readln(am.ingreso);
      armaNotas(am.codigos,am.notas,am.materias);
    end;
  end;
  
  procedure agregarRama(var a:arbol;al:alumno);
  begin
    if(a=nil)then begin
      new(a);
      a^.dato:=al;
      a^.HI:=nil;
      a^.HD:=nil;
    end
    else                                                                     
       if(a^.dato.legajo >= al.legajo)then
          agregarRama(a^.HI,al)
       else
          agregarRama(a^.HD,al);
  end;
  
var
  alum:alumno;
begin
  leeAlumno(alum);
  while(alum.legajo<>0)do begin
     agregarRama(arl,alum);
     leeAlumno(alum);
  end;
end;

procedure moduloB(ar:arbol;val:integer;var lis:incisoB);         

  procedure agregaLista(var li:incisoB;docu,ingre:integer);
  var
    nue:incisoB;
  begin
    new(nue);
    nue^.dato.dni:=docu;
    nue^.dato.ingreso:=ingre;
    nue^.sig:=li;
    li:=nue;
  end;
  
begin
  if(ar<>nil)then begin
    if(ar^.dato.legajo > val)then begin
      moduloB(ar^.HI,val,lis);
      agregaLista(lis,ar^.dato.dni,ar^.dato.ingreso);
    end
    else 
      if(ar^.dato.legajo < val)then begin
        moduloB(ar^.HD,val,lis);
        agregaLista(lis,ar^.dato.dni,ar^.dato.ingreso);
      end;
  end;
end;

function moduloC(abb:arbol):integer;
begin
  if(abb^.HD=nil)then
    moduloC:=abb^.dato.legajo
  else
    moduloC:=moduloC(abb^.HD);
end;

procedure moduloD(abAlu:arbol;var mas:integer);        //recorrido IN-ORDEN
begin
  if(abAlu<>nil)then begin
    moduloD(abAlu^.HI,mas);
    if(abAlu^.dato.dni >= mas)then
       mas:=abAlu^.dato.dni;
    moduloD(abAlu^.HD,mas);
  end;
end;

procedure moduloE (arbAl:arbol;var cant:integer);
begin
  if(arbAl<>nil)then begin
    moduloE(arbAL^.HI,cant);
    if(arbAL^.dato.legajo mod 2 <> 0)then
        cant:=cant+1;
    moduloE(arbAL^.HD,cant);
  end;
end;

function calculaPromedio(list:lista):real;
var
  suma,cant:integer;
begin
  suma:=0;
  cant:=0;
  while(list<>nil)do begin
    suma:=suma + list^.dato.nota;
    cant:=cant+1;
    list:=list^.sig;
  end;
  calculaPromedio:=suma/cant;
end;

procedure promedioAlumno (a:arbol;var leg:integer;var prome:real);
var 
  pr:real;
begin
  if(a<>nil)then begin
    promedioAlumno(a^.HI,leg,prome);
    pr:=calculaPromedio(a^.dato.materias);
    if(pr > prome)then
      leg:=a^.dato.legajo;
      prome:=pr;
    promedioAlumno(a^.HD,leg,prome);
  end;
end;

procedure moduloF(abol:arbol;vl:real;var lisP:incisoF);

  procedure agregaNodo(var lp:incisoF;numero:integer;prd:real);
  var
    nue:incisoF;
  begin
    new(nue);
    nue^.dato.legajo:=numero;
    nue^.dato.promedio:=prd;
    nue^.sig:=lp;
    lp:=nue;
  end;
  
var 
  promed:real;
begin
  if(abol<>nil)then begin
    moduloF(abol^.HI,vl,lisP);
    promed:=calculaPromedio(abol^.dato.materias);
    if(promed > vl)then
       agregaNodo(lisP,abol^.dato.legajo,promed);
    moduloF(abol^.HD,vl,lisP);
  end;
end;

var                                                          //programa principal
  arbolAlumnos:arbol;
  valor:integer;
  nuevaLista:incisoB;
  dniMas:integer;
  cantidadImpar:integer;
  legajo:integer;
  promedio:real;
  valorPromedio:real;
  listPromedios:incisoF;
begin
  listPromedios:=nil;
  legajo:=0;
  promedio:=0;
  cantidadImpar:=0;
  dniMas:=-1;
  masGrande:=0;
  arbolAlumnos:=nil;
  nuevaLista:=nil;
  cargaAlumnos(arbolAlumnos);
  readln(valor);
  moduloB(arbolAlumnos,valor,nuevaLista);
  if(arbolAlumnos<>nil)then
     masGrande:=moduloC(arbolAlumnos);
  moduloD(arbolAlumnos,dniMas);
  moduloE(arbolAlumnos,cantidadImpar);
  promedioAlumno(arbolAlumnos,legajo,promedio);
  readln(valorPromedio);
  moduloF(arbolAlumnos,valorPromedio,listPromedios);
end.


//consultar ingreso del valor del punto F, tendria que ser de tipo real para que pueda comparar con el promedio.

