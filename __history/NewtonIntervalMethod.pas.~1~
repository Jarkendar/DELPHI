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
      fatx := f(x);
      it := 0;
      mark := false;
      Result := x;
    end;

   while (it < mit) do
    begin
      if it <> 0 then
        begin
          x:=xit;
        end;
     //obliczenie wartoœci funkcji i pochodnej
      funkcja := f(x);
      pochodna := df(x);

      if pochodna = 0 then     //wartoœæ pochodnej dla x jest równa 0
        begin
          st := 2;
          fatx := f(x);
          mark := false;
          Result := x;
          break;
        end;

      xit := x-(funkcja/pochodna);

      it := it + 1;

      if ((abs(xit-x)/Max(xit,x))<eps) then
        begin
          break;
        end;
    end;

    if ((it = mit) and (abs(xit-x)>eps)) then    //nie osi¹gniet¹ wymaganej dok³adnoœci po mit iteracjach
      begin
        st := 3;
        fatx := f(xit);
        mark := false;
        Result := xit;
      end;

    if mark then
      begin
        fatx := f(x);
        eps := abs(xit-x);
        Result := xit;
      end;
end;

