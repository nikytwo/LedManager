unit LedSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CnAAFont, CnAACtrls, StdCtrls, CnButtons, ExtCtrls, CnPanel,
  Mask, RzEdit, CnSpin, LedBasic;

type
  TFormSetting = class(TForm)
    cnpnlLeft: TCnPanel;
    cnpnlLSNPanel: TCnPanel;
    cnbtnAddScreen: TCnBitBtn;
    cnbtnDelScreen: TCnBitBtn;
    lstScreens: TListBox;
    alblScreenTitle: TCnAALabel;
    grpParaSetting: TGroupBox;
    lblWidth: TLabel;
    lblHeight: TLabel;
    seWidth: TCnSpinEdit;
    seHeight: TCnSpinEdit;
    lblColorStyle: TLabel;
    lblModeStyle: TLabel;
    cbbColorStyle: TComboBox;
    cbbModeStyle: TComboBox;
    grpTemplet: TGroupBox;
    lblFontName: TLabel;
    lblFontSize: TLabel;
    cbbFontSize: TComboBox;
    cbbFontName: TComboBox;
    lblEffect: TLabel;
    cbbEffect: TComboBox;
    lblRunSpeed: TLabel;
    lblStayTime: TLabel;
    seRunSpeed: TCnSpinEdit;
    seStayTime: TCnSpinEdit;
    lblFontColor: TLabel;
    cbbFontColor: TComboBox;
    mmoText: TMemo;
    cnbtnTest: TCnBitBtn;
    cnbtnSave: TCnBitBtn;
    cnbtnCancel: TCnBitBtn;
    alblTextSource: TCnAALabel;
    edtTextSource: TEdit;
    grpHardSetting: TGroupBox;
    lbl3: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    cbbTransMode: TComboBox;
    cbbCardType: TComboBox;
    grpNet: TGroupBox;
    lbl8: TLabel;
    edtIP: TEdit;
    grpCom: TGroupBox;
    lbl9: TLabel;
    lbl10: TLabel;
    cbbComNO: TComboBox;
    cbbBaudrate: TComboBox;
    edtScreenID: TEdit;
    lblIDCode: TLabel;
    edtIDCode: TEdit;
    lblIPPort: TLabel;
    edtIPPort: TEdit;
    procedure FormShow(Sender: TObject);
    procedure cnbtnAddScreenClick(Sender: TObject);
    procedure cnbtnDelScreenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cnbtnTestClick(Sender: TObject);
    procedure lstScreensClick(Sender: TObject);
    procedure cnbtnSaveClick(Sender: TObject);
    procedure cnbtnCancelClick(Sender: TObject);
    procedure CtrlChange(Sender: TObject);
  private
    { Private declarations }
    FLedManager: TLedManager;

    procedure Init;
    procedure LoadSetting;
    procedure SaveSetting;
    procedure SaveDefSetting;
    function GetCurScreen: TLedScreen;
    procedure ShowCtrl;
    procedure StartChangeOrSave;
    procedure endChangeOrSave;
    procedure RefreshListBox;
    procedure ListBoxSelectFirst;
    procedure ListBoxSelectLast;
    procedure SetObjectToCtrl(AScreen: TLedScreen);
    procedure SetCtrlToObject;

    procedure AddLSNScreen;
    procedure AddCPScreen;
    procedure DelScreen(Index: Integer);
  public
    { Public declarations }
    property LedManager: TLedManager read FLedManager;
  end;

var
  FormSetting: TFormSetting;

implementation

uses LSNScreen, LSNWindow, LedIniOptions, CPScreen, CPWindow;

{$R *.dfm}

{ TFormSetting } 

procedure TFormSetting.CtrlChange(Sender: TObject);
begin   
  SetCtrlToObject;
  ShowCtrl;
end;        

procedure TFormSetting.cnbtnTestClick(Sender: TObject);
var
  curScreen: TLedScreen;
  rst: Integer;
begin
  curScreen := GetCurScreen;
  if curScreen = nil then
  begin
    Exit;
  end;

  { DONE : 临时应用参数信息来测试 }

  rst := LedManager.SendTextTo(curScreen.ScreenType, curScreen.ID, 1, mmoText.Text);
  Application.MessageBox(PChar(IntToStr(rst)), '提示', MB_OK);
end;

procedure TFormSetting.lstScreensClick(Sender: TObject);
var
  curScreen: TLedScreen;
begin
  StartChangeOrSave;

  curScreen := GetCurScreen;
  if curScreen <> nil then
  begin
    SetObjectToCtrl(curScreen);
  end;
  ShowCtrl;

  endChangeOrSave;
