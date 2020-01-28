object frmClientes: TfrmClientes
  Left = 432
  Top = 289
  Width = 674
  Height = 419
  Caption = 'Cadastro de Clientes'
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
    DataSource = dsClientes
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
    DataSource = dsClientes
    TabOrder = 1
  end
  object btnImportar: TButton
    Left = 512
    Top = 344
    Width = 97
    Height = 33
    Caption = 'Importar Clientes'
    TabOrder = 2
    OnClick = btnImportarClick
  end
  object dsClientes: TDataSource
    DataSet = dmPrincipal.qryClientes
    Left = 64
    Top = 344
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.txt'
    Filter = 'txt|*.txt'
    Left = 504
    Top = 168
  end
end
