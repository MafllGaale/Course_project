unit Unit1; //������ ��������

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


procedure TForm1.Timer1Timer(Sender: TObject);  // ������ ��������
begin
ProgressBar1.Position:=ProgressBar1.Position+27;  // ���� ������
If (ProgressBar1.Position=ProgressBar1.Max) Then
begin
form2.Show;  // �������� ������� ����
Form1.Hide;  //������ ����� ��������
Timer1.Enabled:=False;
end;
end;


procedure TForm1.FormCreate(Sender: TObject); // ��������
begin
image1.Picture.LoadFromFile('����������� ������������\��������.gif');
end;

end.
