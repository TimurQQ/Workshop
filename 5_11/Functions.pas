unit Functions;

interface

uses AuxiliaryTypes,ListClass;
var  Tokens:WideText;
function CheckNumbers(var Pl:PList;var Nums:IntSet):boolean;
function Split(var s:WideString;var Words:WideText):integer;

implementation
  uses System.SysUtils;
function Split(var s:WideString;var Words:WideText):integer;
var i,len,cnt:integer;
    word:WideString;
  begin
    word:='';
    i:=1;
    cnt:=0;
    len:=Length(s);
    while i<=len do
      begin
        while ((i<=len) and ((s[i]=' ') or (s[i]=#9))) do
          i:=i+1;
        while ((i<=len) and (s[i]<>' ') and (s[i]<>#9)) do
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
