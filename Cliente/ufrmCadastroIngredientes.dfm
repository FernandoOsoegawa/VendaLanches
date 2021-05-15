object frmCadastroIngredientes: TfrmCadastroIngredientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Ingredientes'
  ClientHeight = 368
  ClientWidth = 667
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
    Width = 667
    Height = 368
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
        Width = 659
        Height = 84
        Align = alTop
        TabOrder = 0
        object Label4: TLabel
          Left = 6
          Top = 16
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
          Left = 6
          Top = 67
          Width = 328
          Height = 14
          Caption = 'Duplo clique no registro para selecionar o ingrediente'
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
          Left = 6
          Top = 34
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
            'C'#243'digo do Ingrediente'
            'Nome do Ingrediente'
            'Todos')
        end
        object edtCampo: TEdit
          Left = 168
          Top = 34
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
      object dbgIngredientes: TDBGrid
        Left = 0
        Top = 84
        Width = 659
        Height = 255
        Hint = 'Duplo clique para selecionar o registro'
        Align = alClient
        DataSource = dtsIngredientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDblClick = dbgIngredientesDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ING_CODIGO'
            Title.Caption = 'C'#211'DIGO'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ING_NOME'
            Title.Caption = 'NOME DO INGREDIENTE'
            Width = 302
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ING_VALOR'
            Title.Caption = 'VALOR'
            Width = 85
            Visible = True
          end>
      end
    end
    object tabCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object Label1: TLabel
        Left = 8
        Top = 85
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
      object Label2: TLabel
        Left = 8
        Top = 138
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
      object Label3: TLabel
        Left = 344
        Top = 138
        Width = 127
        Height = 14
        Caption = 'Valor do Ingrediente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtING_CODIGO: TDBEdit
        Left = 8
        Top = 102
        Width = 89
        Height = 22
        DataField = 'ING_CODIGO'
        DataSource = dtsIngredientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edtING_NOME: TDBEdit
        Left = 8
        Top = 155
        Width = 313
        Height = 22
        DataField = 'ING_NOME'
        DataSource = dtsIngredientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edtING_VALOR: TDBEdit
        Left = 344
        Top = 155
        Width = 89
        Height = 22
        DataField = 'ING_VALOR'
        DataSource = dtsIngredientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object pnlEdit: TPanel
        Left = 0
        Top = 0
        Width = 659
        Height = 70
        Align = alTop
        TabOrder = 3
        object btnInserir: TButton
          Left = 8
          Top = 17
          Width = 121
          Height = 41
          Caption = 'Inserir  Ingrediente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          WordWrap = True
          OnClick = btnInserirClick
        end
        object btnEditar: TButton
          Left = 137
          Top = 17
          Width = 121
          Height = 41
          Caption = 'Editar  Ingrediente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          WordWrap = True
          OnClick = btnEditarClick
        end
        object btnDeletar: TButton
          Left = 264
          Top = 17
          Width = 121
          Height = 41
          Caption = 'Deletar Ingrediente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          WordWrap = True
          OnClick = btnDeletarClick
        end
        object btnSalvar: TButton
          Left = 391
          Top = 17
          Width = 121
          Height = 41
          Caption = 'Salvar  Ingrediente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          WordWrap = True
          OnClick = btnSalvarClick
        end
        object btnCancelar: TButton
          Left = 518
          Top = 17
          Width = 121
          Height = 41
          Caption = 'Cancelar  Ingrediente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          WordWrap = True
          OnClick = btnCancelarClick
        end
      end
    end
  end
  object dtsIngredientes: TDataSource
    DataSet = CM.cdsGravaIngredientes
    Left = 544
    Top = 136
  end
end
