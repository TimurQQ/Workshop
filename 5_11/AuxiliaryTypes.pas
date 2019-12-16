unit AuxiliaryTypes;

interface

const n=255;
      m=2000;
type Elem = record
      Value : integer;
      Number : integer;
   end;
  IntSet = set of 1..n;
  WideText = array [1..m] of WideString;
  ElemFile = file of Elem;

implementation
//Nothing to be implementate huh//
end.
