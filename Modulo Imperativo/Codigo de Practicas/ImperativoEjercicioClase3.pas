{Escribir un programa que:
a. Implemente un modulo que lea informacion de socios de un club y las almacene en un arbol binario de busqueda. De cada socio se lee numero de socio, 
nombre y edad. La lectura finaliza con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio.
b. Una vez generado el arbol, realice modulos independientes que reciban el arbol como parametro y: 
    i. Informe el numero de socio mas grande. Debe invocar a un modulo recursivo que retorne dicho valor. 
    ii. Informe los datos del socio con el numero de socio mas chico. Debe invocar a un modulo recursivo que retorne dicho socio. 
    iii. Informe el numero de socio con mayor edad. Debe invocar a un modulo recursivo que retorne dicho valor. 
    iv. Aumente en 1 la edad de todos los socios.
    v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un modulo recursivo que reciba el valor lei­do y
       retorne verdadero o falso.
    vi. Lea un nombre e informe si existe o no existe un socio con ese valor. Debe invocar a un modulo recursivo que reciba el nombre lei­do y 
        retorne verdadero o falso.
    vii. Informe la cantidad de socios. Debe invocar a un modulo recursivo que retorne dicha cantidad.
    viii. Informe el promedio de edad de los socios. Debe invocar a un modulo recursivo que retorne dicho promedio.
    ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el arbol cuyo numero de socio se encuentra entre 
        los dos valores ingresados. Debe invocar a un modulo recursivo que reciba los dos valores leÃ­dos y retorne dicha cantidad. 
    x. Informe los numeros de socio en orden creciente. 
    xi. Informe los numeros de socio pares en orden decreciente.
}

Program ImperativoClase3;

type 
     rangoEdad = 12..100;
     cadena15 = string [15];
     socio = record
               numero: integer;
               nombre: cadena15;
               edad: rangoEdad;
             end;
     arbol = ^nodoArbol;
     nodoArbol = record
                    dato: socio;
                    HI: arbol;
                    HD: arbol;
                 end;
     
procedure GenerarArbol (var a: arbol);
{ Implemente un modulo que lea informacion de socios de un club y las almacene en un arbol binario de busqueda. De cada socio se lee numero de socio, 
nombre y edad. La lectura finaliza con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio. }

  Procedure LeerSocio (var s: socio);
  begin
    write ('Ingrese numero del socio: ');
    readln (s.numero);
    If (s.numero <> 0)then begin
           write ('Ingrese nombre del socio: ');
           readln (s.nombre);
           write ('Ingrese edad del socio: ');
           readln (s.edad);
         end;
  end;  
  
  Procedure InsertarElemento (var a: arbol; elem: socio);
  Begin
    if (a = nil) then begin
           new(a);
           a^.dato:= elem; 
           a^.HI:= nil; 
           a^.HD:= nil;
         end
    else 
         if (elem.numero < a^.dato.numero) then 
             InsertarElemento(a^.HI, elem)
         else
             InsertarElemento(a^.HD, elem); 
  End;

var unSocio: socio;  
Begin
 writeln;
 writeln ('----- Ingreso de socios y armado del arbol ----->');
 writeln;
 a:= nil;
 LeerSocio (unSocio);
 while (unSocio.numero <> 0)do
  begin
   InsertarElemento (a, unSocio);
   writeln;
   LeerSocio (unSocio);
  end;
 writeln;
 writeln ('-----------------------------------------------');
 writeln;
end;

procedure InformarNumeroSocioMasGrande (a: arbol);
{Informe el numero de socio mas grande. Debe invocar a un modulo recursivo que retorne dicho valor.}

  function NumeroMasGrande (a: arbol): integer;
  begin
    if (a = nil) then
        NumeroMasGrande:= -1
    else 
      if (a^.HD = nil) then 
          NumeroMasGrande:= a^.dato.numero
      else 
          NumeroMasGrande:= NumeroMasGrande (a^.HD);
  end;
   
