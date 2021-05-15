unit uSM;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, Data.DBXFirebird, Data.DB, Data.SqlExpr,
    System.IniFiles, Vcl.Forms, Data.FMTBcd, Datasnap.Provider,
    System.Variants;

const ArquivoConfigServidor = 'ConfigServidor.ini';

type
  TSM = class(TDSServerModule)
    sqlConnSrv: TSQLConnection;
    qryGravaLanches: TSQLQuery;
    qryGravaPedidos: TSQLQuery;
    qryGravaIngredientes: TSQLQuery;
    dspGravaPedidos: TDataSetProvider;
    dspGravaIngredientes: TDataSetProvider;
    qryConsulta: TSQLQuery;
    dspGravaLanches: TDataSetProvider;
    qryGravaPedidosItem: TSQLQuery;
    dspGravaPedidosItem: TDataSetProvider;
    qryGravaLanchesItem: TSQLQuery;
    dspGravaLanchesItem: TDataSetProvider;
    qryGravaIngredientesING_CODIGO: TIntegerField;
    qryGravaIngredientesING_NOME: TStringField;
    qryGravaIngredientesING_VALOR: TFMTBCDField;
    qryGravaLanchesLAN_CODIGO: TIntegerField;
    qryGravaLanchesLAN_NOME: TStringField;
    qryGravaLanchesLAN_VALOR: TFMTBCDField;
    qryGravaLanchesItemLAN_CODIGO: TIntegerField;
    qryGravaLanchesItemLAN_ITEM: TSmallintField;
    qryGravaLanchesItemING_CODIGO: TIntegerField;
    qryGravaLanchesItemLAN_QTDE: TSmallintField;
    qryDeletaItensLanche: TSQLQuery;
    qryGravaLanchesItemLAN_TOTAL: TFMTBCDField;
    qryGravaPedidosItemDetalhe: TSQLQuery;
    dspGravaPedidosItemDetalhe: TDataSetProvider;
    qryGravaPedidosPED_CODIGO: TIntegerField;
    qryGravaPedidosPED_DATA: TDateField;
    qryGravaPedidosPED_VRDESCONTO: TFMTBCDField;
    qryGravaPedidosPED_TOTALBRUTO: TFMTBCDField;
    qryGravaPedidosPED_TOTALLIQ: TFMTBCDField;
    qryGravaPedidosItemPED_CODIGO: TIntegerField;
    qryGravaPedidosItemITE_NUMERO: TSmallintField;
    qryGravaPedidosItemLAN_CODIGO: TIntegerField;
    qryGravaPedidosItemDetalhePED_CODIGO: TIntegerField;
    qryGravaPedidosItemDetalheITE_NUMERO: TSmallintField;
    qryGravaPedidosItemDetalheLAN_CODIGO: TIntegerField;
    qryGravaPedidosItemDetalheLAN_ITEM: TSmallintField;
    qryGravaPedidosItemDetalheING_CODIGO: TIntegerField;
    qryGravaPedidosItemDetalheITE_QTDE: TSmallintField;
    qryGravaPedidosItemDetalheITE_VRUNIT: TFMTBCDField;
    qryGravaPedidosItemDetalheITE_TOTAL: TFMTBCDField;
    qryGravaPedidosItemDetalheING_NOME: TStringField;
    qryDeletaItensPedido: TSQLQuery;
    qryGravaPedidosItemDetalheLAN_NOME: TStringField;
    qryBuscaIngrediente: TSQLQuery;
    dspBuscaIngrediente: TDataSetProvider;
    qryBuscaLanche: TSQLQuery;
    dspBuscaLanche: TDataSetProvider;
    qryBuscaIngredienteING_NOME: TStringField;
    qryBuscaIngredienteING_VALOR: TFMTBCDField;
    qryBuscaLancheLAN_NOME: TStringField;
    qryBuscaLancheLAN_VALOR: TFMTBCDField;
    qryCardapioLanches: TSQLQuery;
    dspCardapioLanches: TDataSetProvider;
    qryCardapioLanchesItem: TSQLQuery;
    dspCardapioLanchesItem: TDataSetProvider;
    qryCardapioLanchesLAN_CODIGO: TIntegerField;
    qryCardapioLanchesLAN_NOME: TStringField;
    qryCardapioLanchesLAN_VALOR: TFMTBCDField;
    qryCardapioLanchesItemLAN_CODIGO: TIntegerField;
    qryCardapioLanchesItemLAN_ITEM: TSmallintField;
    qryCardapioLanchesItemING_CODIGO: TIntegerField;
    qryCardapioLanchesItemLAN_QTDE: TSmallintField;
    qryCardapioLanchesItemLAN_TOTAL: TFMTBCDField;
    qryCardapioLanchesItemING_NOME: TStringField;
    qryBuscaLancheItem: TSQLQuery;
    dspBuscaLancheItem: TDataSetProvider;
    qryBuscaLancheItemLAN_CODIGO: TIntegerField;
    qryBuscaLancheItemLAN_ITEM: TSmallintField;
    qryBuscaLancheItemING_CODIGO: TIntegerField;
    qryBuscaLancheItemLAN_QTDE: TSmallintField;
    qryBuscaLancheItemLAN_TOTAL: TFMTBCDField;
    qryBuscaLancheItemING_NOME: TStringField;
    qryBuscaLancheItemLAN_NOME: TStringField;
    qryBuscaLancheItemING_VALOR: TFMTBCDField;
    qryGravaLanchesItemING_NOME: TStringField;
    qryGravaPedidosItemLAN_NOME: TStringField;
    procedure DSServerModuleCreate(Sender: TObject);
  private
    { Private declarations }
    function LeArquivoConfiguracao: string;
    procedure RecebeParametros(Sender: TObject; var OwnerData: OleVariant);
    procedure RecebeParametrosIngredientes(var OwnerData: OleVariant);
    procedure RecebeParametrosLanches(var OwnerData: OleVariant);
    procedure RecebeParametrosCardapioLanches(var OwnerData: OleVariant);
    procedure RecebeParametrosPedidos(var OwnerData: OleVariant);
    function GeraCodigo(Generator: string): Integer;
  public
    { Public declarations }
    function PermiteDeletarIngrediente(Codigo: Integer): Boolean;
    function PermiteDeletarLanche(Codigo: Integer): Boolean;
    function DeletaItensLanche(CodigoLanche: Integer): Boolean;
    function DeletaItensPedido(CodigoPedido: Integer): Boolean;
    function GeraCodigoLanche: Integer;
    function GeraCodigoIngrediente: Integer;
    function GeraCodigoPedido: Integer;
    function RetornaPercentualDesconto(QtdeLanches: Integer): Double;
    function ExisteIngrediente(Nome: string): Boolean;
    function ExisteLanche(Nome: string): Boolean;
  end;

