program ejericio2;
type 

  procedure imprimeDigitos (var num:integer);
  var
    dig:integer;
  begin
    dig:=num mod 10;
    writeln(dig);
    num:=num div 10;
    if(num<>0)then
      imprimeDigitos(num);
  end;

var
  numero:integer;
begin
  readln(numero);
  while(numero<>0)do begin
     imprimeDigitos(numero);
     readln(numero);
  end;
end;

//no compila en la parte de procedure 
