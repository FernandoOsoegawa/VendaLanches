object FrmCliente: TFrmCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Venda de Lanches'
  ClientHeight = 202
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnCadastroIngredientes: TButton
    Left = 49
    Top = 36
    Width = 145
    Height = 57
    Caption = 'Cadastro de Ingredientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    WordWrap = True
    OnClick = btnCadastroIngredientesClick
  end
  object btnCadastroLanches: TButton
    Left = 210
    Top = 36
    Width = 145
    Height = 57
    Caption = 'Cadastro de Lanches'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    WordWrap = True
    OnClick = btnCadastroLanchesClick
  end
  object btnCadastroPedidos: TButton
    Left = 210
    Top = 108
    Width = 145
    Height = 57
    Caption = 'Cadastro de Pedidos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnCadastroPedidosClick
  end
  object btnConsultaCardapio: TButton
    Left = 49
    Top = 108
    Width = 145
    Height = 57
    Caption = 'Consulta Card'#225'pio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    WordWrap = True
    OnClick = btnConsultaCardapioClick
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 192
    Top = 80
  end
end
