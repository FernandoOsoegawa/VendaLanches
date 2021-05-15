unit uFrmCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.AppEvnts;

type
  TFrmCliente = class(TForm)
    btnCadastroIngredientes: TButton;
    btnCadastroLanches: TButton;
    btnCadastroPedidos: TButton;
    btnConsultaCardapio: TButton;
    ApplicationEvents1: TApplicationEvents;
    procedure btnCadastroIngredientesClick(Sender: TObject);
    procedure btnCadastroLanchesClick(Sender: TObject);
    procedure btnCadastroPedidosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnConsultaCardapioClick(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
  private
    { Private declarations }
    procedure TrataErro(MensagemErro: string);
  public
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

uses
  uFrmCadastroLanches, uFrmCadastroPedidos, ufrmCadastroIngredientes, uCM, uFrmConsultaCardapio;

{$R *.dfm}

procedure TFrmCliente.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  TrataErro(UpperCase(e.Message));
end;

procedure TFrmCliente.btnCadastroIngredientesClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadastroIngredientes,frmCadastroIngredientes);
    frmCadastroIngredientes.ShowModal;
  finally
    FreeAndNil(frmCadastroIngredientes);
  end;
end;

procedure TFrmCliente.btnCadastroLanchesClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadastroLanches,frmCadastroLanches);
    frmCadastroLanches.ShowModal;
  finally
    FreeAndNil(frmCadastroLanches);
  end;
end;

procedure TFrmCliente.btnCadastroPedidosClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadastroPedidos,frmCadastroPedidos);
    frmCadastroPedidos.ShowModal;
  finally
    FreeAndNil(frmCadastroPedidos);
  end;
end;

procedure TFrmCliente.btnConsultaCardapioClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmConsultaCardapio,frmConsultaCardapio);
    frmConsultaCardapio.ShowModal;
  finally
    FreeAndNil(frmConsultaCardapio);
  end;
end;

procedure TFrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    CM.ConectaServidor(false);
  except
  end;
end;

procedure TFrmCliente.FormCreate(Sender: TObject);
var Conectado: Boolean;
begin
  Conectado := CM.ConectaServidor(true);
  btnCadastroIngredientes.Enabled := Conectado;
  btnCadastroLanches.Enabled := Conectado;
  btnCadastroPedidos.Enabled := Conectado;
  btnConsultaCardapio.Enabled := Conectado;
end;

procedure TFrmCliente.TrataErro(MensagemErro: string);
begin
  if Pos('IS NOT A VALID DATE', MensagemErro) > 0 then
    Application.MessageBox('Digite uma data válida no formato dd/mm/aaaa!','Aviso',MB_ICONWARNING)
  else if Pos('NUMBER IS OUT OF RANGE', MensagemErro) > 0 then
    Application.MessageBox('O valor do campo numérico digitado está acima do limite permitido! Digite novamente.', 'Aviso', MB_ICONWARNING)
  else if Pos('IS NOT A VALID BCD VALUE', MensagemErro) > 0 then
    Application.MessageBox('O valor do campo numérico digitado não está no formato adequado (casa decimal com 1 vírgula)! Digite novamente.', 'Aviso', MB_ICONWARNING)
  else
    Application.MessageBox(pchar('Ocorreu um erro inesperado! Mensagem: '+MensagemErro),'Erro',MB_ICONERROR);
end;

end.
