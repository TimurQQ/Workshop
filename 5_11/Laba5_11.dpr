program Laba5_11;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Functions in 'Functions.pas',
  AuxiliaryTypes in 'AuxiliaryTypes.pas',
  ListClass in 'ListClass.pas';

var  n:integer;
     Pl:PList;
     Nums:IntSet;
begin
  Write('Введите кол-во элементов списка: ');
  Readln(n);
  Nums:=[0..n];
  while true do
    begin
      Writeln('Введите список построчно.');
      Write('В каждой строке укажите ЗНАЧЕНИЕ и НОМЕР ЗНАЧЕНИЯ через пробел.');
      Pl:=Get_List(n,Pl);
      if CheckNumbers(Pl,Nums) then
        begin
          Writeln('Список успешно создан.');
          break;
        end
      else
        Writeln('Вы ввели список неправильно!Номера не совпадают');
    end;
  Writeln(#10,'Изначальный список: ',#10);
  Print_List(Pl);
  Writeln;
  Bubble_Sort(Pl);
  Writeln(#10,'Отсортированный список: ',#10);
  Print_List(Pl);
  Readln;
end.
