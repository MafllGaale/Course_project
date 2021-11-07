unit Unit2; // Форма главного меню

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Menus, ShellAPI, MMSystem;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure Image3Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit3, Unit4, Unit5, Unit6;

{$R *.dfm}

procedure TForm2.Image3Click(Sender: TObject); // Открытие энциклопедии
begin
Form3.Show;
end;

procedure TForm2.Image6Click(Sender: TObject);  // Закрытие всего проекта
begin
Halt;
end;

procedure TForm2.Image4Click(Sender: TObject); // Открытие теста
begin
Form4.Show;
end;

procedure TForm2.Image5Click(Sender: TObject);  // Открытие "свободного режима"
begin
Form5.Show;
end;

procedure TForm2.N1Click(Sender: TObject);  // Открытие формы "об авторе"
begin
form6.Show;
end;

procedure TForm2.N2Click(Sender: TObject);  // Открытие справки
begin
ShellExecute(0,PChar ('Open'), PChar ('Справка\Справка.chm'),nil,nil,SW_SHOW);
end;

procedure TForm2.FormCreate(Sender: TObject);  // Открытие фоновой музыки 
begin
PlaySound (PChar('музыка\lofi32.wav'),0,SND_ASYNC Or SND_LOOP);
end;
end.
