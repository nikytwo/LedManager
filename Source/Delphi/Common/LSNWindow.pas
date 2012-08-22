unit LSNWindow;

interface

uses    
  Classes,
  SysUtils,
  LSNFun,
  LedBasic,
  LSNScreen;

const
  DefaultHParent = 0;

type
{ TLSNWindow }

  TLSNWindow = class(TLedWindow)
  private
    FAddStyle: Integer;
    FHEXFile: string;
    procedure SetAddStyle(const Value: Integer);
    procedure SetHEXFile(const Value: string);

    function ProgramInit(pin,DbColor,jno,PlayTimes:Integer):Integer;    
  protected

  public
    constructor Create;
    destructor Destroy; override;

    function Show: Integer; override;
    function SaveTo: TStrings; override;
    class function LoadFrom(AKVList: TStrings): TLSNWindow;

    property HEXFile: string read FHEXFile write SetHEXFile;
    property AddStyle: Integer read FAddStyle write SetAddStyle;

  end;


implementation

{ TLSNWindow }

constructor TLSNWindow.Create;
begin
  inherited;
  FHEXFile := '';
  FAddStyle := 1;

end;

destructor TLSNWindow.Destroy;
begin

  inherited;
end;

class function TLSNWindow.LoadFrom(AKVList: TStrings): TLSNWindow;
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
  Result.AddStyle := StrToInt(AKVList.Values['AddStyle']);
end;

function TLSNWindow.ProgramInit(pin, DbColor, jno, PlayTimes: Integer): Integer;
var
    reb:Integer;
begin
    Result:=0;
    StartSend;
    reb:=AddControl(pin,DbColor);
    if reb=2 then
    begin
        Result:=1;
        Exit;
    end;
    reb:=AddProgram(pin,jno,PlayTimes);
    if reb=2 then
    begin
        Result:=2;
        Exit;
    end;
end;

function TLSNWindow.SaveTo: TStrings;
begin
  Result := TStringList.Create;
  Result.Add('TextSource=' + TextSource);
  Result.Add('ScreenID=' + IntToStr(Screen.ID));
  Result.Add('ScreenType=' + Screen.ScreenType);
  Result.Add('ID=' + IntToStr(ID));
  Result.Add('X=' + IntToStr(X));
  Result.Add('Y=' + IntToStr(Y));
  Result.Add('Width=' + IntToStr(Width));
  Result.Add('Heigth=' + IntToStr(Heigth));
  Result.Add('FontName=' + FontName);
  Result.Add('FontSize=' + IntToStr(FontSize));
  Result.Add('FontColor=' + IntToStr(Color));
  Result.Add('Effect=' + IntToStr(Effect));
  Result.Add('RunSpeed=' + IntToStr(RunSpeed));
  Result.Add('StayTime=' + IntToStr(StayTime));
  Result.Add('Alignment=' + IntToStr(Alignment));
  Result.Add('AddStyle=' + IntToStr(AddStyle));
end;

procedure TLSNWindow.SetAddStyle(const Value: Integer);
begin
  FAddStyle := Value;
end;

procedure TLSNWindow.SetHEXFile(const Value: string);
begin
  FHEXFile := Value;
end;

function TLSNWindow.Show: Integer;
var
  sc: TLSNScreen;
begin
  sc := Screen as TLSNScreen;
  //添加节目
  Result := ProgramInit(sc.ID, sc.ColorStyle, 1, 0) * 1000;

  //添加文件区域
  AddFileArea(sc.ID, 1, 1, 0, 0, sc.Width, sc.Heigth);

  //添加字符串到图文区域中
  Result := Result + (AddFileString(sc.ID, 1, 1, 1, PChar(Text),
    PChar(FontName), FontSize, Color, 0, 0, 0, Alignment, sc.Width,
    sc.Heigth, Effect, 255, RunSpeed, StayTime, 1) - 1) * 100000;

  //发送数据(真正)
  Result := Result + (SendControl(sc.ID, 1, 0) - 1) * 1000000
end;

end.
 