end;

procedure TFormSetting.FormShow(Sender: TObject);
begin     
  StartChangeOrSave;
  LoadSetting;

  RefreshListBox;

  endChangeOrSave;
end;       

procedure TFormSetting.cnbtnSaveClick(Sender: TObject);
begin        
  StartChangeOrSave;
  { 保存配置信息的ini文件 }
  SaveSetting;

  endChangeOrSave;
            
  ModalResult := mrOk;
end;

procedure TFormSetting.cnbtnCancelClick(Sender: TObject);
begin
  { 取消配置，返回主界面 }
  Close;
end;

procedure TFormSetting.cnbtnAddScreenClick(Sender: TObject);
begin        
  StartChangeOrSave;

  AddLSNScreen;
  RefreshListBox;
  

  endChangeOrSave;
end;

procedure TFormSetting.cnbtnDelScreenClick(Sender: TObject);
begin
  StartChangeOrSave;

  DelScreen(lstScreens.Count - 1);
  RefreshListBox;


  endChangeOrSave;
end;

procedure TFormSetting.FormCreate(Sender: TObject);
begin
  Init;
end;   

procedure TFormSetting.DelScreen(Index: Integer);
begin
  if (0 <= Index) and (Index < FLedManager.ScreenCount) then
  begin
    FLedManager.DeleteScreen(Index);
  end;
end;   

procedure TFormSetting.AddCPScreen;
var
  aScreen: TCPScreen;
  aWindow: TCPWindow;
begin
  aScreen := TCPScreen.Create;
  aWindow := TCPWindow.Create;
  aScreen.ID := FLedManager.GetNewScreenID(CPScreenType);
  { 设置显示屏默认值 }
  aScreen.Width := IniOptions.LSNDefWidth;
  aScreen.Heigth := IniOptions.LSNDefHeigth;
  aScreen.IsSendByNet := IniOptions.LSNDefIsSendByNet;
  aScreen.IP := IniOptions.LSNDefIP;
  aScreen.Port := IniOptions.LSNDefPort;
  aScreen.IDCode := IniOptions.LSNDefIDCode;
  aScreen.ComNO := IniOptions.LSNDefComNO;
  aScreen.Baudrate := IniOptions.LSNDefBaudrate;
  aScreen.Timeout := IniOptions.DefTimeout;

  aWindow.X := IniOptions.LSNDefWindowX;
  aWindow.Y := IniOptions.LSNDefWindowY;
  aWindow.Width := IniOptions.LSNDefWindowWidth;
  aWindow.Heigth := IniOptions.LSNDefWindowHeigth;
  aWindow.FontName := IniOptions.LSNDefWindowFontName;
  aWindow.FontSize := IniOptions.LSNDefWindowFontSize;
  aWindow.Color := IniOptions.LSNDefWindowFontColor;
  aWindow.Effect := IniOptions.LSNDefWindowEffect;
  aWindow.RunSpeed := IniOptions.LSNDefWindowRunSpeed;
  aWindow.StayTime := IniOptions.LSNDefWindowStayTime;
  aWindow.Alignment := IniOptions.LSNDefWindowAlignment;

  aScreen.AddWindow(aWindow);
  FLedManager.AddScreen(aScreen);
end;

procedure TFormSetting.AddLSNScreen;
var
  aScreen: TLSNScreen;
  aWindow: TLSNWindow;
