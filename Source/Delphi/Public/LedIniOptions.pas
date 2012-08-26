unit LedIniOptions;

interface

uses
  Classes, SysUtils, IniFiles, Forms, Windows;

type
  TIniOptions = class(TObject)
  private
    FScreens: TList;
    FWindows: TList;

    FDatabase: string;
    FUser: string;
    FPassword: string;
    FDBServer: string;
    FBlobSize: string;
    FScreenCount: Integer;
    FWindowCount: Integer;
    FLSNDefTimerON: Boolean;
    FLSNDefMainON: Boolean;
    FLSNDefIsSendByNet: boolean;
    FLSNDefTitleON: Boolean;
    FLSNDefTemperatureON: Boolean;
    FLSNDefWindowFontColor: DWORD;
    FLSNDefWindowStayTime: Integer;
    FLSNDefWindowHeigth: Integer;
    FLSNDefPort: Integer;
    FLSNDefWindowFontSize: Integer;
    FLSNDefWindowY: Integer;
    FLSNDefTitleStyle: Integer;
    FLSNDefColorStyle: Integer;
    FLSNDefWindowAddStyle: Integer;
    FLSNDefBaudrate: Integer;
    FLSNDefWindowAlignment: Integer;
    FLSNDefWidth: Integer;
    FLSNDefWindowEffect: Integer;
    FLSNDefWindowRunSpeed: Integer;
    FLSNDefIDCode: Integer;
    FLSNDefWindowWidth: Integer;
    FLSNDefWindowX: Integer;
    FLSNDefComNO: Integer;
    FLSNDefHeigth: Integer;
    FLSNDefModeStyle: Integer;
    FLSNDefIP: string;
    FLSNDefWindowFontName: string;
    FDBDriverName: string;
    FSourceTableName: string;
    FTextName: string;
    FTextSourceName: string;
    FRefreshTime: integer;
    FDriverFun: string;
    FDefTimeout: Integer;
    FLSNDefTransMode: Integer;
    FLSNDefCardType: Integer;
    procedure SetDatabase(const Value: string);
    procedure SetDBServer(const Value: string);
    procedure SetPassword(const Value: string);
    procedure SetUser(const Value: string);
    procedure SetBlobSize(const Value: string);
    function GetScreens(Index: Integer): TStrings;
    procedure SetScreenCount(const Value: Integer);
    procedure SetScreens(Index: Integer; const Value: TStrings);
    function GetWindows(Index: Integer): TStrings;
    procedure SetWindowCount(const Value: Integer);
    procedure SetWindows(Index: Integer; const Value: TStrings);
    procedure SetLSNDefBaudrate(const Value: Integer);
    procedure SetLSNDefColorStyle(const Value: Integer);
    procedure SetLSNDefComNO(const Value: Integer);
    procedure SetLSNDefHeigth(const Value: Integer);
    procedure SetLSNDefIDCode(const Value: Integer);
    procedure SetLSNDefIP(const Value: string);
    procedure SetLSNDefIsSendByNet(const Value: boolean);
    procedure SetLSNDefMainON(const Value: Boolean);
    procedure SetLSNDefModeStyle(const Value: Integer);
    procedure SetLSNDefPort(const Value: Integer);
    procedure SetLSNDefTemperatureON(const Value: Boolean);
    procedure SetLSNDefTimerON(const Value: Boolean);
    procedure SetLSNDefTitleON(const Value: Boolean);
    procedure SetLSNDefTitleStyle(const Value: Integer);
    procedure SetLSNDefWidth(const Value: Integer);
    procedure SetLSNDefWindowAddStyle(const Value: Integer);
    procedure SetLSNDefWindowAlignment(const Value: Integer);
    procedure SetLSNDefWindowEffect(const Value: Integer);
    procedure SetLSNDefWindowFontColor(const Value: DWORD);
    procedure SetLSNDefWindowFontName(const Value: string);
    procedure SetLSNDefWindowFontSize(const Value: Integer);
    procedure SetLSNDefWindowHeigth(const Value: Integer);
    procedure SetLSNDefWindowRunSpeed(const Value: Integer);
    procedure SetLSNDefWindowStayTime(const Value: Integer);
    procedure SetLSNDefWindowWidth(const Value: Integer);
    procedure SetLSNDefWindowX(const Value: Integer);
    procedure SetLSNDefWindowY(const Value: Integer);
    procedure SetDBDriverName(const Value: string);
    procedure SetSourceTableName(const Value: string);
    procedure SetTextName(const Value: string);
    procedure SetTextSourceName(const Value: string);
    procedure SetRefreshTime(const Value: integer);
    procedure SetDriverFun(const Value: string);
    procedure SetDefTimeout(const Value: Integer);
    procedure SetLSNDefCardType(const Value: Integer);
    procedure SetLSNDefTransMode(const Value: Integer);
  public
    procedure LoadSettings(Ini: TIniFile);
    procedure SaveSettings(Ini: TIniFile);

    procedure LoadFromFile(const FileName: string);
    procedure SaveToFile(const FileName: string);

    function AddScreens(AScreen: TStrings): Integer;
    procedure DeleteScreen(index: Integer);
    function AddWindows(AWindow: TStrings): Integer;
    procedure DeleteWindow(index: Integer);

    {程序级参数信息}
    //自动运行时间间隔,单位毫秒
    property RefreshTime: integer read FRefreshTime write SetRefreshTime;

    {数据库参数信息}
    property DBDriverName: string read FDBDriverName write SetDBDriverName;
    property DriverFun: string read FDriverFun write SetDriverFun;
    property BlobSize: string read FBlobSize write SetBlobSize;
    property DBServer: string read FDBServer write SetDBServer;
    property Database: string read FDatabase write SetDatabase;
    property User: string read FUser write SetUser;
    property Password: string read FPassword write SetPassword;
    property TextSourceName: string read FTextSourceName write SetTextSourceName;
    property SourceTableName: string read FSourceTableName write SetSourceTableName;
    property TextName: string read FTextName write SetTextName;

    {LS-N控制卡的显示屏默认参数信息}
    property LSNDefTransMode: Integer read FLSNDefTransMode write SetLSNDefTransMode;
    property LSNDefCardType: Integer read FLSNDefCardType write SetLSNDefCardType;
    property LSNDefWidth: Integer read FLSNDefWidth write SetLSNDefWidth;
    property LSNDefHeigth: Integer read FLSNDefHeigth write SetLSNDefHeigth;
    property LSNDefIsSendByNet: boolean read FLSNDefIsSendByNet write SetLSNDefIsSendByNet;
    property LSNDefIP: string read FLSNDefIP write SetLSNDefIP;
    property LSNDefPort: Integer read FLSNDefPort write SetLSNDefPort;
    property LSNDefIDCode: Integer read FLSNDefIDCode write SetLSNDefIDCode;
    property LSNDefComNO: Integer read FLSNDefComNO write SetLSNDefComNO;
    property LSNDefBaudrate: Integer read FLSNDefBaudrate write SetLSNDefBaudrate;
    property LSNDefColorStyle: Integer read FLSNDefColorStyle write SetLSNDefColorStyle;
    property LSNDefModeStyle: Integer read FLSNDefModeStyle write SetLSNDefModeStyle;
    property LSNDefTimerON: Boolean read FLSNDefTimerON write SetLSNDefTimerON;
    property LSNDefTemperatureON: Boolean read FLSNDefTemperatureON write SetLSNDefTemperatureON;
    property LSNDefMainON: Boolean read FLSNDefMainON write SetLSNDefMainON;
    property LSNDefTitleON: Boolean read FLSNDefTitleON write SetLSNDefTitleON;
    property LSNDefTitleStyle: Integer read FLSNDefTitleStyle write SetLSNDefTitleStyle;
    property LSNDefWindowX: Integer read FLSNDefWindowX write SetLSNDefWindowX;
    property LSNDefWindowY: Integer read FLSNDefWindowY write SetLSNDefWindowY;
    property LSNDefWindowWidth: Integer read FLSNDefWindowWidth write SetLSNDefWindowWidth;
    property LSNDefWindowHeigth: Integer read FLSNDefWindowHeigth write SetLSNDefWindowHeigth;
    property LSNDefWindowFontName: string read FLSNDefWindowFontName write SetLSNDefWindowFontName;
    property LSNDefWindowFontSize: Integer read FLSNDefWindowFontSize write SetLSNDefWindowFontSize;
    property LSNDefWindowFontColor: DWORD read FLSNDefWindowFontColor write SetLSNDefWindowFontColor;
    property LSNDefWindowEffect: Integer read FLSNDefWindowEffect write SetLSNDefWindowEffect;
    property LSNDefWindowRunSpeed: Integer read FLSNDefWindowRunSpeed write SetLSNDefWindowRunSpeed;
    property LSNDefWindowStayTime: Integer read FLSNDefWindowStayTime write SetLSNDefWindowStayTime;
    property LSNDefWindowAlignment: Integer read FLSNDefWindowAlignment write SetLSNDefWindowAlignment;
    property LSNDefWindowAddStyle: Integer read FLSNDefWindowAddStyle write SetLSNDefWindowAddStyle;
    property DefTimeout: Integer read FDefTimeout write SetDefTimeout;

    {显示屏参数信息}
    property ScreenCount: Integer read FScreenCount write SetScreenCount;
    property Screens[Index: Integer]: TStrings read GetScreens write SetScreens;
    property WindowCount: Integer read FWindowCount write SetWindowCount;   
    property Windows[Index: Integer]: TStrings read GetWindows write SetWindows;

  end;

