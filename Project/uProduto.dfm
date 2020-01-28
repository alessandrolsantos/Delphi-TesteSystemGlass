object frmProduto: TfrmProduto
  Left = 606
  Top = 278
  Width = 887
  Height = 491
  Caption = 'Cadastro de Produtos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 32
    Top = 8
    Width = 833
    Height = 401
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Lista'
      object DBNavigator1: TDBNavigator
        Left = 19
        Top = 16
        Width = 590
        Height = 25
        DataSource = dsProdutos
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 24
        Top = 56
        Width = 753
        Height = 289
        DataSource = dsProdutos
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object Label1: TLabel
        Left = 55
        Top = 32
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label2: TLabel
        Left = 25
        Top = 74
        Width = 78
        Height = 13
        Caption = 'Unidade Medida'
      end
      object Label3: TLabel
        Left = 75
        Top = 111
        Width = 28
        Height = 13
        Caption = 'Pre'#231'o'
      end
      object Label4: TLabel
        Left = 64
        Top = 144
        Width = 39
        Height = 13
        Caption = 'Estoque'
      end
      object DBEdit1: TDBEdit
        Left = 112
        Top = 32
        Width = 441
        Height = 21
        DataField = 'Descricao'
        DataSource = dsProdutos
        TabOrder = 0
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 112
        Top = 70
        Width = 441
        Height = 21
        DataField = 'Codigo_UnidadeMedida'
        DataSource = dsProdutos
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dsUnidadeMedida
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 112
        Top = 107
        Width = 121
        Height = 21
        DataField = 'Preco'
        DataSource = dsProdutos
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 112
        Top = 144
        Width = 121
        Height = 21
        DataField = 'Estoque'
        DataSource = dsProdutos
        TabOrder = 3
      end
    end
  end
  object dsProdutos: TDataSource
    DataSet = dmPrincipal.qryProduto
    Left = 64
    Top = 344
  end
  object dsUnidadeMedida: TDataSource
    DataSet = dmPrincipal.qryUnidadeMedida
    Left = 136
    Top = 352
  end
end
