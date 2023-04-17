unit Assistant.Consulta.CEP;

interface

uses
  System.JSON, System.SysUtils,
  System.Net.HttpClient;

type
  iConsultaCEP = interface
    ['{464F4509-DC01-46D3-9F34-F0B5FDFBE96D}']
    function ConsultaCEP(CEP: string): iConsultaCEP;
    function Logradouro: string;
    function Bairro: string;
    function Estado: string;
    function Cidade: string;
    function Complemento: string;
  end;

type
  TConsultaCEP = class(TInterfacedObject, iConsultaCEP)
  private
    FLogradouro, FBairro, FEstado, FCidade, FComplemento: string;
  public
    function ConsultaCEP(CEP: string): iConsultaCEP;
    function Logradouro: string;
    function Bairro: string;
    function Estado: string;
    function Cidade: string;
    function Complemento: string;

    constructor Create;
    destructor Destroy; override;
    class function New: iConsultaCEP;
  end;

implementation

{ TConsultaCEP }

function TConsultaCEP.Bairro: string;
begin
  Result := FBairro;
end;

function TConsultaCEP.Cidade: string;
begin
  Result := FCidade;
end;

function TConsultaCEP.Estado: string;
begin
  Result := FEstado;
end;

function TConsultaCEP.Logradouro: string;
begin
  Result := FLogradouro;
end;

function TConsultaCEP.Complemento: string;
begin
  Result := FComplemento;
end;

function TConsultaCEP.ConsultaCEP(CEP: string): iConsultaCEP;
var
  Client: THttpClient;
  Response: IHTTPResponse;
  JSON: string;
  JSONValue: TJSONValue;
  JSONObject: TJSONObject;
begin
  Client := THttpClient.Create;
  try
    Response := Client.Get('https://viacep.com.br/ws/' + CEP + '/json/');
    JSON := Response.ContentAsString;
    JSONValue := TJSONObject.ParseJSONValue(JSON);
    JSONObject := JSONValue as TJSONObject;

    if not Assigned(JSONObject) then
    begin
      Exit;
    end;
    FLogradouro := JSONObject.GetValue('logradouro').Value;
    FComplemento := JSONObject.GetValue('complemento').Value;
    FBairro := JSONObject.GetValue('bairro').Value;
    FCidade := JSONObject.GetValue('localidade').Value;
    FEstado := JSONObject.GetValue('uf').Value;
  finally
    FreeAndNil(Client);
    FreeAndNil(JSONObject);
  end;
end;

constructor TConsultaCEP.Create;
begin

end;

destructor TConsultaCEP.Destroy;
begin

  inherited;
end;

class function TConsultaCEP.New: iConsultaCEP;
begin
  Result := self.Create;
end;

end.