implementation

{$R *.dfm}

function TSM.DeletaItensLanche(CodigoLanche: Integer): Boolean;
begin
  result := True;
  try
    qryDeletaItensLanche.Close;
    qryDeletaItensLanche.ParamByName('CODIGO').AsInteger := CodigoLanche;
    qryDeletaItensLanche.ExecSQL();
  except
    result := false;
  end;
  qryDeletaItensLanche.Close;
end;

function TSM.DeletaItensPedido(CodigoPedido: Integer): Boolean;
begin
  result := True;
  try
    qryDeletaItensPedido.Close;
    qryDeletaItensPedido.ParamByName('CODIGO').AsInteger := CodigoPedido;
    qryDeletaItensPedido.ExecSQL();
  except
    result := false;
  end;
  qryDeletaItensPedido.Close;
end;

procedure TSM.DSServerModuleCreate(Sender: TObject);
var ParametroDatabase: string;
begin
  ParametroDatabase := LeArquivoConfiguracao;
  sqlConnSrv.Params.Values['Database'] := ParametroDatabase;
  dspGravaPedidos.BeforeGetRecords := RecebeParametros;
  dspGravaLanches.BeforeGetRecords := RecebeParametros;
  dspGravaIngredientes.BeforeGetRecords := RecebeParametros;
  dspCardapioLanches.BeforeGetRecords := RecebeParametros;
end;

function TSM.ExisteIngrediente(Nome: string): Boolean;
begin
  qryConsulta.Close;
  qryConsulta.SQL.Text := 'select ING_CODIGO '+
                          'from INGREDIENTES '+
                          'where ING_NOME = :NOME';
  qryConsulta.ParamByName('NOME').AsString := Nome;
  qryConsulta.Open;
  result := not qryConsulta.IsEmpty;
  qryConsulta.close;
end;

