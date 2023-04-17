program CadastroCliente;

uses
  Vcl.Forms,
  View.Cliente in 'View\View.Cliente.pas' {frmCliente},
  Model.Email in 'Model\Model.Email.pas',
  Model.Arquivo.XML in 'Model\Model.Arquivo.XML.pas',
  Assistant.Consulta.CEP in 'Assistant\Assistant.Consulta.CEP.pas',
  Controller.Cliente in 'Controller\Controller.Cliente.pas',
  Assistant.Funcoes in 'Assistant\Assistant.Funcoes.pas';

{$R *.res}

begin
  Application.Initialize;
  //ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCliente, frmCliente);
  Application.Run;
end.
