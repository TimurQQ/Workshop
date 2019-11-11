unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
var
 i,j,sk,sc,r:integer;
 fmass:TextFile;
 filename:string;
begin
 randomize;
 sk:=strtoInt(Edit1.text);
 sc:=strtoInt(Edit2.text); // Получили размеры массива
 if SaveDialog1.Execute
  then
  begin
   filename:=SaveDialog1.FileName+'.txt';    //Указываем путь и даем имя будущему файлу
   AssignFile(fmass,filename);              //связываем файловую переменную с файлом
   rewrite(fmass);                          // открываем для записи файл
   writeln(fmass,sk);                       // пишем сначала количество столбцов
   writeln(fmass,sc);                       // ---- строк
     for i:=1 to sk do
      begin
       writeln(fmass);
        for j:=1 to sc do
          begin
          r:=random(200)-100;
          write(fmass,r,' ');               // пишем по циклу случ значения

          end;
      end;


   end;
closefile(fmass);
Button2.Enabled:=true;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
form6.Close;
end;

end.
