unit DBTextSourceService;

interface

uses
  Classes,
  SqlExpr,
  ADODB,
  DB,
  LedIniOptions;
  
const
  TextSourceFieldName = 'TextSource';
  TextFieldName = 'Text';

type
{ TDBTextSourceService }

  TDBTextSourceService = class(TObject)
  private    
    FDBConnetion: TSQLConnection;
    FDBQuery: TSQLQuery;
    FADOConnection: TADOConnection;
    FADOQuery: TADOQuery;
    FScrTable: string;
    FTextSourceName: string;
    FTextName: string;

    function buildSQLString: string;
  protected

  public
    constructor Create;
    destructor Destroy; override;

    procedure LoadSettingFrom(AIniOptions: TIniOptions);
    function GetTexts: TStringList;

  end;


implementation

{ TDBTextSourceService }

function TDBTextSourceService.buildSQLString: string;
begin
  Result := 'Select ';
  Result := Result + FTextSourceName + ' ' + TextSourceFieldName + ', ';
  Result := Result + FTextName + ' ' + TextFieldName + ' ';
  Result := Result + 'From ' + FScrTable;
end;

constructor TDBTextSourceService.Create;
begin
  inherited;
  FDBConnetion := TSQLConnection.Create(nil);
  FDBQuery := TSQLQuery.Create(nil);
  FDBQuery.SQLConnection := FDBConnetion;
  FADOConnection := TADOConnection.Create(nil);
  FADOQuery := TADOQuery.Create(nil);
  FADOQuery.Connection := FADOConnection;
  LoadSettingFrom(IniOptions);
end;

destructor TDBTextSourceService.Destroy;
begin
  FDBQuery.Close;
  FDBConnetion.Close;
  FDBQuery.Free;
  FDBConnetion.Free; 
  inherited;
end;

function TDBTextSourceService.GetTexts: TStringList;
var
  ds: TWideDataSet;
  con: TCustomConnection;
begin
  //创建对象储存数据
  Result := TStringList.Create;
  if IniOptions.DBDriverName = 'SybaseOLEDB' then
  begin
    con := FADOConnection;
    FADOQuery.SQL.Clear;
    FADOQuery.SQL.Add(buildSQLString);
    ds := FADOQuery;
  end
  else
  begin
    con := FDBConnetion;   
    FDBQuery.SQL.Clear;
    FDBQuery.SQL.Add(buildSQLString);
    ds := FDBQuery;
  end;
  try
    //从数据库获取数据  
    con.Close;
    con.Open;
    with ds do
    begin
      Close;
      Open;
      while not Eof do
      begin
        //保存
        Result.Add(FieldByName(TextSourceFieldName).AsString
          + '=' + FieldByName(TextFieldName).AsString);
        Next;
      end;    
    end;
  finally
    ds.Close;
    con.Close;
  end;
end;

procedure TDBTextSourceService.LoadSettingFrom(AIniOptions: TIniOptions);
begin
  FDBConnetion.LoginPrompt := False;
  FDBConnetion.Params.Clear;
  if (IniOptions.DBDriverName = 'Sybase')
  or (IniOptions.DBDriverName = 'ASE') then
  begin                   
    FDBConnetion.DriverName := 'ASE';
    FDBConnetion.GetDriverFunc := 'getSQLDriverASE';
    FDBConnetion.LibraryName := 'dbxase30.dll';
    FDBConnetion.VendorLib := 'libct.dll;libcs.dll';
    FDBConnetion.Params.Add('BlobSize=' + AIniOptions.BlobSize);
    FDBConnetion.Params.Add('HostName=' + AIniOptions.DBServer);
    FDBConnetion.Params.Add('DataBase=' + AIniOptions.Database);
    FDBConnetion.Params.Add('User_Name=' + AIniOptions.User);
    FDBConnetion.Params.Add('Password=' + AIniOptions.Password);
  end
  else if IniOptions.DBDriverName = 'MSSQL' then
  begin
    FDBConnetion.DriverName := 'MSSQL';
    FDBConnetion.GetDriverFunc := 'getSQLDriverMSSQL';  
    FDBConnetion.LibraryName := 'dbxmss30.dll';
    FDBConnetion.VendorLib := 'oledb';
    FDBConnetion.Params.Add('BlobSize=' + AIniOptions.BlobSize);
    FDBConnetion.Params.Add('HostName=' + AIniOptions.DBServer);
    FDBConnetion.Params.Add('DataBase=' + AIniOptions.Database);
    FDBConnetion.Params.Add('User_Name=' + AIniOptions.User);
    FDBConnetion.Params.Add('Password=' + AIniOptions.Password);
  end
  else if IniOptions.DBDriverName = 'SybaseOLEDB' then
  begin
    FADOConnection.LoginPrompt := False;
    FADOConnection.ConnectionString := 'Provider=Sybase.ASEOLEDBProvider.2'
     + ';Initial Catalog=' + AIniOptions.Database
     + ';User ID=' + AIniOptions.User
     + ';Password=' + AIniOptions.Password
     + ';Data Source=' + AIniOptions.DBServer
     + ';Persist Security Info=False'
  end;
  FScrTable := AIniOptions.SourceTableName;
  FTextSourceName := AIniOptions.TextSourceName;
  FTextName := AIniOptions.TextName;

end;

end.
 