unit uCC;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TSMClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
    FPermiteDeletarIngredienteCommand: TDBXCommand;
    FPermiteDeletarLancheCommand: TDBXCommand;
    FDeletaItensLancheCommand: TDBXCommand;
    FDeletaItensPedidoCommand: TDBXCommand;
    FGeraCodigoLancheCommand: TDBXCommand;
    FGeraCodigoIngredienteCommand: TDBXCommand;
    FGeraCodigoPedidoCommand: TDBXCommand;
    FRetornaPercentualDescontoCommand: TDBXCommand;
    FExisteIngredienteCommand: TDBXCommand;
    FExisteLancheCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
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

procedure TSMClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TSM.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
  end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;

function TSMClient.PermiteDeletarIngrediente(Codigo: Integer): Boolean;
begin
  if FPermiteDeletarIngredienteCommand = nil then
  begin
    FPermiteDeletarIngredienteCommand := FDBXConnection.CreateCommand;
    FPermiteDeletarIngredienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermiteDeletarIngredienteCommand.Text := 'TSM.PermiteDeletarIngrediente';
    FPermiteDeletarIngredienteCommand.Prepare;
  end;
  FPermiteDeletarIngredienteCommand.Parameters[0].Value.SetInt32(Codigo);
  FPermiteDeletarIngredienteCommand.ExecuteUpdate;
  Result := FPermiteDeletarIngredienteCommand.Parameters[1].Value.GetBoolean;
end;

function TSMClient.PermiteDeletarLanche(Codigo: Integer): Boolean;
begin
  if FPermiteDeletarLancheCommand = nil then
  begin
    FPermiteDeletarLancheCommand := FDBXConnection.CreateCommand;
    FPermiteDeletarLancheCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermiteDeletarLancheCommand.Text := 'TSM.PermiteDeletarLanche';
    FPermiteDeletarLancheCommand.Prepare;
  end;
  FPermiteDeletarLancheCommand.Parameters[0].Value.SetInt32(Codigo);
  FPermiteDeletarLancheCommand.ExecuteUpdate;
  Result := FPermiteDeletarLancheCommand.Parameters[1].Value.GetBoolean;
end;

function TSMClient.DeletaItensLanche(CodigoLanche: Integer): Boolean;
begin
  if FDeletaItensLancheCommand = nil then
  begin
    FDeletaItensLancheCommand := FDBXConnection.CreateCommand;
    FDeletaItensLancheCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDeletaItensLancheCommand.Text := 'TSM.DeletaItensLanche';
    FDeletaItensLancheCommand.Prepare;
  end;
  FDeletaItensLancheCommand.Parameters[0].Value.SetInt32(CodigoLanche);
  FDeletaItensLancheCommand.ExecuteUpdate;
  Result := FDeletaItensLancheCommand.Parameters[1].Value.GetBoolean;
end;

function TSMClient.DeletaItensPedido(CodigoPedido: Integer): Boolean;
begin
  if FDeletaItensPedidoCommand = nil then
  begin
    FDeletaItensPedidoCommand := FDBXConnection.CreateCommand;
    FDeletaItensPedidoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDeletaItensPedidoCommand.Text := 'TSM.DeletaItensPedido';
    FDeletaItensPedidoCommand.Prepare;
  end;
  FDeletaItensPedidoCommand.Parameters[0].Value.SetInt32(CodigoPedido);
  FDeletaItensPedidoCommand.ExecuteUpdate;
  Result := FDeletaItensPedidoCommand.Parameters[1].Value.GetBoolean;
end;

function TSMClient.GeraCodigoLanche: Integer;
begin
  if FGeraCodigoLancheCommand = nil then
  begin
    FGeraCodigoLancheCommand := FDBXConnection.CreateCommand;
    FGeraCodigoLancheCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGeraCodigoLancheCommand.Text := 'TSM.GeraCodigoLanche';
    FGeraCodigoLancheCommand.Prepare;
  end;
  FGeraCodigoLancheCommand.ExecuteUpdate;
  Result := FGeraCodigoLancheCommand.Parameters[0].Value.GetInt32;
