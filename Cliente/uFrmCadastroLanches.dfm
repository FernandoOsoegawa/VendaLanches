object frmCadastroLanches: TfrmCadastroLanches
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Lanches'
  ClientHeight = 514
  ClientWidth = 665
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
    Width = 665
    Height = 514
    ActivePage = tabConsulta
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnChange = pgcCadastroChange
    object tabConsulta: TTabSheet
      Caption = 'Consulta'
      object pnlOpcaoConsulta: TPanel
        Left = 0
        Top = 0
        Width = 657
        Height = 85
        Align = alTop
        TabOrder = 0
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
      object dbgLanches: TDBGrid
        Left = 0
        Top = 85
        Width = 657
        Height = 400
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
        TabOrder = 1
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
            Title.Caption = 'VALOR'
            Width = 85
            Visible = True
          end>
      end
    end
    object tabCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      OnShow = tabCadastroShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlEdit: TPanel
        Left = 0
        Top = 0
        Width = 657
        Height = 70
        Align = alTop
        TabOrder = 0
        object btnInserirLanche: TButton
          Left = 8
          Top = 17
          Width = 121
          Height = 41
          Caption = 'Inserir Lanche'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnInserirLancheClick
        end
        object btnEditarLanche: TButton
          Left = 137
          Top = 17
          Width = 121
          Height = 41
          Caption = 'Editar Lanche'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnEditarLancheClick
        end
        object btnDeletarLanche: TButton
          Left = 264
          Top = 17
          Width = 121
          Height = 41
          Caption = 'Deletar Lanche'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btnDeletarLancheClick
        end
        object btnSalvarLanche: TButton
          Left = 391
          Top = 17
          Width = 121
          Height = 41
          Caption = 'Salvar Lanche'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = btnSalvarLancheClick
        end
        object btnCancelarLanche: TButton
          Left = 518
          Top = 17
          Width = 121
          Height = 41
          Caption = 'Cancelar Lanche'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = btnCancelarLancheClick
        end
      end
      object grbLancheItem: TGroupBox
        Left = 0
        Top = 182
        Width = 657
        Height = 303
        Align = alClient
        Caption = 'Itens do Lanche'
        TabOrder = 1
        object dbgItem: TDBGrid
          Left = 2
          Top = 130
          Width = 653
          Height = 171
          Align = alClient
          DataSource = dtsItem
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
              FieldName = 'ITEM'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO'
              Title.Caption = 'C'#211'DIGO'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'NOME DO INGREDIENTE'
              Width = 327
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTDE'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL'
              Title.Caption = 'TOTAL ITEM'
              Width = 83
              Visible = True
            end>
        end
        object pnlItem: TPanel
          Left = 2
          Top = 64
          Width = 653
          Height = 66
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Label5: TLabel
            Left = 7
            Top = 12
            Width = 29
            Height = 14
            Caption = 'Item'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 70
            Top = 12
            Width = 139
            Height = 14
            Caption = 'C'#243'digo do Ingrediente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 218
            Top = 12
            Width = 130
            Height = 14
            Caption = 'Nome do Ingrediente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 480
            Top = 12
            Width = 71
            Height = 14
            Caption = 'Quantidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 560
            Top = 12
            Width = 64
            Height = 14
            Caption = 'Total Item'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtITEM: TDBEdit
            Left = 6
            Top = 29
            Width = 55
            Height = 22
            DataField = 'ITEM'
            DataSource = dtsItem
            TabOrder = 0
          end
          object edtCODIGO: TDBEdit
            Left = 69
            Top = 29
            Width = 76
            Height = 22
            DataField = 'CODIGO'
            DataSource = dtsItem
            TabOrder = 1
            OnExit = edtCODIGOExit
          end
          object edtNOME: TDBEdit
            Left = 217
            Top = 29
            Width = 252
            Height = 22
            DataField = 'NOME'
            DataSource = dtsItem
            TabOrder = 3
          end
          object edtQTDE: TDBEdit
            Left = 480
            Top = 29
            Width = 57
            Height = 22
            DataField = 'QTDE'
            DataSource = dtsItem
            TabOrder = 4
            OnExit = edtQTDEExit
          end
          object btnLocalizaIngrediente: TBitBtn
            Left = 148
            Top = 28
            Width = 30
            Height = 25
            Hint = 'Localizar Ingredientes'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FF660000FFFF00FF0000000000FF00FFFF00FFFF00FFFF00FFFF00FF
              000000000000000000000000000000000000660000FFFF00FF0000FF00000000
              00000000FF00FFFF00FFFF00FFFF00FF666666FF00FFFF00FFFF00FFFF00FF66
              0000FFFF00FF0000FF0000FF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FF
              666666FFFFFFFFFFFFFFFFFF660000FFFF00FF0000FF0000FF00FFFFFFFFFF00
              FF000000FF00FFFF00FFFF00FFFF00FF666666000000000000666666FF00FFFF
              0000FF0000FF00FFFFFFFFFFFFFFFF00FF000000FF00FFFF00FFFF00FF666666
              FF00FFFFFF00FF00FF000000666666666666FF00FFFFFFFFFFFFFFFFFFFFFF00
              FF000000FF00FFFF00FF666666FFFFFFFFFF00FF00FFFFFF00FF00FF000000FF
              00FFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF000000FF00FFFF00FF666666FFFF00
              FFFFFFFFFF00FF00FFFFFF00000000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF00
              FF000000FF00FFFF00FF666666FFFFFFFFFF00FFFFFFFFFF00FF00FF000000FF
              00FFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF000000FF00FFFF00FFFF00FF666666
              FFFFFFFFFF00FFFFFF000000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
              FF000000FF00FFFF00FFFF00FFFF00FF666666666666000000FF00FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF000000FF00FFFF00FFFF00FFFF00FF
              666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
              00000000FF00FFFF00FFFF00FFFF00FF666666FFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF00FFFFFFFF666666FF00FFFF00FFFF00FFFF00FFFF00FF
              666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF666666FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FF66666666666666666666666666666666
              6666666666666666666666FF00FFFF00FFFF00FFFF00FFFF00FF}
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = btnLocalizaIngredienteClick
          end
          object edtTOTAL: TDBEdit
            Left = 560
            Top = 29
            Width = 65
            Height = 22
            DataField = 'TOTAL'
            DataSource = dtsItem
            TabOrder = 5
          end
        end
        object pnlEditItem: TPanel
          Left = 2
          Top = 16
          Width = 653
          Height = 48
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object btnInserirItem: TButton
            Left = 13
            Top = 7
            Width = 97
            Height = 32
            Caption = 'Inserir Item'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = btnInserirItemClick
          end
          object btnEditarItem: TButton
            Left = 116
            Top = 7
            Width = 97
            Height = 32
            Caption = 'Editar Item'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = btnEditarItemClick
          end
          object btnDeletarItem: TButton
            Left = 219
            Top = 7
            Width = 97
            Height = 32
            Caption = 'Deletar Item'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = btnDeletarItemClick
          end
          object btnSalvarItem: TButton
            Left = 323
            Top = 7
            Width = 97
            Height = 32
            Caption = 'Salvar Item'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = btnSalvarItemClick
          end
          object btnCancelarItem: TButton
            Left = 426
            Top = 7
            Width = 97
            Height = 32
            Caption = 'Cancelar Item'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            OnClick = btnCancelarItemClick
          end
        end
      end
      object pnlDados: TPanel
        Left = 0
        Top = 70
        Width = 657
        Height = 112
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object Label1: TLabel
          Left = 9
          Top = 13
          Width = 110
          Height = 14
          Caption = 'C'#243'digo do Lanche'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 9
          Top = 59
          Width = 101
          Height = 14
          Caption = 'Nome do Lanche'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 335
          Top = 59
          Width = 98
          Height = 14
          Caption = 'Valor do Lanche'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtLAN_CODIGO: TDBEdit
          Left = 9
          Top = 30
          Width = 89
          Height = 22
          DataField = 'LAN_CODIGO'
          DataSource = dtsLanches
          TabOrder = 0
        end
        object edtLAN_NOME: TDBEdit
          Left = 9
          Top = 76
          Width = 316
          Height = 22
          DataField = 'LAN_NOME'
          DataSource = dtsLanches
          TabOrder = 1
        end
        object edtLAN_VALOR: TDBEdit
          Left = 335
          Top = 76
          Width = 89
          Height = 22
          DataField = 'LAN_VALOR'
          DataSource = dtsLanches
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
    end
  end
  object dtsLanches: TDataSource
    DataSet = CM.cdsGravaLanches
    Left = 580
    Top = 137
  end
  object dtsItem: TDataSource
    DataSet = CM.cdsLanchesItem
    Left = 580
    Top = 193
  end
end
