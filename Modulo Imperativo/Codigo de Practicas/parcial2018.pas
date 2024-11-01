program parcial;
type
	cadena = string[50];
	cliente = record
		dni:integer;
		nombre:cadena;
		fecha:integer;
		monto:real;
	end;
	arbol = ^nodo;
	lista = ^nodo2;
	info=record
		fecha:integer;
		monto:real;
	end;
	nodo2=record
		dato:info;
		sig:lista;
	end;
	informacion = record
		dni:integer;
		nombre:cadena;
		listado:lista;
	end;
	nodo=record	
		dato = informacion;
		HI = arbol;
		HD = arbol;
	end;
procedure leeCliente(var c:cliente);
begin
	readln(c.monto);
	if(c.monto <> 0)then begin
		readln(c.dni);
		readln(c.nombre);
		readln(c.fecha);
	end;
end;

procedure agregaCliente(var a:arbol; cl:cliente);
	
	procedure cargaLista(var lis:lista; fecha:integer; monto:real);
	var
		nue:lista;
	begin
		new(nue);
		nue^.dato.fecha = fecha;
		nue^.dato.monto = monto;
		nue^.sig = lis;
		lis = nue;
	end;
	
begin
	if(a = nil)then begin 
		new(a);
		a.dato.dni = cl.dni;
		a.dato.nombre = cl.nombre;
		cargaLista(a.listado,cl.fecha,cl.monto);
		a.HI = nil;
		a.HD = nil;
	end
	else begin
		if(a.dato.dni < cl.dni)then
			agregaCliente(a.HI,cl)
		else
			agregaCliente(a.HD,cl);
	end;
end;

procedure cargaClientes(var ar:arbol);
var
	cli:cliente;
begin
	leeCliente(cli);
	while(cli.monto <> 0)do begin
		agregaCliente(ar,cli);
		leeCliente(cli);
	end
end;

procedure cuentaClientes(a:arbol; fe:integer;var cant:integer);

	procedure cuentaPedido(l:lista; var canti:integer; f:integer);
	var 
		control = boolean;
	begin
		control = true;
		while(l<>nil)and(control = true)do begin
			if(l.dato.fecha = f)then begin 
				canti = canti +1;
				control = false;
			end;
			l:= l^.sig;
		end;
	end;
	
begin
	if(a<>nil)then begin
		cuentaClientes(a.HI,fe);
		cuentaPedido(a.listado,cant,fe);
		cuentaClientes(a.HD,fe);
	end;
end;
procedure cuentaTodo(arbo:arbol; dni:integer;var mon:real; pedi:integer);

	procedure cuentaInfo(li:lista; var m:real; var p:integer);
	begin
		while(li <> nil)do begin
			m := m + li.^dato.monto;
			p := p + 1;
			li:= li^.sig;
		end;
	end;
	
begin
	if(arbo <> nil)then begin
		if(arbo.dato.dni = dni)then
			cuentaInfo(arbo.dato.listado,mon,pedi)
		else begin
			if(arbo.dato.dni < dni)then
				cuentaTodo(arbo.HI,dni,mon,pedi)
			else
				cuentaTodo(arbo.HD,dni,mon,pedi);
		end;
	end;
end;

var 										//programa principal
	estructura:arbol;
	unFecha:integer;
	cantidad:integer;
	unDNI:integer;
	montoTotal:real;
	totalPedidos:integer;
begin	
	montoTotal = 0;
	totalPedidos = 0;
	cantidad = 0;
	estructura = nil;
	cargaClientes(estructura);
	writeln('Ingrese una fecha');
	readln(unaFecha);
	cuentaClientes(estructura,unaFecha,cantidad);
	writeln('Cantidad de clientes que realizaron pedidos en la fecha ', unaFecha, ' = ',cantidad);
	writeln('Ingrese un dni');
	readln(unDNI);
	cuentaTodo(estructura,unDNI,montoTotal,totalPedidos);
	writeln('Informacion del DNI: ',unDNI, ': monto total abonado: ', montoTotal, ' , cantidad total de pedidos realizados: ', totalPedidos);
end.
