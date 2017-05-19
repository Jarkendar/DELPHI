unit NewtonMethod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ComCtrls, StdCtrls, Grids, Clipbrd;

type fx = function (x : Extended) : Extended;

function Newton(x : Extended;  f : fx ; df : fx ; mit : Integer; eps : Extended; fatx : Extended; it : Integer; st : Integer) : Extended;

implementation

function f (x : Extended) : Extended;
begin
  Result :=x*x-2;
end;
function df (x : Extended) : Extended;
begin
  Result := 2*x;
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


function Newton(x : Extended;  f : fx ; df : fx; mit : Integer; eps : Extended; fatx : Extended; it : Integer; st : Integer) : Extended;
begin
    it := 1;
    x:= 2;
    Result := f(x);
end;

end.
