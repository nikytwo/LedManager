unit LSNScreen;

interface

uses
  Classes,
  SysUtils,
  LSNFun,
  LedBasic;
         
const
  DefaultHParent = 0;

type
{ TLSNScreen }

  TLSNScreen = class(TLedScreen)
  private
    FColorStyle: Integer;
    FMainON: Boolean;
    FTimerON: Boolean;
    FTitleON: Boolean;
    FTemperatureON: Boolean;
    FModeStyle: Integer;
    FTitleStyle: Integer;
    procedure SetColorStyle(const Value: Integer);
    procedure SetMainON(const Value: Boolean);
    procedure SetModeStyle(const Value: Integer);
    procedure SetTemperatureON(const Value: Boolean);
    procedure SetTimerON(const Value: Boolean);
    procedure SetTitleON(const Value: Boolean);
    procedure SetTitleStyle(const Value: Integer);

  protected

  public
    constructor Create;
    destructor Destroy; override;
                                  
    function InitComm: Integer; override;
    function FreeComm: Integer; override;
    function SaveTo: TStrings; override;

    property ColorStyle: Integer read FColorStyle write SetColorStyle;
    property ModeStyle: Integer read FModeStyle write SetModeStyle;
    property TimerON: Boolean read FTimerON write SetTimerON;
    property TemperatureON: Boolean read FTemperatureON write SetTemperatureON;
    property MainON: Boolean read FMainON write SetMainON;
    property TitleON: Boolean read FTitleON write SetTitleON;
    property TitleStyle: Integer read FTitleStyle write SetTitleStyle;

  end;


implementation

{ TLSNScreen }

constructor TLSNScreen.Create;
begin     
  inherited Create;
  ScreenType := 'LSN';
  FColorStyle := 2;
  FModeStyle := 1;
  FTimerON := False;
  FTemperatureON := False;
  FMainON := True;
  FTitleON := False;
  FTitleStyle := 1;
end;

destructor TLSNScreen.Destroy;
begin

  inherited;
end;

function TLSNScreen.FreeComm: Integer;
begin
  if DeleteComm then
  begin
    Result := 0;
  end
  else
  begin
    Result := 100000;
  end; 
end;

function TLSNScreen.InitComm: Integer;
begin
  //创建串口通讯实例
  if CreateComm then
  begin
    Result := 0;
  end
  else
  begin
    Result := 1;
    Exit;
  end;

  //设置显示屏参数
  SetScreenPara(ID, ColorStyle, Width, Heigth, ModeStyle, TimerON,
    TemperatureON, MainON, TitleON, TitleStyle);

  //同步发送方式下发送屏参数到下位机
  if not IsSendByNet then
  begin
    Result := Result + (1 - SendScreenPara(ComNo, Baudrate, DefaultHParent)) * 10;
  end
  else
  begin
    Result := Result + (1 - SendScreenPara_UDP(PChar(IP), Port, DefaultHParent)) * 10;
  end;
end;

function TLSNScreen.SaveTo: TStrings;
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
  Result.Add('ColorStyle=' + IntToStr(ColorStyle));
  Result.Add('ModeStyle=' + IntToStr(ModeStyle));
  Result.Add('TimerON=' + BoolToStr(TimerON));
  Result.Add('TemperatureON=' + BoolToStr(TemperatureON));
  Result.Add('MainON=' + BoolToStr(MainON));
  Result.Add('TitleON=' + BoolToStr(TitleON));
  Result.Add('TitleStyle=' + IntToStr(TitleStyle));
end;

procedure TLSNScreen.SetColorStyle(const Value: Integer);
begin
  FColorStyle := Value;
end;

procedure TLSNScreen.SetMainON(const Value: Boolean);
begin
  FMainON := Value;
end;

procedure TLSNScreen.SetModeStyle(const Value: Integer);
begin
  FModeStyle := Value;
end;

procedure TLSNScreen.SetTemperatureON(const Value: Boolean);
begin
  FTemperatureON := Value;
end;

procedure TLSNScreen.SetTimerON(const Value: Boolean);
begin
  FTimerON := Value;
end;

procedure TLSNScreen.SetTitleON(const Value: Boolean);
begin
  FTitleON := Value;
end;

procedure TLSNScreen.SetTitleStyle(const Value: Integer);
begin
  FTitleStyle := Value;
end;

end.
 