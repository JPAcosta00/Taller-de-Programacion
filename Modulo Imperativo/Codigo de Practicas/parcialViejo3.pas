procedure parcial;
type
  cadena=string[50];
  envio=record
    codigoCliente:integer;
    codigoPostal:integer;
    dia:cadena;
    peso:real;
  end;
  
  arbol=^nodo;
  
  lista=^nodo1;
  
  info=record
    codigoCliente:integer;
    dia:cadena;
    peso:real;
  end;
  
  nodo1=record
    dato:info;
    sig:lista;
  end;
  
  informacion=record
    codigoPostal:integer;
    envios:lista;
  end;
  
  nodo=record
    dato:informacion;
    HI:arbol;
    HD:arbol;
  end;
  
procedure agregaAdelante(var li:lista;codCliente:integer;pes:real;day:cadena);
var
  nue:lista;
begin
    new(nue);
    nue^.dato.codigoCliente:=codCliente;
    nue^.dato.peso:=pes;
    nue^.dato.dia:=day;
    nue^.sig:=li;
    li:=nue;
end;

procedure cargaEnvios(var arbolEnvios:arbol);

  procedure leeEnvio(var e:envio);
  begin
    writeln('ingrese peso del envio');
    readln(e.peso);
    writeln('----------------------');
    if(e.peso <> 0)then begin
      writeln('ingrese codigo del cliente');
      readln(e.codigoCliente);
      writeln('--------------------');
      writeln('ingrese codigo postal');
      readln(e.codigoPostal);
      writeln('--------------------');
      writeln('ingrese dia');
      readln(e.dia);
      writeln('--------------------');
    end;
  end;
  
  procedure armaRamas(var arb:arbol;envi:envio);
  begin
    if(arb = nil)then begin
      new(arb);
      arb^.dato.codigoPostal:=envi.codigoPostal;
      arb^.dato.envios:=nil;
      agregaAdelante(arb^.dato.envios,envi.codigoCliente,envi.peso,envi.dia);
      arb^.HI:=nil;
      arb^.HD:=nil;
    end
    else begin
      if(arb^.dato.codigoPostal = envi.codigoPostal)then 
        agregaAdelante(arb^.dato.envios,envi.codigoCliente,envi.peso,envi.dia)
      else begin
        if(arb^.dato.codigoPostal >= envi.codigoPostal)then
          armaRamas(arb^.HI,envi)
        else 
          armaRamas(arb^.HD,envi);
      end;
    end;
  end;
  
var
  en:envio;
begin
  leeEnvio(en);
  while(en.peso <> 0)do begin
    armaRamas(arbolEnvios,en);
    leeEnvio(en);
  end;
end;

procedure incisoB(a:arbol;cod:integer;var l:lista);

  procedure recorre(list:lista;var lis:lista);
  begin
    while(list <> nil)do begin
       agregaAdelante(lis,list^.dato.codigoCliente,list^.dato.peso,list^.dato.dia);
       list:=list^.sig;
    end;
  end;
  
begin
  if(a <> nil)then begin
    if(a^.dato.codigoPostal = cod)then 
       recorre(a^.dato.envios,l)
    else begin
      if(a^.dato.codigoPostal >= cod)then 
         incisoB(a^.HI,cod,l)
      else 
         incisoB(a^.HD,cod,l);
    end;
  end;
end;

procedure incisoC(ele:lista;var cMas,cMenos:integer;var mas,men:real);
begin
  if(ele <> nil)then begin
     if(ele^.dato.peso > mas)then begin                                            //pregunta mayor
        cMas:=ele^.dato.codigoCliente;
        mas:=ele^.dato.peso;
     end;
     if(ele^.dato.peso < men)then begin                                           //pregunta menor
       cMenos:=ele^.dato.codigoCliente;
       men:=ele^.dato.peso;
     end;
     ele:=ele^.sig;                                                               //avanza en la lista
     incisoC(ele,cMas,cMenos,mas,men);                                            //recursion 
  end;
end;
  
var                                                                              //programa principal
  informacionEnvios:arbol;
  codigo:integer;
  listaEnvios:lista;
  codigoMas:integer;
  codigoMenos:integer;
  max:real;
  min:real;
begin
  max:=-1;
  min:=9999;
  codigoMas:=0;
  codigoMenos:=0;
  listaEnvios:=nil;
  informacionEnvios:=nil;
  cargaEnvios(informacionEnvios);
  writeln('ingrese un codigo postal para buscar sus envios');
  readln(codigo);
  incisoB(informacionEnvios,codigo,listaEnvios);                                //retorna lista del inciso B
  incisoC(listaEnvios,codigoMas,codigoMenos,max,min);                           //retorna los dos codigos de cliente coin mayor peso
end.
