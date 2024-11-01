program parcial;
type
	fecha=record
		anio:integer;
		mes:integer;
		dia:integer;
	end;
	poliza=record
		dni:integer;
		suma:integer;
		cuota:real;
		vencimiento:fecha;
	end;
	
	lista=^nodo;

	nodo=record
		dato:poliza;
		sig:lista;
	end;
	
	arbol = ^nodo1;
	info=record
		anio:integer;
		listado:lista;
	end;
	
	nodo1=record
		dato:info;
		HI:arbol;
		HD:arbol;
	end;
	
	arbol2= ^nodo2;
	nodo2=record
		dato:poliza;
		HI:arbol2;
		HD:arbol2;
	end;

procedure primerModulo(var arbo:arbol);

	procedure leePoliza(var p:poliza);
	begin
		writeln('Ingrese un dni');
		readln(p.dni);
		if(p.dni <> -1)then begin
			writeln('Ingrese una suma');
			readln(p.suma);
			writeln('Ingrese una cuota');
			readln(p.cuota);
			writeln('Ingrese un año de vencimiento');
			readln(p.vencimiento.anio);
			writeln('Ingrese un mes de vencimiento');
			readln(p.vencimiento.mes);
			writeln('Ingrese el dia de vencimiento');
			readln(p.vencimiento.dia);
		end;
	end;

	procedure cargaDatos(var ab:arbol;pol:poliza);
	
		procedure agregaPoliza(var lis:lista; var poli:poliza);           //agrega la poliza a la lista del nodo del arbol de forma ordenada por suma 
		var
			act,ant,nue:lista;
		begin
			new(nue);
			nue^.dato:=poli;
			ant:=lis;
			act:=lis;
			while(act <> nil)and(act^.dato.suma < poli.suma)do begin
				ant:=act;
				act:=act^.sig;
			end;
			if(act = ant )then 
				lis:=nue
			else
				ant^.sig:=nue;
			nue^.sig:=act;
		end;	
		
	var 
		nue:arbol;
	begin
		if(ab = nil)then begin        									//si no existe el año, crea el nodo e inicializa sus datos
			new(nue);
			nue^.dato.anio := pol.vencimiento.anio;
			nue^.dato.listado := nil;
			agregaPoliza(nue^.dato.listado, pol);
			nue^.HI:= nil;
			nue^.HD:= nil;
		end
		else begin
		    if(ab^.dato.anio = pol.vencimiento.anio)then 					//si encontro el año, entonces almacena la poliza a la lista
				agregaPoliza(ab^.dato.listado,pol)
		    else begin												    //si no encontro el año, evalua si ir por izquierda o derecha del arbol
				if(ab^.dato.anio <= pol.vencimiento.anio)then
					cargaDatos(ab^.HI,pol);
				if(ab^.dato.anio > pol.vencimiento.anio)then 
					cargaDatos(ab^.HD,pol);
			end;
		end;
	end;
	
var
	po:poliza;
begin
	leePoliza(po);
	while(po.dni <> -1)do begin
		cargaDatos(arbo,po);
		leePoliza(po);
	end;
	writeln('Se cargo el arbol con exito');
end;

procedure segundoModulo(primero:arbol; var segundo:arbol2; entero:integer);

	procedure agregaInfo(var ar:arbol2; poliza:poliza);
	var
		nue:arbol2;
	begin
		if(ar = nil)then begin
			new(nue);
			nue^.dato := poliza;
			nue^.HI:=nil;
			nue^.HD:=nil
		end
		else begin
			if(ar^.dato.dni > poliza.dni)then 
				agregaInfo(ar^.HI,poliza);
			if(ar^.dato.dni < poliza.dni)then
				agregaInfo(ar^.HD,poliza);
		end;
	end;

	procedure recorrelistado(l:lista; var a:arbol2; num:integer);
	begin
		while(l<>nil)do begin
			if(l^.dato.suma < num)then 
				agregaInfo(a, l^.dato);
			l:= l^.sig;
		end;
	end;
	
begin	
	if(primero <> nil)then begin
		recorreListado(primero^.dato.listado,segundo,entero);
		segundoModulo(primero^.HI,segundo,entero);
		segundoModulo(primero^.HD,segundo,entero);
	end;
	writeln('Se cargo al estructura con exito');
end;

procedure tercerModulo(a:arbol2; var cant:integer; numero:real);				//recorre el arbol entero con pre-orden
begin
	if(a <> nil)then begin
		if(a^.dato.cuota > numero)then 
			cant:= cant+1;
		tercerModulo(a^.HI,cant,numero);
		tercerModulo(a^.HD,cant,numero);
	end;
end;

var																//programa pincipal
	ar:arbol;
	ar2:arbol2;
	valor:integer;
	cantidad:integer;
	valorCuota:real;
begin
	cantidad:=0;
	
	primerModulo(ar);											//inciso A
	
	writeln('Ingresar un valor entero ');
	readln(valor);
	segundoModulo(ar,ar2,valor);								//inciso B
	
	writeln('Ingresar un valor de cuota');
	readln(valorCuota);
	tercerModulo(ar2,cantidad,valorCuota);						//inciso C
end.
