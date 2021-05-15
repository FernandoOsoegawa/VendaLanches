unit uCM;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, Data.DBXCommon,
  IPPeerClient, Data.DB, Data.SqlExpr, System.IniFiles, Vcl.Forms, Winapi.Windows,
  Datasnap.DBClient, Datasnap.DSConnect, System.Variants, uCC, System.ImageList,
  Vcl.ImgList, Vcl.Controls;

const ArquivoConfigCliente = 'ConfigCliente.ini';

type
  TCM = class(TDataModule)
    cdsGravaPedidos: TClientDataSet;
    cdsGravaPedidosItem: TClientDataSet;
    cdsGravaIngredientes: TClientDataSet;
    cdsGravaIngredientesING_CODIGO: TIntegerField;
    cdsGravaIngredientesING_NOME: TStringField;
    cdsGravaIngredientesING_VALOR: TFMTBCDField;
    dspcDatasnap: TDSProviderConnection;
    cdsGravaLanches: TClientDataSet;
    cdsGravaLanchesItem: TClientDataSet;
    sqlConnDatasnap: TSQLConnection;
    cdsGravaLanchesLAN_CODIGO: TIntegerField;
    cdsGravaLanchesLAN_NOME: TStringField;
    cdsGravaLanchesLAN_VALOR: TFMTBCDField;
    cdsLanchesItem: TClientDataSet;
    cdsLanchesItemITEM: TIntegerField;
    cdsLanchesItemCODIGO: TIntegerField;
    cdsLanchesItemQTDE: TIntegerField;
    cdsLanchesItemNOME: TStringField;
    cdsGravaLanchesItemLAN_CODIGO: TIntegerField;
    cdsGravaLanchesItemLAN_ITEM: TSmallintField;
    cdsGravaLanchesItemING_CODIGO: TIntegerField;
    cdsGravaLanchesItemLAN_QTDE: TSmallintField;
    cdsLanchesItemTOTAL: TFloatField;
    cdsGravaLanchesItemLAN_TOTAL: TFMTBCDField;
    cdsGravaPedidosItemDetalhe: TClientDataSet;
    cdsGravaPedidosPED_CODIGO: TIntegerField;
    cdsGravaPedidosPED_DATA: TDateField;
    cdsGravaPedidosPED_VRDESCONTO: TFMTBCDField;
    cdsGravaPedidosPED_TOTALBRUTO: TFMTBCDField;
    cdsGravaPedidosPED_TOTALLIQ: TFMTBCDField;
    cdsGravaPedidosItemPED_CODIGO: TIntegerField;
    cdsGravaPedidosItemITE_NUMERO: TSmallintField;
    cdsGravaPedidosItemLAN_CODIGO: TIntegerField;
    cdsGravaPedidosItemDetalhePED_CODIGO: TIntegerField;
    cdsGravaPedidosItemDetalheITE_NUMERO: TSmallintField;
    cdsGravaPedidosItemDetalheLAN_CODIGO: TIntegerField;
    cdsGravaPedidosItemDetalheLAN_ITEM: TSmallintField;
    cdsGravaPedidosItemDetalheING_CODIGO: TIntegerField;
    cdsGravaPedidosItemDetalheITE_QTDE: TSmallintField;
    cdsGravaPedidosItemDetalheITE_VRUNIT: TFMTBCDField;
    cdsGravaPedidosItemDetalheITE_TOTAL: TFMTBCDField;
    cdsGravaPedidosItemDetalheING_NOME: TStringField;
    cdsGravaPedidosItemDetalheLAN_NOME: TStringField;
    cdsBuscaIngrediente: TClientDataSet;
    cdsBuscaLanche: TClientDataSet;
    cdsCardapioLanches: TClientDataSet;
    cdsCardapioLanchesItem: TClientDataSet;
    cdsCardapioLanchesItemLAN_CODIGO: TIntegerField;
    cdsCardapioLanchesItemLAN_ITEM: TSmallintField;
    cdsCardapioLanchesItemING_CODIGO: TIntegerField;
    cdsCardapioLanchesItemLAN_QTDE: TSmallintField;
    cdsCardapioLanchesItemLAN_TOTAL: TFMTBCDField;
    cdsCardapioLanchesItemING_NOME: TStringField;
    cdsCardapioLanchesLAN_CODIGO: TIntegerField;
    cdsCardapioLanchesLAN_NOME: TStringField;
    cdsCardapioLanchesLAN_VALOR: TFMTBCDField;
    cdsBuscaIngredienteING_NOME: TStringField;
    cdsBuscaIngredienteING_VALOR: TFMTBCDField;
    cdsBuscaLancheLAN_NOME: TStringField;
    cdsBuscaLancheLAN_VALOR: TFMTBCDField;
    cdsBuscaLancheItem: TClientDataSet;
    cdsBuscaLancheItemLAN_CODIGO: TIntegerField;
    cdsBuscaLancheItemLAN_ITEM: TSmallintField;
    cdsBuscaLancheItemING_CODIGO: TIntegerField;
    cdsBuscaLancheItemLAN_QTDE: TSmallintField;
    cdsBuscaLancheItemLAN_TOTAL: TFMTBCDField;
    cdsBuscaLancheItemING_NOME: TStringField;
    cdsBuscaLancheItemLAN_NOME: TStringField;
    cdsBuscaLancheItemING_VALOR: TFMTBCDField;
    cdsPedidosItem: TClientDataSet;
    cdsPedidosItemITE_NUMERO: TSmallintField;
    cdsPedidosItemLAN_CODIGO: TIntegerField;
    cdsPedidosItemLAN_NOME: TStringField;
    cdsPedidosItemDetalhe: TClientDataSet;
    cdsPedidosItemDetalheITE_NUMERO: TSmallintField;
    cdsPedidosItemDetalheLAN_CODIGO: TIntegerField;
    cdsPedidosItemDetalheLAN_ITEM: TSmallintField;
    cdsPedidosItemDetalheING_CODIGO: TIntegerField;
    cdsPedidosItemDetalheITE_QTDE: TSmallintField;
    cdsPedidosItemDetalheITE_VRUNIT: TFMTBCDField;
    cdsPedidosItemDetalheITE_TOTAL: TFMTBCDField;
    cdsPedidosItemDetalheING_NOME: TStringField;
    cdsPedidosItemDetalheLAN_NOME: TStringField;
    cdsGravaLanchesItemING_NOME: TStringField;
    cdsGravaPedidosItemLAN_NOME: TStringField;
    procedure cdsGravaIngredientesBeforeGetRecords(Sender: TObject;
      var OwnerData: OleVariant);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsGravaLanchesBeforeGetRecords(Sender: TObject;
      var OwnerData: OleVariant);
    procedure cdsGravaPedidosBeforeGetRecords(Sender: TObject;
      var OwnerData: OleVariant);
    procedure cdsCardapioLanchesBeforeGetRecords(Sender: TObject;
      var OwnerData: OleVariant);
  private
    FInstanceOwner: Boolean;
    FSMClient: TSMClient;
    ParametrosIngredientes, ParametrosLanches, ParametrosPedidos, ParametrosCardapioLanches: OleVariant;
    function GetSMClient: TSMClient;
    procedure ConfiguraConexaoServidor;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property SMClient: TSMClient read GetSMClient write FSMClient;
    function ConectaServidor(Conecta: Boolean): Boolean;
    procedure SetaParametrosCdsGravaIngredientes(NomeCampo, ValorCampo: string);
    procedure SetaParametrosCdsGravaLanches(NomeCampo, ValorCampo: string);
    procedure SetaParametrosCdsGravaPedidos(NomeCampo, ValorCampo: string);
    procedure SetaParametrosCdsCardapioLanches(NomeCampo, ValorCampo: string);
    function BuscaIngrediente(Codigo: Integer): Boolean;
    function BuscaLanche(Codigo: Integer): Boolean;

