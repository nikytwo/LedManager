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
  Color := 255;//255－－红色，65280－－黄色，65535－－绿色
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
  Result.X := StrToIntDef(AKVList.Values['X'], 0);
  Result.Y := StrToIntDef(AKVList.Values['Y'], 0);
  Result.Width := StrToIntDef(AKVList.Values['Width'], 128);
  Result.Heigth := StrToIntDef(AKVList.Values['Heigth'], 64);
  Result.FontName := AKVList.Values['FontName'];
  Result.FontSize := StrToIntDef(AKVList.Values['FontSize'], 12);
  Result.Color := StrToIntDef(AKVList.Values['FontColor'], 255);
  Result.Effect := StrToIntDef(AKVList.Values['Effect'], 1);
  Result.RunSpeed := StrToIntDef(AKVList.Values['RunSpeed'], 10);
  Result.StayTime := StrToIntDef(AKVList.Values['StayTime'], 0);
  Result.Alignment := StrToIntDef(AKVList.Values['Alignment'], 1);
  Result.AddStyle := StrToIntDef(AKVList.Values['AddStyle'], 1);
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
  Result := 0;
  sc := Screen as TLSNScreen;
  //添加节目
  ProgramInit(sc.ID, sc.ColorStyle, 1, 0);

  //静态文本
  AddQuitText(sc.ID, 1, ID, X, Y, Width, Heigth, Color, PChar(FontName),
    FontSize, 0, 0, 0, PChar(Text));

//  //添加文件区域
//  AddFileArea(sc.ID, 1, 1, X, Y, Width, Heigth);

//  //添加字符串到图文区域中
//  AddFileString(sc.ID, 1, 1, 1, PChar(Text),
//    PChar(FontName), FontSize, Self.Color, 0, 0, 0, Alignment, Width,
//    Heigth, Effect, 255, RunSpeed, StayTime, 1);

  //发送数据(真正)
  Result := Result + (SendControl(sc.ID, 1, 0) - 1) * 1000000;

end;

end.
 