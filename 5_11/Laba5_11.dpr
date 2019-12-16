program Laba5_11;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  Functions in 'Functions.pas',
  AuxiliaryTypes in 'AuxiliaryTypes.pas',
  ListClass in 'ListClass.pas';

var  key,i,cnt:integer;
     Pl,SPl:PList;
     Nums:IntSet;
     F:ElemFile;
     root,str:WideString;
     Tokens:WideText;
     files: TStringList;
begin
  files := TStringList.Create;
  root:=GetCurrentDir;
  while true do
    begin
      Writeln('�� ������ ������� ������������������ ����������� n � ��������� � � �����.');
      Writeln('������ ������� ������������������ �������� �����, ������ ������� - ��������, ������ - �����.');
      Writeln('��� ������ ������ ���� �������� � ������ � ����� ��������� �� 1 �� n',#10);
      Writeln('�������� ����� ���� (1 ��� 2 ��� 3):');
      Writeln('1.������� ����');
      Writeln('2.������������ ����� ��������� �����');
      Writeln('3.�����');
      if ReadKey(key)=false then
        continue;
      case key of
        1:CreateFile(F,Nums);
        2:
          begin
            GetFiles(root, files);
            for i := 0 to files.Count - 1 do
            begin
              str:=files[i];
              cnt:=Split('\',str,Tokens);
              Writeln(i+1,': ',Tokens[cnt]);
            end;
            GetFile(F);
            fread(F,Pl);
            while true do
              begin
                Writeln('�������� ����� ���� (1 ��� 2 ��� 3):');
                Writeln('1.������� ������ �� ���������� ������');
                Writeln('2.����������� ������');
                Writeln('3.��������� �����');

                if ReadKey(key)=false then
                  continue;
                case key of
                  1:Print_List(Pl);
                  2:
                    begin
                      CopyList(Pl,SPl);
                      Bubble_Sort(SPl);

                      while true do
                        begin
                          Writeln('�������� ����� ���� (1 ��� 2 ��� 3):');
                          Writeln('1.������� �������� ������');
                          Writeln('2.������� ������������� ������');
                          Writeln('3.��������� �����');
                          if ReadKey(key)=false then
                            continue;
                          case key of
                            1:Print_List(Pl);
                            2:Print_List(SPl);
                            3:
                              begin
                                DisposeAll(Pl);
                                break;
                              end;
                            else Writeln('������ �������� �� ����������!');
                          end;
                        end;
                    end;
                  3:break;
                  else Writeln('������ �������� �� ����������!');
                end;
              end;
          end;
        3:exit;
        else Writeln('������ �������� �� ����������!');
      end;
    end;
end.