var 
  max: integer;
begin
  writeln;
  writeln ('----- Informar Numero Socio Mas Grande ----->');
  writeln;
  max:= NumeroMasGrande (a);
  if (max = -1) then 
      writeln ('Arbol sin elementos')
  else begin
         writeln;
         writeln ('Numero de socio mas grande: ', max);
         writeln;
       end;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;

procedure InformarDatosSocioNumeroMasChico (a: arbol);
{ Informe los datos del socio con el numero de socio mas chico. Debe invocar a un modulo recursivo que retorne dicho socio. }
  
  function SocioMasChico (a: arbol): arbol;
  begin
    if ((a = nil) or (a^.HI = nil))then 
        SocioMasChico:= a
    else
       SocioMasChico:= SocioMasChico (a^.HI);
  end;
   
var minSocio: arbol;
begin
  writeln;
  writeln ('----- Informar Datos Socio Numero Mas Chico ----->');
  writeln;
  minSocio:= SocioMasChico (a);
  if (minSocio = nil) then
        writeln ('Arbol sin elementos')
  else begin
         writeln;
         writeln ('Socio con numero mas chico: ', minSocio^.dato.numero, ' Nombre: ', minSocio^.dato.nombre, ' Edad: ', minSocio^.dato.edad); 
         writeln;
       end;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;

procedure InformarNumeroSocioConMasEdad (a: arbol);
{ Informe el numero de socio con mayor edad. Debe invocar a un modulo recursivo que retorne dicho valor.  }

     procedure actualizarMaximo(var maxValor,maxElem : integer; nuevoValor, nuevoElem : integer);
	begin
	  if (nuevoValor >= maxValor) then
	  begin
		maxValor := nuevoValor;
		maxElem := nuevoElem;
	  end;
	end;
	procedure NumeroMasEdad (a: arbol; var maxEdad: integer; var maxNum: integer);
	begin
	   if (a <> nil) then
	   begin
		  actualizarMaximo(maxEdad,maxNum,a^.dato.edad,a^.dato.numero);
		  numeroMasEdad(a^.hi, maxEdad,maxNum);
		  numeroMasEdad(a^.hd, maxEdad,maxNum);
	   end; 
	end;
var maxEdad, maxNum: integer;
begin
  writeln;
  writeln ('----- Informar Numero Socio Con Mas Edad ----->');
  writeln;
  maxEdad := -1;
  NumeroMasEdad (a, maxEdad, maxNum);
  if (maxEdad = -1) then 
     writeln ('Arbol sin elementos')
  else begin
         writeln;
         writeln ('Numero de socio con mas edad: ', maxNum);
         writeln;
       end;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;

procedure AumentarEdad (a: arbol);
begin
 if (a <> nil)then begin
        a^.dato.edad:= a^.dato.edad + 1;
        AumentarEdad (a^.HI);
        AumentarEdad (a^.HD);
      end;
end;

procedure InformarExistenciaNumeroSocio (a: arbol);
{ Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un modulo recursivo que reciba el valor lei­do y
       retorne verdadero o falso. }
       
  function Buscar (a: arbol; num: integer): boolean;
  begin
    if (a = nil)then
       Buscar:= false
    else 
      If (a^.dato.numero = num) then
           Buscar:= true
      else 
         if (num < a^.dato.numero)then 
              Buscar:= Buscar (a^.HI, num)
         else 
              Buscar:= Buscar (a^.HD, num)
  end;
  
var numABuscar: integer;
begin
  writeln;
  writeln ('----- Informar Existencia Numero Socio ----->');
  writeln;
  write ('Ingrese numero de socio a buscar: ');
  Readln (numABuscar);
  writeln;
  if (Buscar (a, numABuscar)) then 
     writeln ('El numero ', numABuscar, ' existe')
  else 
     writeln ('El numero ', numABuscar, ' no existe');
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;
  
