unit EAN;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, NewtonMethod, NewtonIntervalMethod, Types, Math, IntervalArithmetic32and64;

type
  TMain = class(TForm)
    label_aritmetic: TLabel;
    radio_floatPoint: TRadioButton;
    radio_Section: TRadioButton;
    label_input_x0: TLabel;
    edit_x0_from: TEdit;
    edit_x0_to: TEdit;
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
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure clearEditNumberIteration(Sender: TObject);
    procedure rewriteNumber(Sender: TObject);
    procedure radioFloatClick(Sender: TObject);
    procedure radioSectionClick(Sender: TObject);
    procedure startClick(Sender: TObject);
    function checkFieldX0(mode : Boolean): Boolean;
    function checkFieldEps(mode : Boolean):Boolean;
    function checkFieldMit():Boolean;
    function checkFields(mode : Boolean) : Boolean;
    procedure keyPress(Sender: TObject; var Key: Char);
    procedure checkClick1(Sender: TObject);
    procedure checkClick2(Sender: TObject);

type fx = function (x : Extended) : Extended; far;
type fxinterval = function (x : interval; var st : Integer) : interval; far;

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
  intervalx : interval;
  mit : Integer; //maksymalna liczba iteracji
  eps : Extended; //b³¹d wzglêdny
  intervaleps : interval;
  fatx : Extended; //wartoœæ funkcji dla
  intervalfatx : interval;
  it : Integer;
  st : Integer;
  lewyKoniec : String;
  prawyKoniec : String;

implementation

{$R *.dfm}

//FUNKCJE ***********************************
function f1 (x : Extended) : Extended; far;
begin
  f1 :=x*x-2;
end;
function df1 (x : Extended) : Extended; far;
begin
  df1 := 2*x;
end;

function f2 (x : Extended) : Extended; far;
  var s : Extended;
  begin
    s:=Sin(x);
    f2:=s*(s+0.5)-0.5;
end;
function df2 (x : Extended) : Extended; far;
  begin
    df2:=Sin(2*x) + 0.5*Cos(x);
  end;

//FUNKCJE PRZEDZIA£OWE
function if1 (x : interval; var st :Integer) : interval; far;
begin
  if1 :=x*x-2;
  st := 0;
end;
function idf1 (x : interval; var st : Integer) : interval; far;
begin
  idf1 := 2*x;
  st := 0;
end;

function if2 (x : interval; var st : Integer) : interval; far;
  var
    s : interval;
  begin
    s:=iSin(x,st);
    if2:=s*(s+0.5)-0.5;
end;
function idf2 (x : interval; var st : Integer) : interval; far;
var
  st2 : Integer;
  begin
    idf2:=iSin(2*x, st) + 0.5*iCos(x, st2);
    if st2 <> 0 then st := st2;
  end;

//**************************************************************
procedure TMain.clearEditNumberIteration(Sender: TObject);
begin
  edit_eps.Clear;
end;

procedure TMain.keyPress(Sender: TObject; var Key: Char);  //w³asna obs³uga klawiszy
begin
   if (not ((ord(key) in [48..57]) or (ord(key) in [44..45]) or (ord(key) = 8))) then key := #0;

end;

procedure TMain.checkClick1(Sender: TObject);
begin
  if CheckBox1.Checked then
    begin
      CheckBox1.Checked := true;
      CheckBox2.Checked := false;
    end
  else
    begin
      CheckBox1.Checked := false;
      CheckBox2.Checked := true;
    end;
end;

procedure TMain.checkClick2(Sender: TObject);
begin
  if CheckBox2.Checked then
    begin
      CheckBox2.Checked := true;
      CheckBox1.Checked := false;
    end
  else
    begin
      CheckBox2.Checked := false;
      CheckBox1.Checked := true;
    end;
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
begin

    if radio_floatPoint.Checked then  //wybrano arytmetykê zwyk³¹
      begin
        if checkFields(true) then
          begin
            //odpal funkcjê
            if CheckBox1.Checked then
              begin
                x := Newton (x, f1, df1, mit, eps, fatx , it, st);
              end;
            if CheckBox2.Checked then
              begin
                x := Newton (x, f2, df2, mit, eps, fatx , it, st);
              end;
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
    else //arytmetyka przedzia³owa
      begin
       if checkFields(false) then
          begin
            //odpal funkcjê
            if CheckBox1.Checked then
              begin
                intervalx := NewtonInterval (intervalx, if1, idf1, mit, intervaleps, intervalfatx , it, st);
              end;
            if CheckBox2.Checked then
              begin
                intervalx := NewtonInterval (intervalx, if2, idf2, mit, intervaleps, intervalfatx , it, st);
              end;
            if st = 2 then
              begin
                label_x.Caption := '';
                label_fatx.Caption := '';
                label_it.Caption := '';
                label_st.Caption := IntToStr(st);
              end
            else
              begin
                iends_to_strings(intervalx, lewyKoniec, prawyKoniec);
                label_x.Caption := '['+lewyKoniec+';'+prawyKoniec+']';
                iends_to_strings(intervalfatx, lewyKoniec, prawyKoniec);
                label_fatx.Caption := '['+lewyKoniec+';'+prawyKoniec+']';
                label_it.Caption := IntToStr(it);
                label_st.Caption := IntToStr(st);
              end;
          end;
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
        if checkFieldEps(mode) then
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
else  //arytmetyka przedzia³owa
  begin
    if (edit_x0_from.Text = '') or (edit_x0_to.Text = '') then
      begin
        showMessage('Pola x0 : Od oraz Do nie mog¹ byæ puste!');
        Result := false;
      end
    else
      begin
        //jeœli A mniejsze od B
        intervalx.a := left_read(edit_x0_from.Text);
        intervalx.b := right_read(edit_x0_to.Text);

        if intervalx.a > intervalx.b then
          begin
             showMessage('Pocz¹tek przedzia³u nie mo¿e byæ wiêkszy od jego koñca!');
             Result := false;
          end
        else
          begin
            Result := true;
          end;
    end;
  end;
end;

function TMain.checkFieldEps(mode : Boolean):Boolean;
begin
  if mode then
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
   end
  else
    begin //arytmetyka przedzia³owa
      if edit_eps.Text = '' then
        begin
          showMessage('Pole dok³adnoœæ nie mo¿e byæ puste!');
          Result := false;
        end
      else
        begin
          eps := Power(10, -(StrToInt(edit_eps.Text)));
          intervaleps.a := left_read(FloatToStr(eps));
          intervaleps.b := right_read(FloatToStr(eps));
          Result := true;
        end;

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

end.