end;

function TSMClient.GeraCodigoIngrediente: Integer;
begin
  if FGeraCodigoIngredienteCommand = nil then
  begin
    FGeraCodigoIngredienteCommand := FDBXConnection.CreateCommand;
    FGeraCodigoIngredienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGeraCodigoIngredienteCommand.Text := 'TSM.GeraCodigoIngrediente';
    FGeraCodigoIngredienteCommand.Prepare;
  end;
  FGeraCodigoIngredienteCommand.ExecuteUpdate;
  Result := FGeraCodigoIngredienteCommand.Parameters[0].Value.GetInt32;
end;

function TSMClient.GeraCodigoPedido: Integer;
begin
  if FGeraCodigoPedidoCommand = nil then
  begin
    FGeraCodigoPedidoCommand := FDBXConnection.CreateCommand;
    FGeraCodigoPedidoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGeraCodigoPedidoCommand.Text := 'TSM.GeraCodigoPedido';
    FGeraCodigoPedidoCommand.Prepare;
  end;
  FGeraCodigoPedidoCommand.ExecuteUpdate;
  Result := FGeraCodigoPedidoCommand.Parameters[0].Value.GetInt32;
end;

function TSMClient.RetornaPercentualDesconto(QtdeLanches: Integer): Double;
begin
  if FRetornaPercentualDescontoCommand = nil then
  begin
    FRetornaPercentualDescontoCommand := FDBXConnection.CreateCommand;
    FRetornaPercentualDescontoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornaPercentualDescontoCommand.Text := 'TSM.RetornaPercentualDesconto';
    FRetornaPercentualDescontoCommand.Prepare;
  end;
  FRetornaPercentualDescontoCommand.Parameters[0].Value.SetInt32(QtdeLanches);
  FRetornaPercentualDescontoCommand.ExecuteUpdate;
  Result := FRetornaPercentualDescontoCommand.Parameters[1].Value.GetDouble;
end;

function TSMClient.ExisteIngrediente(Nome: string): Boolean;
begin
  if FExisteIngredienteCommand = nil then
  begin
    FExisteIngredienteCommand := FDBXConnection.CreateCommand;
    FExisteIngredienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FExisteIngredienteCommand.Text := 'TSM.ExisteIngrediente';
    FExisteIngredienteCommand.Prepare;
  end;
  FExisteIngredienteCommand.Parameters[0].Value.SetWideString(Nome);
  FExisteIngredienteCommand.ExecuteUpdate;
  Result := FExisteIngredienteCommand.Parameters[1].Value.GetBoolean;
end;

function TSMClient.ExisteLanche(Nome: string): Boolean;
begin
  if FExisteLancheCommand = nil then
  begin
    FExisteLancheCommand := FDBXConnection.CreateCommand;
    FExisteLancheCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FExisteLancheCommand.Text := 'TSM.ExisteLanche';
    FExisteLancheCommand.Prepare;
  end;
  FExisteLancheCommand.Parameters[0].Value.SetWideString(Nome);
  FExisteLancheCommand.ExecuteUpdate;
  Result := FExisteLancheCommand.Parameters[1].Value.GetBoolean;
end;

constructor TSMClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TSMClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TSMClient.Destroy;
begin
  FDSServerModuleCreateCommand.DisposeOf;
  FPermiteDeletarIngredienteCommand.DisposeOf;
  FPermiteDeletarLancheCommand.DisposeOf;
  FDeletaItensLancheCommand.DisposeOf;
  FDeletaItensPedidoCommand.DisposeOf;
  FGeraCodigoLancheCommand.DisposeOf;
  FGeraCodigoIngredienteCommand.DisposeOf;
  FGeraCodigoPedidoCommand.DisposeOf;
  FRetornaPercentualDescontoCommand.DisposeOf;
  FExisteIngredienteCommand.DisposeOf;
  FExisteLancheCommand.DisposeOf;
  inherited;
end;

end.

