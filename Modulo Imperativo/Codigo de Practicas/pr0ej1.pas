program ejercicio1;
type
aprob=1..36;
vector=array [aprob] of real;
alumnos=record
  apellido:string;
  num:integer;
  anio:integer;
  aprobado:aprob;
  nota:integer;
  notas:vector;
end;
lista=^nodo;

nodo=record
  dato:alumnos;
  sig:lista;
end;

incisoB=record
  numAlumno:integer;
  prom:real;
end;

listado=^nodo2;

nodo2=record
  dato:incisoB;
  sig:listado;
end;

procedure leerRegistro (var a:alumnos);
var 
  i:integer;
begin
  writeln('apellido');
  readln(a.apellido);
  writeln('num de alumno');
  readln(a.num);
  writeln('anio ingreso');
  readln(a.anio);
  writeln('materias aprobadas');
  readln(a.aprobado);
  for i:=1 to a.aprobado do begin
    writeln('nota');
      readln(a.nota);
      if(a.nota>=4) and (a.nota<=10) then
          a.notas[i]:=a.nota;
  end;
end;

Procedure cargarInformacion (var l:lista;al:alumnos);
var
  nue:lista;
begin
  new(nue);
  nue^.dato:=al;
  nue^.sig:=l;
  l:=nue;
end;

procedure calcular (vec:vector;cant:aprob;var pr:real);
var
  i:integer;
  suma:real;
begin
  suma:=0;
  for i:=1 to cant do begin
     suma:=suma + vec[i];
  end;
  pr:=suma / cant;
end;

procedure cargaNuevo (num:integer;promedi:real; var listaNueva:listado);
var
  nue:listado;
begin
  new(nue);
  nue^.dato.numAlumno:=num;
  nue^.dato.prom:=promedi;
  nue^.sig:=listaNueva;
  listaNueva:=nue;
end;

procedure calculaPromedio (li:lista;var nueva:listado);
var
  prome:real;
begin
  while(li <> nil)do begin
     calcular(li^.dato.notas,li^.dato.aprobado,prome);
     cargaNuevo(li^.dato.num,prome,nueva);
     li:=li^.sig;
  end;
end;

procedure cargar (var lis:lista);
var
  alu:alumnos;
begin
  repeat
    leerRegistro(alu);
    cargarInformacion(lis,alu);
  until(alu.num = 11111);
end;

var
  list:lista;
  listProm:listado;

begin
  list:=nil;
  listProm:=nil;
  cargar(list);
  calculaPromedio(list,listProm);
end.


//terminado.
