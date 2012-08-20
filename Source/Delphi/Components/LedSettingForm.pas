unit LedSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CnAAFont, CnAACtrls, StdCtrls, CnButtons, ExtCtrls, CnPanel,
  Mask, RzEdit, CnSpin, LedBasic;

type
  TFormSetting = class(TForm)
    cnpnlLeft: TCnPanel;
    cnpnlContext: TCnPanel;
    cnbtnAddScreen: TCnBitBtn;
    cnbtnDelScreen: TCnBitBtn;
    lstScreens: TListBox;
    alblScreenTitle: TCnAALabel;
    grpHardSetting: TGroupBox;
    rbRs: TRadioButton;
    lbl1: TLabel;
    cbbPort: TComboBox;
    lbl2: TLabel;
    cbbBaudrate: TComboBox;
    rbNet: TRadioButton;
    lbl4: TLabel;
    lbl5: TLabel;
    edtIPPort: TEdit;
    edtIP: TRzMaskEdit;
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
    procedure rbClick(Sender: TObject);
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
    procedure EnableCtrl;
    procedure StartChangeOrSave;
    procedure endChangeOrSave;
    procedure RefreshListBox;
    procedure ListBoxSelectFirst;
    procedure ListBoxSelectLast;
    procedure SetObjectToCtrl(AScreen: TLedScreen);
    procedure SetCtrlToObject;

    procedure AddLSNScreen;
    procedure DelLSNScreen(Index: Integer);
  public
    { Public declarations }
    property LedManager: TLedManager read FLedManager;
  end;

var
  FormSetting: TFormSetting;

implementation

uses LSNScreen, LSNWindow, LedIniOptions;

{$R *.dfm}

{ TFormSetting } 

procedure TFormSetting.CtrlChange(Sender: TObject);
begin   
  SetCtrlToObject;
end;        

procedure TFormSetting.cnbtnTestClick(Sender: TObject);
var
  curScreen: TLedScreen;
begin
  curScreen := GetCurScreen;
  if curScreen = nil then
  begin
    Exit;
  end;

  { DONE : 临时应用参数信息来测试 }

  LedManager.SendTextTo(curScreen.ScreenType, curScreen.ID, 1, mmoText.Text);
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
  EnableCtrl;

  endChangeOrSave;
end;

procedure TFormSetting.rbClick(Sender: TObject);
begin     
  SetCtrlToObject;
  EnableCtrl;
end;

procedure TFormSetting.FormShow(Sender: TObject);
begin     
  StartChangeOrSave;
  LoadSetting;

  RefreshListBox;
  EnableCtrl;

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
  EnableCtrl;

  endChangeOrSave;
end;

procedure TFormSetting.cnbtnDelScreenClick(Sender: TObject);
begin
  StartChangeOrSave;

  DelLSNScreen(lstScreens.Count - 1);
  RefreshListBox;
  EnableCtrl;

  endChangeOrSave;
end;

procedure TFormSetting.FormCreate(Sender: TObject);
begin
  Init;
end;   

procedure TFormSetting.DelLSNScreen(Index: Integer);
begin
  if (0 <= Index) and (Index < FLedManager.ScreenCount) then
  begin
    FLedManager.DeleteScreen(Index);
  end;
end;   

procedure TFormSetting.AddLSNScreen;
var
  aScreen: TLedScreen;
  aWindow: TLedWindow;
begin
  aScreen := TLSNScreen.Create;
  aWindow := TLSNWindow.Create;
  aScreen.ID := FLedManager.GetNewScreenID('LSN');
  { 设置显示屏默认值 }
  aScreen.Width := IniOptions.LSNDefWidth;
  aScreen.Heigth := IniOptions.LSNDefHeigth;
  aScreen.IsSendByNet := IniOptions.LSNDefIsSendByNet;
  aScreen.IP := IniOptions.LSNDefIP;
  aScreen.Port := IniOptions.LSNDefPort;
  aScreen.IDCode := IniOptions.LSNDefIDCode;
  aScreen.ComNO := IniOptions.LSNDefComNO;
  aScreen.Baudrate := IniOptions.LSNDefBaudrate;
  TLSNScreen(aScreen).ColorStyle := IniOptions.LSNDefColorStyle;
  TLSNScreen(aScreen).ModeStyle := IniOptions.LSNDefModeStyle;
  TLSNScreen(aScreen).TimerON := IniOptions.LSNDefTimerON;
  TLSNScreen(aScreen).TemperatureON := IniOptions.LSNDefTemperatureON;
  TLSNScreen(aScreen).MainON := IniOptions.LSNDefMainON;
  TLSNScreen(aScreen).TitleON := IniOptions.LSNDefTitleON;
  TLSNScreen(aScreen).TitleStyle := IniOptions.LSNDefTitleStyle;

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
  TLSNWindow(aWindow).AddStyle := IniOptions.LSNDefWindowAddStyle;

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
  FLedManager.LoadFrom(IniOptions, 'LSN');     
end;     

procedure TFormSetting.SaveSetting;
var
  i, j: Integer;
  tmpKVList: TStrings;
  tmpScreen: TLSNScreen;
  tmpWindow: TLSNWindow;
