unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TForm4 = class(TForm)
    Label3: TLabel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Button2: TButton;
    Label4: TLabel;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    Button4: TButton;
    SaveDialog1: TSaveDialog;

    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
     a: array of array of integer; //массив и его будущие размеры
  n,m:byte;     //глобальные переменные, доступные обеим процедурам
   temp:real;

implementation

{$R *.dfm}


procedure TForm4.Button2Click(Sender: TObject);
var i,j,ii, jj, maxel: integer;
begin
maxel:=0;
for i:=1 to n do
for j:=1 to m do
if a[i,j]>maxel then begin
maxel:=a[i,j];
ii:=i;
jj:=j;
end;
for i:=ii to n-1 do
for j:=1 to m do
a[i,j]:=a[i+1,j];
SetLength(a, n-1,m);
n:=n-1;
for i:=1 to n do
for j:=jj to m-1 do
a[i,j]:=a[i,j+1];
SetLength(a, n,m-1);
m:=m-1;

end;

procedure TForm4.Button3Click(Sender: TObject);
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
          {-----------}



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

procedure TForm4.Button4Click(Sender: TObject);
var pr:string;
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

end;

end.