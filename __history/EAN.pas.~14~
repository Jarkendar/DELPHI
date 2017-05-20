unit EAN;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, NewtonMethod, Types, Math;

type
  TMain = class(TForm)
    label_aritmetic: TLabel;
    radio_floatPoint: TRadioButton;
    radio_Section: TRadioButton;
    label_input_x0: TLabel;
    edit_x0_from: TEdit;
    edit_x0_to: TEdit;
    label_function: TLabel;
    label_numberIteration: TLabel;
    edit_eps: TEdit;
    button_start: TButton;
    label_score: TLabel;
    label_iteration: TLabel;
    label_x: TLabel;
    label_it: TLabel;
    label_from: TLabel;
    label_to: TLabel;
    Label3: TLabel;
    label_stan: TLabel;
    label_st: TLabel;
    edit_max_it: TEdit;
    label_max_it: TLabel;
    Label1: TLabel;
    label_fatx: TLabel;
    procedure clearEditNumberIteration(Sender: TObject);
    procedure rewriteNumber(Sender: TObject);
    procedure radioFloatClick(Sender: TObject);
    procedure radioSectionClick(Sender: TObject);
    procedure startClick(Sender: TObject);
    function checkFieldX0(mode : Boolean): Boolean;
    function checkFieldEps():Boolean;
    function checkFieldMit():Boolean;
    function checkFields(mode : Boolean) : Boolean;
    procedure keyPress(Sender: TObject; var Key: Char);

type fx = function (x : Extended) : Extended; far;

  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  Main: TMain;
  wielomian : array of Extended;
  iterator : integer;
  rownanieWielomianu : String;

  x : Extended;  //pocz¹tkowe przybli¿enie
  mit : Integer; //maksymalna liczba iteracji
  eps : Extended; //b³¹d wzglêdny
  fatx : Extended; //wartoœæ funkcji dla
  it : Integer;
  st : Integer;
  wynik : Extended;




//  function Newton(x : Extended;  f : fx ; df : fx; mit : Integer; eps : Extended; fatx : Extended; it : Integer; st : Integer) : Extended;

implementation

{$R *.dfm}

//FUNKCJE
function f (x : Extended) : Extended; far;
begin
  Result :=x*x-2;
end;
function df (x : Extended) : Extended; far;
begin
  df := 2*x;
end;

//function f (x : Extended) : Extended; far;
//var s : Extended;
//begin
//s:=Sin(x);
//f:=s*(s+0.5)-0.5;
//end;
//function df (x : Extended) : Extended; far;
//begin
//df:=Sin(2*x) + 0.5*Cos(x);
//end;
//**************************************************************
procedure TMain.clearEditNumberIteration(Sender: TObject);
begin
  edit_eps.Clear;
end;

procedure TMain.keyPress(Sender: TObject; var Key: Char);  //w³asna obs³uga klawiszy
begin
   if (not ((ord(key) in [48..57]) or (ord(key) in [44..45]) or (ord(key) = 8))) then key := #0;

end;

procedure TMain.radioFloatClick(Sender: TObject);
begin
  edit_x0_To.ReadOnly := true;
end;

procedure TMain.radioSectionClick(Sender: TObject);
begin
  edit_x0_to.ReadOnly := false;
end;

procedure TMain.rewriteNumber(Sender: TObject);
begin
  if radio_floatPoint.Checked then
    begin
      edit_x0_to.Text := edit_x0_from.Text;
    end;
end;






procedure TMain.startClick(Sender: TObject);
var
  checkX0 : Boolean;
  checkMit : Boolean;
  checkEps : Boolean;
begin

    if radio_floatPoint.Checked then  //wybrano arytmetykê zwyk³¹
      begin
        if checkFields(true) then
          begin
            //odpal funkcjê
            x := Newton (x, f, df, mit, eps, fatx , it, st);
            if st = 2 then
              begin
                label_x.Caption := '';
                label_fatx.Caption := '';
                label_it.Caption := '';
                label_st.Caption := IntToStr(st);
              end
            else
              begin
                label_x.Caption := FloatToStr(x);
                label_fatx.Caption := FloatToStr(fatx);
                label_it.Caption := IntToStr(it);
                label_st.Caption := IntToStr(st);
              end;


          end;
      end
    else
    begin
      //arytmetyka przedzia³owa
    end;

end;

function TMain.checkFields(mode : Boolean) : Boolean;
var
  checkX0 : Boolean;
  checkMit : Boolean;
  checkEps : Boolean;
begin
  checkX0 := false;
  checkMit := false;
  checkEps := false;
        if checkFieldX0(mode) then
        begin
          checkX0 := true;
        end;
        if checkFieldEps() then
          begin
            checkEps := true;
          end;
        if checkFieldMit() then
          begin
            checkMit := true;
          end;
        Result := checkX0 and checkEps and checkMit;
end;

function TMain.checkFieldX0(mode : Boolean): Boolean;
begin
if mode then    //true zwyk³a, false przedzia³owa
  begin
    if edit_x0_from.Text = '' then
      begin
        showMessage('Pole "x0 Od" jest puste');
        Result := false;
      end
    else
      begin
        x:= StrToFloat(edit_x0_from.Text);
        Result := true;
      end;
  end
else
  begin
    if (edit_x0_from.Text = '') or (edit_x0_to.Text = '') then
      begin
        showMessage('Pola x0 : Od oraz Do nie mog¹ byæ puste!');
        Result := false;
      end;
    //jeœli A mniejsze od B


    //arytmetyka przedzia³owa
  end;
end;

function TMain.checkFieldEps():Boolean;
begin
   if edit_eps.Text = '' then
     begin
       showMessage('Pole dok³adnoœæ nie mo¿e byæ puste!');
       Result := false;
     end
   else
     begin
        eps := Power(10, -(StrToInt(edit_eps.Text)));
        Result := true;
     end;
end;

function TMain.checkFieldMit():Boolean;
begin
  if edit_max_it.Text = '' then
    begin
      showMessage('Pole maksymalna liczba iteracji nie mo¿e byæ puste!');
      Result := false;
    end
  else
    begin
      mit := StrToInt(edit_max_it.Text);
      Result := true;
    end;


end;

//function Newton(x : Extended;  f : fx ; df : fx; mit : Integer; eps : Extended; fatx : Extended; it : Integer; st : Integer) : Extended;
//begin
//
//
//end;




end.