function TSM.ExisteLanche(Nome: string): Boolean;
begin
  qryConsulta.Close;
  qryConsulta.SQL.Text := 'select LAN_CODIGO '+
                          'from LANCHES '+
                          'where LAN_NOME = :NOME';
  qryConsulta.ParamByName('NOME').AsString := Nome;
  qryConsulta.Open;
  result := not qryConsulta.IsEmpty;
  qryConsulta.close;
end;

function TSM.GeraCodigo(Generator: string): Integer;
begin
  qryConsulta.Close;
  qryConsulta.SQL.Text := 'select gen_id('+Generator+',1) as CODIGO '+
                          'from RDB$DATABASE';
  qryConsulta.Open;
  result := qryConsulta.FieldByName('CODIGO').AsInteger;
  qryConsulta.close;
end;

function TSM.GeraCodigoIngrediente: Integer;
begin
  result := GeraCodigo('GEN_INGREDIENTES');
end;

function TSM.GeraCodigoLanche: Integer;
begin
  result := GeraCodigo('GEN_LANCHES');
end;

function TSM.GeraCodigoPedido: Integer;
begin
  result := GeraCodigo('GEN_PEDIDOS');
end;

function TSM.LeArquivoConfiguracao: string;
var ArqIni: TIniFile;
    CaminhoBancoDados,EnderecoIP: string;
begin
  ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+ArquivoConfigServidor);
  try
    CaminhoBancoDados := ArqIni.ReadString('SERVIDOR','CAMINHO','');
    EnderecoIP := ArqIni.ReadString('SERVIDOR','ENDERECO','');
    Result := EnderecoIP + ':' + CaminhoBancoDados;
  finally
    ArqIni.Free;
  end;
end;

procedure TSM.RecebeParametros(Sender: TObject; var OwnerData: OleVariant);
begin
  if Sender = dspGravaIngredientes then
    RecebeParametrosIngredientes(OwnerData)
  else if Sender = dspGravaLanches then
    RecebeParametrosLanches(OwnerData)
  else if Sender = dspGravaPedidos then
    RecebeParametrosPedidos(OwnerData)
  else if Sender = dspCardapioLanches then
    RecebeParametrosCardapioLanches(OwnerData);
end;

procedure TSM.RecebeParametrosCardapioLanches(var OwnerData: OleVariant);
var NomeCampo,ValorCampo,sql: string;
begin
  if VarIsArray(OwnerData) and (VarArrayHighBound(OwnerData, 1) = 1) then
  begin
    NomeCampo := OwnerData[0];
    ValorCampo := OwnerData[1];
    sql := 'select LAN_CODIGO, LAN_NOME, LAN_VALOR '+
           'from LANCHES ';
    if NomeCampo = 'CODIGO' then
    begin
      sql := sql + ' where LAN_CODIGO = :CAMPO';
      qryCardapioLanches.SQL.Text := sql;
      qryCardapioLanches.ParamByName('CAMPO').AsInteger := StrToIntDef(ValorCampo,0);
    end
    else if NomeCampo = 'NOME' then
    begin
      sql := sql + ' where LAN_NOME like :CAMPO order by LAN_NOME';
      qryCardapioLanches.SQL.Text := sql;
      qryCardapioLanches.ParamByName('CAMPO').AsString := '%'+ValorCampo+'%';
    end
    else
    begin
      sql := sql + ' order by LAN_NOME';
      qryCardapioLanches.SQL.Text := sql;
    end;
  end;
end;

procedure TSM.RecebeParametrosIngredientes(var OwnerData: OleVariant);
var NomeCampo,ValorCampo,sql: string;
begin
  if VarIsArray(OwnerData) and (VarArrayHighBound(OwnerData, 1) = 1) then
  begin
    NomeCampo := OwnerData[0];
    ValorCampo := OwnerData[1];
    sql := 'select ING_CODIGO, ING_NOME, ING_VALOR '+
           'from INGREDIENTES ';
    if NomeCampo = 'CODIGO' then
    begin
      sql := sql + ' where ING_CODIGO = :CAMPO';
      qryGravaIngredientes.SQL.Text := sql;
      qryGravaIngredientes.ParamByName('CAMPO').AsInteger := StrToIntDef(ValorCampo,0);
    end
    else if NomeCampo = 'NOME' then
    begin
      sql := sql + ' where ING_NOME like :CAMPO order by ING_NOME';
      qryGravaIngredientes.SQL.Text := sql;
      qryGravaIngredientes.ParamByName('CAMPO').AsString := '%'+ValorCampo+'%';
    end
    else
    begin
      sql := sql + ' order by ING_NOME';
      qryGravaIngredientes.SQL.Text := sql;
    end;
  end;
