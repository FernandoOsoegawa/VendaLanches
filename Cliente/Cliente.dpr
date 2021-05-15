program Cliente;

uses
  MidasLib,
  Windows,
  Vcl.Forms,
  uFrmCliente in 'uFrmCliente.pas' {FrmCliente},
  uFrmCadastroLanches in 'uFrmCadastroLanches.pas' {frmCadastroLanches},
  ufrmCadastroIngredientes in 'ufrmCadastroIngredientes.pas' {frmCadastroIngredientes},
  uFrmCadastroPedidos in 'uFrmCadastroPedidos.pas' {frmCadastroPedidos},
  uCC in 'uCC.pas',
  uCM in 'uCM.pas' {CM: TDataModule},
  uFrmConsultaCardapio in 'uFrmConsultaCardapio.pas' {frmConsultaCardapio};

{$R *.res}

var Handle: HWND;
begin
  Handle := FindWindow(Pchar($0),'Cliente - Venda de Lanches');
  if Handle = 0 then
  begin
    Application.Initialize;
    Application.MainFormOnTaskbar := false;
    Application.Title := 'Cliente - Venda de Lanches';
    Application.CreateForm(TCM, CM);
    Application.CreateForm(TFrmCliente, FrmCliente);
    Application.Run;
  end
  else
  begin
    Application.MessageBox('A aplicação cliente já está sendo executada!','Aviso',MB_ICONWARNING);
    Application.Terminate;
  end;
end.
