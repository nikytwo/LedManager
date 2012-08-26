unit LedBasic;

interface

uses
  Windows,
  SysUtils,
  Classes,
  IniFiles,
  LedIniOptions;

const
  CBSuccesed = 0;

type

  TLedWindow = class;
  TLedScreen = class;

{ 管理Led显示屏的类 }

  TLedManager = class(TObject)
  private
    FScreens: THashedStringList;
    function GetScreenCount: Integer;
    function GetScreens(Index: Integer): TLedScreen;

  protected

  public
    constructor Create;
    destructor Destroy; override;

    function AddScreen(AScreen: TLedScreen): TLedScreen;
    procedure DeleteScreen(Index: Integer);
    procedure ClearScreen;
    function SendTextTo(AScreenType: string; ScreenID, WindowID: Integer; Text: string): Integer;
    function SendText(TheTextSource: string; Text: string): Integer;
    function GetScreenBy(AScreenType: string; ScreenID: Integer): TLedScreen;
    function GetNewScreenID(AScreenType: string): Integer;
    procedure LoadFrom(AIniOptions: TIniOptions);
    procedure SaveTo(AIniOptions: TIniOptions);

    
    property Screens[Index: Integer]: TLedScreen read GetScreens;
    property ScreenCount: Integer read GetScreenCount;
    property ScreenNames: THashedStringList read FScreens;

  end;


  { 封装了Led显示屏信息的类 }

  TLedScreen = class(TObject)
  private
    FList: TList;
    FWidth: Integer;
    FID: Integer;
    FHeigth: Integer;
    FIsSendByNet: Boolean;
    FPort: Integer;
    FComNO: Integer;
    FIDCode: Integer;
    FBaudrate: Integer;
    FIP: string;
    FScreenType: string;
    function GetWindows(Index: Integer): TLedWindow;
    function GetWindowCount: Integer;
    procedure SetBaudrate(const Value: Integer);
    procedure SetComNO(const Value: Integer);
    procedure SetHeigth(const Value: Integer);
    procedure SetID(const Value: Integer);
    procedure SetIDCode(const Value: Integer);
    procedure SetIP(const Value: string);
    procedure SetIsSendByNet(const Value: Boolean);
    procedure SetPort(const Value: Integer);
    procedure SetWidth(const Value: Integer);
    procedure SetScreenType(const Value: string);

  protected

  public
    constructor Create;
    destructor Destroy; override;

    function InitComm: Integer; virtual; abstract;
    function FreeComm: Integer; virtual; abstract;
    function AddWindow(AWindow: TLedWindow): TLedWindow;
    procedure DeleteWindow(WindowID: Integer);
    procedure ClearWindow;
    //让Led显示屏显示内容
    function ShowText(WindowID: Integer; AText: string): Integer;
    function SaveTo: TStrings; virtual; abstract;

    property ScreenType: string read FScreenType write SetScreenType;
    property ID: Integer read FID write SetID;
    property Width: Integer read FWidth write SetWidth;
    property Heigth: Integer read FHeigth write SetHeigth;
    property Windows[Index: Integer]: TLedWindow read GetWindows; default;
    property WindowCount: Integer read GetWindowCount;
    property IsSendByNet: Boolean read FIsSendByNet write SetIsSendByNet;
    property IP: string read FIP write SetIP;
    property Port: Integer read FPort write SetPort;
    property IDCode: Integer read FIDCode write SetIDCode;  //识别码
    property ComNO: Integer read FComNO write SetComNO; //串口号，如COM1时，=1
    property Baudrate: Integer read FBaudrate write SetBaudrate;  //串口波特率

  end;