var
  IniOptions: TIniOptions = nil;

implementation

procedure TIniOptions.LoadSettings(Ini: TIniFile);
var
  i: Integer;
  tmpWindowInfos, tmpScreenInfos: TStrings;
begin
  if Ini <> nil then
  begin
    {程序级参数信息}
    FRefreshTime := Ini.ReadInteger('App', 'RefreshTime', 3000);
    {数据库参数信息}
    FDBDriverName := Ini.ReadString('DBConnectString', 'DBDriverName', 'MSSQL');
    FDriverFun := Ini.ReadString('DBConnectString', 'DriverFun', 'getSQLDriverMSSQL');
    FBlobSize := Ini.ReadString('DBConnectString', 'BlobSize', '4096');
    FDBServer := Ini.ReadString('DBConnectString', 'DBServer', '127.0.0.1');
    FDatabase := Ini.ReadString('DBConnectString', 'Database', 'test');
    FUser := Ini.ReadString('DBConnectString', 'User', 'sa');
    FPassword := Ini.ReadString('DBConnectString', 'Password', '');
    FSourceTableName := Ini.ReadString('DBConnectString', 'SourceTableName', 'Test');
    FTextSourceName := Ini.ReadString('DBConnectString', 'TextSourceName', 'TextSource');
    FTextName := Ini.ReadString('DBConnectString', 'TextName', 'Text');
    
    {LS-N控制卡的显示屏默认参数信息}
    LSNDefTransMode := Ini.ReadInteger('LSNDefInfo', 'LSNDefTransMode', 1);  
    LSNDefCardType := Ini.ReadInteger('LSNDefInfo', 'LSNDefCardType', 3);
    LSNDefWidth := Ini.ReadInteger('LSNDefInfo', 'LSNDefWidth', 128);
    LSNDefHeigth := Ini.ReadInteger('LSNDefInfo', 'LSNDefHeigth', 128);
    LSNDefIsSendByNet := Ini.ReadBool('LSNDefInfo', 'LSNDefIsSendByNet', True);
    LSNDefIP := Ini.ReadString('LSNDefInfo', 'LSNDefIP', '192.168.128.128');
    LSNDefPort := Ini.ReadInteger('LSNDefInfo', 'LSNDefPort', 1024);
    LSNDefIDCode := Ini.ReadInteger('LSNDefInfo', 'LSNDefIDCode', -1);
    LSNDefComNO := Ini.ReadInteger('LSNDefInfo', 'LSNDefComNO', 1);
    LSNDefBaudrate := Ini.ReadInteger('LSNDefInfo', 'LSNDefBaudrate', 115200);
    LSNDefColorStyle := Ini.ReadInteger('LSNDefInfo', 'LSNDefColorStyle', 2);
    LSNDefModeStyle := Ini.ReadInteger('LSNDefInfo', 'LSNDefModeStyle', 1);
    LSNDefTimerON := Ini.ReadBool('LSNDefInfo', 'LSNDefTimerON', False);
    LSNDefTemperatureON := Ini.ReadBool('LSNDefInfo', 'LSNDefTemperatureON', False);
    LSNDefMainON := Ini.ReadBool('LSNDefInfo', 'LSNDefMainON', True);
    LSNDefTitleON := Ini.ReadBool('LSNDefInfo', 'LSNDefTitleON', False);
    LSNDefTitleStyle := Ini.ReadInteger('LSNDefInfo', 'LSNDefTitleStyle', 1);
    LSNDefWindowX := Ini.ReadInteger('LSNDefInfo', 'LSNDefWindowX', 0);
    LSNDefWindowY := Ini.ReadInteger('LSNDefInfo', 'LSNDefWindowY', 0);
    LSNDefWindowWidth := Ini.ReadInteger('LSNDefInfo', 'LSNDefWindowWidth', 128);
    LSNDefWindowHeigth := Ini.ReadInteger('LSNDefInfo', 'LSNDefWindowHeigth', 128);
    LSNDefWindowFontName := Ini.ReadString('LSNDefInfo', 'LSNDefWindowFontName', '宋体');
    LSNDefWindowFontSize := Ini.ReadInteger('LSNDefInfo', 'LSNDefWindowFontSize', 12);
    LSNDefWindowFontColor := Ini.ReadInteger('LSNDefInfo', 'LSNDefWindowFontColor', 255);
    LSNDefWindowEffect := Ini.ReadInteger('LSNDefWindowEffect', 'LSNDefWindowEffect', 2);
    LSNDefWindowRunSpeed := Ini.ReadInteger('LSNDefInfo', 'LSNDefWindowRunSpeed', 4);
    LSNDefWindowStayTime := Ini.ReadInteger('LSNDefInfo', 'LSNDefWindowStayTime', 0);
    LSNDefWindowAlignment := Ini.ReadInteger('LSNDefInfo', 'LSNDefWindowAlignment', 1);
    DefTimeout := Ini.ReadInteger('LSNDefInfo', 'DefTimeout', 600);

    {显示屏参数信息}
    FScreenCount := Ini.ReadInteger('LedInfo', 'ScreenCount', 0);
    { TODO : 判断 TList 是否为空 }
    FScreens := TList.Create;
    for i := 0 to FScreenCount - 1 do
    begin
      tmpScreenInfos := TStringList.Create;
      //tmpScreenInfos.Add('');
      Ini.ReadSectionValues('Screen' + IntToStr(i + 1), tmpScreenInfos);
      FScreens.Add(tmpScreenInfos);
    end;
    FWindowCount := Ini.ReadInteger('LedInfo', 'WindowCount', 0);   
    { TODO : 判断 TList 是否为空 }
    FWindows := TList.Create;
    for i := 0 to FWindowCount - 1 do
    begin
      tmpWindowInfos := TStringList.Create;
      Ini.ReadSectionValues('Window' + IntToStr(i + 1), tmpWindowInfos);
      FWindows.Add(tmpWindowInfos);
    end;
  end;
