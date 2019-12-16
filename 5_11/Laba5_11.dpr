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
      Writeln('Вы можете создать последовательность размерности n и сохранить её в файле.');
      Writeln('Каждый элемент последовательности является парой, первый элемент - значение, второй - номер.');
      Writeln('Все номера должны быть различны и давать в сумме множество от 1 до n',#10);
      Writeln('Выберите пункт меню (1 или 2 или 3):');
      Writeln('1.Создать файл');
      Writeln('2.Использовать ранее созданные файлы');
      Writeln('3.Выйти');
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
                Writeln('Выберите пункт меню (1 или 2 или 3):');
                Writeln('1.Вывести список из полученных данных');
                Writeln('2.Упорядочить список');
                Writeln('3.Вернуться назад');

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
                          Writeln('Выберите пункт меню (1 или 2 или 3):');
                          Writeln('1.Вывести исходный список');
                          Writeln('2.Вывести упорядоченный список');
                          Writeln('3.Вернуться назад');
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
                            else Writeln('Такого варианта не существует!');
                          end;
                        end;
                    end;
                  3:break;
                  else Writeln('Такого варианта не существует!');
                end;
              end;
          end;
        3:exit;
        else Writeln('Такого варианта не существует!');
      end;
    end;
end.
