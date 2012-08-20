unit DBSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBTextSourceService;

type
  TFormDBSetting = class(TForm)
    grpDBServer: TGroupBox;
    grpSourceTable: TGroupBox;
    pnl1: TPanel;
    btnSave: TButton;
    btnCancel: TButton;
    lbl5: TLabel;
    edtDBServer: TEdit;
    cbbDriverName: TComboBox;
    lblDriverName: TLabel;
    lblDatabase: TLabel;
    lblUser: TLabel;
    lblPassword: TLabel;
    edtDatabase: TEdit;
    edtUser: TEdit;
    edtPassword: TEdit;
    lblTable: TLabel;
    edtTable: TEdit;
    lblTextSource: TLabel;
    lblText: TLabel;
    edtTextSource: TEdit;
    edtText: TEdit;
    btnTest: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FDBTextService: TDBTextSourceService;

    procedure LoadDBSetting;
    procedure SaveDBSetting;
  public
    { Public declarations }
  end;

var
  FormDBSetting: TFormDBSetting;

implementation

uses LedIniOptions;

{$R *.dfm}

procedure TFormDBSetting.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFormDBSetting.btnTestClick(Sender: TObject);
begin
  { DONE : 测试是否能获取数据 }
  if FDBTextService = nil then
  begin
    FDBTextService := TDBTextSourceService.Create;
  end;
  { TODO : 不应该Save DB Setting }
  SaveDBSetting;
  FDBTextService.LoadSettingFrom(IniOptions);
  try
    FDBTextService.GetTexts;
    Application.MessageBox('链接成功！', '提示', MB_OK);
  except
    Application.MessageBox('链接失败！', '提示', MB_OK);
  end;
end;

procedure TFormDBSetting.btnSaveClick(Sender: TObject);
begin
  SaveDBSetting;
  IniOptions.SaveToFile(ExtractFilePath(ParamStr(0)) + 'LedManager.ini');
  ModalResult := mrOk;
end;

procedure TFormDBSetting.LoadDBSetting;
var
  i: Integer;
begin
  for i := 0 to cbbDriverName.Items.Count - 1 do
  begin
    if IniOptions.DBDriverName = cbbDriverName.Items[i] then
    begin
      cbbDriverName.ItemIndex := i;
    end;
  end;
  edtDBServer.Text := IniOptions.DBServer;
  edtDatabase.Text := IniOptions.Database;
  edtUser.Text := IniOptions.User;
  edtPassword.Text := IniOptions.Password;
  edtTable.Text := IniOptions.SourceTableName;
  edtTextSource.Text := IniOptions.TextSourceName;
  edtText.Text := IniOptions.TextName;
end;

procedure TFormDBSetting.SaveDBSetting;
begin
  IniOptions.DBDriverName := cbbDriverName.Text;
  IniOptions.DBServer := edtDBServer.Text;
  IniOptions.Database := edtDatabase.Text;
  IniOptions.User := edtUser.Text;
  IniOptions.Password := edtPassword.Text;
  IniOptions.SourceTableName := edtTable.Text;
  IniOptions.TextSourceName := edtTextSource.Text;
  IniOptions.TextName := edtText.Text;
end;

procedure TFormDBSetting.FormShow(Sender: TObject);
begin
  LoadDBSetting;
end;

end.
