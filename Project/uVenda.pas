unit uVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, Grids, DBGrids, DBCtrls, Provider,
  ComCtrls;

type
  pItensVenda = ^TItensVenda;

  TItensVenda = Record
    codigoVenda : Integer;
    codigoProduto : Integer;
    quantidade : Integer;
  end;


type
  TfrmVendas = class(TForm)
    pcVendas: TPageControl;
    tsLista: TTabSheet;
    tsVenda: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    dsClientes: TDataSource;
    dsProdutos: TDataSource;
    dsVendas: TDataSource;
    btnAdicionar: TButton;
    btnFinalizar: TButton;
    cbClientes: TDBLookupComboBox;
    cbProdutos: TDBLookupComboBox;
    edtQuantidade: TEdit;
    cdsVendas: TClientDataSet;
    cdsVendasCodigoCliente: TIntegerField;
    cdsVendasCodigoProduto: TIntegerField;
    cdsVendasProduto: TStringField;
    cdsVendasQuantidade: TIntegerField;
    cdsVendasValor: TCurrencyField;
    DBGrid2: TDBGrid;
    dsListaVendas: TDataSource;
    btnEstornar: TButton;
    btnNovaVenda: TButton;
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Finalizar;
    function ValidarCampos : Boolean;
    procedure AdicionarItem(CodigoCliente, CodigoProduto, Quantidade : Integer ; Preco : Currency ; Produto : String);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure btnEstornarClick(Sender: TObject);
    procedure dsListaVendasDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure btnNovaVendaClick(Sender: TObject);
    procedure pcVendasChange(Sender: TObject);
  private
    { Private declarations }
    ValorTotal : Currency;
    ptrItensVenda : pItensVenda;
    dataVenda : TDatetime;
    ListaItens : TList;
    pQuantidade : ^integer;
    Quantidade : Integer;
    
  public
    { Public declarations }
  end;

var
  frmVendas: TfrmVendas;

implementation

uses uDMPrincipal;

{$R *.dfm}

procedure TfrmVendas.btnAdicionarClick(Sender: TObject);
begin
  if ValidarCampos then
  begin
    AdicionarItem(cbClientes.KeyValue
                  , cbProdutos.KeyValue
                  , StrToInt(edtQuantidade.Text)
                  , dsProdutos.DataSet.FieldByName('Preco').AsCurrency * StrToInt(edtQuantidade.Text)
                  , dsProdutos.DataSet.FieldByName('Descricao').AsString);

    ValorTotal := ValorTotal + cdsVendasValor.AsCurrency;
  end;
end;

procedure TfrmVendas.btnFinalizarClick(Sender: TObject);
begin
  dmPrincipal.qryVendas.Open;
  dmPrincipal.qryVendas.Insert;
  dmPrincipal.qryVendasCodigo_Cliente.AsInteger := cbClientes.KeyValue;
  dmPrincipal.qryVendasDataVenda.AsDateTime := Now;
  dataVenda := dmPrincipal.qryVendasDataVenda.AsDateTime;
  dmPrincipal.qryVendasValor.AsCurrency := ValorTotal;
  dmPrincipal.qryVendas.Post;

  dmPrincipal.qryVendas.Open;
  dmPrincipal.qryVendas.Locate('dataVenda', dataVenda, []);

  dmPrincipal.qryItensVendas.Open;
  cdsVendas.First;

  while not cdsVendas.Eof do
  begin
    dmPrincipal.qryItensVendas.Insert;
    dmPrincipal.qryItensVendasCodigo_Venda.AsInteger := dmPrincipal.qryVendasCodigo.AsInteger;
    dmPrincipal.qryItensVendasCodigo_Produto.AsInteger := cdsVendasCodigoProduto.AsInteger;
    dmPrincipal.qryItensVendasQuantidade.AsInteger := cdsVendasQuantidade.AsInteger;
    dmPrincipal.qryItensVendasValor.AsCurrency := cdsVendasValor.AsCurrency;
    dmPrincipal.qryItensVendas.Post;
    cdsVendas.Next;
  end;

  Finalizar;
end;

procedure TfrmVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmVendas := nil;
end;

procedure TfrmVendas.Finalizar;
begin
  cbClientes.KeyValue := 0;
  cbProdutos.KeyValue := 0;
  edtQuantidade.Text := EmptyStr;

  ValorTotal := 0;

  cdsVendas.EmptyDataSet;
  dsListaVendas.DataSet.Refresh;
end;

procedure TfrmVendas.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',  #8]) then
   Key := #0;
end;

