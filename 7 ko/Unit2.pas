unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TForm2 = class(TForm)
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    Button3: TButton;
    Button4: TButton;
    SaveDialog1: TSaveDialog;
    Edit1: TEdit;

    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  a: array of array of integer; //массив и его будущие размеры
  n,m:byte;     //глобальные переменные, доступные обеим процедурам

implementation

{$R *.dfm}


procedure TForm2.Button2Click(Sender: TObject);
var
i, j,  k: integer;
max:integer;
begin

with StringGrid1 do
for j:= 0 to ColCount - 1 do // »дем по столбцами.
  begin
  k:= 0;
  max:= StrToInt(Cells[j,0]); // минимальное число в столбце - модуль верхнего.
    for i:= 0 to RowCount - 1 do // »дем по строкам.
      begin
        if StrToInt(Cells[j,i]) > max then
          begin
          max:= StrToInt(Cells[j,i]);
          k:= i;
          end;
      end;
  Cells[j,k]:= '0';
  end;

end;



procedure TForm2.Button3Click(Sender: TObject);
 var
  f:textFile;
  i,j,znach:integer;
  filename,prob:string;
begin
 if OpenDialog1.Execute
  then
   begin
     filename:=OpenDialog1.FileName;
     AssignFile(f,filename);
     reset(f);
     readln(f,n);
     readln(f,m);
     readln(f);

     Setlength(a,n,m); //выдел€ем пам€ть под динамический массив
     Stringgrid1.rowcount:=n;//фиксированные €чейки уберем, они не используютс€
     stringgrid1.colcount:=m;
     Stringgrid2.rowcount:=n;
     stringgrid2.colcount:=m;

      for i:=0 to n-1  do
      begin
       for j:=0 to m-1 do
        begin
         read(f,znach);
         a[i,j]:=znach;
         stringGrid1.Cells[j,i]:=inttostr(a[i,j]);
        end;
      readln(f);
     end;
   end;
  closefile(f);
 end;

 
procedure TForm2.Button4Click(Sender: TObject);
var
pr:string;
i,j:byte;
f1:TextFile;
begin
  if not SaveDialog1.Execute then exit;
  assignFile(f1,SaveDialog1.FileName+'.txt');
  rewrite(f1);
  pr:=' ';
  writeln(f1,n);
  writeln(f1,m);
  writeln(f1);
  for i:=0 to n-1 do
  begin
    for j:=0 to m-2 do
    begin
      write(f1,a[i,j]);
      write(f1,pr);
    end;
    writeln(f1,a[i,m]);
  end;
  closeFile(f1);
end;

end.
