object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Left = 660
  Top = 356
  Height = 482
  Width = 486
  object ADOConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=dbTeste;Data Source=DESKTOP-337GCLT'
    DefaultDatabase = 'dbTeste'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 40
  end
  object qryClientes: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Cliente'
    Parameters = <>
    Left = 128
    Top = 40
    object qryClientesCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryClientesDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object qryUnidadeMedida: TADODataSet
    Active = True
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from UnidadeMedida'
    Parameters = <>
    Left = 48
    Top = 120
    object AutoIncField1: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object qryProduto: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 
      #13#10'SELECT p.Codigo'#13#10'      ,p.Descricao'#13#10'      ,p.Codigo_UnidadeMe' +
      'dida'#13#10'      ,um.Descricao as UnidadeMedida'#13#10'      ,p.Preco'#13#10'    ' +
      '  ,p.Estoque'#13#10'  FROM dbo.Produto p'#13#10'inner join '#13#10#9'dbo.UnidadeMed' +
      'ida um on um.codigo = p.Codigo_UnidadeMedida'
    Parameters = <>
    Left = 152
    Top = 136
    object qryProdutoCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryProdutoDescricao: TWideStringField
      FieldName = 'Descricao'
      FixedChar = True
      Size = 10
    end
    object qryProdutoUnidadeMedida: TStringField
      FieldName = 'UnidadeMedida'
      Size = 50
    end
    object qryProdutoCodigo_UnidadeMedida: TIntegerField
      FieldName = 'Codigo_UnidadeMedida'
      LookupDataSet = qryUnidadeMedida
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      LookupCache = True
      Visible = False
    end
    object qryProdutoPreco: TBCDField
      FieldName = 'Preco'
      Precision = 18
      Size = 2
    end
    object qryProdutoEstoque: TIntegerField
      FieldName = 'Estoque'
    end
  end
  object qryVendas: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Venda'
    Parameters = <>
    Left = 56
    Top = 224
    object qryVendasCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryVendasCodigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
    object qryVendasValor: TBCDField
      FieldName = 'Valor'
      Precision = 18
      Size = 2
    end
    object qryVendasDataVenda: TDateTimeField
      FieldName = 'DataVenda'
    end
  end
  object qryItensVendas: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from ItensVendas'
    IndexFieldNames = 'Codigo_Venda'
    Parameters = <>
    Left = 272
    Top = 224
    object qryItensVendasCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryItensVendasCodigo_Venda: TIntegerField
      FieldName = 'Codigo_Venda'
    end
    object qryItensVendasCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object qryItensVendasQuantidade: TIntegerField
      FieldName = 'Quantidade'
    end
    object qryItensVendasValor: TBCDField
      FieldName = 'Valor'
      Precision = 18
      Size = 2
    end
  end
  object spListaVendas: TADOStoredProc
    Active = True
    Connection = ADOConnection
    CursorType = ctStatic
    ProcedureName = 'ListaVendas;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@DataIni'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@DataFim'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 0d
      end
      item
        Name = '@CodigoVenda'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 152
    Top = 224
    object spListaVendasCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object spListaVendasDataVenda: TDateTimeField
      FieldName = 'DataVenda'
    end
    object spListaVendasCodigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
    object spListaVendasCliente: TStringField
      FieldName = 'Cliente'
      Size = 50
    end
    object spListaVendasProduto: TWideStringField
      FieldName = 'Produto'
      FixedChar = True
      Size = 10
    end
    object spListaVendasPreco: TBCDField
      FieldName = 'Preco'
      Precision = 18
      Size = 2
    end
    object spListaVendasCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object spListaVendasQuantidade: TIntegerField
      FieldName = 'Quantidade'
    end
    object spListaVendasvalor: TBCDField
      FieldName = 'valor'
      Precision = 18
      Size = 2
    end
    object spListaVendasValor_Total: TBCDField
      FieldName = 'Valor_Total'
      Precision = 18
      Size = 2
    end
  end
end
