unit CoreBridgeUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

function HelloWorld: PChar; cdecl;
function Hello(Name: PChar): PChar; cdecl;
function HelloByteBuffer(Buffer: PChar; var Size: integer): integer; cdecl;

implementation

function HelloWorld: PChar; cdecl;
begin
  Result := 'Hello World!';
end;

function Hello(Name: PChar): PChar; cdecl;
begin
  Result := PChar('Hello, ' + Name + '!!');
end;

function HelloByteBuffer(Buffer: PChar; var Size: integer): integer; cdecl;
begin
    strcopy(Buffer,'Hello');
    Size := Length(Buffer);
    Result := 0;
end;


end.

