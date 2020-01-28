object frmRelatorioVendas: TfrmRelatorioVendas
  Left = 737
  Top = 386
  Caption = 'frmRelatorioVendas'
  ClientHeight = 216
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dtIni: TDateTimePicker
    Left = 56
    Top = 32
    Width = 186
    Height = 21
    Date = 43317.806100104160000000
    Time = 43317.806100104160000000
    TabOrder = 0
  end
  object dtFim: TDateTimePicker
    Left = 304
    Top = 32
    Width = 186
    Height = 21
    Date = 43317.806100104160000000
    Time = 43317.806100104160000000
    TabOrder = 1
  end
  object btnImprimir: TButton
    Left = 240
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 2
    OnClick = btnImprimirClick
  end
  object dsListaVendas: TDataSource
    DataSet = dmPrincipal.spListaVendas
    Left = 104
    Top = 200
  end
end
