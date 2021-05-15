object SM: TSM
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  Height = 394
  Width = 731
  object sqlConnSrv: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=C:\sistemas\VendaLanches\Exe\Dados\VENDAS.FDB'
      'RoleName=RoleName'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Left = 40
    Top = 24
  end
  object qryGravaLanches: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select LAN_CODIGO, LAN_NOME, LAN_VALOR'
      'from LANCHES')
    SQLConnection = sqlConnSrv
    Left = 163
    Top = 88
    object qryGravaLanchesLAN_CODIGO: TIntegerField
      FieldName = 'LAN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryGravaLanchesLAN_NOME: TStringField
      FieldName = 'LAN_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryGravaLanchesLAN_VALOR: TFMTBCDField
      FieldName = 'LAN_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
  end
  object qryGravaPedidos: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select PED_CODIGO, PED_DATA, PED_VRDESCONTO, PED_TOTALBRUTO,'
      'PED_TOTALLIQ'
      'from PEDIDOS')
    SQLConnection = sqlConnSrv
    Left = 383
    Top = 88
    object qryGravaPedidosPED_CODIGO: TIntegerField
      FieldName = 'PED_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryGravaPedidosPED_DATA: TDateField
      FieldName = 'PED_DATA'
      ProviderFlags = [pfInUpdate]
    end
    object qryGravaPedidosPED_VRDESCONTO: TFMTBCDField
      FieldName = 'PED_VRDESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qryGravaPedidosPED_TOTALBRUTO: TFMTBCDField
      FieldName = 'PED_TOTALBRUTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qryGravaPedidosPED_TOTALLIQ: TFMTBCDField
      FieldName = 'PED_TOTALLIQ'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
  end
  object qryGravaIngredientes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select ING_CODIGO, ING_NOME, ING_VALOR'
      'from INGREDIENTES')
    SQLConnection = sqlConnSrv
    Left = 52
    Top = 88
    object qryGravaIngredientesING_CODIGO: TIntegerField
      FieldName = 'ING_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryGravaIngredientesING_NOME: TStringField
      FieldName = 'ING_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qryGravaIngredientesING_VALOR: TFMTBCDField
      FieldName = 'ING_VALOR'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
  end
  object dspGravaPedidos: TDataSetProvider
    DataSet = qryGravaPedidos
    Options = [poNoReset, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 383
    Top = 136
  end
  object dspGravaIngredientes: TDataSetProvider
    DataSet = qryGravaIngredientes
    Options = [poNoReset, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 52
    Top = 136
  end
  object qryConsulta: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConnSrv
    Left = 64
    Top = 208
  end
  object dspGravaLanches: TDataSetProvider
    DataSet = qryGravaLanches
    Options = [poNoReset, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 163
    Top = 136
  end
  object qryGravaPedidosItem: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select ITE.PED_CODIGO, ITE.ITE_NUMERO, ITE.LAN_CODIGO,'
      'LAN.LAN_NOME'
      'from PEDIDOS_ITEM ITE'
      'left join LANCHES LAN on (ITE.LAN_CODIGO = LAN.LAN_CODIGO)'
      'where ITE.PED_CODIGO = :CODIGO'
      'order by ITE.ITE_NUMERO')
    SQLConnection = sqlConnSrv
    Left = 486
    Top = 88
    object qryGravaPedidosItemPED_CODIGO: TIntegerField
      FieldName = 'PED_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryGravaPedidosItemITE_NUMERO: TSmallintField
      FieldName = 'ITE_NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryGravaPedidosItemLAN_CODIGO: TIntegerField
      FieldName = 'LAN_CODIGO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryGravaPedidosItemLAN_NOME: TStringField
      FieldName = 'LAN_NOME'
      ProviderFlags = []
      Size = 50
    end
  end
  object dspGravaPedidosItem: TDataSetProvider
    DataSet = qryGravaPedidosItem
    Options = [poNoReset, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 486
    Top = 136
  end
  object qryGravaLanchesItem: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select ITE.LAN_CODIGO, ITE.LAN_ITEM, ITE.ING_CODIGO, ITE.LAN_QTD' +
        'E,'
      'ITE.LAN_TOTAL, ING.ING_NOME'
      'from LANCHES_ITEM ITE'
      'left join INGREDIENTES ING on (ITE.ING_CODIGO = ING.ING_CODIGO)'
      'where (ITE.LAN_CODIGO = :CODIGO)'
      'order by ITE.LAN_ITEM')
    SQLConnection = sqlConnSrv
    Left = 272
    Top = 88
    object qryGravaLanchesItemLAN_CODIGO: TIntegerField
      FieldName = 'LAN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryGravaLanchesItemLAN_ITEM: TSmallintField
      FieldName = 'LAN_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryGravaLanchesItemING_CODIGO: TIntegerField
      FieldName = 'ING_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object qryGravaLanchesItemLAN_QTDE: TSmallintField
      FieldName = 'LAN_QTDE'
      ProviderFlags = [pfInUpdate]
    end
    object qryGravaLanchesItemLAN_TOTAL: TFMTBCDField
      FieldName = 'LAN_TOTAL'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qryGravaLanchesItemING_NOME: TStringField
      FieldName = 'ING_NOME'
      ProviderFlags = []
      Size = 50
    end
  end
  object dspGravaLanchesItem: TDataSetProvider
    DataSet = qryGravaLanchesItem
    Options = [poNoReset, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 272
    Top = 136
  end
  object qryDeletaItensLanche: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'delete from LANCHES_ITEM'
      'where LAN_CODIGO = :CODIGO')
    SQLConnection = sqlConnSrv
    Left = 160
    Top = 208
  end
  object qryGravaPedidosItemDetalhe: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select DET.PED_CODIGO, DET.ITE_NUMERO, DET.LAN_CODIGO, DET.LAN_I' +
        'TEM,'
      'DET.ING_CODIGO, DET.ITE_QTDE, DET.ITE_VRUNIT, DET.ITE_TOTAL,'
      'ING.ING_NOME,LAN.LAN_NOME'
      'from PEDIDOS_ITEM_DETALHE DET'
      'left join LANCHES LAN on (DET.LAN_CODIGO = LAN.LAN_CODIGO)'
      'left join INGREDIENTES ING on (DET.ING_CODIGO = ING.ING_CODIGO)'
      'where DET.PED_CODIGO = :CODIGO'
      'order by DET.LAN_ITEM')
    SQLConnection = sqlConnSrv
    Left = 620
    Top = 88
    object qryGravaPedidosItemDetalhePED_CODIGO: TIntegerField
      FieldName = 'PED_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryGravaPedidosItemDetalheITE_NUMERO: TSmallintField
      FieldName = 'ITE_NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryGravaPedidosItemDetalheLAN_CODIGO: TIntegerField
      FieldName = 'LAN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryGravaPedidosItemDetalheLAN_ITEM: TSmallintField
      FieldName = 'LAN_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryGravaPedidosItemDetalheING_CODIGO: TIntegerField
      FieldName = 'ING_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object qryGravaPedidosItemDetalheITE_QTDE: TSmallintField
      FieldName = 'ITE_QTDE'
      ProviderFlags = [pfInUpdate]
    end
    object qryGravaPedidosItemDetalheITE_VRUNIT: TFMTBCDField
      FieldName = 'ITE_VRUNIT'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qryGravaPedidosItemDetalheITE_TOTAL: TFMTBCDField
      FieldName = 'ITE_TOTAL'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qryGravaPedidosItemDetalheING_NOME: TStringField
      FieldName = 'ING_NOME'
      ProviderFlags = []
      Size = 50
    end
    object qryGravaPedidosItemDetalheLAN_NOME: TStringField
      FieldName = 'LAN_NOME'
      ProviderFlags = []
      Size = 50
    end
  end
  object dspGravaPedidosItemDetalhe: TDataSetProvider
    DataSet = qryGravaPedidosItemDetalhe
    Options = [poNoReset, poUseQuoteChar]
    Left = 620
    Top = 136
  end
  object qryDeletaItensPedido: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'delete from PEDIDOS_ITEM'
      'where PED_CODIGO = :CODIGO')
    SQLConnection = sqlConnSrv
    Left = 280
    Top = 208
  end
  object qryBuscaIngrediente: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select ING_NOME, ING_VALOR'
      'from INGREDIENTES'
      'where ING_CODIGO = :CODIGO')
    SQLConnection = sqlConnSrv
    Left = 320
    Top = 280
    object qryBuscaIngredienteING_NOME: TStringField
      FieldName = 'ING_NOME'
      Size = 50
    end
    object qryBuscaIngredienteING_VALOR: TFMTBCDField
      FieldName = 'ING_VALOR'
      Precision = 18
      Size = 2
    end
  end
  object dspBuscaIngrediente: TDataSetProvider
    DataSet = qryBuscaIngrediente
    Options = [poNoReset, poUseQuoteChar]
    Left = 320
    Top = 328
  end
  object qryBuscaLanche: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select LAN_NOME, LAN_VALOR'
      'from LANCHES'
      'where LAN_CODIGO = :CODIGO')
    SQLConnection = sqlConnSrv
    Left = 424
    Top = 280
    object qryBuscaLancheLAN_NOME: TStringField
      FieldName = 'LAN_NOME'
      Size = 50
    end
    object qryBuscaLancheLAN_VALOR: TFMTBCDField
      FieldName = 'LAN_VALOR'
      Precision = 18
      Size = 2
    end
  end
  object dspBuscaLanche: TDataSetProvider
    DataSet = qryBuscaLanche
    Options = [poNoReset, poUseQuoteChar]
    Left = 424
    Top = 328
  end
  object qryCardapioLanches: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select LAN_CODIGO, LAN_NOME, LAN_VALOR'
      'from LANCHES')
    SQLConnection = sqlConnSrv
    Left = 56
    Top = 280
    object qryCardapioLanchesLAN_CODIGO: TIntegerField
      FieldName = 'LAN_CODIGO'
      Required = True
    end
    object qryCardapioLanchesLAN_NOME: TStringField
      FieldName = 'LAN_NOME'
      Size = 50
    end
    object qryCardapioLanchesLAN_VALOR: TFMTBCDField
      FieldName = 'LAN_VALOR'
      Precision = 18
      Size = 2
    end
  end
  object dspCardapioLanches: TDataSetProvider
    DataSet = qryCardapioLanches
    Options = [poNoReset, poUseQuoteChar]
    Left = 56
    Top = 328
  end
  object qryCardapioLanchesItem: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select ITE.LAN_CODIGO, ITE.LAN_ITEM, ITE.ING_CODIGO, ITE.LAN_QTD' +
        'E,'
      'ITE.LAN_TOTAL, ING.ING_NOME'
      'from LANCHES_ITEM ITE'
      'left join INGREDIENTES ING on (ITE.ING_CODIGO = ING.ING_CODIGO)'
      'where (ITE.LAN_CODIGO = :CODIGO)'
      'order by ITE.LAN_ITEM')
    SQLConnection = sqlConnSrv
    Left = 186
    Top = 280
    object qryCardapioLanchesItemLAN_CODIGO: TIntegerField
      FieldName = 'LAN_CODIGO'
      Required = True
    end
    object qryCardapioLanchesItemLAN_ITEM: TSmallintField
      FieldName = 'LAN_ITEM'
      Required = True
    end
    object qryCardapioLanchesItemING_CODIGO: TIntegerField
      FieldName = 'ING_CODIGO'
    end
    object qryCardapioLanchesItemLAN_QTDE: TSmallintField
      FieldName = 'LAN_QTDE'
    end
    object qryCardapioLanchesItemLAN_TOTAL: TFMTBCDField
      FieldName = 'LAN_TOTAL'
      Precision = 18
      Size = 2
    end
    object qryCardapioLanchesItemING_NOME: TStringField
      FieldName = 'ING_NOME'
      Size = 50
    end
  end
  object dspCardapioLanchesItem: TDataSetProvider
    DataSet = qryCardapioLanchesItem
    Options = [poNoReset, poUseQuoteChar]
    Left = 186
    Top = 328
  end
  object qryBuscaLancheItem: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'select ITE.LAN_CODIGO, ITE.LAN_ITEM, ITE.ING_CODIGO, ITE.LAN_QTD' +
        'E,'
      'ITE.LAN_TOTAL, ING.ING_NOME,ING.ING_VALOR,LAN.LAN_NOME'
      'from LANCHES_ITEM ITE'
      'left join INGREDIENTES ING on (ITE.ING_CODIGO = ING.ING_CODIGO)'
      'left join LANCHES LAN on (ITE.LAN_CODIGO = LAN.LAN_CODIGO)'
      'where (ITE.LAN_CODIGO = :CODIGO)'
      'order by ITE.LAN_ITEM')
    SQLConnection = sqlConnSrv
    Left = 528
    Top = 280
    object qryBuscaLancheItemLAN_CODIGO: TIntegerField
      FieldName = 'LAN_CODIGO'
      Required = True
    end
    object qryBuscaLancheItemLAN_ITEM: TSmallintField
      FieldName = 'LAN_ITEM'
      Required = True
    end
    object qryBuscaLancheItemING_CODIGO: TIntegerField
      FieldName = 'ING_CODIGO'
    end
    object qryBuscaLancheItemLAN_QTDE: TSmallintField
      FieldName = 'LAN_QTDE'
    end
    object qryBuscaLancheItemLAN_TOTAL: TFMTBCDField
      FieldName = 'LAN_TOTAL'
      Precision = 18
      Size = 2
    end
    object qryBuscaLancheItemING_NOME: TStringField
      FieldName = 'ING_NOME'
      Size = 50
    end
    object qryBuscaLancheItemLAN_NOME: TStringField
      FieldName = 'LAN_NOME'
      Size = 50
    end
    object qryBuscaLancheItemING_VALOR: TFMTBCDField
      FieldName = 'ING_VALOR'
      Precision = 18
      Size = 2
    end
  end
  object dspBuscaLancheItem: TDataSetProvider
    DataSet = qryBuscaLancheItem
    Options = [poNoReset, poUseQuoteChar]
    Left = 528
    Top = 328
  end
end
