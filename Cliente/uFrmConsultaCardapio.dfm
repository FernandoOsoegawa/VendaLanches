object frmConsultaCardapio: TfrmConsultaCardapio
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Consulta Card'#225'pio de Lanches'
  ClientHeight = 526
  ClientWidth = 699
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcCadastro: TPageControl
    Left = 0
    Top = 0
    Width = 699
    Height = 526
    ActivePage = tabConsulta
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 697
    object tabConsulta: TTabSheet
      Caption = 'Consulta'
      ExplicitWidth = 689
      object pnlOpcaoConsulta: TPanel
        Left = 0
        Top = 0
        Width = 691
        Height = 84
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 689
        object Label4: TLabel
          Left = 8
          Top = 18
          Width = 115
          Height = 14
          Caption = 'Op'#231#227'o de Consulta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblSelecionaRegistro: TLabel
          Left = 8
          Top = 65
          Width = 297
          Height = 14
          Caption = 'Duplo clique no registro para selecionar o lanche'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnSair: TButton
          Left = 523
          Top = 27
          Width = 121
          Height = 41
          Caption = 'Sair'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = btnSairClick
        end
        object btnConsultar: TButton
          Left = 394
          Top = 27
          Width = 121
          Height = 41
          Caption = 'Consultar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btnConsultarClick
        end
        object cmbOpcao: TComboBox
          Left = 8
          Top = 36
          Width = 154
          Height = 22
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 2
          ParentFont = False
          TabOrder = 0
          Text = 'Todos'
          OnClick = cmbOpcaoClick
          Items.Strings = (
            'C'#243'digo do Lanche'
            'Nome do Lanche'
            'Todos')
        end
        object edtCampo: TEdit
          Left = 168
          Top = 36
          Width = 214
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object grbLancheItem: TGroupBox
        Left = 0
        Top = 331
        Width = 691
        Height = 166
        Align = alBottom
        Caption = 'Itens do Lanche'
        TabOrder = 2
        ExplicitWidth = 689
        object dbgItem: TDBGrid
          Left = 2
          Top = 16
          Width = 687
          Height = 148
          Align = alClient
          DataSource = dtsItens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'LAN_ITEM'
              Title.Caption = 'ITEM'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ING_CODIGO'
              Title.Caption = 'C'#211'DIGO'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ING_NOME'
              Title.Caption = 'NOME DO INGREDIENTE'
              Width = 327
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LAN_QTDE'
              Title.Caption = 'QTDE.'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LAN_TOTAL'
              Title.Caption = 'TOTAL ITEM'
              Width = 85
              Visible = True
            end>
        end
      end
      object grbLanche: TGroupBox
        Left = 0
        Top = 84
        Width = 691
        Height = 247
        Align = alClient
        Caption = 'Lanches'
        TabOrder = 1
        ExplicitWidth = 689
        object dbgLanches: TDBGrid
          Left = 2
          Top = 16
          Width = 687
          Height = 229
          Align = alClient
          DataSource = dtsLanches
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          OnDblClick = dbgLanchesDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'LAN_CODIGO'
              Title.Caption = 'C'#211'DIGO'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LAN_NOME'
              Title.Caption = 'NOME DO LANCHE'
              Width = 302
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LAN_VALOR'
              Title.Caption = 'VALOR TOTAL'
              Width = 98
              Visible = True
            end>
        end
      end
    end
  end
  object dtsLanches: TDataSource
    DataSet = CM.cdsCardapioLanches
    Left = 548
    Top = 168
  end
  object dtsItens: TDataSource
    DataSet = CM.cdsCardapioLanchesItem
    Left = 548
    Top = 224
  end
end
