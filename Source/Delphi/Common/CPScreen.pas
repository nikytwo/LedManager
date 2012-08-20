unit CPScreen;

interface

uses
  LedBasic;

const
  DefaultTimeOut = 600;

type
{ TCPScreen }

  TCPScreen = class(TLedScreen)
  private

  protected

  public
    constructor Create;
    destructor Destroy; override;

  end;


implementation

{ TCPScreen }

constructor TCPScreen.Create;
begin
  inherited;
  ScreenType := 'CP2500'

end;

destructor TCPScreen.Destroy;
begin

  inherited;
end;

end.
 