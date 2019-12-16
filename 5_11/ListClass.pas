unit ListClass;

interface
uses AuxiliaryTypes;
type Plist=^List;
  List=record
      item:Elem;
      next:PList;
      pre:PList;
   end;
function Get_List(var F:ElemFile;Pl:PList):PList;
procedure Bubble_Sort(var Pl:PList);
procedure Print_List(var Pl:PList);
procedure CopyList(var P1,P2:Plist);// P1 to P2;
procedure DisposeAll(var Pl:PList);

implementation
  uses System.SysUtils,Functions;

function Get_List(var F:ElemFile;Pl:PList):PList;
var Lp,Ls:PList;
    i:integer;
    tmp:Elem;
  begin
    i:=1;
    while not eof(F) do
      begin
        Read(F,tmp);
        if Pl=nil then
          begin
            new(Lp);
            Lp^.item.Value:=tmp.Value;
            Lp^.item.Number:=tmp.Number;
            Lp^.next:=nil;
            Lp^.pre:=nil;
            Pl:=Lp;
          end
        else
          begin
            new(Ls);
            Lp^.next:=Ls;
            Ls^.item.Value:=tmp.Value;
            Ls^.item.Number:=tmp.Number;
            Ls^.next:=nil;
            Ls^.pre:=Lp;
            Lp:=Ls;
          end;
          i:=i+1;
      end;
    Result:=Pl;
  end;

procedure DisposeAll(var Pl:PList);
  begin
    while Pl^.next <> nil do
      begin
        Pl:=Pl^.next;
        Pl^.pre:=nil;
      end;
    pl:=nil;
  end;

procedure CopyList(var P1,P2:Plist);// P1 to P2;
var ptr,Lp,Ls:PList;
  begin
    ptr:=P1;
    P2:=nil;
    while(ptr <> nil) do
      begin
        if P2=nil then
          begin
            new(Lp);
            Lp^.item:=ptr^.item;
            Lp^.next:=nil;
            Lp^.pre:=nil;
            P2:=Lp;
          end
        else
          begin
            new(Ls);
            Lp^.next:=Ls;
            lS^.item:=ptr^.item;
            Ls^.next:=nil;
            Ls^.pre:=Lp;
            Lp:=Ls;
          end;
        ptr:=ptr^.next;
      end;
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
    Writeln;
  end;
end.