{ 在Led屏上定义的有一定范围，可以单独显示内容区域 }

  TLedWindow = class(TObject)
  private
    FRunSpeed: Integer;
    FX: Integer;
    FID: Integer;
    FY: Integer;
    FHeigth: Integer;
    FEffect: Integer;
    FAlignment: Integer;
    FWidth: Integer;
    FStayTime: Integer;
    FFontSize: Integer;
    FFontName: string;
    FText: string;
    FColor: DWORD;
    FScreen: TLedScreen;
    FTextSource: string;
    procedure SetAlignment(const Value: Integer);
    procedure SetColor(const Value: DWORD);
    procedure SetEffect(const Value: Integer);
    procedure SetFontName(const Value: string);
    procedure SetFontSize(const Value: Integer);
    procedure SetHeigth(const Value: Integer);
    procedure SetRunSpeed(const Value: Integer);
    procedure SetScreen(const Value: TLedScreen);
    procedure SetStayTime(const Value: Integer);
    procedure SetText(const Value: string);
    procedure SetWidth(const Value: Integer);
    procedure SetX(const Value: Integer);
    procedure SetY(const Value: Integer);
    procedure SetTextSource(const Value: string);

  protected

  public
    constructor Create; overload;
    constructor Create(x, y, width, heigth: Integer); overload;
    destructor Destroy; override;

    function Show: Integer; virtual; abstract;
    class function LoadFrom(AKVList: TStrings): TLedWindow;
    function SaveTo: TStrings; virtual; abstract;

    property Screen: TLedScreen read FScreen write SetScreen;
    property ID: Integer read FID;
    property X: Integer read FX write SetX;
    property Y: Integer read FY write SetY;
    property Width: Integer read FWidth write SetWidth;
    property Heigth: Integer read FHeigth write SetHeigth;
    property FontName: string read FFontName write SetFontName;
    property FontSize: Integer read FFontSize write SetFontSize;
    property RunSpeed: Integer read FRunSpeed write SetRunSpeed;
    property Effect: Integer read FEffect write SetEffect;
    property StayTime: Integer read FStayTime write SetStayTime;
    property Alignment: Integer read FAlignment write SetAlignment;
    property Text: string read FText write SetText;
    property Color: DWORD read FColor write SetColor;
    //该显示屏该区域/窗口显示的内容来源ID
    property TextSource: string read FTextSource write SetTextSource;

  end;

implementation

uses LSNWindow, LSNScreen, CPScreen, CPWindow;

{ TLedScreen }

function TLedScreen.AddWindow(AWindow: TLedWindow): TLedWindow;
begin
  Result := AWindow;
  AWindow.FID := FList.Add(AWindow) + 1;
  AWindow.FScreen := Self;
end;

procedure TLedScreen.ClearWindow;
var
  I: Integer;
begin
  for I := FList.Count - 1 downto 0 do
  begin
    TLedWindow(FList.Items[I]).Free;
    FList.Delete(I);
  end;
end;

constructor TLedScreen.Create;
begin      
  inherited;
  FList := TList.Create;
  FScreenType := 'Basic';
  FWidth := 128;
  FHeigth := 64;
  FIsSendByNet := False;
  FIP := '192.168.128.1';
  FPort := 1024;
  FIDCode := -1;
  FComNO := 1;
  FBaudrate := 115200;  
end;

procedure TLedScreen.DeleteWindow(WindowID: Integer);
begin
  if (WindowID > 0) and (WindowID <= WindowCount) then
  begin
    TLedWindow(FList.Items[WindowID - 1]).Free;
    FList.Delete(WindowID - 1);
  end;
end;

destructor TLedScreen.Destroy;
begin

  ClearWindow;
  FreeAndNil(FList);

  inherited;
end;

function TLedScreen.GetWindowCount: Integer;
begin
  Result := FList.Count;
end;

function TLedScreen.GetWindows(Index: Integer): TLedWindow;
begin            
  if FList.Count > 0 then
  begin
    Result := TLedWindow(FList.Items[Index]);
  end
  else
  begin
    Result := nil;
  end;
end;

procedure TLedScreen.SetBaudrate(const Value: Integer);
begin
  FBaudrate := Value;
end;

procedure TLedScreen.SetComNO(const Value: Integer);
begin
  FComNO := Value;
end;

procedure TLedScreen.SetHeigth(const Value: Integer);
begin
  FHeigth := Value;
end;

procedure TLedScreen.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TLedScreen.SetIDCode(const Value: Integer);
begin
  FIDCode := Value;
end;

procedure TLedScreen.SetIP(const Value: string);
begin
  FIP := Value;
end;

procedure TLedScreen.SetIsSendByNet(const Value: Boolean);
begin
  FIsSendByNet := Value;
end;

procedure TLedScreen.SetPort(const Value: Integer);
begin
  FPort := Value;
end;

procedure TLedScreen.SetScreenType(const Value: string);
begin
  FScreenType := Value;
end;

procedure TLedScreen.SetWidth(const Value: Integer);
begin
  FWidth := Value;
end;

function TLedScreen.ShowText(WindowID: Integer; AText: string): Integer;
var
  curWindow: TLedWindow;
