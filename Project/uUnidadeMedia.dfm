object frmUnidadeMedida: TfrmUnidadeMedida
  Left = 450
  Top = 205
  Width = 654
  Height = 394
  Caption = 'Cadastro de Unidaded de Medida'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 24
    Top = 80
    Width = 593
    Height = 241
    DataSource = dsUnidadeMedida
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 24
    Top = 48
    Width = 590
    Height = 25
    DataSource = dsUnidadeMedida
    TabOrder = 1
  end
  object dsUnidadeMedida: TDataSource
    DataSet = dmPrincipal.qryUnidadeMedida
    Left = 96
    Top = 296
  end
end
