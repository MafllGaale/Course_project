unit Unit4; // Форма с тестом

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TForm4 = class(TForm)
    Image1: TImage;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    RadioGroup2: TRadioGroup;
    Button1: TButton;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  f: text;
s: string;
Nvern, ball: integer;
implementation

uses Unit2;

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
//Если выбран вариант ответа и не достигнут конец файла
 if (RadioGroup2.ItemIndex>-1) and (not Eof(f)) then begin
 if RadioGroup2.ItemIndex = Nvern-1 then ball:=ball+1; //Если выбранный вариант ответа верный
 RadioGroup2.Items.Clear; //то балл прибавляется
 Repeat //и очищается поле для следующего вопроса
 if (s[1]='-') then begin
 delete(s,1,1);
 RadioGroup2.Caption:=s;
 end
 else if s[1]='*' then begin
 delete(s,1,1);
 Nvern:=StrToInt(s);
end
 else RadioGroup2.Items.Add(s);
 readln(f,s);
 until (s[1]='-') or (Eof(f));
 end
//Если конец файла достигнут, значит вопросы закончились
 Else if Eof(f) then begin
 delete(s,1,1);
 Nvern:=StrToInt(s);
 if RadioGroup2.ItemIndex = Nvern-1 then ball:=ball+1;
 Label1.Caption:='Вы ответили на '+IntToStr(ball)+' из 4 вопросов'; //Вывод кол-ва баллов
 CloseFile(f);
 Button1.Enabled:=False; //Кнопка становится недоступной в завершении проекта
 end;
end;


procedure TForm4.RadioGroup1Click(Sender: TObject);
begin
RadioGroup1.Enabled:=false; //Выбор варианта становится недоступен
RadioGroup2.Enabled:=true; //Доступным становится поле с вопросом
Button1.Enabled:=true; //Кнопка Далее
case RadioGroup1.ItemIndex of //В зависимости от выбранного варианта переменная f
0: AssignFile( f ,'Тесты\t.txt');//связывается с разными файлами
1: AssignFile( f ,'Тесты\t2.txt');
end;
reset(f); //Открываем файл для чтения
readln(f,s); //Считываем первую строку из файла
ball:=0; //изначально количество баллов 0
repeat
if (s[1]='-') then begin //Если первый символ строки '-' значит это вопрос
delete(s,1,1);
RadioGroup2.Caption:=s;
end
else if s[1]='*' then begin //Если перв символ '*' значит это номер верного ответа
delete(s,1,1);
Nvern:=StrToInt(s);
end
else RadioGroup2.Items.Add(s); //Иначе это вариант ответа
readln(f,s); //Считываем следующую строку из файла
until (s[1]='-') or (Eof(f)); //Считывание и отправление вариантов ответов в RadiGroup до тех пор
// пока не достигнут следующий вопрос или конец файла
end;

procedure TForm4.Image2Click(Sender: TObject);
begin
form4.Hide;
form2.show;
end;

end.

