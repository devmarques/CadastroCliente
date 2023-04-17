unit Controller.Cliente;

interface

uses
  Model.Arquivo.XML, Model.Email, Data.DB, System.Classes, System.SysUtils;

type
  iClienteController = interface
    ['{974F56AE-F7AD-4608-8394-FDDC857D7FAE}']
    function EnviarCadastroViaXML(DataSet: TDataSet): iClienteController;
    function CriarXMLCadastroCliente(DataSet: TDataSet): iClienteController;
    function CarregaConfiguracaoEmail(DataSet: TDataSet): iClienteController;
    function ValidaEnvioEmail(Email: string; DataSet : TDataSet): Boolean;
    function ValidaCPF(CPF: string): Boolean;
  end;

type
  TClienteController = class(TInterfacedObject, iClienteController)
  private
    FArquivoXML: iArquivoXML;
    FEmail: iEmail;
  public
    function EnviarCadastroViaXML(DataSet: TDataSet): iClienteController;
    function CriarXMLCadastroCliente(DataSet: TDataSet): iClienteController;
    function CarregaConfiguracaoEmail(DataSet: TDataSet): iClienteController;
      function ValidaEnvioEmail(Email: string; DataSet : TDataSet): Boolean;
        function ValidaCPF(CPF: string): Boolean;

    constructor Create;
    destructor Destroy; override;
    class function New: iClienteController;
  end;

implementation

{ TClienteController }

function TClienteController.CarregaConfiguracaoEmail(
  DataSet: TDataSet): iClienteController;
begin
  if not Assigned(FEmail) then
    FEmail := TEmail.New;
  FEmail.setHost(DataSet.FieldByName('smtp').AsString);
  FEmail.setUsername(DataSet.FieldByName('email').AsString);
  FEmail.setPassword(DataSet.FieldByName('password').AsString);
  FEmail.setPort(DataSet.FieldByName('porta').AsInteger);
  FEmail.setUseTLS(DataSet.FieldByName('tls').AsBoolean);
  FEmail.setUseSSL(DataSet.FieldByName('ssl').AsBoolean)
end;

constructor TClienteController.Create;
begin

end;

destructor TClienteController.Destroy;
begin

  inherited;
end;


function TClienteController.CriarXMLCadastroCliente(DataSet: TDataSet): iClienteController;
var
  index: Integer;
begin
  if not Assigned(FArquivoXML) then
    FArquivoXML := TArquivoXML.New;
  FArquivoXML.CriaArquivo;
  FArquivoXML.AdicionaElementoRaiz('CadastroCliente');
  FArquivoXML.AdicionaElemento('Dados');
  for index := 0 to DataSet.FieldCount - 1 do
  begin
    FArquivoXML.AdicionaAtributo(DataSet.Fields[index].FieldName, DataSet.Fields[index].AsString);
  end;
end;


function TClienteController.EnviarCadastroViaXML(DataSet: TDataSet): iClienteController;
var
  Arquivo: TMemoryStream;
  conteudoEmail: string;
begin
  Arquivo := TMemoryStream.Create;
  try
    conteudoEmail := 'Cadastro criado com sucesso! Os seguintes dados foram cadastrados em nosso sistema:' + sLineBreak +
                     'Nome:         ' + DataSet.FieldByName('Nome').AsString                               + sLineBreak +
                     'Identidade:   ' + DataSet.FieldByName('Identidade').AsString                         + sLineBreak +
                     'CPF:          ' + DataSet.FieldByName('CPF').AsString                                + sLineBreak +
                     'Telefone:     ' + DataSet.FieldByName('Telefone').AsString                           + sLineBreak +
                     'Email:        ' + DataSet.FieldByName('Email').AsString                              + sLineBreak +
                     'Cep:          ' + DataSet.FieldByName('Cep').AsString                                + sLineBreak +
                     'Logradouro:   ' + DataSet.FieldByName('Logradouro').AsString                         + sLineBreak +
                     'Numero:       ' + DataSet.FieldByName('Numero').AsString                             + sLineBreak +
                     'Complemento:  ' + DataSet.FieldByName('Complemento').AsString                        + sLineBreak +
                     'Bairro:       ' + DataSet.FieldByName('Bairro').AsString                             + sLineBreak +
                     'Cidade:       ' + DataSet.FieldByName('Cidade').AsString                             + sLineBreak +
                     'Estado:       ' + DataSet.FieldByName('Estado').AsString                             + sLineBreak +
                     'Pais:         ' + DataSet.FieldByName('Pais').AsString                               + sLineBreak;


    FArquivoXML.ArquivoXML.SaveToStream(Arquivo);
    FEmail.configuraEmail;
    FEmail.CarregaAnexo(Arquivo);
    FEmail.enviaEmail(DataSet.FieldByName('email').AsString, 'Cadastro', conteudoEmail);
  finally
    FreeAndNil(Arquivo);
  end;
end;

class function TClienteController.New: iClienteController;
begin
  result := Self.Create;
end;

function TClienteController.ValidaCPF(CPF: string): Boolean;
var
  Index, digito, soma, resto, digitoVerificador: Integer;
begin
  Result := False;
  if Length(CPF) <> 11 then
    Exit;
  soma := 0;
  resto := 0;
  for Index := 1 to 9 do
    soma := soma + StrToInt(CPF[Index]) * (11 - Index);
  resto := soma mod 11;
  if (resto = 0) or (resto = 1) then
    digitoVerificador := 0
  else
    digitoVerificador := 11 - resto;
  if digitoVerificador <> StrToInt(CPF[10]) then
    Exit;
  soma := 0;
  for Index := 1 to 10 do
    soma := soma + StrToInt(CPF[Index]) * (12 - Index);
  resto := soma mod 11;
  if (resto = 0) or (resto = 1) then
    digitoVerificador := 0
  else
    digitoVerificador := 11 - resto;
  if digitoVerificador = StrToInt(CPF[11]) then
    Result := True;
end;


function TClienteController.ValidaEnvioEmail(Email: string; DataSet: TDataSet): Boolean;
begin
  result := Trim(Email) <> EmptyStr;
  result := not DataSet.IsEmpty;
end;

end.

