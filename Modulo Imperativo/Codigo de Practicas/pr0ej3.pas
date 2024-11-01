program Ejercicio3;
type
  subCodigo=1..1000;
  
  info=record
    precio:real;
    canti:integer;
  end;
  
  stock=array [1..1000]of info;     //se dispone cargado
  
  product=record 
    codigoProducto:subCodigo;
    cantUnidades:integer;
  end;
  
  venta=record
    codigoVenta:integer;
    producto:product;
  end;
  detail=record
    codigoProducto:subCodigo;
    cantidad:integer;
    precioUnitario:real;
  end;
  
  ticket=record
    codigoVenta:integer;
    detalle:detail;
    montoTotal:real;
  end;
   
  lista=^nodo;
  
  nodo=record
    dato:ticket;
    sig:lista;
  end;

procedure cargaStock (var vector:stock);        //se dispone

procedure leeProducto (p:product);
begin
  readln(p.cantUnidades);
  if(p.cantUnidades <> 0)then
     readln(p.codigoProducto);
end;

procedure leeVentas (var ve:venta);
begin
  readln(ve.codigoVenta);
  if(ve.codigoVenta <> -1)then
     leeProducto(ve.producto);
end;

procedure cargaTickets (var l:lista;codV:integer;codP:subCodigo;cant:integer;pre:real;preTotal:real);
var 
  nue:lista;
begin
  new(nue);
  nue^.dato.codigoVenta:=codV;
  nue^.dato.detalle.codigoProducto:=codP;
  nue^.dato.detalle.cantidad:=cant;
  nue^.dato.detalle.precioUnitario:=pre;
  nue^.dato.montoTotal:=preTotal;
  nue^.sig:=l;
  l:=nue;
end;

procedure cargaInformacion (var lis:lista;vec:stock);
var
  ven:venta;
  codigoV:integer;
  codigoP:subCodigo;
  cantidades:integer;
  precio:real;
  total:real;
begin
  leeVentas(ven);
  while(ven.codigoVenta <> -1)do begin
      codigoV:=ven.codigoVenta;
      codigoP:=ven.producto.codigoProducto;
      if(vec[ven.producto.codigoProducto].canti < ven.producto.cantUnidades )then                                           //si no hay stock suficiente vende lo maximo
              cantidades:=vec[ven.producto.codigoProducto].canti;
      precio:=vec[ven.producto.codigoProducto].precio;
      total:=vec[ven.producto.codigoProducto].precio * cantidades;
      vec[ven.producto.codigoProducto].canti:=vec[ven.producto.codigoProducto].canti - ven.producto.cantUnidades;           //actualiza el stock 
      cargaTickets(lis,codigoV,codigoP,cantidades,precio,total);                                                            //carga la informacion del sticker
      leeVentas(ven);
  end;
end;

procedure incisoB (li:lista; codi:subCodigo;var canti:integer);
begin
  while(li <> nil)do begin
    if(li^.dato.detalle.codigoProducto = codi)then 
       canti:=canti+1;
    li:=li^.sig;
  end;
end;

var                                                         //programa principal
  vecto:stock;
  list:lista;
  codigoBusca:subCodigo;
  cantidadVendidas:integer;
begin                                                        
  list:=nil;
  cantidadVendidas:=0;
  cargaStock(vecto);                                        //se dispone 
  cargaInformacion(list,vecto);
  readln(codigoBusca);
  incisoB(list,codigoBusca,cantidadVendidas);
end