end;

procedure TIniOptions.SaveSettings(Ini: TIniFile);   
var
  i, j: Integer;
  tmpWindowInfos, tmpScreenInfos: TStrings;
  name, value: string;
begin
  if Ini <> nil then
  begin        
    {程序级参数信息}
    Ini.WriteInteger('App', 'RefreshTime', FRefreshTime);
    {数据库参数信息}
    Ini.WriteString('DBConnectString', 'DBDriverName', FDBDriverName);   
    Ini.WriteString('DBConnectString', 'DriverFun', FDriverFun);
    Ini.WriteString('DBConnectString', 'BlobSize', FBlobSize);
    Ini.WriteString('DBConnectString', 'DBServer', FDBServer);
    Ini.WriteString('DBConnectString', 'Database', FDatabase);
    Ini.WriteString('DBConnectString', 'User', FUser);
    Ini.WriteString('DBConnectString', 'Password', FPassword);   
    Ini.WriteString('DBConnectString', 'SourceTableName', FSourceTableName);
    Ini.WriteString('DBConnectString', 'TextSourceName', FTextSourceName);
    Ini.WriteString('DBConnectString', 'TextName', FTextName);

    {LS-N控制卡的显示屏默认参数信息}                   
    Ini.WriteInteger('LSNDefInfo', 'LSNDefTransMode', LSNDefTransMode);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefCardType', LSNDefCardType);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefWidth', LSNDefWidth);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefHeigth', LSNDefHeigth);
    Ini.WriteBool('LSNDefInfo', 'LSNDefIsSendByNet', LSNDefIsSendByNet);
    Ini.WriteString('LSNDefInfo', 'LSNDefIP', LSNDefIP);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefPort', LSNDefPort);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefIDCode', LSNDefIDCode);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefComNO', LSNDefComNO);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefBaudrate', LSNDefBaudrate);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefColorStyle', LSNDefColorStyle);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefModeStyle', LSNDefModeStyle);
    Ini.WriteBool('LSNDefInfo', 'LSNDefTimerON', LSNDefTimerON);
    Ini.WriteBool('LSNDefInfo', 'LSNDefTemperatureON', LSNDefTemperatureON);
    Ini.WriteBool('LSNDefInfo', 'LSNDefMainON', LSNDefMainON);     
    Ini.WriteBool('LSNDefInfo', 'LSNDefTitleON', LSNDefTitleON);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefTitleStyle', LSNDefTitleStyle);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefWindowX', LSNDefWindowX);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefWindowY', LSNDefWindowY);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefWindowWidth', LSNDefWindowWidth);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefWindowHeigth', LSNDefWindowHeigth);
    Ini.WriteString('LSNDefInfo', 'LSNDefWindowFontName', LSNDefWindowFontName);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefWindowFontSize', LSNDefWindowFontSize);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefWindowFontColor', LSNDefWindowFontColor);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefWindowEffect', LSNDefWindowEffect);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefWindowRunSpeed', LSNDefWindowRunSpeed);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefWindowStayTime', LSNDefWindowStayTime);
    Ini.WriteInteger('LSNDefInfo', 'LSNDefWindowAlignment', LSNDefWindowAlignment); 
    Ini.WriteInteger('LSNDefInfo', 'DefTimeout', FDefTimeout);

    {显示屏参数信息}    
    Ini.WriteInteger('LedInfo', 'ScreenCount', FScreens.Count);
    Ini.WriteInteger('LedInfo', 'WindowCount', FWindows.Count);
    for i := 0 to FScreens.Count - 1 do
    begin
      tmpScreenInfos := Screens[i];
      for j := 0 to tmpScreenInfos.Count - 1 do
      begin
        name := tmpScreenInfos.Names[j];
        value := tmpScreenInfos.Values[name];
        Ini.WriteString('Screen' + IntToStr(i + 1), name, value);
      end;
    end;

    for i := 0 to FWindows.Count - 1 do
    begin
      tmpWindowInfos := Windows[i];
      for j := 0 to tmpWindowInfos.Count - 1 do
      begin
        name := tmpWindowInfos.Names[j];
        value := tmpWindowInfos.Values[name];
        Ini.WriteString('Window' + IntToStr(i + 1), name, value);
      end;
    end;

  end;