function TfrmVendas.ValidarCampos: Boolean;
begin
  if (cbClientes.KeyValue = 0) or (cbClientes.KeyValue = null) then
  begin
    ShowMessage('Selecione um cliente.');
    cbClientes.SetFocus;
    Result := False;
    Exit;
  end else
  if (cbProdutos.KeyValue = 0) or (cbProdutos.KeyValue = null) then
  begin
    ShowMessage('Selecione um produto.');
    cbProdutos.SetFocus;
    Result := False;
    Exit;
  end else
  if Trim(edtQuantidade.Text) = EmptyStr then
  begin
    ShowMessage('Informar quantidade.');
    edtQuantidade.SetFocus;
    Result := False;
    Exit;
  end;

end;

procedure TfrmVendas.btnEstornarClick(Sender: TObject);
var
  i : Integer;
begin

  if MessageDlg('Tem certeza que deseja estornar essa venda?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmPrincipal.spListaVendas.First;
    new(ptrItensVenda);
    dmPrincipal.qryProduto.Close;
    dmPrincipal.qryProduto.Open;

    while not dmPrincipal.spListaVendas.Eof do
    begin

      Quantidade := dmPrincipal.spListaVendasQuantidade.AsInteger;

      ptrItensVenda^.codigoVenda := dmPrincipal.spListaVendasCodigo.AsInteger;
      ptrItensVenda^.codigoProduto := dmPrincipal.spListaVendasCodigo_Produto.AsInteger;
      ptrItensVenda^.quantidade := dmPrincipal.spListaVendasQuantidade.AsInteger;

      ListaItens.Add(ptrItensVenda);

      dmPrincipal.spListaVendas.Next;
    end;

    for i := (ListaItens.Count - 1) Downto 0 do
    begin
      ptrItensVenda := ListaItens.Items[i];
      if dmPrincipal.qryProduto.Locate('Codigo', ptrItensVenda^.codigoProduto, []) then
      begin
        pQuantidade := @Quantidade;

        pQuantidade^ := pQuantidade^ + dmPrincipal.qryProdutoEstoque.AsInteger;

        dmPrincipal.qryProduto.Open;
        dmPrincipal.qryProduto.Edit;
        dmPrincipal.qryProdutoEstoque.AsInteger := Quantidade;
        dmPrincipal.qryProduto.Post;
      end;
    end;

    dmPrincipal.qryVendas.Open;
    
    if dmPrincipal.qryVendas.Locate('codigo', ptrItensVenda^.codigoVenda , []) then
      dmPrincipal.qryVendas.Delete;
  end;



end;

procedure TfrmVendas.dsListaVendasDataChange(Sender: TObject; Field: TField);
begin
  if Assigned(frmVendas) and (pcVendas.ActivePage  = tsLista) then
  begin
    with dmPrincipal.spListaVendas do
    begin
      Close;
      Parameters.ParamByName('@CodigoVenda').Value := dsListaVendas.DataSet.FieldByName('Codigo').AsInteger;
      Open;

      cdsVendas.EmptyDataSet;

      while not Eof do
      begin
        AdicionarItem(FieldByName('Codigo_Cliente').AsInteger
                 , FieldByName('Codigo_Produto').AsInteger
                 , FieldByName('Quantidade').AsInteger
                 , FieldByName('valor').AsCurrency
                 , FieldByName('Produto').AsString);
        Next;
      end;

      cbClientes.KeyValue := FieldByName('Codigo_Cliente').AsInteger;
      cbProdutos.KeyValue := FieldByName('Codigo_Produto').AsInteger
    end;
  end;
end;

procedure TfrmVendas.AdicionarItem(CodigoCliente, CodigoProduto, Quantidade: Integer; Preco: Currency; Produto: String);
begin
  cdsVendas.Edit;
  cdsVendas.Insert;
  cdsVendasCodigoCliente.AsInteger := CodigoCliente;
  cdsVendasCodigoProduto.AsInteger := CodigoProduto;
  cdsVendasQuantidade.AsInteger := Quantidade;
  cdsVendasValor.AsCurrency := Preco;
  cdsVendasProduto.AsString := Produto;
  cdsVendas.Post;
end;

procedure TfrmVendas.FormCreate(Sender: TObject);
begin
  dsClientes.DataSet := dmPrincipal.qryClientes;
  dsClientes.DataSet.Open;

  dsProdutos.DataSet := dmPrincipal.qryProduto;
  dsProdutos.DataSet.Open;

  dsListaVendas.DataSet := dmPrincipal.qryVendas;
  dsListaVendas.DataSet.Open;

  cdsVendas.CreateDataSet;
  cdsVendas.Open;

  ListaItens := TList.Create();
  ValorTotal := 0;
end;

procedure TfrmVendas.btnNovaVendaClick(Sender: TObject);
begin
  Finalizar;
end;

procedure TfrmVendas.pcVendasChange(Sender: TObject);
begin
  dsListaVendas.DataSet.Refresh;
end;

end.
