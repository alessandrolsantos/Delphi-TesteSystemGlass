unit uProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Mask, ComCtrls;

type
  TfrmProduto = class(TForm)
    dsProdutos: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    dsUnidadeMedida: TDataSource;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProduto: TfrmProduto;
                             
implementation

uses uDMPrincipal;

{$R *.dfm}

procedure TfrmProduto.FormShow(Sender: TObject);
begin
  dsProdutos.DataSet := dmPrincipal.qryProduto;
  dsProdutos.DataSet.Open;
end;

procedure TfrmProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmProduto := nil;
end;

end.
