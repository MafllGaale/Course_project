unit Unit3; //форма с энциклопедией

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw;

type
  TForm3 = class(TForm)
    WebBrowser1: TWebBrowser;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);  // Открытие html страниц 
begin
WebBrowser1.Navigate(extractfilepath(paramstr(0))+'Энциклопедия\Main_page.htm');
end;

end.
