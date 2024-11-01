program ejercicio4;
type
  subRubro=1..8;
  subIndice=1..30;
  producto=record
    codigo:integer;
    rubro:subRubro;
    precio:real;
  end;
  lista=^nodo;
  nodo=record
    dato:producto;
    sig:lista;
  end;
  productos=array[1..8]of lista;
  vector=array[subIndice]of producto;

procedure inicializa (var infor:productos);ç
var
  i:integer;
begin
  for i:=1 to 8 do 
     infor[i]:=nil;
end;

procedure cargaProductos (var produc:productos);

  procedure leeProducto(var p:producto);
  begin
    readln(p.precio);
    if(p.precio<>0)then begin
      readln(p.codigo);
      readln(p.rubro);
    end;
  end;
  
  procedure insertarOrdenado (var l:lista; registro:producto);
  var
    ant,act,nue:lista;
  begin
    new(nue);
    nue^.dato:=registro;
    nue^.sig:=nil;
    ant:=l;
    act:=l;
    while(act<>nil)and(act^.dato.codigo < registro.codigo)do begin
      ant:=act;
      act:=act^.sig;
    end;
    if(ant=act)then
       l:=nue;
    else
       ant^.sig:=nue;
    nue^.sig:=act;
  end;
  
var
  pr:producto;
begin
  leeProducto(pr);
  while(pr.precio <> 0)do begin
      insertaOrdenado(produc[pr.rubro],pr);
      leeProducto(pr);
  end;
end;

procedure muestraCodigos (informa:productos);
var
  i:integer;
begin
  for i:=1 to 8 do begin
      writeln('rubro',i);
      writeln('codigos:');
      while(informa[i]<>nil)do begin
          writeln(informa[i].dato.codigo);
          informa[i]:=informa[i]^.sig;
      end;
  end;
end;

procedure generaVector(vProdu:productos;var vec:vector;var dimen:subIndice);

begin
  while(vProdu[3]<>nil)do begin
     if(dimen < 30)then begin
        vec[dimen]:=vProdu[dimen];
        dimen:=dimen+1;
     end;
     vProdu[3]:=vProdu[3]^.sig;
  end;
end;

procedure ordenaSeleccionando (var vet:vector; dl:subIndice);
var
  i,j,pos:integer;
  item:oficina;
begin
  for i:=1 to dl-1 do begin
     pos:=i;
     for j:=i+1 to dl do begin
       if(vet[j].precio < vet[pos].precio)then
           pos:=j;
     end;
     item:=vet[pos];
     vet[pos]:=vet[i];
     vet[i]:=item;
  end;
end;

procedure muestraPrecios(ve:vector;dim:subIndice);
var
  i:subIndice;
begin
  for i:=1 to dim do begin
     writeln('precios:');
     writeln(ve[i].precio);
  end;
end;

procedure calculaPromedio (vc:vector;diml:subIndice;var prom:real);
var
  i:subIndice;
  suma:integer;
begin
  suma:=0;
  for i:=1 to diml do begin
     suma:=suma + vc[i].precio;
  prom:=suma/diml;
end;

var                                            //programa principal
  infoProductos:productos;
  vecto:vector;
  dimension:subIndice;
  promedio:real;
begin 
  dimension:=1;
  promedio:=0;
  inicializa(infoProductos);
  cargaProductos(infoProductos);                  //inciso A
  muestraCodigos(infoProductos);                  //inciso B
  generaVector(infoProductos,vecto,dimension);    //inciso C
  ordenaSeleccionando(vecto,dimension);
  muestraPrecios(vecto,dimension);
  calculaPromedio(vecto,dimension,promedio);
end.