procedure InformarExistenciaNombreSocio (arb:arbol;var nomb:cadena15);

  function buscaNombre (ar:arbol,nom:cadena):boolean;
  begin
    if(ar=nil)then
      buscaNombre:=false
    else 
      buscaNombre:=ar^.dato.nombre=nom or buscaNombre(ar^.HI,nom) or buscaNombre(ar^.HD.nom);
  end;

begin
  if(buscaNombre(arb,nomb))then
     writeln('si,existe');
  else 
    writeln('no,no existe');
end;

procedure recorridoEnOrden(arbo:arbol;var cant:integer);
  begin
     if(arbo<>nil)then begin
       recorridoEnOrden(arbo^.HI,cant);
       cant:=cant+1;
       recorridoEnOrden(arbo^.HD,cant);
     end;
  end;

procedure InformarCantidadSocios(ar:arbol);
var
  canti:integer;
begin
  canti:=0;
  recorridoEnOrden(ar,canti);
  writeln('cantidad de socios totales:',canti);
end;
  
procedure InformarPromedioEdad(arbl:arbol);  

  procedure calculaPromedio(arl:arbol;var sumador:integer);
  begin
    if(a<>nil)then begin
      calculaPromedio(arl^.HI,sumador);
      sumador:=sumador+arl^.dato.edad;
      calculaPromedio(arl^.HD,sumador);
    end;
  end;
  
var
  cantidad:integer;
  suma:integer;
  promedio:=real;
begin
  suma:=0;
  recorridoEnOrden(arbl,cantidad);
  calculaPromedio(arbl,suma);
  promedio:=suma/cantidad;
  writeln('promedio de edad:',promedio);
end;

procedure InformarCantidadSociosEnRango(arblo:arbol;val1,val2:integer);

  procedure cuentaSocios (arbolito:arbol;v1,v2,cant:integer);                                            
  begin
    if(arbolito<>nil)then begin
      cuentaSocios(arbolito^.HI,v1,v2,cant);
      if(arbolito^.dato.numero>=v1)and(arbolito^.dato.numero=<v2)then 
          cant:=cant+1;
      cuentaSocios(arbolito^.HD,v1,v2,cant);
    end;
  end;
  
var
  contador:integer;
begin
  contador:=0;
  cuentaSocios(arblo,val1,val2,contador);
  writeln('cantidad de socios entre',val1,'y',val2,':',contador);
end;

procedure InformarNumerosSociosOrdenCreciente(arbolt:arbol);
begin
  if(arbolt<>nil)then begin
     InformarNumerosSociosOrdenCreciente(arbolt^.HI);
     writeln(arbolt^.dato.numero);
     InformarNumerosSociosOrdenCreciente(arbolt^.HD);ç
  end;
end;

procedure InformarNumerosSociosOrdenDeCreciente (al:arbol);
begin
  if(al<>nil)then begin
    InformarNumerosSociosOrdenDeCreciente(al^.HD);
    writeln(al^.dato.numero);
    InformarNumerosSociosOrdenDeCreciente(al^.HI);
  end;
end;

var                                             //programa principal
  a: arbol; 
  nombre:cadena15;
  valor1,valor2:integer;
Begin
  cuenta:=0;
  GenerarArbol (a);
  InformarNumeroSocioMasGrande (a);
  InformarDatosSocioNumeroMasChico (a);
  InformarNumeroSocioConMasEdad (a);
  AumentarEdad (a);
  InformarExistenciaNumeroSocio (a);
  readln(nombre);
  InformarExistenciaNombreSocio (a,nombre);
  InformarCantidadSocios (a);
  InformarPromedioDeEdad (a);
  readln(valor1);
  readln(valor2);
  InformarCantidadSociosEnRango (a,valor1,valor2);
  InformarNumerosSociosOrdenCreciente (a);
  InformarNumerosSociosOrdenDeCreciente (a);
End.
