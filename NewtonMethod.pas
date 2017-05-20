unit NewtonMethod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ComCtrls, StdCtrls, Grids, Clipbrd, IntervalArithmetic32and64;

type fx = function (x : Extended) : Extended; far;

function Newton(x : Extended; f : fx; df : fx;  mit : Integer; eps : Extended; fatx : Extended; it : Integer; st : Integer) : Extended;

implementation

function Newton(x : Extended; f : fx; df : fx; mit : Integer; eps : Extended; fatx : Extended; it : Integer; st : Integer) : Extended;
var
  xit : Extended;  //x po i-tej iteracji
  funkcja : Extended;
  pochodna : Extended;
begin
   it := 0;
//   xit := x+1;
   funkcja := 0;
   pochodna := 0;

   if mit < 1 then   //mit jest za ma³y
    begin
      st := 1;
      fatx := f(x);
      it := 0;
      eps := 0;
      Result := x;
    end;


   while((it < mit) and (abs(xit-x)>eps)) do
    begin
      //program
      if it <> 0 then
        begin
          x:=xit;
        end;

     //obliczenie wartoœci funkcji i pochodnej
     showMessage('1');
     showMessage('x0fun='+FloatToStr(x));
      funkcja := f(x);
      ShowMessage('2');
      pochodna := df(x);

      if pochodna = 0 then     //wartoœæ pochodnej dla x jest równa 0
        begin
          st := 2;
        end;

      xit := x*(funkcja/pochodna);


      st:= 0;
      fatx := abs(xit-x);
      it := it + 1;

    end;

    if ((it = mit) and (abs(xit-x)>eps)) then    //nie osi¹gniet¹ wymaganej dok³adnoœci po mit iteracjach
      begin
        st := 3;
      end;


      Result := xit;
end;

end.
