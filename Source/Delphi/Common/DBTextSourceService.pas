unit DBTextSourceService;

interface

uses
  Classes,
  SqlExpr,
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
begin
  //创建对象储存数据
  Result := TStringList.Create;
  try
    //从数据库获取数据  
    FDBConnetion.Close;
    FDBConnetion.Open;  
    with FDBQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add(buildSQLString);
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
    FDBQuery.Close;
    FDBConnetion.Close;
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
  end;
  FScrTable := AIniOptions.SourceTableName;
  FTextSourceName := AIniOptions.TextSourceName;
  FTextName := AIniOptions.TextName;

end;

end.
 