program ejercicio3;
type
   subRubro=1..10;
   producto=record
     codigo:integer;
     rubro:subRubro;
     stock:integer;
     precio:real;
   end;
   
   arbol=^nodo;
   
   nodo=record
     dato:producto;
     HI:arbol;
     HD:arbol;
   end;
   
   vecRubros=array[subRubro]of arbol;
   
   info=record
     codigo:integer;
     stock:integer;
   end;
   
   vector=array[subRubro]of info;
   
   vecDos=array[subRubro]of integer;

procedure inicializa(var vecto:vecRubros);
var
  i:subRubro;
begin
  for i:=1 to 10 do 
    vecto[i]:=nil;
end;

procedure cargaRubros(var v:vecRubros);

  procedure leeProducto(var p:producto);
  begin
    writeln('ingrese codigo');
    readln(p.codigo);
    if(p.codigo <> -1)then begin
      writeln('ingrese un rubro');
      readln(p.rubro);
      writeln('ingrese un stock del producto');
      readln(p.stock);
      writeln('ingrese un precio de producto');
      readln(p.precio);
    end;
  end;

  procedure cargaArbol(var ar:arbol;pr:producto); 
  begin
    if(ar = nil)then begin
      new(ar);
      ar^.dato:=pr;
      ar^.HI:=nil;
      ar^.HD:=nil;
    end
    else begin
      if(ar^.dato.codigo >= pr.codigo)then 
         cargaArbol(ar^.HI,pr)
      else
         cargaArbol(ar^.HD,pr);
    end;
  end;
  
var
  pro:producto;
begin
  leeProducto(pro);
  while(pro.codigo <> -1)do begin
     cargaArbol(v[pro.rubro],pro);
     leeProducto(pro);
  end;
end;

function incisoB(ar:arbol;cod:integer):boolean;
begin
    if(ar^.dato.codigo = cod)then
       incisoB:=true
    else begin
       if(ar^.dato.codigo > cod)then
           incisoB:= incisoB(ar^.HI,cod)
       else
           incisoB:= incisoB(ar^.HD,cod);
    end;
end;

procedure incisoC(vr:vecRubros;var v:vector);

  procedure recorreArbol(arb:arbol;var codi:integer;var sto:integer);
  begin
   if(arb <> nil)then begin
     if(arb^.HD = nil)then begin
        codi:=arb^.dato.codigo;
        sto:=arb^.dato.stock;
     end
     else
       recorreArbol(arb^.HD,codi,sto);
   end;
  end;
  
var
  i:subRubro;
  st:integer;
  cod:integer;
begin
  cod:=0;
  st:=0;
  for i:=1 to 10 do begin
    recorreArbol(vr[i],cod,st);
    v[i].codigo:=cod;
    v[i].stock:=st;
  end;
end;

procedure inicializaDos(var vectorDos:vecDos);
var
  i:subRubro;
begin
  for i:=1 to 10 do 
     vectorDos[i]:=0;
end;

procedure incisoD(vet:vecRubros;var vd:vecDos;c1,c2:integer);

  function calcula(arUno:arbol;codUno,codDos:integer):integer;
  begin
    if(arUno = nil)then
      calcula:=0
    else  begin
      if(arUno^.dato.codigo >= codUno)and(arUno^.dato.codigo <= codDos)then
         calcula:= calcula + 1 + calcula(arUno^.HI,codUno,codDos) + calcula(arUno^.HD,codUno,codDos)
      else begin
         if(arUno^.dato.codigo >= codUno)then
            calcula:=calcula(arUno^.HI,codUno,codDos)
         else 
            calcula:=calcula(arUno^.HD,codUno,codDos);
      end;
    end;
  end;

var 
  i:subRubro;
  cant:integer;
begin
  for i:=1 to 10 do begin
    cant:=0;
    cant:=calcula(vet[i],c1,c2);
    vd[i]:=cant;
  end;
end;

procedure imprimeD(vd:vecDos);
var
  i:subRubro;
begin
  for i:= 1 to 10 do 
    writeln(vd[i]);
    writeln('--------');
end;

var                                                         //programa principal
  vec:vecRubros;
  rubro:subRubro;
  codigo:integer;
  buscar:boolean;
  vect:vector;
  vDos:vecDos;
  codigo1,codigo2:integer;
begin
  inicializaDos(vDos);
  buscar:=false;
  inicializa(vec);
  cargaRubros(vec);
  writeln('ingresar rubro a buscar');
  readln(rubro);
  writeln('ingresar codigo del rubro');
  readln(codigo);
  buscar:= incisoB(vec[rubro],codigo);
  writeln(buscar);
  incisoC(vec,vect);
  writeln('ingresar codigo uno');
  readln(codigo1);
  writeln('ingresar codigo dos');
  readln(codigo2);
  incisoD(vec,vDos,codigo1,codigo2);
  imprimeD(vDos);
end.