begin
  aScreen := TLSNScreen.Create;
  aWindow := TLSNWindow.Create;
  aScreen.ID := FLedManager.GetNewScreenID(LSNScreenType);
  { 设置显示屏默认值 }
  aScreen.Width := IniOptions.LSNDefWidth;
  aScreen.Heigth := IniOptions.LSNDefHeigth;
  aScreen.IsSendByNet := IniOptions.LSNDefIsSendByNet;
  aScreen.IP := IniOptions.LSNDefIP;
  aScreen.Port := IniOptions.LSNDefPort;
  aScreen.IDCode := IniOptions.LSNDefIDCode;
  aScreen.ComNO := IniOptions.LSNDefComNO;
  aScreen.Baudrate := IniOptions.LSNDefBaudrate;
  aScreen.ColorStyle := IniOptions.LSNDefColorStyle;
  aScreen.ModeStyle := IniOptions.LSNDefModeStyle;
  aScreen.TimerON := IniOptions.LSNDefTimerON;
  aScreen.TemperatureON := IniOptions.LSNDefTemperatureON;
  aScreen.MainON := IniOptions.LSNDefMainON;
  aScreen.TitleON := IniOptions.LSNDefTitleON;
  aScreen.TitleStyle := IniOptions.LSNDefTitleStyle;

  aWindow.X := IniOptions.LSNDefWindowX;
  aWindow.Y := IniOptions.LSNDefWindowY;
  aWindow.Width := IniOptions.LSNDefWindowWidth;
  aWindow.Heigth := IniOptions.LSNDefWindowHeigth;
  aWindow.FontName := IniOptions.LSNDefWindowFontName;
  aWindow.FontSize := IniOptions.LSNDefWindowFontSize;
  aWindow.Color := IniOptions.LSNDefWindowFontColor;
  aWindow.Effect := IniOptions.LSNDefWindowEffect;
  aWindow.RunSpeed := IniOptions.LSNDefWindowRunSpeed;
  aWindow.StayTime := IniOptions.LSNDefWindowStayTime;
  aWindow.Alignment := IniOptions.LSNDefWindowAlignment;
  aWindow.AddStyle := IniOptions.LSNDefWindowAddStyle;

  aScreen.AddWindow(aWindow);
  FLedManager.AddScreen(aScreen);    
end;

procedure TFormSetting.Init;
begin
  FLedManager := TLedManager.Create;

end;

procedure TFormSetting.LoadSetting;
begin
  IniOptions.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'LedManager.ini');
  FLedManager.LoadFrom(IniOptions);
end;

procedure TFormSetting.SaveSetting;
var
  i, j: Integer;
  tmpKVList: TStrings;
begin
  { TODO : 未考虑cp2500 }
  { 将Led对象信息保存至ini文件中 }
  //加载显示屏参数
  for i := IniOptions.ScreenCount - 1 downto 0 do
  begin
    //清除配置文件ini中的所有显示屏，稍后再加上
    IniOptions.DeleteScreen(i);
  end;
  for i := IniOptions.WindowCount - 1 downto 0 do
  begin
    //清除配置文件ini中的所有显示屏的相关区域/窗口，稍后再加上
    IniOptions.DeleteWindow(i);
  end;

  FLedManager.SaveTo(IniOptions);

  IniOptions.SaveToFile(ExtractFilePath(ParamStr(0)) + 'LedManager.ini');
end;

procedure TFormSetting.RefreshListBox;
var
  curScreen: TLedScreen;
begin
  lstScreens.Items := FLedManager.ScreenNames;
  ListBoxSelectLast;
  curScreen := GetCurScreen;
  if curScreen <> nil then
  begin
    SetObjectToCtrl(curScreen);
  end;
  ShowCtrl;
end;

procedure TFormSetting.SetObjectToCtrl(AScreen: TLedScreen);
var
  i: Integer;
begin
  if AScreen = nil then
  begin
    Exit;
  end;

  grpHardSetting.Caption := AScreen.ScreenType + '系列' + IntToStr(AScreen.ID) + '号显示屏硬件设置';
  edtScreenID.Text := IntToStr(AScreen.ID);
  seWidth.Value := AScreen.Width;
  seHeight.Value := AScreen.Heigth;
  edtIP.Text := AScreen.IP;
  edtIPPort.Text := IntToStr(AScreen.Port);
  edtIDCode.Text := IntToStr(AScreen.IDCode);
  if (0 < AScreen.ComNO) and (AScreen.ComNO <= 16) then
  begin
    cbbComNO.ItemIndex := AScreen.ComNO - 1;
  end;
  for i := 0 to cbbBaudrate.Items.Count - 1 do
  begin
    if AScreen.Baudrate = StrToInt(cbbBaudrate.Items[i]) then
    begin
      cbbBaudrate.ItemIndex := i;
      Break;
    end;
  end;
  cbbFontName.Text := AScreen.Windows[0].FontName;
  for i := 0 to cbbFontSize.Items.Count - 1 do
  begin
    if AScreen.Windows[0].FontSize = StrToInt(cbbFontSize.Items[i]) then
    begin
      cbbFontSize.ItemIndex := i;
      Break;
    end;
  end;
  if 65535 = AScreen.Windows[0].Color then
  begin
    cbbFontColor.ItemIndex := 1;
  end
  else if 65280 = AScreen.Windows[0].Color then
  begin
    cbbFontColor.ItemIndex := 2;
  end
  else
  begin
    cbbFontColor.ItemIndex := 0;
  end;

  cbbEffect.ItemIndex := AScreen.Windows[0].Effect;
  seRunSpeed.Value := AScreen.Windows[0].RunSpeed;
  seStayTime.Value := AScreen.Windows[0].StayTime;
  edtTextSource.Text := AScreen.Windows[0].TextSource;

  { DONE : 根据控制卡类型进行保存 }
  if AScreen.ScreenType = LSNScreenType then
  begin
    cbbTransMode.ItemIndex := (AScreen as TLSNScreen).TransMode - 1;
    cbbCardType.ItemIndex := (AScreen as TLSNScreen).CardType - 1;
    cbbColorStyle.ItemIndex := (AScreen as TLSNScreen).ColorStyle - 1;
    cbbModeStyle.ItemIndex := (AScreen as TLSNScreen).ModeStyle - 1;
  end;
