program ejericio1;
type
  subRango=1..10;
  vector=array[1..10]of char;
  
  lista:^nodo;
  
  nodo=record
    dato:char;
    sig:lista;
  end;

procedure moduloA(var v:vector;var dimL:subRango);       //carga de forma recursiva en un vector hasta que se ingresa un punto.
var 
  car:char;
begin
  if(car<>'.')then begin                                //consultar si corta solo con el punto o con la dimension fisica del vector tambien.       
     readln(car);
     v[dimL]:=car;
     if(dimL=10)then                               
       dimL:=1;
     dimL:=dimL+1;
     moduloA(v,dimL);
  end;
end;

procedure moduloB (vect:vector);                         //imprime vector normal  
var
  i:subRango;
begin
  for i:=1 to 10 do 
    writeln(vect[i]);
end;

procedure moduloC (var ve:vector;dimlo:subRango);       //imprime vector de forma recursiva
begin
  if(dimlo < 10)then begin
     writeln(ve[dimlo]);
     dimlo:=dimlo+1;
     moduloB(ve,dimlo)
  end;
end;

procedure moduloD (var canti:integer);                         //cuenta la cantidad de caracteres leidos de forma recursiva hasta que se ingresa un punto
var 
  carac:char;
begin
  readln(carac);
  if(carac <> '.')then begin
    canti:=canti+1;
    moduloD(canti);
  end;
end;

procedure moduloE (var li:lista);                                //carga una lista de forma recursiva

  procedure agregaAdelante(var lis:lista;info:char);
  var
    nue:lista;
  begin
    new(nue);
    nue^.dato:=info;
    nue^.sig:=lis;
    lis:=nue;
  end; 
  
var
  caracte:char;
begin
  readln(caracte);
  if(caracte <> '.')then begin
    agregaAdelante(li,caracte);
    moduloE(li);
  end;
end;

procedure moduloF (var l:lista);                       //imprime lista de forma recursiva en el sentido que estan almacenados los datos.
begin
  if(l<>nil)then begin 
    writeln(l^.dato);
    l:=l^.sig;
    moduloF(l);
  end;
end;

procedure moduloG (var listado:lista);                  //imprime lista de forma recursiva al reves, "dejando en la pila"
begin
  if(listado<>nil)then begin
    listado:=listado^sig;
    moduloG(listado);
    writeln(listado^.dato);
  end;
end;

var                                                       //programa principal
  dimLogica,dimLog:subRango;
  vecto:vector;
  cantidad:integer;
  list:lista;
begin
  list:=nil;
  dimLogica:=1;
  cantidad:=0;
  dimLog:=1;
  moduloA(vecto,dimLogica);                              //inciso A
  moduloB(vecto);                                        //inciso B
  moduloC(vecto,dimLog);                                 //inciso C 
  moduloD(cantidad);                                     //inciso D
  writeln(cantidad);
  moduloE(list);                                         //inciso E
  moduloF(list);                                         //inciso F 
  moduloG(list);                                         //inciso G
end;


//preguntar si corta cuando se llena el vector o hasta que lee el caracter
