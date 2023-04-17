unit View.Cliente;

interface

uses
  System.SysUtils, System.Variants,
  System.Classes, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBGrids, Assistant.Consulta.CEP,
  Controller.Cliente, Vcl.Menus, Assistant.Funcoes, Vcl.Grids, Vcl.Mask;

type
  TfrmCliente = class(TForm)
    PageControl1: TPageControl;
    tsConsulta: TTabSheet;
    tsCadastro: TTabSheet;
    cdsCliente: TClientDataSet;
    dsCliente: TDataSource;
    cdsClientecpf: TStringField;
    cdsClienteidentidade: TStringField;
    cdsClientetelefone: TStringField;
    cdsClienteemail: TStringField;
    cdsClientecep: TStringField;
    cdsClientelogradouro: TStringField;
    cdsClientenumero: TIntegerField;
    cdsClientecomplemento: TStringField;
    cdsClientebairro: TStringField;
    cdsClientecidade: TStringField;
    cdsClienteestado: TStringField;
    cdsClientepais: TStringField;
    GroupBox1: TGroupBox;
    cdsClientenome: TStringField;
    Label1: TLabel;
    cdsClienteid: TIntegerField;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    pnlButtons: TPanel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    btnAdicionar: TSpeedButton;
    SpeedButton2: TSpeedButton;
    btnEditar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnExcluir: TSpeedButton;
    Panel1: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    txtNomeConsulta: TEdit;
    txtCPFConsulta: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    txtEstadoConsulta: TEdit;
    btnConsultar: TSpeedButton;
    DBGrid1: TDBGrid;
    tsConfiguracaoEmail: TTabSheet;
    GroupBox4: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mConfiguracao: TMenuItem;
    btnSalvarConfiguracaoEmail: TSpeedButton;
    btnCancelarConfiguracaoEmail: TSpeedButton;
    cdsEmail: TClientDataSet;
    dsEmail: TDataSource;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    cdsEmailemail: TStringField;
    cdsEmailpassword: TStringField;
    cdsEmailsmtp: TStringField;
    cdsEmailporta: TIntegerField;
    cdsEmailtls: TBooleanField;
    DBCheckBox2: TDBCheckBox;
    cdsEmailssl: TBooleanField;
    procedure dsClienteStateChange(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure mConfiguracaoClick(Sender: TObject);
    procedure tsConfiguracaoEmailShow(Sender: TObject);
    procedure btnCancelarConfiguracaoEmailClick(Sender: TObject);
    procedure btnSalvarConfiguracaoEmailClick(Sender: TObject);
    procedure cdsEmailAfterInsert(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
    FClienteController: iClienteController;
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

{$R *.dfm}

procedure TfrmCliente.btnAdicionarClick(Sender: TObject);
begin
  cdsCliente.Insert;
end;

procedure TfrmCliente.btnCancelarClick(Sender: TObject);
begin
  cdsCliente.Cancel;
end;

procedure TfrmCliente.btnEditarClick(Sender: TObject);
begin
  if cdsClientE.IsEmpty then
  begin
    MessageDlg('Nenhum registro encontrado para ser editado.', mtInformation, [mbOK], 0);
    exit
  end;
  cdsCliente.Edit;
end;

procedure TfrmCliente.btnExcluirClick(Sender: TObject);
begin
  cdsCliente.Delete;
end;

procedure TfrmCliente.btnSalvarClick(Sender: TObject);
begin
  if not (cdsCliente.State in [dsInsert, dsEdit]) then
    exit;

  cdsCliente.Post;

  if not FClienteController.ValidaEnvioEmail(cdsCliente.FieldByName('email').AsString, cdsEmail) then
    Exit;
  FClienteController.CriarXMLCadastroCliente(cdsCliente);
  FClienteController.CarregaConfiguracaoEmail(cdsEmail);
  FClienteController.EnviarCadastroViaXML(cdsCliente);
end;

procedure TfrmCliente.cdsEmailAfterInsert(DataSet: TDataSet);
begin
  cdsEmail.FieldByName('tls').AsBoolean := false;
  cdsEmail.FieldByName('ssl').AsBoolean := false;
end;

procedure TfrmCliente.mConfiguracaoClick(Sender: TObject);
begin
  tsConfiguracaoEmail.TabVisible := True;
  PageControl1.ActivePage := tsConfiguracaoEmail;
  tsConfiguracaoEmail.Visible := True;
  if cdsEmail.IsEmpty then
    cdsEmail.Insert
  else
    cdsEmail.Edit;
end;

procedure TfrmCliente.DBEdit7Exit(Sender: TObject);
var
  consulta: iConsultaCEP;
begin
  consulta := TConsultaCEP.New;

  consulta.ConsultaCEP(cdsCliente.FieldByName('cep').AsString);
  cdsCliente.FieldByName('estado').AsString := consulta.Estado;
  cdsCliente.FieldByName('cidade').AsString := consulta.Cidade;
  cdsCliente.FieldByName('bairro').AsString := consulta.Bairro;
  cdsCliente.FieldByName('logradouro').AsString := consulta.Logradouro;
  cdsCliente.FieldByName('logradouro').AsString := consulta.Complemento;
end;

procedure TfrmCliente.dsClienteStateChange(Sender: TObject);
begin
  btnAdicionar.Visible := not (dsCliente.State in [dsInsert, dsEdit]);
  btnEditar.Visible := not (dsCliente.State in [dsInsert, dsEdit]);
  btnCancelar.Visible := dsCliente.State in [dsInsert, dsEdit];
  btnSalvar.Visible := dsCliente.State in [dsInsert, dsEdit];

  tsConsulta.TabVisible := not (dsCliente.State in [dsInsert, dsEdit]);
  tsConsulta.Visible := tsConsulta.TabVisible;
  tsCadastro.TabVisible := (dsCliente.State in [dsInsert, dsEdit]);
  tsCadastro.Visible := tsCadastro.TabVisible;
  mConfiguracao.Enabled := not (dsCliente.State in [dsInsert, dsEdit]);
end;

procedure TfrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Self := nil;
end;

procedure TfrmCliente.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  cdsCliente.CreateDataSet;
  cdsEmail.CreateDataSet;
  cdsEmail.Open;
  cdsCliente.Open;
  FClienteController := TClienteController.New;
end;

procedure TfrmCliente.btnSalvarConfiguracaoEmailClick(Sender: TObject);
begin
  cdsEmail.Post;
  tsConfiguracaoEmail.TabVisible := false;
  tsConsulta.TabVisible := True;
  pnlButtons.visible := True;
end;

procedure TfrmCliente.btnCancelarConfiguracaoEmailClick(Sender: TObject);
begin
  cdsEmail.Cancel;
  tsConfiguracaoEmail.TabVisible := false;
  tsConsulta.TabVisible := True;
  pnlButtons.visible := True;
end;

procedure TfrmCliente.btnConsultarClick(Sender: TObject);
var
  funcoes: iFuncoes;
begin
  funcoes := TFuncoes.New;
  cdsCliente.Filter := EmptyStr;
  cdsCliente.Filtered := false;
  if Trim(txtNomeConsulta.Text) <> EmptyStr then
    cdsCliente.Filter := cdsCliente.Filter + '  nome LIKE ' + QuotedStr('%' + txtNomeConsulta.Text + '%');
  if Trim(txtEstadoConsulta.Text) <> EmptyStr then
    cdsCliente.Filter := cdsCliente.Filter + funcoes.iif(cdsCliente.Filter = EmptyStr, ' and ', '') + '  estado = ' + QuotedStr(txtEstadoConsulta.Text);
  if Trim(txtCPFConsulta.Text) <> EmptyStr then
    cdsCliente.Filter := cdsCliente.Filter + funcoes.iif(cdsCliente.Filter = EmptyStr, ' and ', '') + '  cpf = ' + QuotedStr(txtCPFConsulta.Text);
  cdsCliente.Filtered := True;
end;

procedure TfrmCliente.tsConfiguracaoEmailShow(Sender: TObject);
begin
  tsConsulta.TabVisible := false;
  tsCadastro.TabVisible := false;
  pnlButtons.visible := false;
end;

end.