end;

procedure TIniOptions.LoadFromFile(const FileName: string);
var
  Ini: TIniFile;
begin
  if FileExists(FileName) then
  begin
    Ini := TIniFile.Create(FileName);
    try
      LoadSettings(Ini);
    finally
      Ini.Free;
    end;
  end;
end;

procedure TIniOptions.SaveToFile(const FileName: string);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FileName);
  try
    SaveSettings(Ini);
  finally
    Ini.Free;
  end;
end;

procedure TIniOptions.SetDatabase(const Value: string);
begin
  FDatabase := Value;
end;

procedure TIniOptions.SetDBServer(const Value: string);
begin
  FDBServer := Value;
end;

procedure TIniOptions.SetDefTimeout(const Value: Integer);
begin
  FDefTimeout := Value;
end;

procedure TIniOptions.SetPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TIniOptions.SetUser(const Value: string);
begin
  FUser := Value;
end;

procedure TIniOptions.SetBlobSize(const Value: string);
begin
  FBlobSize := Value;
end;

function TIniOptions.GetScreens(Index: Integer): TStrings;
begin
  if FScreens.Count > 0 then
  begin
    Result := TStrings(FScreens.Items[index]);
  end
  else
  begin
    Result := nil;
  end;
end;

procedure TIniOptions.SetScreenCount(const Value: Integer);
begin
  FScreenCount := Value;