begin
  { 将Led对象信息保存至ini文件中 }
  //加载显示屏参数
  for i := IniOptions.ScreenCount - 1 downto 0 do
  begin  
    if IniOptions.Screens[i].Values['ScreenType'] = 'LSN' then
    begin
      //清除配置文件ini中的LS-N控制卡的显示屏，稍后再加上
      IniOptions.DeleteScreen(i);
    end;
  end;
  for i := IniOptions.WindowCount - 1 downto 0 do
  begin
    if IniOptions.Windows[i].Values['ScreenType'] = 'LSN' then
    begin        
      //清除配置文件ini中的LS-N控制卡的显示屏的相关区域/窗口，稍后再加上
      IniOptions.DeleteWindow(i);
    end;
  end;

  for i := 0 to FLedManager.ScreenCount - 1 do
  begin
    tmpScreen := FLedManager.Screens[i] as TLSNScreen;
    tmpKVList := tmpScreen.SaveTo;
    IniOptions.AddScreens(tmpKVList);

    for j := 0 to tmpScreen.WindowCount - 1 do
    begin
      tmpWindow := tmpScreen.Windows[0] as TLSNWindow;
      tmpKVList := tmpWindow.SaveTo;
      IniOptions.AddWindows(tmpKVList);
    end;
  end;

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
end;        

procedure TFormSetting.EnableCtrl;
begin
  edtIPPort.Enabled := not rbRs.Checked;
  edtIP.Enabled := not rbRs.Checked;
  cbbPort.Enabled := rbRs.Checked;
  cbbBaudrate.Enabled := rbRs.Checked;
  cnbtnDelScreen.Enabled := (lstScreens.Count > 0);
end;

procedure TFormSetting.SetObjectToCtrl(AScreen: TLedScreen);
var
  i: Integer;
  lsnScreen: TLSNScreen;
begin
  if AScreen = nil then
  begin
    Exit;
  end;
  lsnScreen := AScreen as TLSNScreen;
  grpHardSetting.Caption := IntToStr(lsnScreen.ID) + '号显示屏硬件设置';
  seWidth.Value := lsnScreen.Width;
  seHeight.Value := lsnScreen.Heigth;
  rbRs.Checked := not lsnScreen.IsSendByNet;
  rbNet.Checked := lsnScreen.IsSendByNet;
  edtIP.Text := lsnScreen.IP;
  edtIPPort.Text := IntToStr(lsnScreen.Port);
  if (0 < lsnScreen.ComNO) and (lsnScreen.ComNO <= 16) then
  begin
    cbbPort.ItemIndex := lsnScreen.ComNO - 1;
  end;
  for i := 0 to cbbBaudrate.Items.Count - 1 do
  begin
    if lsnScreen.Baudrate = StrToInt(cbbBaudrate.Items[i]) then
    begin
      cbbBaudrate.ItemIndex := i;
      Break;
    end;
  end;
  cbbColorStyle.ItemIndex := lsnScreen.ColorStyle - 1;
  cbbModeStyle.ItemIndex := lsnScreen.ModeStyle - 1;
  cbbFontName.Text := lsnScreen.Windows[0].FontName;
  for i := 0 to cbbFontSize.Items.Count - 1 do
  begin
    if lsnScreen.Windows[0].FontSize = StrToInt(cbbFontSize.Items[i]) then
    begin
      cbbFontSize.ItemIndex := i;
      Break;
    end;
  end;
  cbbFontColor.ItemIndex := lsnScreen.Windows[0].Color - 1;
  cbbEffect.ItemIndex := lsnScreen.Windows[0].Effect;
  seRunSpeed.Value := lsnScreen.Windows[0].RunSpeed;
  seStayTime.Value := lsnScreen.Windows[0].StayTime;
  edtTextSource.Text := lsnScreen.Windows[0].TextSource;
end;

procedure TFormSetting.SetCtrlToObject;
var
  lsnScreen: TLSNScreen;
begin
  if not cnpnlContext.Enabled then
  begin
    Exit;
  end;
  lsnScreen := GetCurScreen as TLSNScreen;
  if lsnScreen = nil then
  begin
    Exit;
  end;
  lsnScreen.Width := seWidth.Value;
  lsnScreen.Heigth := seHeight.Value;
  lsnScreen.IsSendByNet := not rbRs.Checked;
  lsnScreen.IP := edtIP.Text;
  lsnScreen.Port := StrToInt(edtIPPort.Text);
  lsnScreen.ComNO := cbbPort.ItemIndex + 1;
  lsnScreen.Baudrate := StrToInt(cbbBaudrate.Text);
  lsnScreen.ColorStyle := cbbColorStyle.ItemIndex + 1;
  lsnScreen.ModeStyle := cbbModeStyle.ItemIndex + 1;
  lsnScreen.Windows[0].FontName := cbbFontName.Text;
  lsnScreen.Windows[0].FontSize := StrToInt(cbbFontSize.Text);
  lsnScreen.Windows[0].Color := cbbFontColor.ItemIndex + 1;
  lsnScreen.Windows[0].Effect := cbbEffect.ItemIndex;
  lsnScreen.Windows[0].RunSpeed := seRunSpeed.Value;
  lsnScreen.Windows[0].StayTime := seStayTime.Value;
  lsnScreen.Windows[0].TextSource := edtTextSource.Text;
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
  cnpnlContext.Enabled := True;
  Screen.Cursor := crDefault;
end;

procedure TFormSetting.StartChangeOrSave;
begin
  Screen.Cursor := crHourGlass;
  cnpnlContext.Enabled := False;
end;

procedure TFormSetting.SaveDefSetting;
begin
{ TODO : 保存为默认设置 }
end;

end.
