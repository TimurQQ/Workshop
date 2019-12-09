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
  Write('������� ���-�� ��������� ������: ');
  Readln(n);
  Nums:=[0..n];
  while true do
    begin
      Writeln('������� ������ ���������.');
      Write('� ������ ������ ������� �������� � ����� �������� ����� ������.');
      Pl:=Get_List(n,Pl);
      if CheckNumbers(Pl,Nums) then
        begin
          Writeln('������ ������� ������.');
          break;
        end
      else
        Writeln('�� ����� ������ �����������!������ �� ���������');
    end;
  Writeln(#10,'����������� ������: ',#10);
  Print_List(Pl);
  Writeln;
  Bubble_Sort(Pl);
  Writeln(#10,'��������������� ������: ',#10);
  Print_List(Pl);
  Readln;
end.