end;

procedure TSM.RecebeParametrosLanches(var OwnerData: OleVariant);
var NomeCampo,ValorCampo,sql: string;
begin
  if VarIsArray(OwnerData) and (VarArrayHighBound(OwnerData, 1) = 1) then
  begin
    NomeCampo := OwnerData[0];
    ValorCampo := OwnerData[1];
    sql := 'select LAN_CODIGO, LAN_NOME, LAN_VALOR '+
           'from LANCHES ';
    if NomeCampo = 'CODIGO' then
    begin
      sql := sql + ' where LAN_CODIGO = :CAMPO';
      qryGravaLanches.SQL.Text := sql;
      qryGravaLanches.ParamByName('CAMPO').AsInteger := StrToIntDef(ValorCampo,0);
    end
    else if NomeCampo = 'NOME' then
    begin
      sql := sql + ' where LAN_NOME like :CAMPO order by LAN_NOME';
      qryGravaLanches.SQL.Text := sql;
      qryGravaLanches.ParamByName('CAMPO').AsString := '%'+ValorCampo+'%';
    end
    else
    begin
      sql := sql + ' order by LAN_NOME';
      qryGravaLanches.SQL.Text := sql;
    end;
  end;
end;

procedure TSM.RecebeParametrosPedidos(var OwnerData: OleVariant);
var NomeCampo,ValorCampo,sql: string;
begin
  if VarIsArray(OwnerData) and (VarArrayHighBound(OwnerData, 1) = 1) then
  begin
    NomeCampo := OwnerData[0];
    ValorCampo := OwnerData[1];
    sql := 'select PED_CODIGO, PED_DATA, PED_VRDESCONTO, PED_TOTALBRUTO, '+
           'PED_TOTALLIQ '+
           'from PEDIDOS ';
    if NomeCampo = 'CODIGO' then
    begin
      sql := sql + ' where PED_CODIGO = :CAMPO';
      qryGravaPedidos.SQL.Text := sql;
      qryGravaPedidos.ParamByName('CAMPO').AsInteger := StrToIntDef(ValorCampo,0);
    end
    else if NomeCampo = 'DATA' then
    begin
      sql := sql + ' where PED_DATA = :CAMPO order by PED_CODIGO';
      qryGravaPedidos.SQL.Text := sql;
      qryGravaPedidos.ParamByName('CAMPO').AsDate := StrToDateDef(ValorCampo,date);
    end
    else
    begin
      sql := sql + ' order by PED_CODIGO';
      qryGravaPedidos.SQL.Text := sql;
    end;
  end;
end;

function TSM.RetornaPercentualDesconto(QtdeLanches: Integer): Double;
var PercentualDesconto: Double;
begin
  // regra interna, poderia estar uma tabela para melhor controle e ser dinâmico
  if QtdeLanches = 2 then
    PercentualDesconto := 3
  else if QtdeLanches = 3 then
    PercentualDesconto := 5
  else if QtdeLanches >= 5 then
    PercentualDesconto := 10
  else
    PercentualDesconto := 0;
  Result := PercentualDesconto;
end;

function TSM.PermiteDeletarIngrediente(Codigo: Integer): Boolean;
begin
  qryConsulta.Close;
  qryConsulta.SQL.Text := 'select first 1 LAN_CODIGO '+
                          'from LANCHES_ITEM '+
                          'where ING_CODIGO = :CODIGO';
  qryConsulta.ParamByName('CODIGO').AsInteger := Codigo;
  qryConsulta.Open;
  result := not qryConsulta.IsEmpty;
  qryConsulta.close;
end;

function TSM.PermiteDeletarLanche(Codigo: Integer): Boolean;
begin
  qryConsulta.Close;
  qryConsulta.SQL.Text := 'select first 1 LAN_CODIGO '+
                          'from PEDIDOS_ITEM '+
                          'where LAN_CODIGO = :CODIGO';
  qryConsulta.ParamByName('CODIGO').AsInteger := Codigo;
  qryConsulta.Open;
  result := not qryConsulta.IsEmpty;
  qryConsulta.close;
end;

end.

