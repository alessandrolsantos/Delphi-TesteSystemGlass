object frmMenu: TfrmMenu
  Left = 609
  Top = 293
  Width = 773
  Height = 463
  Caption = 'frmMenu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 368
    Top = 200
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Cliente1: TMenuItem
        Caption = 'Cliente'
        OnClick = Cliente1Click
      end
      object UnidadeMedida1: TMenuItem
        Caption = 'UnidadeMedida'
        OnClick = UnidadeMedida1Click
      end
      object Produto1: TMenuItem
        Caption = 'Produto'
        OnClick = Produto1Click
      end
    end
    object Mdulos1: TMenuItem
      Caption = 'Opera'#231#245'es'
      object Vendas1: TMenuItem
        Caption = 'Vendas'
        OnClick = Vendas1Click
      end
    end
    object Relatorios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Rela1: TMenuItem
        Caption = 'Rela'#243'rio de Vendas'
        OnClick = Rela1Click
      end
    end
  end
end
