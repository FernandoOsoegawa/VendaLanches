program Servidor;

uses
  MidasLib,
  Windows,
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uFrmServidor in 'uFrmServidor.pas' {frmServidor},
  uSM in 'uSM.pas' {SM: TDSServerModule},
  uSC in 'uSC.pas' {SC: TDataModule};

{$R *.res}

var Handle: HWND;
begin
  Handle := FindWindow(Pchar($0),'Servidor de Aplica��o');
  if Handle = 0 then
  begin
    Application.Initialize;
    Application.MainFormOnTaskbar := false;
    Application.Title := 'Servidor de Aplica��o';
    Application.CreateForm(TSC, SC);
  Application.CreateForm(TfrmServidor, frmServidor);
  Application.Run;
  end
  else
  begin
    Application.MessageBox('A aplica��o servidor j� est� sendo executada!','Aviso',MB_ICONWARNING);
    Application.Terminate;
  end;
end.

