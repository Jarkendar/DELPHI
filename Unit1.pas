unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    label_description: TLabel;
    edit_input: TEdit;
    button_accept: TButton;
    procedure click_accept_Unit1(Sender: TObject);
    procedure zamknijOkno();
    procedure zamknij(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  stopien : integer;
  tablica : array of Extended;
  rozmiar : integer;
  wiel : String;

implementation

{$R *.dfm}

uses EAN;

procedure TForm1.click_accept_Unit1(Sender: TObject);
begin
if edit_input.Text = '' then
begin
  ShowMessage('Pole musi byæ wype³nione');
end
else
begin
  if label_description.Caption = 'WprowadŸ stopieñ wielomianu:' then
  begin
    rozmiar := StrToInt(edit_input.Text);
    if rozmiar>0 then
    begin
      SetLength(tablica,rozmiar+1);
      label_description.Caption := Concat('Wspó³czynnik przy x^',IntToStr(rozmiar));
    end
    else
    begin
      ShowMessage('Stopieñ wiêkszy od 0');
    end;
  end
  else
  begin
    if rozmiar >= 0  then
      begin
        tablica[rozmiar] := StrToFloat(edit_input.Text);
        rozmiar := rozmiar - 1;
        wiel := Concat(wiel, FloatToStr(tablica[rozmiar]) + 'x^'+ IntToStr(rozmiar)+'+');
        ShowMessage(wiel);
        edit_input.Text := '';
      end
      else
            zamknijOkno;
        //Kod ukoñczenia wpisywania funkcji, zapis do pliku

      end;
  end;
end;

procedure TForm1.zamknij(Sender: TObject; var Action: TCloseAction);
begin
  EAN.Main.Enabled := true;
end;

procedure TForm1.zamknijOkno();
begin
EAN.Main.Enabled := true;
ShowMessage('Wprowadzono wielomian');
  Form1.Close;
end;


end.