end;

procedure TIniOptions.SetScreens(Index: Integer; const Value: TStrings);
begin
  FScreens.Items[Index] := Value;
end;

function TIniOptions.GetWindows(Index: Integer): TStrings;
begin
  if FWindows.Count > 0 then
  begin
    Result := TStrings(Fwindows.Items[index]);
  end
  else
  begin
    Result := nil;
  end;
end;

procedure TIniOptions.SetWindowCount(const Value: Integer);
begin
  FWindowCount := Value;
end;

procedure TIniOptions.SetWindows(Index: Integer; const Value: TStrings);
begin
  FWindows.Items[Index] := Value;
end;

procedure TIniOptions.SetLSNDefBaudrate(const Value: Integer);
begin
  FLSNDefBaudrate := Value;
end;

procedure TIniOptions.SetLSNDefCardType(const Value: Integer);
begin
  FLSNDefCardType := Value;
end;

procedure TIniOptions.SetLSNDefColorStyle(const Value: Integer);
begin
  FLSNDefColorStyle := Value;
end;

procedure TIniOptions.SetLSNDefComNO(const Value: Integer);
begin
  FLSNDefComNO := Value;
end;

procedure TIniOptions.SetLSNDefHeigth(const Value: Integer);
begin
  FLSNDefHeigth := Value;
