library MyDLL;

uses
  SysUtils;

{$APPTYPE CONSOLE}

type
  TMyData = packed record
    Result: Integer;
    Message: WideString;
  end;

procedure ProcessRecord(ARecords: array of TMyData); stdcall;
var
  i: Integer;
  LMyData: TMyData;
begin
  for i := Low(ARecords) to High(ARecords) do
  begin
    LMyData := ARecords[i];
    WriteLn('Result: ', LMyData.Result, ' Message: ', LMyData.Message);
  end;
end;

exports
  ProcessRecord;

begin
end.
