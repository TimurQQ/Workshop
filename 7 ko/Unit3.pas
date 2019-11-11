unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    StringGrid1: TStringGrid;
    Label4: TLabel;
    StringGrid2: TStringGrid;
    Button2: TButton;
    Label6: TLabel;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
   a: array of array of integer; //������ � ��� ������� �������
  n,m:byte;     //���������� ����������, ��������� ����� ����������
    mx:integer;
implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
 var i,j:byte;
begin
Randomize;
Setlength(a,n,m*2);//��� ������� ������� ����� � 2 ���� ������, ����� ���������
for i:=0 to n-1 do
for j:=0 to m-1 do
a[i,j]:=random(10)+1;
mx:=a[0,0];
for i:=0 to n-1 do
for j:=0 to m-1 do
if abs(a[i,j])>abs(mx) then mx:=abs(a[i,j]); //������ �������� ����
Stringgrid1.rowcount:=n;
stringgrid1.colcount:=m;
Stringgrid2.rowcount:=n;
with stringgrid1 do
for i:=0 to n-1 do
for j:=0 to m-1 do
cells[j,i]:=inttostr(a[i,j]);
end;

procedure TForm3.Button2Click(Sender: TObject);
 var i,j,k,f:byte;
begin
j:=0; //������ �������
while j<=m-1 do //���� �� �����
 begin
   f:=0;//��� � ������� ���
   for i:=0 to n-1 do
   if a[i,j]=mx then f:=1; //���� ��� �� ����, ������ ����
   if f=0 then j:=j+1 //���� ���, ���� ������ �� 1
    else //���� ����
     begin
      m:=m+1; //������� �������
      if j=m-2 then  //���� ��� ���� ��������� �������
       for i:=0 to n-1 do a[i,m-1]:=0 //� ����������� ������� ����� ����
      else //���� �� ���������
       begin
        for i:=0 to n-1 do
        for k:=m-1 downto j+2 do//�������� ������� �� 1 ����� ������� �� ����������
        a[i,k]:=a[i,k-1];
        for i:=0 to n-1 do
        a[i,j+1]:=0; //�� �������������� ����� ����� ����
      end;
      j:=j+2;//������������� ����� ������� � ������
     end;
 end;
stringgrid2.colcount:=m;//������ ���������� �������� �� ������ �������
with stringgrid2 do
for i:=0 to n-1 do
for j:=0 to m-1 do
cells[j,i]:=inttostr(a[i,j]);
end;

procedure TForm3.Button3Click(Sender: TObject);
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
     {��� ���� }
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

procedure TForm3.Button4Click(Sender: TObject);
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


