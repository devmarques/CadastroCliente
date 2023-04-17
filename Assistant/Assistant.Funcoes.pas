unit Assistant.Funcoes;

interface

type
  iFuncoes = interface
    ['{3FF77569-1727-41A7-9FE1-52AE4C14791B}']
    function iif(aCondicao: Boolean; aTrue, aFalse: Variant): Variant;
  end;

type
  TFuncoes = class(TInterfacedObject, iFuncoes)
  public
    function iif(aCondicao: Boolean; aTrue, aFalse: Variant): Variant;

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

end.

