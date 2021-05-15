unit ufrmCadastroIngredientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadastroIngredientes = class(TForm)
    dtsIngredientes: TDataSource;
    pgcCadastro: TPageControl;
    tabConsulta: TTabSheet;
    tabCadastro: TTabSheet;
    Label1: TLabel;
    edtING_CODIGO: TDBEdit;
    Label2: TLabel;
    edtING_NOME: TDBEdit;
    Label3: TLabel;
    edtING_VALOR: TDBEdit;
    pnlOpcaoConsulta: TPanel;
    btnSair: TButton;
    btnConsultar: TButton;
    Label4: TLabel;
    cmbOpcao: TComboBox;
    edtCampo: TEdit;
    dbgIngredientes: TDBGrid;
    pnlEdit: TPanel;
    btnInserir: TButton;
    btnEditar: TButton;
    btnDeletar: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    lblSelecionaRegistro: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure cmbOpcaoClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgcCadastroChange(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgIngredientesDblClick(Sender: TObject);
  private
    { Private declarations }
    function ValidaConsulta: Boolean;
    function ValidaCadastro: Boolean;
    procedure HabilitaCampos(Habilita: Boolean);
    procedure ConfiguraCamposTela;
  public
    { Public declarations }
    ModoSelecionaIngrediente: Boolean;
    CodigoIngrediente: Integer;
  end;

var
  frmCadastroIngredientes: TfrmCadastroIngredientes;

implementation

uses
  uCM;

{$R *.dfm}

procedure TfrmCadastroIngredientes.btnCancelarClick(Sender: TObject);
begin
  CM.cdsGravaIngredientes.Cancel;
  HabilitaCampos(false);
end;

procedure TfrmCadastroIngredientes.btnConsultarClick(Sender: TObject);
begin
  with CM do
  begin
    if ValidaConsulta then
    begin
      case cmbOpcao.ItemIndex of
        0: SetaParametroscdsGravaIngredientes('CODIGO',edtCampo.Text);
        1: SetaParametroscdsGravaIngredientes('NOME',edtCampo.Text);
        2: SetaParametroscdsGravaIngredientes('','');
      end;
      cdsGravaIngredientes.Close;
      cdsGravaIngredientes.Open;
      HabilitaCampos(false);
      if cdsGravaIngredientes.IsEmpty then
        Application.MessageBox('A consulta não retornou resultados!','Aviso',MB_ICONWARNING);
    end
    else
    begin
      Application.MessageBox('Digite o valor do campo da consulta!','Aviso',MB_ICONWARNING);
      edtCampo.SetFocus;
    end;
  end;
end;

procedure TfrmCadastroIngredientes.btnDeletarClick(Sender: TObject);
begin
  with CM do
  begin
    if Application.MessageBox('Deseja realmente deletar o ingrediente?','Aviso',MB_ICONWARNING+MB_YESNO+MB_DEFBUTTON2) = ID_YES then
    begin
      if CM.SMClient.PermiteDeletarIngrediente(cdsGravaIngredientesING_CODIGO.AsInteger) then
      begin
        Application.MessageBox('Não é permitido deletar este ingrediente, pois já foi feito um pedido com ele!',
          'Aviso',MB_ICONWARNING);
        Exit;
      end;

      cdsGravaIngredientes.Delete;
      if cdsGravaIngredientes.ApplyUpdates(0) = 0 then
        Application.MessageBox('Ingrediente deletado com sucesso!','Aviso',MB_ICONINFORMATION)
      else
        Application.MessageBox('Erro ao deletar Ingrediente!','Aviso',MB_ICONERROR);
      cdsGravaIngredientes.close;
      cdsGravaIngredientes.Open;
      HabilitaCampos(false);
      pgcCadastro.ActivePageIndex := 0;
    end;
  end;
end;

procedure TfrmCadastroIngredientes.btnEditarClick(Sender: TObject);
begin
  CM.cdsGravaIngredientes.Edit;
  HabilitaCampos(true);
  edtING_NOME.SetFocus;
end;

procedure TfrmCadastroIngredientes.btnInserirClick(Sender: TObject);
begin
  with CM do
  begin
    cdsGravaIngredientes.Append;
    cdsGravaIngredientesING_VALOR.AsFloat := 0;
    HabilitaCampos(true);
    edtING_NOME.SetFocus;
  end;
end;

procedure TfrmCadastroIngredientes.btnSairClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmCadastroIngredientes.btnSalvarClick(Sender: TObject);
begin
  with CM do
  begin
    if ValidaCadastro then
    begin
      if cdsGravaIngredientes.State = dsInsert then
        cdsGravaIngredientesING_CODIGO.AsInteger := CM.SMClient.GeraCodigoIngrediente;
      cdsGravaIngredientes.Post;
      if cdsGravaIngredientes.ApplyUpdates(0) = 0 then
      begin
        Application.MessageBox('Ingrediente gravado com sucesso!','Aviso',MB_ICONINFORMATION);
      end
      else
        Application.MessageBox('Erro ao gravar Ingrediente!','Aviso',MB_ICONERROR);
      HabilitaCampos(false);
    end;
  end;
end;

procedure TfrmCadastroIngredientes.cmbOpcaoClick(Sender: TObject);
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

procedure TfrmCadastroIngredientes.ConfiguraCamposTela;
begin
  edtING_CODIGO.Enabled := false;
  edtING_NOME.CharCase := ecUpperCase;
  edtCampo.CharCase := ecUpperCase;
end;

procedure TfrmCadastroIngredientes.dbgIngredientesDblClick(Sender: TObject);
begin
  if ModoSelecionaIngrediente then
  begin
    if CM.cdsGravaIngredientes.IsEmpty then
      Exit;
    CodigoIngrediente := CM.cdsGravaIngredientesING_CODIGO.AsInteger;
    self.Close;
  end
  else
    pgcCadastro.ActivePageIndex := 1;
end;

procedure TfrmCadastroIngredientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CM.cdsGravaIngredientes.Close;
end;

procedure TfrmCadastroIngredientes.FormCreate(Sender: TObject);
begin
  with CM do
  begin
    CodigoIngrediente := 0;
    ModoSelecionaIngrediente := false;
    ConfiguraCamposTela;
    SetaParametroscdsGravaIngredientes('CODIGO','0');
    cdsGravaIngredientes.close;
    cdsGravaIngredientes.Open;
  end;
end;

procedure TfrmCadastroIngredientes.FormShow(Sender: TObject);
begin
  pgcCadastro.ActivePageIndex := 0;
  cmbOpcao.ItemIndex := 2;
  cmbOpcaoClick(self);
  HabilitaCampos(false);
  tabCadastro.TabVisible := not ModoSelecionaIngrediente;
  lblSelecionaRegistro.Visible := ModoSelecionaIngrediente;
  if ModoSelecionaIngrediente then
    self.Caption := 'Pesquisa de Ingredientes'
  else
    self.Caption := 'Cadastro de Ingredientes';
end;

procedure TfrmCadastroIngredientes.HabilitaCampos(Habilita: Boolean);
begin
  with CM do
  begin
    btnInserir.Enabled := not (cdsGravaIngredientes.State in [dsInsert,dsEdit]);
    btnEditar.Enabled := (cdsGravaIngredientes.State = dsBrowse) and (not cdsGravaIngredientes.IsEmpty);
    btnDeletar.Enabled := (cdsGravaIngredientes.State = dsBrowse) and (not cdsGravaIngredientes.IsEmpty);
    btnSalvar.Enabled := (cdsGravaIngredientes.State in [dsInsert,dsEdit]);
    btnCancelar.Enabled := (cdsGravaIngredientes.State in [dsInsert,dsEdit]);
    edtING_NOME.Enabled := Habilita;
    edtING_VALOR.Enabled := Habilita;
    dbgIngredientes.Enabled := not Habilita;
    dbgIngredientes.Repaint;
  end;
end;

procedure TfrmCadastroIngredientes.pgcCadastroChange(Sender: TObject);
begin
  if CM.cdsGravaIngredientes.State in [dsInsert,dsEdit] then
  begin
    pgcCadastro.ActivePageIndex := 1;
    Application.MessageBox('Cancele ou salve o ingrediente antes de mudar de aba!','Aviso',MB_ICONWARNING);
  end;
end;

function TfrmCadastroIngredientes.ValidaCadastro: Boolean;
begin
  with CM do
  begin
    result := false;
    if cdsGravaIngredientesING_NOME.AsString = '' then
    begin
      Application.MessageBox('Digite o nome do ingrediente!','Aviso',MB_ICONWARNING);
      Exit;
    end
    else if cdsGravaIngredientesING_VALOR.AsFloat <= 0 then
    begin
      Application.MessageBox('Digite o valor do ingrediente!','Aviso',MB_ICONWARNING);
      Exit;
    end
    else if (cdsGravaIngredientes.State = dsInsert) and
            (SMClient.ExisteIngrediente(cdsGravaIngredientesING_NOME.AsString)) then
    begin
      Application.MessageBox('Já existe um ingrediente com este nome! Digite outro valor.','Aviso',MB_ICONWARNING);
      Exit;
    end;
    result := True;
  end;
end;

function TfrmCadastroIngredientes.ValidaConsulta: Boolean;
begin
  result := false;
  case cmbOpcao.ItemIndex of
    0,1: result := edtCampo.Text <> '';
    2: result := True;
  end;
end;

end.
