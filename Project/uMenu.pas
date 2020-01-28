unit uMenu;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, DBCtrls, Grids, DBGrids, Menus;

type
  TfrmMenu = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Cliente1: TMenuItem;
    UnidadeMedida1: TMenuItem;
    Mdulos1: TMenuItem;
    Produto1: TMenuItem;
    Vendas1: TMenuItem;
    Relatorios1: TMenuItem;
    Rela1: TMenuItem;
    procedure UnidadeMedida1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Rela1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

uses uDMPrincipal, uUnidadeMedia, uClientes, uProduto, uVenda,
  uRelatorioVendas;



{$R *.dfm}

procedure TfrmMenu.UnidadeMedida1Click(Sender: TObject);
begin

  if not assigned(frmUnidadeMedida) then
    frmUnidadeMedida := TfrmUnidadeMedida.Create(Self);

  frmUnidadeMedida.Show;
end;

procedure TfrmMenu.Cliente1Click(Sender: TObject);
begin

  if not assigned(frmClientes) then
    frmClientes := TfrmClientes.Create(Self);

  frmClientes.Show;
end;

procedure TfrmMenu.Produto1Click(Sender: TObject);
begin

  if not assigned(frmProduto) then
    frmProduto := TfrmProduto.Create(Self);

  frmProduto.Show;
end;

procedure TfrmMenu.Vendas1Click(Sender: TObject);
begin
  if not assigned(frmVendas) then
    frmVendas := TfrmVendas.Create(Self);

  frmVendas.Show;
end;

procedure TfrmMenu.Rela1Click(Sender: TObject);
begin
  if not assigned(frmRelatorioVendas) then
    frmRelatorioVendas := TfrmRelatorioVendas.Create(Self);

  frmRelatorioVendas.Show;
end;

end.
