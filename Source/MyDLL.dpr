library MyDLL;

uses
  SysUtils;

{$APPTYPE CONSOLE}

type
  PMyData = ^TMyData;
  TMyData = packed record
    Result: Integer;
    Message: array[0..3] of Char;
  end;

function GetRecord(var ASize: Integer):Pointer; stdcall;
var
  i: Integer;
  LMyData: array[0..4] of TMyData;
begin
  for i := 0 to 4 do
  begin
    LMyData[i].Result := i;
    StrPCopy(@LMyData[i].Message[0], 'AB');
  end;

  ASize := SizeOf(TMyData) * 4;
  GetMem(Result, ASize);
  Move(LMyData[0], Result^, ASize);
end;

procedure FreeRecord(AData: Pointer); stdcall;
begin
  FreeMem(AData);
end;

exports
  GetRecord,
  FreeRecord;

begin
end.
