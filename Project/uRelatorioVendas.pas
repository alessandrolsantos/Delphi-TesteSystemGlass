unit uRelatorioVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, StdCtrls, ppCtrls, ppBands, ppPrnabl, ppCache, ppDesignLayer,
  ppParameter;

type
  TfrmRelatorioVendas = class(TForm)
    dtIni: TDateTimePicker;
    dtFim: TDateTimePicker;
    ppReport: TppReport;
    ppDBPipeline: TppDBPipeline;
    dsListaVendas: TDataSource;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    btnImprimir: TButton;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine1: TppLine;
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioVendas: TfrmRelatorioVendas;

implementation

uses uDMPrincipal;

{$R *.dfm}

procedure TfrmRelatorioVendas.btnImprimirClick(Sender: TObject);
begin
  dmPrincipal.spListaVendas.Close;
  dmPrincipal.spListaVendas.Parameters.ParamByName('@DataIni').Value := dtIni.DateTime;
  dmPrincipal.spListaVendas.Parameters.ParamByName('@DataFim').Value := dtFim.DateTime + StrToTime('23:59');
  dmPrincipal.spListaVendas.Parameters.ParamByName('@codigoVenda').Value := null;
  dmPrincipal.spListaVendas.Open;

  ppReport.Print;
end;

end.
