unit uDMPrincipal;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmPrincipal = class(TDataModule)
    ADOConnection: TADOConnection;
    qryClientes: TADODataSet;
    qryClientesCodigo: TAutoIncField;
    qryClientesDescricao: TStringField;
    qryUnidadeMedida: TADODataSet;
    AutoIncField1: TAutoIncField;
    StringField1: TStringField;
    qryProduto: TADODataSet;
    qryProdutoCodigo: TAutoIncField;
    qryProdutoDescricao: TWideStringField;
    qryProdutoCodigo_UnidadeMedida: TIntegerField;
    qryProdutoPreco: TBCDField;
    qryProdutoEstoque: TIntegerField;
    qryProdutoUnidadeMedida: TStringField;
    qryVendas: TADODataSet;
    qryVendasCodigo: TAutoIncField;
    qryVendasCodigo_Cliente: TIntegerField;
    qryVendasValor: TBCDField;
    qryVendasDataVenda: TDateTimeField;
    qryItensVendas: TADODataSet;
    qryItensVendasCodigo: TIntegerField;
    qryItensVendasCodigo_Venda: TIntegerField;
    qryItensVendasCodigo_Produto: TIntegerField;
    qryItensVendasQuantidade: TIntegerField;
    qryItensVendasValor: TBCDField;
    spListaVendas: TADOStoredProc;
    spListaVendasCodigo: TAutoIncField;
    spListaVendasDataVenda: TDateTimeField;
    spListaVendasCodigo_Cliente: TIntegerField;
    spListaVendasCliente: TStringField;
    spListaVendasProduto: TWideStringField;
    spListaVendasPreco: TBCDField;
    spListaVendasCodigo_Produto: TIntegerField;
    spListaVendasQuantidade: TIntegerField;
    spListaVendasvalor: TBCDField;
    spListaVendasValor_Total: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{$R *.dfm}

end.
