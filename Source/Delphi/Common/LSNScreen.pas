unit LSNScreen;

interface

uses
  Classes,
  SysUtils,
  LSNFun,
  LedBasic;
         
const
  DefaultHParent = 0;
  LSNScreenType = 'LSN';

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
    FCardType: Integer;
    FTransMode: Integer;
    procedure SetColorStyle(const Value: Integer);
    procedure SetMainON(const Value: Boolean);
    procedure SetModeStyle(const Value: Integer);
    procedure SetTemperatureON(const Value: Boolean);
    procedure SetTimerON(const Value: Boolean);
    procedure SetTitleON(const Value: Boolean);
    procedure SetTitleStyle(const Value: Integer);
    procedure SetCardType(const Value: Integer);

  protected

  public
    constructor Create;
    destructor Destroy; override;
                                  
    function InitComm: Integer; override;
    function FreeComm: Integer; override;
    function SaveTo: TStrings; override;
    class function LoadFrom(AKVList: TStrings): TLSNScreen;

    property TransMode: Integer read FTransMode write FTransMode;
    property CardType: Integer read FCardType write SetCardType;
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
  ScreenType := LSNScreenType;
  FTransMode := 1;
  FCardType := 3;
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

end;

function TLSNScreen.InitComm: Integer;
begin
  //设置通讯方式
  Result := 1 - SetTransMode(TransMode, CardType);

  //设置通讯参数
  if TransMode = 1 then
  begin
    Result := Result + (1 - SetNetworkPara(ID, PChar(IP))) * 10;
  end
  else
  begin  
    Result := Result + (1 - SetSerialportPara(ID, ComNO, Baudrate)) * 10;
  end;

  //设置显示屏参数
  Result := Result + (SendScreenPara(ID, ColorStyle, Width, Heigth) - 1) * 100;
end;

class function TLSNScreen.LoadFrom(AKVList: TStrings): TLSNScreen;
begin
  Result := nil;
  Result := TLSNScreen.Create;
  Result.ID := StrToIntDef(AKVList.Values['ID'], 1);
  Result.Width := StrToIntDef(AKVList.Values['Width'], 128);
  Result.Heigth := StrToIntDef(AKVList.Values['Heigth'], 64);
  Result.IsSendByNet := StrToBoolDef(AKVList.Values['IsSendByNet'], True);
  Result.IP := AKVList.Values['IP'];
  Result.Port := StrToIntDef(AKVList.Values['Port'], 1024);
  Result.IDCode := StrToIntDef(AKVList.Values['IDCode'], -1);
  Result.ComNO := StrToIntDef(AKVList.Values['ComNO'], 1);
  Result.Baudrate := StrToIntDef(AKVList.Values['Baudrate'], 115200);
  Result.TransMode := StrToIntDef(AKVList.Values['TransMode'], 1);
  Result.CardType := StrToIntDef(AKVList.Values['CardType'], 3);
  Result.ColorStyle := StrToIntDef(AKVList.Values['ColorStyle'], 1);
  Result.ModeStyle := StrToIntDef(AKVList.Values['ModeStyle'], 1);
  Result.TimerON := StrToBoolDef(AKVList.Values['TimerON'], False);
  Result.TemperatureON := StrToBoolDef(AKVList.Values['TemperatureON'], False);
  Result.MainON := StrToBoolDef(AKVList.Values['MainON'], True);
  Result.TitleON := StrToBoolDef(AKVList.Values['TitleON'], False);
  Result.TitleStyle := StrToIntDef(AKVList.Values['TitleStyle'], 1);
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
  Result.Add('TransMode=' + IntToStr(TransMode));
  Result.Add('CardType=' + IntToStr(CardType));
  Result.Add('ColorStyle=' + IntToStr(ColorStyle));
  Result.Add('ModeStyle=' + IntToStr(ModeStyle));
  Result.Add('TimerON=' + BoolToStr(TimerON));
  Result.Add('TemperatureON=' + BoolToStr(TemperatureON));
  Result.Add('MainON=' + BoolToStr(MainON));
  Result.Add('TitleON=' + BoolToStr(TitleON));
  Result.Add('TitleStyle=' + IntToStr(TitleStyle));
end;

procedure TLSNScreen.SetCardType(const Value: Integer);
begin
  FCardType := Value;
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
 