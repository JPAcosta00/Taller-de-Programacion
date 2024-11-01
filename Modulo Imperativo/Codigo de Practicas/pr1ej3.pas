program ejercicio3;
type
  subGenero= 1..8;
  pelicula=record 
    codPelicula:integer;
    codGenero:subGenero;
    puntaje:real;
  end;
  vector=array[subGenero]of integer;
  lista=^nodo;
  nodo=record
    dato:pelicula;
    sig:lista;
  end;
  peliculas=array[subGenero]of lista;
  
procedure Inicializa (var vecto:vector);
var
  i:subGenero;
begin
  for i:=1 to 8 do 
    vecto[i]:=0;
end;

procedure cargaPelicular (var vp:peliculas);

  procedure leePelicula (var p:pelicula);
  begin
    write('ingrese un codigo de Pelicula:');
    read(p.codPelicula);
    if(p.codPelicula <> -1)then begin
        write('ingrese un codigo de Genero:');
        read(p.codGenero);
        write('ingrese un puntaje promedio recibido de las criticas:');
        read(p.puntaje);
        writeln('----------------------------');
    end;
  end;
  
  procedure agregarAtras (var lis,ult:lista; pelicu:pelicula);
  var
    nue:lista;
  begin
    new(nue);
    nue^.dato:=pelicu;
    nue^.sig:=nil;
    if(lis<>nil)then
      ult^.sig:=nue;
    else
      l:=nue;
    ult:=nue;
  end;

var
  ulti:lista;
  peli:pelicula;
begin
  new(ulti);
  leePelicula(peli);
  while(peli.codigo <> -1)do begin
     agregaAtras(vp[peli.codGenero],ulti,peli);
     leePelicula(peli);
  end;
end;

procedure calcula (vePeli:pelicular;var vec:vector);

  procedure calculaCodigo (ls:lista;var codiMas:integer);
  var
    max:real;
  begin
    max:=-1;
    while(ls <> nil)do begin
       if(ls^.dato.puntaje >= max)then begin
          codiMas:=ls^.dato.codigo;
          max:=ls^.dato.puntaje;
       end;
       ls:=ls^.sig;
    end;
  end;

var
  i:subGenero;
  codMas:integer;
begin
  for i:=1 to 8 do begin
    codMas:=0;
    calculaCodigo(vePeli[i],codMas);
    vec[i]:=codMas;
  end;
end;

procedure ordenaVectorSeleccionando (var v:vector);
var
  i,j,pos:subGenero;
  item:integer;
begin
  for i:=1 to 7 do begin
    pos:=i;
    for j:=i+1 to 8 do begin
       if(v[j]<v[pos])then 
          pos:=j;
    end;
    item:=v[pos];
    v[pos]:=v[i];
    v[i]:=item;
  end;
end;

procedure calculaMayorMenor (ve:vector;var codMas,codMenos:subGenero);
var
  max,min:integer;
  i:subGenero;
begin
  max:=-1;
  min:=9999;
  for i:=1 to 8 do begin
     if(ve[i]>max)then begin
        codMas:=i;
        max:=ve[i];
     end;
     if(ve[i]<min)then begin 
        codMenos:=i;
        min:=ve[i];
     end;
  end;
end;

var                                               //programa principal
  vPeliculas:pelicular;
  vect:vector;
  codigoMas,codigoMenos:integer;
begin
  codigoMas:=0;
  codigoMenos:=0;
  Incializa(vect);
  cargaPeliculas(vPeliculas);
  calcula(vPeliculas,vect);
  ordenaVectorSeleccionando(vect);
  calculaMayorMenor(vect,codigoMas,codigoMenos);
  writeln(codigoMas);                                
  writeln(codigoMenos);
end.
