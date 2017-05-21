unit NewtonIntervalMethod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ComCtrls, StdCtrls, Grids, Clipbrd, IntervalArithmetic32and64, Math;

type fxinterval = function (x : interval; var st : Integer) : interval; far;

function NewtonInterval(var x : interval; f : fxinterval; df : fxinterval;  mit : Integer; eps : interval; var fatx : interval; var it : Integer; var st : Integer) : interval;

implementation

function NewtonInterval(var x : interval; f : fxinterval; df : fxinterval;  mit : Integer; eps : interval; var fatx : interval; var it : Integer; var st : Integer) : interval;
var
  mark : Boolean;
  xit : interval;  //x po i-tej iteracji
  funkcja : interval;
  pochodna : interval;
  stanFunkcji : Integer;
  maxInterval : interval;
begin
    mark := true;
   it := 0;
   st := 0;
//   xit := x+1;
   funkcja := 0;
   pochodna := 0;

   if mit < 1 then   //mit jest za ma³y
    begin
      st := 1;
      fatx := f(x, stanFunkcji);
      it := 0;
      mark := false;
      Result := x;
    end;

   while (it < mit) do
    begin
      if it <> 0 then
        begin
          x.a:=xit.a;
          x.b:=xit.b;
        end;
     //obliczenie wartoœci funkcji i pochodnej
      funkcja := f(x,stanFunkcji);
      if stanFunkcji <> 0 then
        begin
          st:= 4;
          showMessage('B³¹d funkcji');
          break;
        end;
      pochodna := df(x, stanFunkcji);
      if stanFunkcji <> 0 then
        begin
          st := 5;
          showMessage('B³¹d pochodnej');
          break
        end;
        

      if containtZero(pochodna) then     //wartoœæ przedzia³u pochodnej dla x zawiera 0
        begin
          st := 2;
          fatx := f(x, stanFunkcji);
          mark := false;
          Result := x;
          break;
        end;

      xit := x-(funkcja/pochodna);

      it := it + 1;

      if iabs(xit)>iabs(x) then maxInterval := iabs(xit)
      else maxInterval := iabs(x);

      if containtZero(maxInterval) then
        begin
          st := 2;
          fatx := f(x, stanFunkcji);
          mark := false;
          showMessage('Przy obliczaniu b³êdu mog³o dojœæ do dzielenia przez zero');
          Result := x;
          break;
        end;
      
      if ((iabs(xit-x)/maxInterval)<eps) then
        begin
          break;
        end;
    end;

    if ((it = mit) and ((iabs(xit-x)/maxInterval)>eps)) then    //nie osi¹gniet¹ wymaganej dok³adnoœci po mit iteracjach
      begin
        st := 3;
        fatx := f(xit, stanFunkcji);
        mark := false;
        Result := xit;
      end;

    if mark then
      begin
        fatx := f(x, stanFunkcji);
        Result := xit;
      end;
end;

end.
