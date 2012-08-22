unit CPScreen;

interface

uses
  Windows,
  Classes,
  SysUtils,
  CommCtrl,
  LedBasic,
  cpower;

const
  DefaultTimeOut = 600;
  CPScreenType = 'CP2500';

type
{ TCPScreen }

  TCPScreen = class(TLedScreen)
  private
    FTimeout: Integer;

    procedure SetTimeout(const Value: Integer);
    function GetIP(AIP: string): Integer;
    procedure GetSplitWnd(pWndRects:pInteger);
  protected

  public
    constructor Create;
    destructor Destroy; override;

    function InitComm: Integer; override;
    function FreeComm: Integer; override;
    function SaveTo: TStrings; override;   
    class function LoadFrom(AKVList: TStrings): TCPScreen;

    property Timeout: Integer read FTimeout write SetTimeout;
  end;


implementation

{ TCPScreen }

constructor TCPScreen.Create;
begin
  inherited;
  ScreenType := CPScreenType;
  FTimeout := 600;
end;

destructor TCPScreen.Destroy;
begin

  inherited;
end;

function TCPScreen.FreeComm: Integer;
begin

end;

function TCPScreen.InitComm: Integer;    
var
  name:AnsiString;  
  nWndRect: array[0..4] of Integer ;
begin
  //≥ı ºªØ∆¡≤Œ
  if not IsSendByNet then
  begin
	  name := Format('COM%d', [Port]);
    CP5200_RS232_InitEx(name, Baudrate, FTimeout);  
    GetSplitWnd(@nWndRect);
    Result := Result
      + (-CP5200_Net_SplitScreen(ID,Width,Heigth,WindowCount,@nWndRect)) * 10;
  end
  else
  begin
    CP5200_Net_Init(GetIp(IP), Port, IDCode, FTimeout);
    GetSplitWnd(@nWndRect);
    Result := Result
      + (-CP5200_RS232_SplitScreen(ID,Width,Heigth,WindowCount,@nWndRect )) * 10;
  end;
end;

class function TCPScreen.LoadFrom(AKVList: TStrings): TCPScreen;
begin
  Result := nil;
  Result := TCPScreen.Create;
  Result.ID := StrToInt(AKVList.Values['ID']);
  Result.Width := StrToInt(AKVList.Values['Width']);
  Result.Heigth := StrToInt(AKVList.Values['Heigth']);
  Result.IsSendByNet := StrToBool(AKVList.Values['IsSendByNet']);
  Result.IP := AKVList.Values['IP'];
  Result.Port := StrToInt(AKVList.Values['Port']);
  Result.IDCode := StrToInt(AKVList.Values['IDCode']);
  Result.ComNO := StrToInt(AKVList.Values['ComNO']);
  Result.Baudrate := StrToInt(AKVList.Values['Baudrate']);
  Result.Timeout := StrToInt(AKVList.Values['Timeout']);
end;

function TCPScreen.GetIP(AIP: string): Integer;
var
  ip1, ip2, ip3, ip4: DWORD;
  tmpIP: string;
  p: Integer;
begin
  tmpIP := AIP;
  p := Pos('.',tmpIP);
  ip1 := StrToInt(Copy(tmpIP, 0, p));
  tmpIP := Copy(tmpIP, p + 1, length(tmpIP) - p - 1);
  p := Pos('.',tmpIP);
  ip2 := StrToInt(Copy(tmpIP, 0, p));
  tmpIP := Copy(tmpIP, p + 1, length(tmpIP) - p - 1);
  p := Pos('.',tmpIP);
  ip3 := StrToInt(Copy(tmpIP, 0, p));
  tmpIP := Copy(tmpIP, p + 1, length(tmpIP) - p - 1);
  p := Pos('.',tmpIP);
  ip4 := StrToInt(Copy(tmpIP, 0, p));

  Result := MAKEIPADDRESS(ip1,ip2,ip3,ip4);
end;

procedure TCPScreen.GetSplitWnd(pWndRects: pInteger);
begin
  PInteger(Integer(pWndRects)+ 0)^ := 0;
  PInteger(Integer(pWndRects)+ 4)^ := 0;
  PInteger(Integer(pWndRects)+ 8)^ :=  Integer(Width);
  PInteger(Integer(pWndRects)+ 12)^ := Heigth;
end;

function TCPScreen.SaveTo: TStrings;
begin
  Result := TStringList.Create;
  Result.Add('ScreenType=' + ScreenType);
  Result.Add('ID=' + IntToStr(ID));
  Result.Add('Width=' + IntToStr(Width));
  Result.Add('Heigth=' + IntToStr(Heigth));
  Result.Add('IsSendByNet=' + BoolToStr(IsSendByNet));
  Result.Add('IP=' + IP);
  Result.Add('Port=' + IntToStr(Port));
  Result.Add('IDCode=' + IntToStr(IDCode));
  Result.Add('ComNO=' + IntToStr(ComNO));
  Result.Add('Baudrate=' + IntToStr(Baudrate));
  Result.Add('Timeout=' + IntToStr(Timeout));
end;

procedure TCPScreen.SetTimeout(const Value: Integer);
begin
  FTimeout := Value;
end;

end.
 