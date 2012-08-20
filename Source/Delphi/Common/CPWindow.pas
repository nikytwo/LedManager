unit CPWindow;

interface

uses  
  Classes,
  SysUtils,
  LedBasic,
  cpower;

type
{ TCPWindow }

  TCPWindow = class(TLedWindow)
  private

  protected

  public
    constructor Create;
    destructor Destroy; override;  

    function Show: Integer; override;
    function SaveTo: TStrings; override;     
    class function LoadFrom(AKVList: TStrings): TLedWindow;
  published

  end;


implementation

{ TCPWindow }

constructor TCPWindow.Create;
begin   
  inherited;

end;

destructor TCPWindow.Destroy;
begin

  inherited;
end;

class function TCPWindow.LoadFrom(AKVList: TStrings): TLedWindow;
begin
  Result := TCPWindow.Create;
  Result.TextSource := AKVList.Values['TextSource'];
  Result.X := StrToInt(AKVList.Values['X']);
  Result.Y := StrToInt(AKVList.Values['Y']);
  Result.Width := StrToInt(AKVList.Values['Width']);
  Result.Heigth := StrToInt(AKVList.Values['Heigth']);
  Result.FontName := AKVList.Values['FontName'];
  Result.FontSize := StrToInt(AKVList.Values['FontSize']);
  Result.Color := StrToInt(AKVList.Values['FontColor']);
  Result.Effect := StrToInt(AKVList.Values['Effect']);
  Result.RunSpeed := StrToInt(AKVList.Values['RunSpeed']);
  Result.StayTime := StrToInt(AKVList.Values['StayTime']);
  Result.Alignment := StrToInt(AKVList.Values['Alignment']);
end;

function TCPWindow.SaveTo: TStrings;
begin  
  Result := TStringList.Create;
  Result.Add('TextSource=' + TextSource);
  Result.Add('ScreenID=' + IntToStr(Screen.ID));
  Result.Add('ScreenType=' + Screen.ScreenType);
  Result.Add('ID=' + IntToStr(ID));
  Result.Add('X=' + IntToStr(X));
  Result.Add('Y=' + IntToStr(Y));
  Result.Add('Width=' + IntToStr(Width));
  Result.Add('Heigth=' + IntToStr(Heigth));
  Result.Add('FontName=' + FontName);
  Result.Add('FontSize=' + IntToStr(FontSize));
  Result.Add('FontColor=' + IntToStr(Color));
  Result.Add('Effect=' + IntToStr(Effect));
  Result.Add('RunSpeed=' + IntToStr(RunSpeed));
  Result.Add('StayTime=' + IntToStr(StayTime));
  Result.Add('Alignment=' + IntToStr(Alignment));
end;

function TCPWindow.Show: Integer;
begin
  //向窗口发送数据
  if Screen.IsSendByNet then
  begin
    Result := (-CP5200_Net_SendText(Screen.ID, ID - 1, PChar(Text),
      Color, FontSize, RunSpeed, Effect, StayTime, Alignment)) * 1000;
  end
  else
  begin
    Result := (-CP5200_RS232_SendText(Screen.ID, ID - 1, PChar(Text),
      Color, FontSize, RunSpeed, Effect, StayTime, Alignment)) * 1000;
  end;
end;

end.