end;

procedure TFormSetting.ShowCtrl;
begin
  grpNet.Visible := (cbbTransMode.ItemIndex = 0);
  grpCom.Visible := (cbbTransMode.ItemIndex > 0);

end;

procedure TFormSetting.SetCtrlToObject;
var
  aScreen: TLedScreen;
  lsnScreen: TLSNScreen;
begin
  if not Self.Enabled then
  begin
    Exit;
  end;
  aScreen := GetCurScreen;
  if aScreen = nil then
  begin
    Exit;
  end;
  aScreen.Width := seWidth.Value;
  aScreen.Heigth := seHeight.Value;
  aScreen.IsSendByNet := (cbbTransMode.ItemIndex = 0);
  aScreen.IP := edtIP.Text;
  aScreen.Port := StrToInt(edtIPPort.Text);
  aScreen.ComNO := cbbComNO.ItemIndex + 1;
  aScreen.Baudrate := StrToInt(cbbBaudrate.Text);
  aScreen.Windows[0].Width := seWidth.Value;
  aScreen.Windows[0].Heigth := seHeight.Value;
  aScreen.Windows[0].FontName := cbbFontName.Text;
  aScreen.Windows[0].FontSize := StrToInt(cbbFontSize.Text);
  aScreen.Windows[0].Color := cbbFontColor.ItemIndex + 1;
  if 1 = cbbFontColor.ItemIndex then
  begin
    aScreen.Windows[0].Color := 65535;
  end
  else if 2 = cbbFontColor.ItemIndex then
  begin
    aScreen.Windows[0].Color := 65280;
  end
  else
  begin
    aScreen.Windows[0].Color := 255;
  end;
  aScreen.Windows[0].Effect := cbbEffect.ItemIndex;
  aScreen.Windows[0].RunSpeed := seRunSpeed.Value;
  aScreen.Windows[0].StayTime := seStayTime.Value;
  aScreen.Windows[0].TextSource := edtTextSource.Text;
  { DONE : 根据控制卡类型进行保存 }
  if AScreen.ScreenType = LSNScreenType then
  begin
    (aScreen as TLSNScreen).TransMode := cbbTransMode.ItemIndex + 1;
    (aScreen as TLSNScreen).CardType := cbbCardType.ItemIndex + 1;
    (aScreen as TLSNScreen).ColorStyle := cbbColorStyle.ItemIndex + 1;
    (aScreen as TLSNScreen).ModeStyle := cbbModeStyle.ItemIndex + 1;
  end;
end;

procedure TFormSetting.ListBoxSelectFirst;
begin
  if lstScreens.Count > 0 then
  begin
    lstScreens.Selected[0] := True;
  end;
end;

procedure TFormSetting.ListBoxSelectLast;
begin     
  if lstScreens.Count > 0 then
  begin
    lstScreens.Selected[lstScreens.Count - 1] := True;
  end;
end;

function TFormSetting.GetCurScreen: TLedScreen;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to lstScreens.Count - 1 do
  begin
    if lstScreens.Selected[i] then
    begin
      Result := LedManager.Screens[i];
      Break;
    end;
  end;
end;

procedure TFormSetting.endChangeOrSave;
begin
  { TODO : Panel的控制应滞后 }
  cnpnlLSNPanel.Enabled := True;
  cnpnlLSNPanel.Visible := True;
  Self.Enabled := True;
  Screen.Cursor := crDefault;
end;

procedure TFormSetting.StartChangeOrSave;
begin
  { TODO : Panel的控制应滞后 }
  Screen.Cursor := crHourGlass; 
  Self.Enabled := False;
  cnpnlLSNPanel.Visible := False;
  cnpnlLSNPanel.Enabled := False;
end;

procedure TFormSetting.SaveDefSetting;
begin
{ TODO : 保存为默认设置 }
end;

end.
