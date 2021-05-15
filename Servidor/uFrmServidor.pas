unit uFrmServidor;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, System.IniFiles;

type
  TfrmServidor = class(TForm)
    btnExecutar: TBitBtn;
    edtPortaTCP: TEdit;
    Label1: TLabel;
    procedure btnExecutarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure LeGravaArquivoConfiguracao(Tipo: Char);
  public
    { Public declarations }
  end;

var
  frmServidor: TfrmServidor;

implementation

uses
  uSC, uSM;

{$R *.dfm}

procedure TfrmServidor.btnExecutarClick(Sender: TObject);
begin
  if btnExecutar.Tag = 0 then
  begin
    if uSC.SC.IniciaServidor(StrToIntDef(edtPortaTCP.Text,0)) then
    begin
      edtPortaTCP.Enabled := False;
      btnExecutar.Tag := 1;
      btnExecutar.Caption := 'Finalizar';
      LeGravaArquivoConfiguracao('G');
    end
    else
      Application.MessageBox(PChar('Erro ao iniciar o servidor! Verifique se a porta '+
        'está liberada no firewall do Windows.'),'Erro',MB_ICONWARNING);
  end
  else
  begin
    btnExecutar.Tag := 0;
    btnExecutar.Caption := 'Iniciar';
    edtPortaTCP.Enabled := True;
    uSC.SC.FinalizaServidor;
  end;
end;

procedure TfrmServidor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    uSC.SC.FinalizaServidor;
  except
  end;
end;

procedure TfrmServidor.FormCreate(Sender: TObject);
begin
  LeGravaArquivoConfiguracao('L');
end;

procedure TfrmServidor.LeGravaArquivoConfiguracao(Tipo: Char);
var ArqIni: TIniFile;
    Porta: string;
begin
  ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+ArquivoConfigServidor);
  try
    if Tipo = 'L' then
    begin
      Porta := ArqIni.ReadString('SERVIDOR','PORTA','211');
      edtPortaTCP.Text := Porta;
    end
    else
      ArqIni.WriteString('SERVIDOR','PORTA',edtPortaTCP.Text);
  finally
    ArqIni.Free;
  end;
end;

end.

