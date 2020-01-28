unit uUnidadeMedia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, DB, Grids, DBGrids, ADODB;

type
  TfrmUnidadeMedida = class(TForm)
    DBGrid1: TDBGrid;
    dsUnidadeMedida: TDataSource;
    DBNavigator1: TDBNavigator;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUnidadeMedida: TfrmUnidadeMedida;

implementation

uses uDMPrincipal;

{$R *.dfm}

procedure TfrmUnidadeMedida.FormShow(Sender: TObject);
begin
  dsUnidadeMedida.DataSet := dmPrincipal.qryUnidadeMedida;
  dsUnidadeMedida.DataSet.Open;
end;

procedure TfrmUnidadeMedida.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  Action := cafree;
  frmUnidadeMedida := Nil;
end;

end.
