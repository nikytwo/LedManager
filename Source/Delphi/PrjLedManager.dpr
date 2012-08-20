program PrjLedManager;

uses
  Forms,
  MainForm in 'Components\MainForm.pas' {FormMain},
  LedIniOptions in 'Public\LedIniOptions.pas',
  LedBasic in 'Common\LedBasic.pas',
  cpower in 'Public\cpower.pas',
  CPScreen in 'Common\CPScreen.pas',
  LSNScreen in 'Common\LSNScreen.pas',
  LSNFun in 'Public\LSNFun.pas',
  LSNWindow in 'Common\LSNWindow.pas',
  LedSettingForm in 'Components\LedSettingForm.pas' {FormSetting},
  DBSettingForm in 'Components\DBSettingForm.pas' {FormDBSetting},
  DBTextSourceService in 'Common\DBTextSourceService.pas',
  wdRunOnce in 'Public\wdRunOnce.pas';

{$R *.res}

begin
  Application.Initialize;
  if not AppHasRun(Application.Handle) then
  begin
    Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormSetting, FormSetting);
  Application.CreateForm(TFormDBSetting, FormDBSetting);
  Application.Run;
  end;
end.
