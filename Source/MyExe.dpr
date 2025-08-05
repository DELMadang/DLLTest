program MyExe;

uses
  Windows,
  SysUtils;

{$APPTYPE CONSOLE}

type
  TMyData = packed record
    Result: Integer;
    Message: array[0..3] of Char;
  end;

  function GetRecord(var ASize: Integer):Pointer; stdcall; external 'MyDLL.dll';
  procedure FreeRecord(AData: Pointer); stdcall; external 'MyDLL.dll';

procedure Main();
var
  LBuffer: Pointer;
  LSize: Integer;
  LMyData: array of TMyData;
  i: Integer;
begin
  LBuffer := GetRecord(LSize);
  try
    SetLength(LMyData, LSize);
    Move(LBuffer^, LMyData[0], LSize);
    for i := 0 to (LSize div SizeOf(TMyData)) do
    begin
      Writeln(LMyData[i].Result);
      Writeln(string(LMyData[i].Message));
    end;
  finally
    FreeRecord(LBuffer);
  end;

  ReadLn;
end;

begin
  Main();
end.
