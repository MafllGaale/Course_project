unit Unit5; // Открытие "свободного режима"

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  TForm5 = class(TForm)
    Timer1: TTimer;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  Buf:TBitmap;
  path:string;
  Img: array [0..21] of TBitmap;
  KnImg: array [1..5] of TBitmap;
  clothes:array [1..20] of Boolean;
  Vverx: array [1..5] of integer;
implementation

uses Unit2;

{$R *.dfm}

procedure TForm5.FormCreate(Sender: TObject); // Загрузка изображений
var i:integer;
begin
  Path:=ExtractfileDir(Application.exeName); // указание путя
  Buf:= TBitmap.Create;
  Buf.Width:=1100; // Масштабирование формы
  Buf.Height:=600;
  for i:= 0 to 20 do
    begin
      Img[i]:=TBitmap.Create;
      Img[i].Transparent:=true;
      Img[i].LoadFromFile(path+'\Img\'+inttostr(i)+'.bmp'); // Занесение одежды в массив
    end;
  for i:= 1 to 5 do
    begin
      KnImg[i]:=TBitmap.Create;
      KnImg[i].Transparent:=true;
      KnImg[i].LoadFromFile(path+'\Img\kn'+inttostr(i)+'.bmp'); // Занесение кнопок в массив
    end;

    for i:= 1 to 21 do  // Прозрачная одежда при первом запуске
    clothes[i]:=false;

    Vverx[1]:=1;
    Vverx[2]:=5;
    Vverx[3]:=9;
    Vverx[4]:=13;
    Vverx[5]:=17;

end;

procedure TForm5.Timer1Timer(Sender: TObject); // Загрузка фона, куклы
var i:integer;
begin
      Buf:=TBitMap.Create;
      Buf.LoadFromFile('Графическая составляющая\fon.bmp');


  Buf.Canvas.Draw(0,0,Img[0]);

  for i:= 1 to 5 do
  Buf.Canvas.Draw(i*150+190,450,KnImg[i]);

    for i:= 1 to 20 do
    if clothes[i]=true then Buf.Canvas.Draw(0,0,Img[i]);

  Form5.Canvas.Draw(0,0,Buf);
end;


procedure TForm5.FormMouseDown(Sender: TObject; Button: TMouseButton;  // Реализация кнопок
  Shift: TShiftState; X, Y: Integer);
begin
  Form5.caption:=inttostr(X);

  if (X>=340) and (X<=440) and (Y>=450) and (Y<=545) then   // Кнопка с верхней одеждой
    begin
    clothes[Vverx[1]]:=false;
    inc(Vverx[1]);
    if Vverx[1]>4 then Vverx[1]:=1;
    clothes[Vverx[1]]:=true;
    end;

    if (X>=490) and (X<=540) and (Y>=450) and (Y<=545) then  // Кнопка с нижней одеждой
    begin
    clothes[Vverx[2]]:=false;
    inc(Vverx[2]);
    if Vverx[2]>8 then Vverx[2]:=5;
    clothes[Vverx[2]]:=true;
    end;

     if (X>=640) and (X<=740) and (Y>=450) and (Y<=545) then  // Кнопка с обувью
    begin
    clothes[Vverx[3]]:=false;
    inc(Vverx[3]);
    if Vverx[3]>12 then Vverx[3]:=9;
    clothes[Vverx[3]]:=true;
    end;

    if (X>=790) and (X<=890) and (Y>=450) and (Y<=545) then   // Кнопка с прической
    begin
    clothes[Vverx[4]]:=false;
    inc(Vverx[4]);
    if Vverx[4]>16 then Vverx[4]:=13;
    clothes[Vverx[4]]:=true;
    end;

    if (X>=940) and (X<=1040) and (Y>=450) and (Y<=545) then  // Кнопка с аксекссуарами
    begin
    clothes[Vverx[5]]:=false;
    inc(Vverx[5]);
    if Vverx[5]>20 then Vverx[5]:=17;
    clothes[Vverx[5]]:=true;
    end;


end;

procedure TForm5.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TForm5.Image1Click(Sender: TObject);
begin
form5.Hide;
form2.show;
end;

end.

