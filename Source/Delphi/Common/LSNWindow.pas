unit LSNWindow;

interface

uses    
  Classes,
  SysUtils,
  LSNFun,
  LedBasic;

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

  protected

  public
    constructor Create;
    destructor Destroy; override;

    function Show: Integer; override;
    function SaveTo: TStrings; override;

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
begin
  if '' = FHEXFile then
  begin
    FHEXFile := 'Lsn_' + IntToStr(Screen.ID) + '_' + IntToStr(ID) + '.dat';
  end;
  //转化主区要显示的数据
  AddString(Effect, RunSpeed, StayTime, Y, PChar(FontName), FontSize,
    Color, PChar(HEXFile), PChar(Text), AddStyle);

  //向主区发送数据
  if Screen.IsSendByNet then
  begin
    Result := (1 - SendDATA_UDP(PChar(Screen.IP), Screen.Port, Screen.Baudrate,
      PChar(HEXFile), DefaultHParent)) * 1000;
  end
  else
  begin
    Result := (1 - SendDATAToComm(Screen.ComNo, Screen.Baudrate,
      PChar(HEXFile), DefaultHParent)) * 1000;
  end;
end;

end.
 