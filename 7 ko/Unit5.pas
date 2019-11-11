unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TForm5 = class(TForm)
    StringGrid1: TStringGrid;
    Label3: TLabel;
    Button2: TButton;
    StringGrid2: TStringGrid;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Button4: TButton;

    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  var
  Form5: TForm5;
     a: array of array of integer; //������ � ��� �������
  n,m:byte;     //���������� ����������, ��������� ����� ����������

implementation

{$R *.dfm}



procedure TForm5.Button2Click(Sender: TObject);
  var i,j:byte;
 temp:integer;
begin
for i:=0 to n-1 do
 begin
  temp:=a[i,m-2];
  a[i,m-2]:=a[i,m-1];
  a[i,m-1]:=temp;
 end;
with stringgrid2 do
for i:=0 to n-1 do
for j:=0 to m-1 do
cells[j,i]:=inttostr(a[i,j]);
end;



procedure TForm5.Button3Click(Sender: TObject);
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

     Setlength(a,n,m); //�������� ������ ��� ������������ ������
     Stringgrid1.rowcount:=n;//������������� ������ ������, ��� �� ������������
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




procedure TForm5.Button4Click(Sender: TObject);                
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

