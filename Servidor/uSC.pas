unit uSC;

interface

uses System.SysUtils, System.Classes,
  Datasnap.DSTCPServerTransport,
  Datasnap.DSServer, Datasnap.DSCommonServer,
  IPPeerServer, IPPeerAPI, Datasnap.DSAuth;

type
  TSC = class(TDataModule)
    DSServer1: TDSServer;
    DSTCPServerTransport1: TDSTCPServerTransport;
    DSServerClass1: TDSServerClass;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  private
    { Private declarations }
  public
    function IniciaServidor(PortaTCP: Integer): Boolean;
    procedure FinalizaServidor;
  end;

var
  SC: TSC;

implementation

{$R *.dfm}

uses
  uSM;

procedure TSC.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSM.TSM;
end;

procedure TSC.FinalizaServidor;
begin
  if DSServer1.Started then
    DSServer1.Stop;
end;

function TSC.IniciaServidor(PortaTCP: Integer): Boolean;
begin
  Result := true;
  DSTCPServerTransport1.Port := PortaTCP;
  try
    DSServer1.Start;
  except
    Result := False;
  end;
end;

end.

