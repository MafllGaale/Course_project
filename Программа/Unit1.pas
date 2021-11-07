unit Unit1; //Модуль заставки

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs, StdCtrls, XPMan, ExtCtrls, Menus, jpeg, ComCtrls, GIFImage;


type
TForm1 = class(TForm)
Timer1: TTimer;
ProgressBar1: TProgressBar;
    Image1: TImage;

procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);




private
{ Private declarations }
public
{ Public declarations }
end;

var
Form1: TForm1;

implementation

uses
Unit2;

{$R *.dfm}


procedure TForm1.Timer1Timer(Sender: TObject);  // Полоса загрузки
begin
ProgressBar1.Position:=ProgressBar1.Position+27;  // Сама полоса
If (ProgressBar1.Position=ProgressBar1.Max) Then
begin
form2.Show;  // Показать главное меню
Form1.Hide;  //Скрыть форму заставки
Timer1.Enabled:=False;
end;
end;


procedure TForm1.FormCreate(Sender: TObject); // Заставка
begin
image1.Picture.LoadFromFile('Графическая составляющая\заставка.gif');
end;

end.