end;

var
  CM: TCM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TCM.BuscaIngrediente(Codigo: Integer): Boolean;
begin
  with CM do
  begin
    cdsBuscaIngrediente.close;
    cdsBuscaIngrediente.Params.ParamByName('CODIGO').AsInteger := Codigo;
    cdsBuscaIngrediente.Open;
    result := not cdsBuscaIngrediente.IsEmpty;
  end;
end;

function TCM.BuscaLanche(Codigo: Integer): Boolean;
begin
  with CM do
  begin
    cdsBuscaLanche.close;
    cdsBuscaLanche.Params.ParamByName('CODIGO').AsInteger := Codigo;
    cdsBuscaLanche.Open;
    result := not cdsBuscaLanche.IsEmpty;
  end;
end;

procedure TCM.cdsCardapioLanchesBeforeGetRecords(Sender: TObject;
  var OwnerData: OleVariant);
begin
  OwnerData := ParametrosCardapioLanches;
end;

procedure TCM.cdsGravaIngredientesBeforeGetRecords(Sender: TObject;
  var OwnerData: OleVariant);
begin
  OwnerData := ParametrosIngredientes;
end;

procedure TCM.cdsGravaLanchesBeforeGetRecords(Sender: TObject;
  var OwnerData: OleVariant);
begin
  OwnerData := ParametrosLanches;
