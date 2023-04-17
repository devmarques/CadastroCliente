unit Model.Email;

interface

uses
  IdMessage, IdSMTP, IdExplicitTLSClientServerBase, IdSSLOpenSSL, IdAttachment,
  IdMessageParts, IdText, System.SysUtils, Vcl.Dialogs, System.Classes,
  IdAttachmentMemory;

type
  iEmail = interface
    ['{C5027FFF-F56F-4C8A-A484-FCC382384E31}']
    function enviaEmail(enderecoEmail, assuntoEmail, conteudoEmail: string): iEmail;
    function configuraEmail: iEmail;
    function CarregaAnexo(Arquivo: TMemoryStream): iEmail;
    function getHost: Variant;
    function getUsername: Variant;
    function getPassword: Variant;
    function getPort: Variant;
    function getUseSSL: Variant;

    function getUseTLS: Variant;
    function setHost(Value: string): iEmail;
    function setUsername(Value: string): iEmail;
    function setPassword(Value: string): iEmail;
    function setPort(Value: integer): iEmail;
    function setUseTLS(Value: Boolean): iEmail;
    function setUseSSL(Value: Boolean): iEmail;
  end;

type
  TEmail = class(TInterfacedObject, iEmail)
  private
    FSMTP: TIdSMTP;
    IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
    FTexto: TIdText;
    FMsg: TIdMessage;
    FAnexo: TIdAttachmentMemory;

    FHost, FUsername, FPassword: string;
    FPort: Integer;
    FUseTLS, FUseSSL: Boolean;
  public
    function getHost: Variant;
    function getUsername: Variant;
    function getPassword: Variant;
    function getPort: Variant;
    function getUseTLS: Variant;
    function getUseSSL: Variant;

    function setHost(Value: string): iEmail;
    function setUsername(Value: string): iEmail;
    function setPassword(Value: string): iEmail;
    function setPort(Value: integer): iEmail;
    function setUseTLS(Value: Boolean): iEmail;
    function setUseSSL(Value: Boolean): iEmail;

    function enviaEmail(enderecoEmail, assuntoEmail, conteudoEmail: string): iEmail;
    function configuraEmail: iEmail;
    function CarregaAnexo(Arquivo: TMemoryStream): iEmail;

    constructor Create;
    destructor Destroy; override;
    class function New : iEmail;
  end;

implementation

{ TEmail }

{ GET }

function TEmail.getHost: Variant;
begin
  Result := FHost;
end;

function TEmail.getPassword: Variant;
begin
  Result := FPassword;
end;

function TEmail.getPort: Variant;
begin
  Result := FPort;
end;

function TEmail.getUsername: Variant;
begin
  Result := FUsername;
end;

function TEmail.getUseSSL: Variant;
begin
  RESULT := FUseSSL;
end;

function TEmail.getUseTLS: Variant;
begin
  Result := FUseTLS;
end;

{ SET }

function TEmail.setHost(Value: string): iEmail;
begin
  FHost := Value;
end;

function TEmail.setPassword(Value: string): iEmail;
begin
  FPassword := Value;
end;

function TEmail.setPort(Value: integer): iEmail;
begin
  FPort := Value;
end;

function TEmail.setUsername(Value: string): iEmail;
begin
  FUsername := Value;
end;

function TEmail.setUseSSL(Value: Boolean): iEmail;
begin
  FUseSSL := Value;
end;

function TEmail.setUseTLS(Value: Boolean): iEmail;
begin
  FUseTLS := Value;
end;

constructor TEmail.Create;
begin

end;

class function TEmail.New: iEmail;
begin
  result := Self.Create;
end;

destructor TEmail.Destroy;
begin
  if Assigned(FSMTP) then
  begin
    FSMTP.Disconnect;
    FreeAndNil(FSMTP);
  end;

  if Assigned(FTexto) then
    FreeAndNil(FTexto);

  if Assigned(FMsg) then
    FreeAndNil(FMsg);

  if Assigned(IdSSLIOHandlerSocket) then
    FreeAndNil(IdSSLIOHandlerSocket);

  if Assigned(FAnexo) then
    FreeAndNil(FAnexo);
  inherited;
end;

function TEmail.configuraEmail: iEmail;
begin
  result := self;
  FSMTP := TIdSMTP.Create(nil);

  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  FSMTP.Host := FHost;
  FSMTP.Port := FPort;
  FSMTP.Username := FUsername;
  FSMTP.Password := FPassword;

  if FUseTLS or FUseSSL then
  begin
    IdSSLIOHandlerSocket.Destination := FSMTP.Host + ':' + IntToStr(FSMTP.Port);
    IdSSLIOHandlerSocket.Host := FSMTP.Host;

    //IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv3;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvTLSv1;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmUnassigned;

    FSMTP.IOHandler := IdSSLIOHandlerSocket;
  end;
  if FUseTLS then
  begin
    FSMTP.UseTLS := utUseExplicitTLS;
  end;

  FSMTP.AuthType := satDefault;
end;

function TEmail.CarregaAnexo(Arquivo: TMemoryStream): iEmail;
begin
  result := self;
  if not Assigned(FMsg) then
    FMsg := TIdMessage.Create(nil);
  FAnexo := TIdAttachmentMemory.Create(FMsg.MessageParts);
  FAnexo.FileName := 'Cadastro.xml';
  FAnexo.LoadFromStream(Arquivo);
end;

function TEmail.enviaEmail(enderecoEmail, assuntoEmail, conteudoEmail: string): iEmail;
begin
  result := self;
  if not Assigned(FMsg) then
    FMsg := TIdMessage.Create(nil);
  try
    FMsg.From.Text := FUsername;
    FMsg.Recipients.Add.Address := enderecoEmail;
    FMsg.Subject := assuntoEmail;

    FTexto := TIdText.Create(FMsg.MessageParts);
    FTexto.Body.Text := conteudoEmail;
    FTexto.ContentType := 'text/plain';

    FMsg.MessageParts.Add;
    FSMTP.Connect;
    FSMTP.Send(FMsg);
  except
    on e: Exception do
      messageDlg('Não foi possível concluir o envio de email.' + sLineBreak + 'Falha apresentada: ' + e.Message, mtError, [mbOk], 0);
  end;
end;

end.