end;

procedure TIniOptions.SetLSNDefIDCode(const Value: Integer);
begin
  FLSNDefIDCode := Value;
end;

procedure TIniOptions.SetLSNDefIP(const Value: string);
begin
  FLSNDefIP := Value;
end;

procedure TIniOptions.SetLSNDefIsSendByNet(const Value: boolean);
begin
  FLSNDefIsSendByNet := Value;
end;

procedure TIniOptions.SetLSNDefMainON(const Value: Boolean);
begin
  FLSNDefMainON := Value;
end;

procedure TIniOptions.SetLSNDefModeStyle(const Value: Integer);
begin
  FLSNDefModeStyle := Value;
end;

procedure TIniOptions.SetLSNDefPort(const Value: Integer);
begin
  FLSNDefPort := Value;
end;

procedure TIniOptions.SetLSNDefTemperatureON(const Value: Boolean);
begin
  FLSNDefTemperatureON := Value;
end;

procedure TIniOptions.SetLSNDefTimerON(const Value: Boolean);
begin
  FLSNDefTimerON := Value;
end;

procedure TIniOptions.SetLSNDefTitleON(const Value: Boolean);
begin
  FLSNDefTitleON := Value;
end;

procedure TIniOptions.SetLSNDefTitleStyle(const Value: Integer);
begin
  FLSNDefTitleStyle := Value;