end;

procedure TCM.cdsGravaPedidosBeforeGetRecords(Sender: TObject;
  var OwnerData: OleVariant);
begin
  OwnerData := ParametrosPedidos;
end;

function TCM.ConectaServidor(Conecta: Boolean): Boolean;
begin
  result := false;
  if Conecta then
  begin
    try
      sqlConnDatasnap.Connected := True;
      result := True;
    except
      on e:Exception do
      begin
        Application.MessageBox(PChar('Erro ao conectar no servidor de aplicação! Mensagem: '+e.Message),'Erro',MB_ICONERROR);
      end;
    end;
  end
  else
    sqlConnDatasnap.Connected := false;
end;

procedure TCM.ConfiguraConexaoServidor;
var ArqIni: TIniFile;
    EnderecoIP,Porta: string;
begin
  ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+ArquivoConfigCliente);
  try
    Porta := ArqIni.ReadString('CONFIG','CAMINHO','');
    EnderecoIP := ArqIni.ReadString('CONFIG','ENDERECO','');
    sqlConnDatasnap.Params.Values['HostName'] := EnderecoIP;
    sqlConnDatasnap.Params.Values['port'] := Porta;
  finally
    ArqIni.Free;
  end;
end;

constructor TCM.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

procedure TCM.DataModuleCreate(Sender: TObject);
begin
  ConfiguraConexaoServidor;
end;

destructor TCM.Destroy;
begin
  FSMClient.Free;
  inherited;
end;

function TCM.GetSMClient: TSMClient;
begin
  if FSMClient = nil then
  begin
    sqlConnDatasnap.Open;
    FSMClient:= TSMClient.Create(sqlConnDatasnap.DBXConnection, FInstanceOwner);
  end;
  Result := FSMClient;
end;

procedure TCM.SetaParametrosCdsCardapioLanches(NomeCampo, ValorCampo: string);
begin
  ParametrosCardapioLanches := VarArrayOf([NomeCampo,ValorCampo]);
end;

procedure TCM.SetaParametrosCdsGravaIngredientes(NomeCampo, ValorCampo: string);
begin
  ParametrosIngredientes := VarArrayOf([NomeCampo,ValorCampo]);
end;

procedure TCM.SetaParametrosCdsGravaLanches(NomeCampo, ValorCampo: string);
begin
  ParametrosLanches := VarArrayOf([NomeCampo,ValorCampo]);
end;

procedure TCM.SetaParametrosCdsGravaPedidos(NomeCampo, ValorCampo: string);
begin
  ParametrosPedidos := VarArrayOf([NomeCampo,ValorCampo]);
end;

end.
