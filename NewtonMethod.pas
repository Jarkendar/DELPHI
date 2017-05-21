unit NewtonMethod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ComCtrls, StdCtrls, Grids, Clipbrd, IntervalArithmetic32and64, Math;

type fx = function (x : Extended) : Extended; far;

function Newton(var x : Extended; f : fx; df : fx;  mit : Integer; eps : Extended; var fatx : Extended; var it : Integer; var st : Integer) : Extended;

implementation

function Newton(var x : Extended; f : fx; df : fx;  mit : Integer;  eps : Extended; var fatx : Extended; var it : Integer; var st : Integer) : Extended;
var
  mark : Boolean;
  xit : Extended;  //x po i-tej iteracji
  funkcja : Extended;
  pochodna : Extended;
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

      if ((abs(xit-x)/Max(abs(xit),abs(x)))<eps) then
        begin
          break;
        end;
    end;

    if ((it = mit) and ((abs(xit-x)/Max(xit,x)>eps))) then    //nie osi¹gniet¹ wymaganej dok³adnoœci po mit iteracjach
      begin
        st := 3;
        fatx := f(xit);
        mark := false;
        Result := xit;
      end;

    if mark then
      begin
        fatx := f(x);
        Result := xit;
      end;
end;
end.
