//Una empresa de viajes tiene los pasajes que vendidos. Se lee codigo de vuelo,codigo de
// venta,codigo de ciudad de destino y monto. Se lee hasta codigo de ciudad -1
// - Armar una estructura que este ordenada por codigo de ciudad de destino con todos su vuelos
//   vendidos. Se pide guardar el codigo de vuelo, monto y codigo de venta.
// - Leer un codigo de ciudad de destino y para ese codigo de ciudad de destino, devolver 
//  la cantidad de pasajes vendidos.
//- calcular que codigo de destino vendio mas pasajes.
  
program parcial;
type
  pasajes=record 
    codigoVuelo:integer;
    codigoVenta:integer;
    codigoDestino:integer;
    monto:real;
  end;
  
  arbol=^nodo;
  
  lista=^noddo;
  
  informacion=record
    codigoVuelo:integer;
    codigoVenta:integer;
    monto:real;
  end;
  
  noddo=record
    dato:informacion;
    sig:lista;
  end;
  
  info=record
    destino:integer;
    vendidos:lista;
  end;
  
  nodo=record
    dato:info;
    HI:arbol;
    HD:arbol;
  end;

procedure cargaInformacion (var arb:arbol);

  procedure leePasaje(var p:pasajes);
  begin
    readln(p.codigoDestino);
    if(p.codigoDestino <> -1)then begin
      readln(p.codigoVuelo);
      readln(p.codigoVenta);
      readln(p.monto);
    end;
  end;
  
  procedure armaRamas(var ar:arbol;pa:pasajes);
  
    procedure cargaVendidos(var l:lista;codVuelo,codVenta:integer;mont:real);
    var
      nue:lista;
    begin
      new(nue);
      nue^.dato.codigoVuelo:=codVuelo;
      nue^.dato.codigoVenta:=codVenta;
      nue^.dato.monto:=mont;
      nue^.sig:=l;
      l:=nue;
    end;
    
  begin
    if(ar = nil)then begin
      new(ar);
      ar^.dato.destino:=pa.codigoDestino;
      ar^.dato.vendidos:=nil;
      cargaVendidos(ar^.dato.vendidos,pa.codigoVuelo,pa.codigoVenta,pa.monto);
      ar^.HI:=nil;
      ar^.HD:=nil;
    end
    else begin
      if(ar^.dato.destino = pa.codigoDestino)then
         cargaVendidos(ar^.dato.vendidos,pa.codigoVuelo,pa.codigoVenta,pa.monto)
      else begin
        if(ar^.dato.destino >= pa.codigoDestino)then
           armaRamas(ar^.HI,pa)
        else
           armaRamas(ar^.HD,pa);
      end;
    end;
  end;
  
var
  pasa:pasajes;
begin
  leePasaje(pasa);
  while(pasa.codigoDestino <> -1)do begin
    armaRamas(arb,pasa);
    leePasaje(pasa);
  end;
end;

procedure cuentaVendidos(ele:lista;var canti:integer);
  begin
    while(ele <> nil)do begin
       canti:=canti+1;
       ele:=ele^.sig;
    end;
  end;

function incisoB(a:arbol;codi:integer):integer;
var
  cant:integer;
begin
  cant:=0;
  if(a = nil)then 
    incisoB:=0
  else begin
    if(a^.dato.destino = codi)then begin
       cuentaVendidos(a^.dato.vendidos,cant);
       incisoB:=cant;
    end
    else begin
      if(a^.dato.destino >= codi)then
         incisoB:=incisoB(a^.HI,codi)
      else
         incisoB:=incisoB(a^.HD,codi);
    end;
  end;
end;

procedure incisoC(arbo:arbol;var codiMas:integer;var maxi:integer);
var
  cant:integer;
begin
  if(arbo <> nil)then begin
    incisoC(arbo^.HI,codiMas,maxi);
    cant:=0;
    cuentaVendidos(arbo^.dato.vendidos,cant);
    if(cant > maxi)then begin
       codiMas:=arbo^.dato.destino;
       maxi:=cant;
    end;
    incisoC(arbo^.HD,codiMas,maxi);
  end;
end;

var                                                      //programa principal
  informacionVuelos:arbol;
  codigoCiudad:integer;
  cantidad:integer;
  codigoMas:integer;
  max:integer;
begin
  max:=-1;
  codigoMas:=0;
  cantidad:=0;
  informacionVuelos:=nil;
  cargaInformacion(informacionVuelos);
  readln(codigoCiudad);
  cantidad:= incisoB(informacionVuelos,codigoCiudad);
  incisoC(informacionVuelos,codigoMas,max);
end.
