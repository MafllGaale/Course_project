unit Unit4; // ����� � ������

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
//���� ������ ������� ������ � �� ��������� ����� �����
 if (RadioGroup2.ItemIndex>-1) and (not Eof(f)) then begin
 if RadioGroup2.ItemIndex = Nvern-1 then ball:=ball+1; //���� ��������� ������� ������ ������
 RadioGroup2.Items.Clear; //�� ���� ������������
 Repeat //� ��������� ���� ��� ���������� �������
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
//���� ����� ����� ���������, ������ ������� �����������
 Else if Eof(f) then begin
 delete(s,1,1);
 Nvern:=StrToInt(s);
 if RadioGroup2.ItemIndex = Nvern-1 then ball:=ball+1;
 Label1.Caption:='�� �������� �� '+IntToStr(ball)+' �� 4 ��������'; //����� ���-�� ������
 CloseFile(f);
 Button1.Enabled:=False; //������ ���������� ����������� � ���������� �������
 end;
end;


procedure TForm4.RadioGroup1Click(Sender: TObject);
begin
RadioGroup1.Enabled:=false; //����� �������� ���������� ����������
RadioGroup2.Enabled:=true; //��������� ���������� ���� � ��������
Button1.Enabled:=true; //������ �����
case RadioGroup1.ItemIndex of //� ����������� �� ���������� �������� ���������� f
0: AssignFile( f ,'�����\t.txt');//����������� � ������� �������
1: AssignFile( f ,'�����\t2.txt');
end;
reset(f); //��������� ���� ��� ������
readln(f,s); //��������� ������ ������ �� �����
ball:=0; //���������� ���������� ������ 0
repeat
if (s[1]='-') then begin //���� ������ ������ ������ '-' ������ ��� ������
delete(s,1,1);
RadioGroup2.Caption:=s;
end
else if s[1]='*' then begin //���� ���� ������ '*' ������ ��� ����� ������� ������
delete(s,1,1);
Nvern:=StrToInt(s);
end
else RadioGroup2.Items.Add(s); //����� ��� ������� ������
readln(f,s); //��������� ��������� ������ �� �����
until (s[1]='-') or (Eof(f)); //���������� � ����������� ��������� ������� � RadiGroup �� ��� ���
// ���� �� ��������� ��������� ������ ��� ����� �����
end;

procedure TForm4.Image2Click(Sender: TObject);
begin
form4.Hide;
form2.show;
end;

end.

