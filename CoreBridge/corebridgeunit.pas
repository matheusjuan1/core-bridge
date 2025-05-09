unit CoreBridgeUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

function HelloWorld: PChar; stdcall;
function Hello(Name: PChar): PChar; stdcall;

implementation

function HelloWorld: PChar; stdcall;
begin
  Result := PChar('Hello World!');
end;

function Hello(Name: PChar): PChar; stdcall;
begin
  Result := PChar('Hello, ' + String(Name) + '!!');
end;

end.

