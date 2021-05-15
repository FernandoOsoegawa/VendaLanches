object CM: TCM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 384
  Width = 675
  object cdsGravaPedidos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGravaPedidos'
    RemoteServer = dspcDatasnap
    BeforeGetRecords = cdsGravaPedidosBeforeGetRecords
    Left = 56
    Top = 216
    object cdsGravaPedidosPED_CODIGO: TIntegerField
      FieldName = 'PED_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGravaPedidosPED_DATA: TDateField
      FieldName = 'PED_DATA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsGravaPedidosPED_VRDESCONTO: TFMTBCDField
      FieldName = 'PED_VRDESCONTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object cdsGravaPedidosPED_TOTALBRUTO: TFMTBCDField
      FieldName = 'PED_TOTALBRUTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object cdsGravaPedidosPED_TOTALLIQ: TFMTBCDField
      FieldName = 'PED_TOTALLIQ'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
  end
  object cdsGravaPedidosItem: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspGravaPedidosItem'
    RemoteServer = dspcDatasnap
    Left = 160
    Top = 216
    object cdsGravaPedidosItemPED_CODIGO: TIntegerField
      FieldName = 'PED_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGravaPedidosItemITE_NUMERO: TSmallintField
      FieldName = 'ITE_NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGravaPedidosItemLAN_CODIGO: TIntegerField
      FieldName = 'LAN_CODIGO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsGravaPedidosItemLAN_NOME: TStringField
      FieldName = 'LAN_NOME'
      ProviderFlags = []
      Size = 50
    end
  end
  object cdsGravaIngredientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGravaIngredientes'
    RemoteServer = dspcDatasnap
    BeforeGetRecords = cdsGravaIngredientesBeforeGetRecords
    Left = 56
    Top = 152
    object cdsGravaIngredientesING_CODIGO: TIntegerField
      FieldName = 'ING_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGravaIngredientesING_NOME: TStringField
      FieldName = 'ING_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsGravaIngredientesING_VALOR: TFMTBCDField
      FieldName = 'ING_VALOR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 18
      Size = 2
    end
  end
  object dspcDatasnap: TDSProviderConnection
    ServerClassName = 'TSM'
    SQLConnection = sqlConnDatasnap
    Left = 64
    Top = 72
  end
  object cdsGravaLanches: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGravaLanches'
    RemoteServer = dspcDatasnap
    BeforeGetRecords = cdsGravaLanchesBeforeGetRecords
    Left = 161
    Top = 152
    object cdsGravaLanchesLAN_CODIGO: TIntegerField
      FieldName = 'LAN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGravaLanchesLAN_NOME: TStringField
      FieldName = 'LAN_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsGravaLanchesLAN_VALOR: TFMTBCDField
      FieldName = 'LAN_VALOR'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 18
      Size = 2
    end
  end
  object cdsGravaLanchesItem: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspGravaLanchesItem'
    RemoteServer = dspcDatasnap
    Left = 266
    Top = 152
    object cdsGravaLanchesItemLAN_CODIGO: TIntegerField
      FieldName = 'LAN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGravaLanchesItemLAN_ITEM: TSmallintField
      FieldName = 'LAN_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGravaLanchesItemING_CODIGO: TIntegerField
      FieldName = 'ING_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsGravaLanchesItemLAN_QTDE: TSmallintField
      FieldName = 'LAN_QTDE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsGravaLanchesItemLAN_TOTAL: TFMTBCDField
      FieldName = 'LAN_TOTAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object cdsGravaLanchesItemING_NOME: TStringField
      FieldName = 'ING_NOME'
      ProviderFlags = []
      Size = 50
    end
  end
  object sqlConnDatasnap: TSQLConnection
    ConnectionName = 'DataSnapCONNECTION'
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=DataSnap'
      'HostName=localhost'
      'port=211')
    Left = 65
    Top = 23
    UniqueId = '{11EBD809-7BC5-4F3C-B924-3B13DFDE0921}'
  end
  object cdsLanchesItem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 457
    Top = 152
    object cdsLanchesItemITEM: TIntegerField
      FieldName = 'ITEM'
    end
    object cdsLanchesItemCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsLanchesItemNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsLanchesItemQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object cdsLanchesItemTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
  end
  object cdsGravaPedidosItemDetalhe: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspGravaPedidosItemDetalhe'
    RemoteServer = dspcDatasnap
    Left = 296
    Top = 216
    object cdsGravaPedidosItemDetalhePED_CODIGO: TIntegerField
      FieldName = 'PED_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGravaPedidosItemDetalheITE_NUMERO: TSmallintField
      FieldName = 'ITE_NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGravaPedidosItemDetalheLAN_CODIGO: TIntegerField
      FieldName = 'LAN_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGravaPedidosItemDetalheLAN_ITEM: TSmallintField
      FieldName = 'LAN_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGravaPedidosItemDetalheING_CODIGO: TIntegerField
      FieldName = 'ING_CODIGO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsGravaPedidosItemDetalheITE_QTDE: TSmallintField
      FieldName = 'ITE_QTDE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsGravaPedidosItemDetalheITE_VRUNIT: TFMTBCDField
      FieldName = 'ITE_VRUNIT'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object cdsGravaPedidosItemDetalheITE_TOTAL: TFMTBCDField
      FieldName = 'ITE_TOTAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object cdsGravaPedidosItemDetalheING_NOME: TStringField
      FieldName = 'ING_NOME'
      ProviderFlags = []
      Size = 50
    end
    object cdsGravaPedidosItemDetalheLAN_NOME: TStringField
      FieldName = 'LAN_NOME'
      ProviderFlags = []
      Size = 50
    end
  end
  object cdsBuscaIngrediente: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspBuscaIngrediente'
    RemoteServer = dspcDatasnap
    Left = 56
    Top = 280
    object cdsBuscaIngredienteING_NOME: TStringField
      FieldName = 'ING_NOME'
      Size = 50
    end
    object cdsBuscaIngredienteING_VALOR: TFMTBCDField
      FieldName = 'ING_VALOR'
      Precision = 18
      Size = 2
    end
  end
  object cdsBuscaLanche: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspBuscaLanche'
    RemoteServer = dspcDatasnap
    Left = 155
    Top = 280
    object cdsBuscaLancheLAN_NOME: TStringField
      FieldName = 'LAN_NOME'
      Size = 50
    end
    object cdsBuscaLancheLAN_VALOR: TFMTBCDField
      FieldName = 'LAN_VALOR'
      Precision = 18
      Size = 2
    end
  end
  object cdsCardapioLanches: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCardapioLanches'
    RemoteServer = dspcDatasnap
    BeforeGetRecords = cdsCardapioLanchesBeforeGetRecords
    Left = 376
    Top = 280
    object cdsCardapioLanchesLAN_CODIGO: TIntegerField
      FieldName = 'LAN_CODIGO'
      Required = True
    end
    object cdsCardapioLanchesLAN_NOME: TStringField
      FieldName = 'LAN_NOME'
      Size = 50
    end
    object cdsCardapioLanchesLAN_VALOR: TFMTBCDField
      FieldName = 'LAN_VALOR'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
  end
  object cdsCardapioLanchesItem: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspCardapioLanchesItem'
    RemoteServer = dspcDatasnap
    Left = 496
    Top = 280
    object cdsCardapioLanchesItemLAN_CODIGO: TIntegerField
      FieldName = 'LAN_CODIGO'
      Required = True
    end
    object cdsCardapioLanchesItemLAN_ITEM: TSmallintField
      FieldName = 'LAN_ITEM'
      Required = True
    end
    object cdsCardapioLanchesItemING_CODIGO: TIntegerField
      FieldName = 'ING_CODIGO'
    end
    object cdsCardapioLanchesItemLAN_QTDE: TSmallintField
      FieldName = 'LAN_QTDE'
    end
    object cdsCardapioLanchesItemLAN_TOTAL: TFMTBCDField
      FieldName = 'LAN_TOTAL'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object cdsCardapioLanchesItemING_NOME: TStringField
      FieldName = 'ING_NOME'
      Size = 50
    end
  end
  object cdsBuscaLancheItem: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    ProviderName = 'dspBuscaLancheItem'
    RemoteServer = dspcDatasnap
    Left = 256
    Top = 280
    object cdsBuscaLancheItemLAN_CODIGO: TIntegerField
      FieldName = 'LAN_CODIGO'
      Required = True
    end
    object cdsBuscaLancheItemLAN_ITEM: TSmallintField
      FieldName = 'LAN_ITEM'
      Required = True
    end
    object cdsBuscaLancheItemING_CODIGO: TIntegerField
      FieldName = 'ING_CODIGO'
    end
    object cdsBuscaLancheItemLAN_QTDE: TSmallintField
      FieldName = 'LAN_QTDE'
    end
    object cdsBuscaLancheItemLAN_TOTAL: TFMTBCDField
      FieldName = 'LAN_TOTAL'
      Precision = 18
      Size = 2
    end
    object cdsBuscaLancheItemING_NOME: TStringField
      FieldName = 'ING_NOME'
      Size = 50
    end
    object cdsBuscaLancheItemLAN_NOME: TStringField
      FieldName = 'LAN_NOME'
      Size = 50
    end
    object cdsBuscaLancheItemING_VALOR: TFMTBCDField
      FieldName = 'ING_VALOR'
      Precision = 18
      Size = 2
    end
  end
  object cdsPedidosItem: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Left = 456
    Top = 216
    object cdsPedidosItemITE_NUMERO: TSmallintField
      FieldName = 'ITE_NUMERO'
    end
    object cdsPedidosItemLAN_CODIGO: TIntegerField
      FieldName = 'LAN_CODIGO'
    end
    object cdsPedidosItemLAN_NOME: TStringField
      FieldName = 'LAN_NOME'
      Size = 50
    end
  end
  object cdsPedidosItemDetalhe: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Left = 560
    Top = 216
    object cdsPedidosItemDetalheITE_NUMERO: TSmallintField
      FieldName = 'ITE_NUMERO'
    end
    object cdsPedidosItemDetalheLAN_CODIGO: TIntegerField
      FieldName = 'LAN_CODIGO'
    end
    object cdsPedidosItemDetalheLAN_ITEM: TSmallintField
      FieldName = 'LAN_ITEM'
    end
    object cdsPedidosItemDetalheING_CODIGO: TIntegerField
      FieldName = 'ING_CODIGO'
    end
    object cdsPedidosItemDetalheITE_QTDE: TSmallintField
      FieldName = 'ITE_QTDE'
    end
    object cdsPedidosItemDetalheITE_VRUNIT: TFMTBCDField
      FieldName = 'ITE_VRUNIT'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object cdsPedidosItemDetalheITE_TOTAL: TFMTBCDField
      FieldName = 'ITE_TOTAL'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object cdsPedidosItemDetalheING_NOME: TStringField
      FieldName = 'ING_NOME'
      Size = 50
    end
    object cdsPedidosItemDetalheLAN_NOME: TStringField
      FieldName = 'LAN_NOME'
      Size = 50
    end
  end
end
