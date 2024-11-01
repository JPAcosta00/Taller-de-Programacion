program ejercicio3;
type
  subNumeros=0..99;
  
  lista=^nodo;
  nodo=record 
    dato:subNumeros;
    sig:lista;
  end;

procedure cargaListaRecursiva(var lis:lista);

  procedure creaNodo(var li:lista;n:subNumeros);
  var
    nue:lista;
  begin
    new(nue);
    nue^.dato:=n;
    nue^.sig:=li;
    li:=nue;
  end;

var
  num:subNumeros;
begin
  Randomize;
  num:=random(99);
  if(num<>0)then begin
    creaNodo(lis,num);
    cargaListaRecursiva(lis);
  end;
end;

procedure devuelveMinimo(var l:lista;var min:subNumeros);
begin
  if(l<>nil)then begin
    if(l^.dato <= min)then
        min:=l^.dato;
    l:=l^.sig;
    devuelveMinimo(l,min);
  end;
end;

procedure devuelveMaximo(var listado:lista;var max:subNumeros);
begin
  if(listado<>nil)then begin 
    if(listado^.dato > max)then
       max:=listado^.dato;
    listado:=listado^.sig;
    devuelveMaximo(listado,max);
  end;
end;

function busca(liste:lista;nume:subNumeros):boolean;
begin
  if(liste<>nil)then begin
     if(liste^.dato = nume)then
        busca:=true
     else
        busca:=false;
     busca(liste^.sig,nume);
  end;
end;
var                                            //programa principal
  list:lista;
  minimo,maximo:subNumeros;
  numerito:subNumeros;
begin
  maximo:=1;
  minimo:=99;
  list:=nil;
  cargaListaRecursiva(list);                   //inciso A
  devuelveMinimo(list,minimo);                 //inciso B
  devuelveMaximo(list,maximo);                 //inciso C
  readln(numerito);
  busca(list,numerito);             //inciso D
end.
