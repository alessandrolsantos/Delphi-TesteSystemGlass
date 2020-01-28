program SystemGlass;

uses
  Forms,
  uUnidadeMedia in 'uUnidadeMedia.pas' {frmUnidadeMedida},
  uDMPrincipal in 'uDMPrincipal.pas' {dmPrincipal: TDataModule},
  uMenu in 'uMenu.pas' {frmMenu},
  uClientes in 'uClientes.pas' {frmClientes},
  uProduto in 'uProduto.pas' {frmProduto},
  uVenda in 'uVenda.pas' {frmVendas},
  uRelatorioVendas in 'uRelatorioVendas.pas' {frmRelatorioVendas};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmRelatorioVendas, frmRelatorioVendas);
  Application.Run;
end.
