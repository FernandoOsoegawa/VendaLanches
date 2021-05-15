unit uFrmConsultaCardapio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmConsultaCardapio = class(TForm)
    pgcCadastro: TPageControl;
    tabConsulta: TTabSheet;
    pnlOpcaoConsulta: TPanel;
    Label4: TLabel;
    btnSair: TButton;
    btnConsultar: TButton;
    cmbOpcao: TComboBox;
    edtCampo: TEdit;
    grbLancheItem: TGroupBox;
    dbgItem: TDBGrid;
    grbLanche: TGroupBox;
    dbgLanches: TDBGrid;
    dtsLanches: TDataSource;
    dtsItens: TDataSource;
    lblSelecionaRegistro: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbOpcaoClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgLanchesDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ModoSelecionaLanche: Boolean;
    CodigoLanche: Integer;
    function ValidaConsulta: Boolean;
    procedure BuscaItens(DataSet: TDataSet);
    procedure ConfiguraCamposTela;
  end;

var
  frmConsultaCardapio: TfrmConsultaCardapio;

implementation

uses
  uCM;

{$R *.dfm}

procedure TfrmConsultaCardapio.btnConsultarClick(Sender: TObject);
begin
  with CM do
  begin
    if ValidaConsulta then
    begin
      case cmbOpcao.ItemIndex of
        0: SetaParametrosCdsCardapioLanches('CODIGO',edtCampo.Text);
        1: SetaParametrosCdsCardapioLanches('NOME',edtCampo.Text);
        2: SetaParametrosCdsCardapioLanches('','');
      end;
      cdsCardapioLanches.Close;
      cdsCardapioLanches.Open;
      if cdsCardapioLanches.IsEmpty then
      begin
        cdsCardapioLanchesItem.Close;
        Application.MessageBox('A consulta não retornou resultados!','Aviso',MB_ICONWARNING);
      end;
    end
    else
    begin
      Application.MessageBox('Digite o valor do campo da consulta!','Aviso',MB_ICONWARNING);
      edtCampo.SetFocus;
    end;
  end;
end;

procedure TfrmConsultaCardapio.btnSairClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmConsultaCardapio.BuscaItens(DataSet: TDataSet);
begin
  with CM do
  begin
    if cdsCardapioLanches.IsEmpty then
      cdsCardapioLanchesItem.Close
    else
    begin
      cdsCardapioLanchesItem.Close;
      cdsCardapioLanchesItem.Params.ParamByName('CODIGO').AsInteger := cdsCardapioLanchesLAN_CODIGO.AsInteger;
      cdsCardapioLanchesItem.Open;
    end;
  end;
end;

procedure TfrmConsultaCardapio.cmbOpcaoClick(Sender: TObject);
begin
  edtCampo.Clear;
  edtCampo.Visible := True;
  case cmbOpcao.ItemIndex of
    0:
    begin
      edtCampo.NumbersOnly := True;
      edtCampo.SetFocus;
    end;
    1:
    begin
      edtCampo.NumbersOnly := false;
      edtCampo.SetFocus;
    end;
    2:
    begin
      edtCampo.Visible := false;
      btnConsultar.SetFocus;
    end;
  end;
end;

procedure TfrmConsultaCardapio.ConfiguraCamposTela;
begin
  edtCampo.CharCase := ecUpperCase;
end;

procedure TfrmConsultaCardapio.dbgLanchesDblClick(Sender: TObject);
begin
  if ModoSelecionaLanche then
  begin
    if CM.cdsCardapioLanches.IsEmpty then
      Exit;
    CodigoLanche := CM.cdsCardapioLanchesLAN_CODIGO.AsInteger;
    self.Close;
  end;
end;

procedure TfrmConsultaCardapio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CM.cdsCardapioLanches.Close;
  CM.cdsCardapioLanchesItem.Close;
  CM.cdsCardapioLanches.AfterScroll := nil;
end;

procedure TfrmConsultaCardapio.FormCreate(Sender: TObject);
begin
  ModoSelecionaLanche := False;
  CodigoLanche := 0;
  CM.cdsCardapioLanches.AfterScroll := BuscaItens;
  CM.cdsCardapioLanches.Close;
  CM.cdsCardapioLanchesItem.Close;
  ConfiguraCamposTela;
end;

procedure TfrmConsultaCardapio.FormShow(Sender: TObject);
begin
  lblSelecionaRegistro.Visible := ModoSelecionaLanche;
  cmbOpcao.ItemIndex := 2;
  cmbOpcaoClick(self);
end;

function TfrmConsultaCardapio.ValidaConsulta: Boolean;
begin
  result := false;
  case cmbOpcao.ItemIndex of
    0,1: result := edtCampo.Text <> '';
    2: result := True;
  end;
end;

end.
