unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm6 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.Image4Click(Sender: TObject);
begin
form6.Hide;
end;

end.
