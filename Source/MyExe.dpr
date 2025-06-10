program MyExe;

uses
  Windows,
  SysUtils;

{$APPTYPE CONSOLE}

type
  TMyData = packed record
    Result: Integer;
    Message: WideString;
  end;

  procedure ProcessRecord(ARecords: array of TMyData); stdcall; external 'MyDLL.DLL';

procedure Main();
var
  LRecords: array of TMyData;
  i: Integer;
begin
  SetLength(LRecords, 5);
  for i := 0 to 4 do
  begin
    LRecords[i].Result := i;
    LRecords[i].Message := 'Message ' + IntToStr(i);
  end;

  WriteLn('Call DLL');
  ProcessRecord(LRecords);

  ReadLn;
end;

begin
  Main();
end.
