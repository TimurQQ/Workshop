unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    Button5: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;

    procedure Button5Click(Sender: TObject);
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
  Form1: TForm1;

implementation

uses Unit2, Unit3, Unit4, Unit5,unit6;

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.Show;
end;

 procedure TForm1.Button2Click(Sender: TObject);
begin
form3.Show
end;


procedure TForm1.Button3Click(Sender: TObject);
begin
form4.Show
end;



procedure TForm1.Button4Click(Sender: TObject);
begin
form5.Show
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
form6.ShowModal;
end;
end.
