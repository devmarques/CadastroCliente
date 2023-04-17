unit Model.Arquivo.XML;

interface

uses
  Xml.XMLDoc, Xml.XMLIntf, System.SysUtils;

type
  iArquivoXML = interface
    ['{06D96525-8A0E-4153-9149-FA5E3FDA48A4}']
    function CriaArquivo: iArquivoXML;
    function AdicionaElementoRaiz(Descricao: string): iArquivoXML;
    function AdicionaElemento(Descricao: string): iArquivoXML;
    function AdicionaAtributo(Descricao, Valor: string): iArquivoXML;
    function ArquivoXML: IXMLDocument;
  end;

type
  TArquivoXML = class(TInterfacedObject, iArquivoXML)
  private
    FArquivo: IXMLDocument;
    FElementoRaiz, FElemento, FAtributo: IXMLNode;
  public
    function CriaArquivo: iArquivoXML;
    function AdicionaElementoRaiz(Descricao: string): iArquivoXML;
    function AdicionaElemento(Descricao: string): iArquivoXML;
    function AdicionaAtributo(Descricao, Valor: string): iArquivoXML;
    function ArquivoXML: IXMLDocument;

    constructor Create;
    destructor Destroy; override;
    class function New: iArquivoXML;
  end;

implementation

{ TArquivoXML }

function TArquivoXML.AdicionaAtributo(Descricao, Valor: string): iArquivoXML;
begin
  result := self;
  FAtributo := FElemento.AddChild(Descricao);
  if Trim(Valor) <> EmptyStr then
    FAtributo.Text := Valor;
end;

function TArquivoXML.AdicionaElemento(Descricao: string): iArquivoXML;
begin
  result := self;
  FElemento := FElementoRaiz.AddChild(Descricao);
end;

function TArquivoXML.AdicionaElementoRaiz(Descricao: string): iArquivoXML;
begin
  result := self;
  FElementoRaiz := FArquivo.AddChild(Descricao);
end;

function TArquivoXML.ArquivoXML: IXMLDocument;
begin
  result := FArquivo;
end;

constructor TArquivoXML.Create;
begin

end;

function TArquivoXML.CriaArquivo: iArquivoXML;
begin
  result := self;
  FArquivo := TXMLDocument.Create(nil);
  FArquivo.Active := True;
  FArquivo.Encoding := 'UTF-8';
end;

destructor TArquivoXML.Destroy;
begin
  FreeAndNil(FArquivo);
  inherited;
end;

class function TArquivoXML.New: iArquivoXML;
begin
  Result := Self.Create;
end;

end.