begin
  Result := 0;
  curWindow := Windows[WindowID - 1];
  if AText = curWindow.Text then
  begin
    Exit;
  end;
  curWindow.Text := AText;
           
  try
    Result := InitComm;
    //if Result = CBSuccesed then
    //begin
      Result := Result + curWindow.Show;
    //end;
    if Result <> 0 then
    begin
      curWindow.Text := '';
    end;
    //Sleep(2000);
  finally
    FreeComm;
  end;
end;

{ TLedWindow }

constructor TLedWindow.Create;
begin
  FTextSource := 'gzz001';
  FX := 0;
  FY := 0;
  FWidth := 128;
  FHeigth := 64;
  FFontName := '宋体';
  FFontSize := 12;
  FColor := 1;
  FEffect := 2;
  FRunSpeed := 10;
  FStayTime := 0;
  FAlignment := 1;
end;

constructor TLedWindow.Create(x, y, width, heigth: Integer);
begin      
  FTextSource := 'gzz001';
  FX := x;
  FY := y;
  FWidth := width;
  FHeigth := heigth;  
  FFontName := '宋体';
  FFontSize := 12;
  FColor := 1;
  FEffect := 2;
  FRunSpeed := 4;
  FStayTime := 0;
  FAlignment := 1;
end;

destructor TLedWindow.Destroy;
begin

  inherited;
end;

class function TLedWindow.LoadFrom(AKVList: TStrings): TLedWindow;
begin
  Result := TLSNWindow.Create;
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

procedure TLedWindow.SetAlignment(const Value: Integer);
begin
  FAlignment := Value;
end;

procedure TLedWindow.SetColor(const Value: DWORD);
begin
  FColor := Value;
end;

procedure TLedWindow.SetEffect(const Value: Integer);
begin
  FEffect := Value;
end;

procedure TLedWindow.SetFontName(const Value: string);
begin
  FFontName := Value;
end;

procedure TLedWindow.SetFontSize(const Value: Integer);
begin
  FFontSize := Value;
end;

procedure TLedWindow.SetHeigth(const Value: Integer);
begin
  FHeigth := Value;
end;

procedure TLedWindow.SetRunSpeed(const Value: Integer);
begin
  FRunSpeed := Value;
end;

procedure TLedWindow.SetScreen(const Value: TLedScreen);
begin
  FScreen := Value;
end;

procedure TLedWindow.SetTextSource(const Value: string);
begin
  FTextSource := Value;
end;

procedure TLedWindow.SetStayTime(const Value: Integer);
begin
  FStayTime := Value;
end;

procedure TLedWindow.SetText(const Value: string);
begin
  FText := Value;
end;

procedure TLedWindow.SetWidth(const Value: Integer);
begin
  FWidth := Value;
end;

procedure TLedWindow.SetX(const Value: Integer);
begin
  FX := Value;
end;

procedure TLedWindow.SetY(const Value: Integer);
begin
  FY := Value;
end;

{ TLedManager }

function TLedManager.AddScreen(AScreen: TLedScreen): TLedScreen;
var
  aKey: string;
begin
  Result := AScreen;
  aKey := AScreen.ScreenType;
  { TODO : 考虑不同通讯但相同屏号 }
  {if AScreen.IsSendByNet then
  begin
    aKey := aKey + ':' + AScreen.IP + ':' + IntToStr(AScreen.Port);
  end
  else
  begin   
    aKey := aKey + ':Com' + IntToStr(AScreen.ComNO)
      + ':' + IntToStr(AScreen.Baudrate);
  end;
  }
  aKey := aKey + IntToStr(AScreen.ID);
  FScreens.AddObject(aKey, AScreen);
end;

procedure TLedManager.ClearScreen;
var
  I: Integer;
begin
  for I := FScreens.Count - 1 downto 0 do
  begin
    FScreens.Objects[I].Free;
    FScreens.Delete(I);
  end;
end;

constructor TLedManager.Create;
begin
  inherited;
  FScreens := THashedStringList.Create;
end;

procedure TLedManager.DeleteScreen(Index: Integer);
var
  id: Integer;
  tmpScreen: TLedScreen;
begin
  if ScreenCount > 0 then
  begin
    id := Index;//FScreens.IndexOf(IntToStr(ScreenID));
    tmpScreen := FScreens.Objects[id] as TLedScreen;
    FScreens.Delete(id);
    tmpScreen.Free;
  end;
end;

destructor TLedManager.Destroy;
begin    
  ClearScreen;
  FreeAndNil(FScreens);

  inherited;
