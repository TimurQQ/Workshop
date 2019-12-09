unit ListClass;

interface
uses AuxiliaryTypes;
type Plist=^List;
  List=record
      item:Elem;
      next:PList;
      pre:PList;
   end;
function Get_List(k:integer;Pl:PList):PList;
procedure Bubble_Sort(var Pl:PList);
procedure Print_List(var Pl:PList);

implementation
  uses System.SysUtils,Functions;

function Get_List(k:integer;Pl:PList):PList;
var Lp,Ls:PList;
    i:integer;
    str:WideString;
  begin
    i:=1;
    while i<=k do
      begin
        Write(#10,IntToStr(i)+ '-й элемент: ');
        Readln(str);
        Split(str,Tokens);
        if Pl=nil then
          begin
            new(Lp);
            Lp^.item.Value:=StrToInt(Tokens[1]);
            Lp^.item.Number:=StrToInt(Tokens[2]);
            Lp^.next:=nil;
            Lp^.pre:=nil;
            Pl:=Lp;
          end
        else
          begin
            new(Ls);
            Lp^.next:=Ls;
            Ls^.item.Value:=StrToInt(Tokens[1]);
            Ls^.item.Number:=StrToInt(Tokens[2]);
            Ls^.next:=nil;
            Ls^.pre:=Lp;
            Lp:=Ls;
          end;
          i:=i+1;
      end;
    Result:=Pl;
  end;
procedure Swap(var P1,P2:PList);
var tmp:Elem;
  begin
    tmp:=P1.item;
    P1.item:=P2.item;
    P2.item:=tmp;
  end;
procedure Bubble_Sort(var Pl:PList);
var ptr1,ptr2:PList;
  begin
    ptr1:=Pl;
    ptr2:=Pl;
    while(ptr1 <> nil) do
      begin
        ptr2:=Pl;
        while(ptr2^.next <> nil) do
          begin
            if (ptr2^.item.Number > (ptr2^.next)^.item.Number) then
              Swap(ptr2,ptr2^.next);
            ptr2:=ptr2^.next;
          end;
        ptr1:=ptr1^.next;
      end;
  end;
procedure Print_List(var Pl:PList);
var ptr:PList;
  begin
    ptr:=Pl;
    while(ptr <> nil)do
      begin
      Write(' (');
      Write(ptr^.item.Value);
      Write(',');
      Write(ptr^.item.Number);
      Write(') ');
      ptr:=ptr^.next;
      end;
  end;
end.
