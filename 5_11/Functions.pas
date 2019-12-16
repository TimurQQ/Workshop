unit Functions;

interface

uses AuxiliaryTypes,ListClass,System.Classes;
var  Tokens:WideText;
function CheckNumbers(var Pl:PList;var Nums:IntSet):boolean;
function Split(ch:char;var s:WideString;var Words:WideText):integer;
function ReadKey(var key:integer):boolean;
procedure CreateFile(var F:ElemFile;var Nums:IntSet);
procedure GetFile(var F:ElemFile);
procedure fread(var F:ElemFile;var Pl:PList);
procedure GetFiles(const dir: string; list: TStrings);

implementation
  uses System.SysUtils;

procedure GetFile(var F:ElemFile);
var str:WideString;
  begin
    while(true) do
      begin
        Write(#10,'Введите имя файла с расширением: ');
        Readln(str);
        str:=trim(str);
        if FileExists(str) then
          begin
            AssignFile(F, str);
            break;
          end
        else Writeln('Такого файла не существует в директории!');
      end;
  end;

function ReadKey(var key:integer):boolean;
  begin
    Result:=true;
    try
      Readln(key);
    except
      Writeln('Такого варианта не существует!',#10);
      Result:=false;
    end;
  end;

procedure GetFiles(const dir: string; list: TStrings);
var rec: TSearchRec;
begin
  if FindFirst(dir + '\*.*', faAnyFile, rec) = 0 then
  repeat
    if (rec.Name = '.') or (rec.Name = '..') then Continue;
    if (rec.Attr and faDirectory) <> 0 then GetFiles(dir + '\' + rec.Name, list)
    else list.Add(dir + '\' + rec.Name);
  until FindNext(rec) <> 0;
  FindClose(rec);
end;

procedure fread(var F:ElemFile;var Pl:PList);
  begin
    Reset(F);
    Pl:=Get_List(F,Pl);
    CloseFile(F);
  end;

procedure fwrite(var F:ElemFile;var Nums:IntSet);
var tmp:Elem;
    i,n,val:integer;
    isCorrect:boolean;
    str:WideString;
  begin
    while true do
      begin
        i:=1;
        isCorrect:=True;
        Write('Введите кол-во элементов списка: ');
        while True do
          begin
            try
              Readln(n);
              break;
            except
              Writeln('Неправильный формат ввода!');
            end;
          end;
        Rewrite(F);
        Nums:=[0..n];
        Writeln('Введите список построчно.');
        Write('В каждой строке укажите ЗНАЧЕНИЕ и НОМЕР ЗНАЧЕНИЯ через пробел.');
        while i<=n do
        begin
          Write(#10,'Введите ', i ,'-й элемент: ');

          while True do
          begin
            try
              Readln(str);
              Split(' ',str,Tokens);
              tmp.Value:=StrToInt(Tokens[1]);
              tmp.Number:=StrToInt(Tokens[2]);
              break;
            except
              Writeln('Неправильный формат ввода!');
            end;
          end;
          Write(F,tmp);
          val:=tmp.Number;
          if (val in Nums) then
            Exclude(Nums,val)
          else
            isCorrect:=False;
          i:=i+1;
        end;
        if isCorrect then
          begin
            Writeln(#10,'Список был введён корректно и успешно создан.',#10);
            break;
          end
        else
          begin
            Writeln('Вы ввели список неправильно. Номера не удовлетворяют условию.');
            Writeln('Введите список корректно:');
          end;
      end;
  end;

procedure CreateFile(var F:ElemFile;var Nums:IntSet);
var str:WideString;
  begin
    Write('Напишите название файла c расширением:');
    Readln(str);
    AssignFile(F,str);
    fwrite(F,Nums);
    CloseFile(F);
  end;

function Split(ch:WideChar; var s:WideString;var Words:WideText):integer;
var i,len,cnt:integer;
    word:WideString;
  begin
    word:='';
    i:=1;
    cnt:=0;
    len:=Length(s);
    while i<=len do
      begin
        while ((i<=len) and ((s[i]=' ') or (s[i]=#9) or (s[i]=ch))) do
          i:=i+1;
        while ((i<=len) and (s[i]<>' ') and (s[i]<>#9) and (s[i]<>ch)) do
          begin
            word:=word+s[i];
            i:=i+1;
          end;
        cnt:=cnt+1;
        Words[cnt]:= word;
        word:='';
      end;
    Result:=cnt;
  end;
function CheckNumbers(var Pl:PList;var Nums:IntSet):boolean;
var ptr:PList;
    val:integer;
  begin
    Result:=true;
    ptr:=Pl;
    while(ptr <> nil) do
      begin
        val:=ptr^.item.Number;
        if (val in Nums) then
          Exclude(Nums,val)
        else
          begin
            Result:=false;
            break;
          end;
        ptr:=ptr^.next;
      end;
  end;
end.