end;

function TLedManager.GetNewScreenID(AScreenType: string): Integer;
var
  i: Integer;
begin
  Result := 1;
  { TODO : 考虑不同通讯但相同屏号 }
  for i := 0 to FScreens.Count - 1 do
  begin
    if Screens[i].ScreenType = AScreenType then
    begin
      Inc(Result);
    end;
  end;
  Result := FScreens.Count + 1;
end;

function TLedManager.GetScreenBy(AScreenType: string;
  ScreenID: Integer): TLedScreen;
var
  index: Integer;
begin
{ TODO : 考虑不同通讯但相同屏号 }
  index := FScreens.IndexOf(AScreenType + IntToStr(ScreenID));
  if index >= 0 then
  begin
    Result := FScreens.Objects[index] as TLedScreen;
  end
  else
  begin
    Result := nil;
  end;

end;

function TLedManager.GetScreenCount: Integer;
begin
  Result := FScreens.Count;
end;

function TLedManager.GetScreens(Index: Integer): TLedScreen;
begin
  if ScreenCount > 0 then
  begin
    Result := FScreens.Objects[Index] as TLedScreen;
  end
  else
  begin
    Result := nil;
  end;
end;

procedure TLedManager.LoadFrom(AIniOptions: TIniOptions);
var
  i, aScreenID: Integer;
  aScreenType: string;
  aKVList: TStrings;
  aScreen: TLedScreen;
begin
  ClearScreen;

  //加载显示屏参数
  For i :=0 to AIniOptions.ScreenCount - 1 do
  begin
    aKVList := AIniOptions.Screens[i];   
    aScreenType := aKVList.Values['ScreenType'];
    if aScreenType = LSNScreenType then
    begin
      AddScreen(TLSNScreen.LoadFrom(aKVList));
    end
    else
    begin
      AddScreen(TCPScreen.LoadFrom(aKVList));
    end;
  end;
  //加载显示屏上的窗口参数
  for i := 0 to AIniOptions.WindowCount - 1 do
  begin
    aKVList := AIniOptions.Windows[i];
    aScreenID := StrToInt(aKVList.Values['ScreenID']);
    aScreenType := aKVList.Values['ScreenType'];
    aScreen := GetScreenBy(aScreenType, aScreenID);
    if aScreenType = LSNScreenType then
    begin
      aScreen.AddWindow(TLSNWindow.LoadFrom(aKVList));
    end
    else
    begin
      aScreen.AddWindow(TCPWindow.LoadFrom(aKVList));
    end;
  end;

end;

procedure TLedManager.SaveTo(AIniOptions: TIniOptions);
var
  i, j: Integer;    
  tmpKVList: TStrings;   
  tmpScreen: TLedScreen;
  tmpWindow: TLedWindow;
begin

  for i := 0 to ScreenCount - 1 do
  begin
    tmpScreen := Screens[i];
    tmpKVList := tmpScreen.SaveTo;
    AIniOptions.AddScreens(tmpKVList);

    for j := 0 to tmpScreen.WindowCount - 1 do
    begin
      tmpWindow := tmpScreen.Windows[j];
      tmpKVList := tmpWindow.SaveTo;
      AIniOptions.AddWindows(tmpKVList);
    end;
  end;
end;

function TLedManager.SendText(TheTextSource, Text: string): Integer;
var
  i, j: Integer;
begin
  Result := 0;
  for i := 0 to ScreenCount - 1 do
  begin
    for j := 0 to Screens[i].WindowCount - 1 do
    begin
      if Screens[i].Windows[j].TextSource = TheTextSource then
      begin
        Result := Screens[i].ShowText(j + 1, Text)
      end;
    end;
  end;
end;

function TLedManager.SendTextTo(AScreenType: string;
  ScreenID, WindowID: Integer; Text: string): Integer;
var
  i, index: Integer;
  tmpScreen: TLedScreen;
begin
  index := -1;
  for i := 0 to ScreenCount - 1 do
  begin
    if (AScreenType = Screens[i].ScreenType) and (ScreenID = Screens[i].ID) then
    begin
      index := i;
      Break;
    end;
  end;
  if (-1 = index) or (ScreenCount <= 0) then
  begin        
    { TODO -olaijie : 未设置任何显示屏 }
    Result := -11;
    Exit;
  end;
  
  tmpScreen := FScreens.Objects[index] as TLedScreen;
  Result := tmpScreen.ShowText(WindowID, Text);
end;

end.
