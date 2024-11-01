program ejercicio2;
type 
  rango=1..5;

  propiedad=record
    zona:rango;
    codigo:integer;
    tipo:string;
    m2:integer;
    preciom2:real;
  end;
  
   prop=record
    codigo:integer;
    tipo:string;
    total:real;
  end;

  lista=^nodo;
  
  nodo=record
    dato:prop;
    sig:lista;
  end;

  vector=array[rango] of lista;

  listaB=^nodoB;
  
  nodoB=record
    dato:integer;
    sig:listaB;
  end;

procedure leePropiedad(var p:propiedad);
begin
  writeln('precio m2');
  readln(p.preciom2);
  if(p.m2<>-1) then begin
    writeln('zona');
  readln(p.zona);
    writeln('codigo');
  readln(p.codigo);
    writeln('tipo');
  readln(p.tipo);  
  writeln('cant de m2');
  readln(p.m2);
  end;
end;

procedure insertarOrdenado(z:rango; pr:prop; var ve:vector);
var
  ant,act:lista;
  nue:lista;
begin 
  ant:=ve[z];
  act:=ve[z];
  new(nue);
  nue^.dato:=pr;
  while((ve[z] <> nil) and (ve[z]^.dato.tipo < pr.tipo))do begin
       ant:=act;
       act:=act^.sig;
  end;
  if (ant=act)then 
     ve[z]:=nue
  else
     ant^.sig:=nue;
  nue^.sig:=act;
end;


procedure carga (var vec:vector);
var 
  zona:rango;
  p:propiedad;
  prope:prop;
begin
  leePropiedad(p);
  while(p.m2 <> -1)do begin
     prope.codigo:= p.codigo;
     prope.tipo:=p.tipo;
     prope.total:=p.m2 * p.preciom2;
     zona:=p.zona;
     insertarOrdenado(zona,prope,vec);
     leePropiedad(p);
  end;
end; 

procedure armaNueva (var l:listaB; codi:integer);
var
  nue:listaB;
begin
  new(nue);
  nue^.dato:=codi;
  nue^.sig:=l;
  l:=nue;
end;

procedure incisoB (i:rango;tipoP:string;vec:vector;var lis:listaB);
begin
  while (vec[i]<>nil)do begin
    if(vec[i]^.dato.tipo = tipoP)then 
       armaNueva(lis,vec[i]^.dato.codigo);
    vec[i]:=vec[i]^.sig;
  end;
end;

var
  vecto:vector;
  i,zon:rango;
  tip:string;
  list:listaB;
begin
  list:=nil;
  for i:=1 to 5 do
    vecto[i]:=nil;         //inicializa el vector de listas
  carga(vecto);
  readln(zon);
  readln(tip);
  incisoB(zon,tip,vecto,list);
end.


//terminado.
