unit uClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, DB, StdCtrls;

type
  TfrmClientes = class(TForm)
    dsClientes: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    btnImportar: TButton;
    OpenDialog1: TOpenDialog;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

uses uDMPrincipal;

{$R *.dfm}

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  dsClientes.DataSet := dmPrincipal.qryClientes;
  dsClientes.DataSet.Open;
end;

procedure TfrmClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmClientes := nil;
end;

procedure TfrmClientes.btnImportarClick(Sender: TObject);
var
  i : Integer;
  arqquivo : TextFile;
  linha:array[1..5] of string;
   s : string;
begin
  if OpenDialog1.Execute then
    AssignFile(arqquivo, OpenDialog1.FileName);

  i:=1;
  Reset(arqquivo);
  dsClientes.DataSet.Open;
  while not eof(arqquivo) do
  begin
    Readln(arqquivo, linha[i]);
    if linha[i] <> EmptyStr then
    begin
      dsClientes.DataSet.Insert;
      dsClientes.DataSet.FieldByName('Descricao').AsString := (copy(linha[i], 0 , 100));
      dsClientes.DataSet.Post;
    end;
    inc(i);
  end;

  CloseFile(arqquivo);

  ShowMessage('Clientes importados!');

end;
end.
