unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, SqlExpr, FMTBcd, Grids, DBGrids,
  LedBasic, DateUtils,
  DBTextSourceService, Menus, CnClasses, CnTrayIcon, RzButton, ExtCtrls,
  CnTimer, WideStrings, ADODB;

const
  TextSourceFieldName = 'TextSource';
  TextFieldName = 'Text';

type
  TFormMain = class(TForm)
    lst1: TListBox;
    btntest: TButton;
    btnShowDBService: TButton;
    btnShowLedSetting: TButton;
    tiMain: TCnTrayIcon;
    pmMain: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    rzbtbtnShowAllText: TRzBitBtn;
    rzbtbtnLedSetting: TRzBitBtn;
    rzbtbtnDBSetting: TRzBitBtn;
    rzbtbtnStart: TRzBitBtn;
    rzbtbtnStop: TRzBitBtn;
    mmo1: TMemo;
    tmrShowAllText: TCnTimer;
    procedure FormCreate(Sender: TObject);
    procedure btnShowDBServiceClick(Sender: TObject);
    procedure btnShowLedSettingClick(Sender: TObject);
    procedure tiMainDblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure rzbtbtnLedSettingClick(Sender: TObject);
    procedure rzbtbtnDBSettingClick(Sender: TObject);
    procedure tmrShowAllTextTimer(Sender: TObject);
    procedure rzbtbtnStartClick(Sender: TObject);
    procedure rzbtbtnStopClick(Sender: TObject);
    procedure rzbtbtnShowAllTextClick(Sender: TObject);
    procedure ctShowAllTextTimer(Sender: TObject);
  private
    { Private declarations }
    FLedManager: TLedManager;
    FDBTextService: TDBTextSourceService;

    procedure Init;
    procedure LoadDBSetting;
    procedure ShowAllText;
    procedure EnableCtrl;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses LedSettingForm, LedIniOptions, DBSettingForm;

{$R *.dfm}

procedure TFormMain.FormCreate(Sender: TObject);
begin
  Init;
end;

procedure TFormMain.Init;
begin   
  LoadDBSetting;
  FDBTextService := TDBTextSourceService.Create;
  FLedManager := TLedManager.Create;
  FLedManager.LoadFrom(IniOptions, 'LSN');   
  EnableCtrl;
end;

procedure TFormMain.LoadDBSetting;
begin
  IniOptions.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'LedManager.ini');
end;

procedure TFormMain.btnShowDBServiceClick(Sender: TObject);
begin
  lst1.Items := FDBTextService.GetTexts;
end;

procedure TFormMain.btnShowLedSettingClick(Sender: TObject);
begin
  lst1.Items := FLedManager.ScreenNames;
end;

procedure TFormMain.tiMainDblClick(Sender: TObject);
begin
  tiMain.ShowApplication;
end;

procedure TFormMain.N1Click(Sender: TObject);
begin
  tiMain.ShowApplication;
end;

procedure TFormMain.N2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.rzbtbtnLedSettingClick(Sender: TObject);
begin
  if FormSetting.ShowModal = mrOK then
  begin
    LoadDBSetting;
    FLedManager.LoadFrom(IniOptions, 'LSN');
  end;
end;

procedure TFormMain.rzbtbtnDBSettingClick(Sender: TObject);
begin
  if FormDBSetting.ShowModal = mrOK then
  begin
    FDBTextService.LoadSettingFrom(IniOptions);
  end;
end;

procedure TFormMain.tmrShowAllTextTimer(Sender: TObject);
begin
  { 时间到，则刷新数据并显示 }
  if tmrShowAllText.Interval > 0 then
  begin
    ShowAllText;
  end;
end;

procedure TFormMain.rzbtbtnStartClick(Sender: TObject);
begin
  { TODO : 开始自动刷新数据并显示 }
  tmrShowAllText.Interval := IniOptions.RefreshTime;
  EnableCtrl;
end;

procedure TFormMain.rzbtbtnStopClick(Sender: TObject);
begin
  { TODO : 停止自动刷新数据 }
  tmrShowAllText.Interval := 0;
  EnableCtrl;
end;

procedure TFormMain.rzbtbtnShowAllTextClick(Sender: TObject);
begin
  ShowAllText;
end;

procedure TFormMain.ShowAllText;
var
  i, rst: Integer;
  aTextList: TStringList;
  name, value: string;
  curtmpTime: string;
  beginTime: TDateTime;
begin
  if mmo1.Lines.Count > 1000 then
  begin
    mmo1.Clear;
  end;
  beginTime := Now;
  curtmpTime := TimeToStr(beginTime);
  aTextList := FDBTextService.GetTexts;
  for i := 0 to aTextList.Count - 1 do
  begin
    name := aTextList.Names[i];
    value := aTextList.Values[name];
    mmo1.Lines.Add(curtmpTime + ': ' + name + '=' + value);
    rst := FLedManager.SendText(name, value);
    mmo1.Lines.Add('结果: ' + IntToStr(rst));
    {
    if (SecondsBetween(Now, beginTime) * 1000) > IniOptions.RefreshTime then
    begin
      aTextList := FDBTextService.GetTexts;
    end;
    }
  end;
end;

procedure TFormMain.EnableCtrl;
begin
  rzbtbtnLedSetting.Enabled := tmrShowAllText.Interval <= 0;
  rzbtbtnDBSetting.Enabled := tmrShowAllText.Interval <= 0;
  rzbtbtnStart.Enabled := tmrShowAllText.Interval <= 0;
  rzbtbtnStop.Enabled := tmrShowAllText.Interval > 0;
end;

procedure TFormMain.ctShowAllTextTimer(Sender: TObject);
begin
  { 时间到，则刷新数据并显示 }
  if tmrShowAllText.Interval > 0 then
  begin
    tmrShowAllText.Enabled := False;
    ShowAllText;    
    tmrShowAllText.Enabled := True;
  end;
end;

end.