end;

procedure TIniOptions.SetLSNDefTransMode(const Value: Integer);
begin
  FLSNDefTransMode := Value;
end;

procedure TIniOptions.SetLSNDefWidth(const Value: Integer);
begin
  FLSNDefWidth := Value;
end;

procedure TIniOptions.SetLSNDefWindowAddStyle(const Value: Integer);
begin
  FLSNDefWindowAddStyle := Value;
end;

procedure TIniOptions.SetLSNDefWindowAlignment(const Value: Integer);
begin
  FLSNDefWindowAlignment := Value;
end;

procedure TIniOptions.SetLSNDefWindowEffect(const Value: Integer);
begin
  FLSNDefWindowEffect := Value;
end;

procedure TIniOptions.SetLSNDefWindowFontColor(const Value: DWORD);
begin
  FLSNDefWindowFontColor := Value;
end;

procedure TIniOptions.SetLSNDefWindowFontName(const Value: string);
begin
  FLSNDefWindowFontName := Value;
end;

procedure TIniOptions.SetLSNDefWindowFontSize(const Value: Integer);
begin
  FLSNDefWindowFontSize := Value;
end;

procedure TIniOptions.SetLSNDefWindowHeigth(const Value: Integer);
begin
  FLSNDefWindowHeigth := Value;
end;

procedure TIniOptions.SetLSNDefWindowRunSpeed(const Value: Integer);
begin
  FLSNDefWindowRunSpeed := Value;
end;

procedure TIniOptions.SetLSNDefWindowStayTime(const Value: Integer);
begin
  FLSNDefWindowStayTime := Value;
end;

procedure TIniOptions.SetLSNDefWindowWidth(const Value: Integer);
begin
  FLSNDefWindowWidth := Value;
end;

procedure TIniOptions.SetLSNDefWindowX(const Value: Integer);
begin
  FLSNDefWindowX := Value;
end;

procedure TIniOptions.SetLSNDefWindowY(const Value: Integer);
begin
  FLSNDefWindowY := Value;
end;

function TIniOptions.AddScreens(AScreen: TStrings): Integer;
begin
  Result := FScreens.Add(AScreen);
end;

function TIniOptions.AddWindows(AWindow: TStrings): Integer;
begin
  Result := FWindows.Add(AWindow);
end;

procedure TIniOptions.DeleteScreen(index: Integer);
begin
  FScreens.Delete(index);
end;

procedure TIniOptions.DeleteWindow(index: Integer);
begin
  FWindows.Delete(index);
end;

procedure TIniOptions.SetDBDriverName(const Value: string);
begin
  FDBDriverName := Value;
end;

procedure TIniOptions.SetSourceTableName(const Value: string);
begin
  FSourceTableName := Value;
end;

procedure TIniOptions.SetTextName(const Value: string);
begin
  FTextName := Value;
end;

procedure TIniOptions.SetTextSourceName(const Value: string);
begin
  FTextSourceName := Value;
end;

procedure TIniOptions.SetRefreshTime(const Value: integer);
begin
  FRefreshTime := Value;
end;

procedure TIniOptions.SetDriverFun(const Value: string);
begin
  FDriverFun := Value;
end;

initialization
  IniOptions := TIniOptions.Create;

finalization
  IniOptions.Free;

end.

