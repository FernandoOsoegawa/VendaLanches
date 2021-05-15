object frmCadastroPedidos: TfrmCadastroPedidos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Pedidos'
  ClientHeight = 570
  ClientWidth = 721
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
    Width = 721
    Height = 570
    ActivePage = tabCadastro
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
        Width = 713
        Height = 79
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
          Left = 578
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
          TabOrder = 4
          OnClick = btnSairClick
        end
        object btnConsultar: TButton
          Left = 449
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
          TabOrder = 3
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
            'C'#243'digo do Pedido'
            'Data do Pedido'
            'Todos')
        end
        object edtCampo: TEdit
          Left = 170
          Top = 36
          Width = 143
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object edtCampoData: TDateTimePicker
          Left = 170
          Top = 36
          Width = 123
          Height = 22
          Date = 44330.000000000000000000
          Time = 44330.000000000000000000
          TabOrder = 2
        end
      end
      object dbgPedido: TDBGrid
        Left = 0
        Top = 79
        Width = 713
        Height = 462
        Align = alClient
        DataSource = dtsPedido
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
        OnDblClick = dbgPedidoDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'PED_CODIGO'
            Title.Caption = 'C'#211'DIGO PEDIDO'
            Width = 111
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PED_DATA'
            Title.Caption = 'DATA'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PED_TOTALBRUTO'
            Title.Caption = 'VR. TOTAL BRUTO'
            Width = 127
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PED_VRDESCONTO'
            Title.Caption = 'VR. DESCONTO'
            Width = 111
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PED_TOTALLIQ'
            Title.Caption = 'VR. TOTAL L'#205'Q.'
            Width = 114
            Visible = True
          end>
      end
    end
    object tabCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      OnShow = tabCadastroShow
      object pnlEdit: TPanel
        Left = 0
        Top = 0
        Width = 713
        Height = 53
        Align = alTop
        TabOrder = 0
        object btnInserirPedido: TButton
          Left = 8
          Top = 6
          Width = 121
          Height = 41
          Caption = 'Inserir Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnInserirPedidoClick
        end
        object btnEditarPedido: TButton
          Left = 137
          Top = 6
          Width = 121
          Height = 41
          Caption = 'Editar Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnEditarPedidoClick
        end
        object btnDeletarPedido: TButton
          Left = 264
          Top = 6
          Width = 121
          Height = 41
          Caption = 'Deletar Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btnDeletarPedidoClick
        end
        object btnSalvarPedido: TButton
          Left = 391
          Top = 6
          Width = 121
          Height = 41
          Caption = 'Salvar Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = btnSalvarPedidoClick
        end
        object btnCancelarPedido: TButton
          Left = 518
          Top = 6
          Width = 121
          Height = 41
          Caption = 'Cancelar Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = btnCancelarPedidoClick
        end
      end
      object pnlDados: TPanel
        Left = 0
        Top = 53
        Width = 713
        Height = 70
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label1: TLabel
          Left = 9
          Top = 13
          Width = 109
          Height = 14
          Caption = 'C'#243'digo do Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 137
          Top = 13
          Width = 95
          Height = 14
          Caption = 'Data do Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 379
          Top = 13
          Width = 93
          Height = 14
          Caption = 'Valor Desconto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 249
          Top = 13
          Width = 116
          Height = 14
          Caption = 'Total Bruto Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 490
          Top = 13
          Width = 126
          Height = 14
          Caption = 'Total L'#237'quido Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtPED_CODIGO: TDBEdit
          Left = 9
          Top = 30
          Width = 89
          Height = 22
          DataField = 'PED_CODIGO'
          DataSource = dtsPedido
          TabOrder = 0
        end
        object edtPED_DATA: TDBEdit
          Left = 137
          Top = 30
          Width = 89
          Height = 22
          DataField = 'PED_DATA'
          DataSource = dtsPedido
          TabOrder = 1
        end
        object edtPED_VRDESCONTO: TDBEdit
          Left = 379
          Top = 30
          Width = 89
          Height = 22
          DataField = 'PED_VRDESCONTO'
          DataSource = dtsPedido
          TabOrder = 3
        end
        object edtPED_TOTALBRUTO: TDBEdit
          Left = 249
          Top = 30
          Width = 89
          Height = 22
          DataField = 'PED_TOTALBRUTO'
          DataSource = dtsPedido
          TabOrder = 2
        end
        object edtPED_TOTALLIQ: TDBEdit
          Left = 490
          Top = 30
          Width = 89
          Height = 22
          DataField = 'PED_TOTALLIQ'
          DataSource = dtsPedido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
      end
      object pgcItem: TPageControl
        Left = 0
        Top = 123
        Width = 713
        Height = 418
        ActivePage = tabPedidoItem
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnChange = pgcItemChange
        object tabPedidoItem: TTabSheet
          Caption = '  Itens do Pedido  '
          object pnlEditItem: TPanel
            Left = 0
            Top = 0
            Width = 705
            Height = 48
            Align = alTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
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
          object pnlItem: TPanel
            Left = 0
            Top = 48
            Width = 705
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
            object Label7: TLabel
              Left = 193
              Top = 12
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
            object edtITE_NUMERO: TDBEdit
              Left = 6
              Top = 29
              Width = 55
              Height = 22
              DataField = 'ITE_NUMERO'
              DataSource = dtsPedidoItem
              TabOrder = 0
            end
            object edtLAN_CODIGO: TDBEdit
              Left = 69
              Top = 29
              Width = 76
              Height = 22
              DataField = 'LAN_CODIGO'
              DataSource = dtsPedidoItem
              TabOrder = 1
              OnExit = edtLAN_CODIGOExit
            end
            object edtLAN_NOME: TDBEdit
              Left = 192
              Top = 29
              Width = 361
              Height = 22
              DataField = 'LAN_NOME'
              DataSource = dtsPedidoItem
              TabOrder = 3
            end
            object btnLocalizaLanches: TBitBtn
              Left = 148
              Top = 28
              Width = 30
              Height = 25
              Hint = 'Localizar Lanches'
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
              OnClick = btnLocalizaLanchesClick
            end
          end
          object dbgPedidoItem: TDBGrid
            Left = 0
            Top = 114
            Width = 705
            Height = 275
            Align = alClient
            DataSource = dtsPedidoItem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = [fsBold]
            OnDblClick = dbgPedidoItemDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'ITE_NUMERO'
                Title.Caption = 'ITEM DO PEDIDO'
                Width = 117
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LAN_CODIGO'
                Title.Caption = 'C'#211'DIGO'
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LAN_NOME'
                Title.Caption = 'NOME DO LANCHE'
                Width = 327
                Visible = True
              end>
          end
        end
        object tabPedidoItemDetalhe: TTabSheet
          Caption = '  Ingredientes do Lanche  '
          ImageIndex = 1
          OnShow = tabPedidoItemDetalheShow
          object pnlEditItemDetalhe: TPanel
            Left = 0
            Top = 0
            Width = 705
            Height = 57
            Align = alTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object btnInserirIngrediente: TButton
              Left = 13
              Top = 7
              Width = 97
              Height = 42
              Caption = 'Inserir Ingrediente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              WordWrap = True
              OnClick = btnInserirIngredienteClick
            end
            object btnEditarIngrediente: TButton
              Left = 116
              Top = 7
              Width = 97
              Height = 42
              Caption = 'Editar Ingrediente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              WordWrap = True
              OnClick = btnEditarIngredienteClick
            end
            object btnDeletarIngrediente: TButton
              Left = 219
              Top = 7
              Width = 97
              Height = 42
              Caption = 'Deletar Ingrediente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              WordWrap = True
              OnClick = btnDeletarIngredienteClick
            end
            object btnSalvarIngrediente: TButton
              Left = 323
              Top = 7
              Width = 97
              Height = 42
              Caption = 'Salvar Ingrediente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              WordWrap = True
              OnClick = btnSalvarIngredienteClick
            end
            object btnCancelarIngrediente: TButton
              Left = 426
              Top = 7
              Width = 103
              Height = 42
              Caption = 'Cancelar Ingrediente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              WordWrap = True
              OnClick = btnCancelarIngredienteClick
            end
          end
          object pnlItemDetalhe: TPanel
            Left = 0
            Top = 57
            Width = 705
            Height = 65
            Align = alTop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object Label12: TLabel
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
            object Label13: TLabel
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
            object Label14: TLabel
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
            object Label15: TLabel
              Left = 444
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
            object Label16: TLabel
              Left = 600
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
            object Label8: TLabel
              Left = 523
              Top = 12
              Width = 50
              Height = 14
              Caption = 'Vr. Unit.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edtLAN_ITEM: TDBEdit
              Left = 6
              Top = 29
              Width = 55
              Height = 22
              DataField = 'LAN_ITEM'
              DataSource = dtsPedidoItemDetalhe
              TabOrder = 0
            end
            object edtING_CODIGO: TDBEdit
              Left = 69
              Top = 29
              Width = 76
              Height = 22
              DataField = 'ING_CODIGO'
              DataSource = dtsPedidoItemDetalhe
              TabOrder = 1
              OnExit = edtING_CODIGOExit
            end
            object edtING_NOME: TDBEdit
              Left = 217
              Top = 29
              Width = 217
              Height = 22
              DataField = 'ING_NOME'
              DataSource = dtsPedidoItemDetalhe
              TabOrder = 3
            end
            object edtITE_QTDE: TDBEdit
              Left = 444
              Top = 29
              Width = 57
              Height = 22
              DataField = 'ITE_QTDE'
              DataSource = dtsPedidoItemDetalhe
              TabOrder = 4
              OnExit = edtITE_QTDEExit
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
            object edtITE_TOTAL: TDBEdit
              Left = 600
              Top = 29
              Width = 75
              Height = 22
              DataField = 'ITE_TOTAL'
              DataSource = dtsPedidoItemDetalhe
              TabOrder = 6
            end
            object edtITE_VRUNIT: TDBEdit
              Left = 523
              Top = 29
              Width = 65
              Height = 22
              DataField = 'ITE_VRUNIT'
              DataSource = dtsPedidoItemDetalhe
              TabOrder = 5
              OnExit = edtITE_VRUNITExit
            end
          end
          object dbgPedidoItemDetalhe: TDBGrid
            Left = 0
            Top = 122
            Width = 705
            Height = 267
            Align = alClient
            DataSource = dtsPedidoItemDetalhe
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = [fsBold]
            Columns = <
              item
                Expanded = False
                FieldName = 'ITE_NUMERO'
                Title.Caption = 'ITEM DO PEDIDO'
                Width = 112
                Visible = True
              end
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
                Width = 228
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ITE_QTDE'
                Title.Caption = 'QTDE.'
                Width = 48
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ITE_VRUNIT'
                Title.Caption = 'VR. UNIT.'
                Width = 69
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ITE_TOTAL'
                Title.Caption = 'TOTAL ITEM'
                Width = 84
                Visible = True
              end>
          end
        end
      end
    end
  end
  object dtsPedido: TDataSource
    DataSet = CM.cdsGravaPedidos
    Left = 608
    Top = 333
  end
  object dtsPedidoItem: TDataSource
    DataSet = CM.cdsPedidosItem
    Left = 608
    Top = 381
  end
  object dtsPedidoItemDetalhe: TDataSource
    DataSet = CM.cdsPedidosItemDetalhe
    Left = 608
    Top = 429
  end
end
