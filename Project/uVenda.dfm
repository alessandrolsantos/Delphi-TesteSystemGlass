object frmVendas: TfrmVendas
  Left = 775
  Top = 192
  Width = 891
  Height = 657
  Caption = 'Vendas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pcVendas: TPageControl
    Left = 16
    Top = 16
    Width = 849
    Height = 593
    ActivePage = tsVenda
    TabOrder = 0
    OnChange = pcVendasChange
    object tsLista: TTabSheet
      Caption = 'Lista'
      object DBGrid2: TDBGrid
        Left = 24
        Top = 24
        Width = 801
        Height = 489
        DataSource = dsListaVendas
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object btnEstornar: TButton
        Left = 720
        Top = 520
        Width = 104
        Height = 36
        Caption = 'Estornar Venda'
        TabOrder = 1
        OnClick = btnEstornarClick
      end
    end
    object tsVenda: TTabSheet
      Caption = 'Vendas'
      ImageIndex = 1
      object Label1: TLabel
        Left = 32
        Top = 64
        Width = 32
        Height = 13
        Caption = 'Cliente'
      end
      object Label2: TLabel
        Left = 32
        Top = 112
        Width = 37
        Height = 13
        Caption = 'Produto'
      end
      object DBGrid1: TDBGrid
        Left = 80
        Top = 168
        Width = 585
        Height = 353
        DataSource = dsVendas
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object btnAdicionar: TButton
        Left = 704
        Top = 168
        Width = 121
        Height = 25
        Caption = 'Adicionar'
        Default = True
        TabOrder = 1
        OnClick = btnAdicionarClick
      end
      object btnFinalizar: TButton
        Left = 688
        Top = 504
        Width = 121
        Height = 25
        Caption = 'Finalizar Venda'
        TabOrder = 2
        OnClick = btnFinalizarClick
      end
      object cbClientes: TDBLookupComboBox
        Left = 88
        Top = 64
        Width = 577
        Height = 21
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dsClientes
        TabOrder = 3
      end
      object cbProdutos: TDBLookupComboBox
        Left = 88
        Top = 104
        Width = 313
        Height = 21
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = dsProdutos
        TabOrder = 4
      end
      object edtQuantidade: TEdit
        Left = 544
        Top = 104
        Width = 121
        Height = 21
        TabOrder = 5
        OnKeyPress = edtQuantidadeKeyPress
      end
      object btnNovaVenda: TButton
        Left = 88
        Top = 8
        Width = 121
        Height = 25
        Caption = 'Nova Venda'
        Default = True
        TabOrder = 6
        OnClick = btnNovaVendaClick
      end
    end
  end
  object dsClientes: TDataSource
    DataSet = dmPrincipal.qryProduto
    Left = 40
    Top = 160
  end
  object dsProdutos: TDataSource
    DataSet = dmPrincipal.qryProduto
    Left = 40
    Top = 232
  end
  object dsVendas: TDataSource
    DataSet = cdsVendas
    Left = 40
    Top = 304
  end
  object cdsVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 32
    Top = 456
    object cdsVendasCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
      Visible = False
    end
    object cdsVendasCodigoProduto: TIntegerField
      FieldName = 'CodigoProduto'
    end
    object cdsVendasProduto: TStringField
      FieldName = 'Produto'
    end
    object cdsVendasQuantidade: TIntegerField
      FieldName = 'Quantidade'
    end
    object cdsVendasValor: TCurrencyField
      FieldName = 'Valor'
    end
  end
  object dsListaVendas: TDataSource
    DataSet = dmPrincipal.qryVendas
    OnDataChange = dsListaVendasDataChange
    Left = 48
    Top = 376
  end
end
