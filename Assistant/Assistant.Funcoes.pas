unit Assistant.Funcoes;

interface

uses
  System.SysUtils, System.strUtils;

type
  iFuncoes = interface
    ['{3FF77569-1727-41A7-9FE1-52AE4C14791B}']
    function iif(aCondicao: Boolean; aTrue, aFalse: Variant): Variant;
    function OnlyNumbers(const Value: string): string;
  end;

type
  TFuncoes = class(TInterfacedObject, iFuncoes)
  public
    function iif(aCondicao: Boolean; aTrue, aFalse: Variant): Variant;
    function OnlyNumbers(const Value: string): string;

    constructor Create;

    destructor Destroy; override;
    class function New: iFuncoes;
  end;

implementation

{ TFuncoes }

constructor TFuncoes.Create;
begin

end;

destructor TFuncoes.Destroy;
begin

  inherited;
end;

function TFuncoes.iif(aCondicao: Boolean; aTrue, aFalse: Variant): Variant;
begin
  case aCondicao of
    true:
      result := aTrue;
    false:
      Result := aFalse;
  end;
end;

class function TFuncoes.New: iFuncoes;
begin
  result := self.Create;
end;

function TFuncoes.OnlyNumbers(const Value: string): string;
var
  index: Integer;
begin
  Result := '';
  if Trim(Value) = EmptyStr then
    Exit;

  for index := 0 to Length(Value) do
    if (Value[index] in ['0'..'9']) then
      Result := Result + Value[index];
end;

end.

