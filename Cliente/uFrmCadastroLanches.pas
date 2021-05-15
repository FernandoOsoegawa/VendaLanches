unit uFrmCadastroLanches;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Datasnap.DBClient;

type
  TfrmCadastroLanches = class(TForm)
    pgcCadastro: TPageControl;
    tabConsulta: TTabSheet;
    pnlOpcaoConsulta: TPanel;
    Label4: TLabel;
    btnSair: TButton;
    btnConsultar: TButton;
    cmbOpcao: TComboBox;
    edtCampo: TEdit;
    dbgLanches: TDBGrid;
    tabCadastro: TTabSheet;
    pnlEdit: TPanel;
    btnInserirLanche: TButton;
    btnEditarLanche: TButton;
    btnDeletarLanche: TButton;
    btnSalvarLanche: TButton;
    btnCancelarLanche: TButton;
    dtsLanches: TDataSource;
    grbLancheItem: TGroupBox;
    dbgItem: TDBGrid;
    dtsItem: TDataSource;
    pnlItem: TPanel;
    Label5: TLabel;
    edtITEM: TDBEdit;
    edtCODIGO: TDBEdit;
    Label6: TLabel;
    edtNOME: TDBEdit;
    Label7: TLabel;
    edtQTDE: TDBEdit;
    Label8: TLabel;
    btnLocalizaIngrediente: TBitBtn;
    pnlDados: TPanel;
    Label1: TLabel;
    edtLAN_CODIGO: TDBEdit;
    Label2: TLabel;
    edtLAN_NOME: TDBEdit;
    Label3: TLabel;
    edtLAN_VALOR: TDBEdit;
    pnlEditItem: TPanel;
    btnInserirItem: TButton;
    btnEditarItem: TButton;
    btnDeletarItem: TButton;
    btnSalvarItem: TButton;
    btnCancelarItem: TButton;
    edtTOTAL: TDBEdit;
    Label9: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure cmbOpcaoClick(Sender: TObject);
    procedure btnCancelarLancheClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnDeletarLancheClick(Sender: TObject);
    procedure btnEditarLancheClick(Sender: TObject);
    procedure btnInserirLancheClick(Sender: TObject);
    procedure btnSalvarLancheClick(Sender: TObject);
    procedure dbgLanchesDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgcCadastroChange(Sender: TObject);
    procedure edtCODIGOExit(Sender: TObject);
    procedure btnLocalizaIngredienteClick(Sender: TObject);
    procedure btnInserirItemClick(Sender: TObject);
    procedure btnEditarItemClick(Sender: TObject);
    procedure btnDeletarItemClick(Sender: TObject);
    procedure btnSalvarItemClick(Sender: TObject);
    procedure btnCancelarItemClick(Sender: TObject);
    procedure edtQTDEExit(Sender: TObject);
    procedure tabCadastroShow(Sender: TObject);
  private
    { Private declarations }
    function ValidaConsulta: Boolean;
    function ValidaCadastroLanche: Boolean;
    function ValidaCadastroItem: Boolean;
    procedure HabilitaCampos(Habilita: Boolean);
    procedure HabilitaCamposItem(Habilita: Boolean);
    procedure ConfiguraCamposTela;
    procedure LimpaDadosItem;
    function CalculaTotalLanche: Double;
    procedure AtualizaTotalLanche;
    procedure CalculaTotalItem;
    procedure CarregaItens(Codigo: Integer);
  public
    { Public declarations }
  end;

var
  frmCadastroLanches: TfrmCadastroLanches;

implementation

uses
  uCM, ufrmCadastroIngredientes;

{$R *.dfm}

procedure TfrmCadastroLanches.AtualizaTotalLanche;
begin
  CM.cdsGravaLanchesLAN_VALOR.AsFloat := CalculaTotalLanche;
end;

procedure TfrmCadastroLanches.btnCancelarLancheClick(Sender: TObject);
begin
  CM.cdsGravaLanches.Cancel;
  if not CM.cdsGravaLanches.IsEmpty then
    CarregaItens(CM.cdsGravaLanchesLAN_CODIGO.AsInteger)
  else
    LimpaDadosItem;
  HabilitaCampos(false);
  HabilitaCamposItem(false);
end;

procedure TfrmCadastroLanches.btnCancelarItemClick(Sender: TObject);
begin
  CM.cdsLanchesItem.Cancel;
  HabilitaCamposItem(false);
end;

procedure TfrmCadastroLanches.btnConsultarClick(Sender: TObject);
begin
  with CM do
  begin
    if ValidaConsulta then
    begin
      case cmbOpcao.ItemIndex of
        0: SetaParametroscdsGravaLanches('CODIGO',edtCampo.Text);
        1: SetaParametroscdsGravaLanches('NOME',edtCampo.Text);
        2: SetaParametroscdsGravaLanches('','');
      end;
      LimpaDadosItem;
      cdsGravaLanches.Close;
      cdsGravaLanches.Open;
      HabilitaCampos(false);
      HabilitaCamposItem(false);
      if cdsGravaLanches.IsEmpty then
        Application.MessageBox('A consulta não retornou resultados!','Aviso',MB_ICONWARNING);
    end
    else
    begin
      Application.MessageBox('Digite o valor do campo da consulta!','Aviso',MB_ICONWARNING);
      edtCampo.SetFocus;
    end;
  end;
end;

procedure TfrmCadastroLanches.btnDeletarLancheClick(Sender: TObject);
begin
  with CM do
  begin
    if Application.MessageBox('Deseja realmente deletar o lanche?','Aviso',MB_ICONWARNING+MB_YESNO+MB_DEFBUTTON2) = ID_YES then
    begin
      if CM.SMClient.PermiteDeletarLanche(cdsGravaLanchesLAN_CODIGO.AsInteger) then
      begin
        Application.MessageBox('Não é permitido deletar este lanche, pois já foi feito um pedido com ele!',
          'Aviso',MB_ICONWARNING);
        Exit;
      end;

      cdsGravaLanches.Delete;
      if cdsGravaLanches.ApplyUpdates(0) = 0 then
        Application.MessageBox('Lanche deletado com sucesso!','Aviso',MB_ICONINFORMATION)
      else
        Application.MessageBox('Erro ao deletar lanche!','Aviso',MB_ICONERROR);
      cdsGravaLanches.close;
      cdsGravaLanches.Open;
      LimpaDadosItem;
      HabilitaCampos(false);
      HabilitaCamposItem(false);
      pgcCadastro.ActivePageIndex := 0;
    end;
  end;
end;

procedure TfrmCadastroLanches.btnDeletarItemClick(Sender: TObject);
begin
  with CM do
  begin
    if Application.MessageBox('Deseja realmente deletar o item?','Aviso',MB_ICONWARNING+MB_YESNO+MB_DEFBUTTON2) = ID_YES then
    begin
      cdsLanchesItem.Delete;
      HabilitaCamposItem(false);
      AtualizaTotalLanche;
    end;
  end;
end;

procedure TfrmCadastroLanches.btnEditarLancheClick(Sender: TObject);
begin
  CM.cdsGravaLanches.Edit;
  HabilitaCampos(true);
  HabilitaCamposItem(false);
  edtLAN_NOME.SetFocus;
end;

procedure TfrmCadastroLanches.btnEditarItemClick(Sender: TObject);
begin
  CM.cdsLanchesItem.Edit;
  HabilitaCamposItem(true);
  CM.BuscaIngrediente(CM.cdsLanchesItemCODIGO.AsInteger);
  edtQTDE.SetFocus;
end;

procedure TfrmCadastroLanches.btnInserirLancheClick(Sender: TObject);
begin
  with CM do
  begin
    LimpaDadosItem;
    cdsGravaLanches.Append;
    cdsGravaLanchesLAN_VALOR.AsFloat := 0;
    HabilitaCampos(true);
    HabilitaCamposItem(false);
    edtLAN_NOME.SetFocus;
  end;
end;

procedure TfrmCadastroLanches.btnInserirItemClick(Sender: TObject);
begin
  with CM do
  begin
    cdsLanchesItem.Append;
    cdsLanchesItemITEM.AsInteger := cdsLanchesItem.RecordCount+1;
    cdsLanchesItemCODIGO.AsInteger := 0;
    cdsLanchesItemQTDE.AsInteger := 0;
    HabilitaCamposItem(true);
    edtCODIGO.SetFocus;
  end;
end;

procedure TfrmCadastroLanches.btnLocalizaIngredienteClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadastroIngredientes,frmCadastroIngredientes);
    frmCadastroIngredientes.ModoSelecionaIngrediente := true;
    frmCadastroIngredientes.ShowModal;
    if frmCadastroIngredientes.CodigoIngrediente > 0 then
    begin
      CM.cdsLanchesItemCODIGO.AsInteger := frmCadastroIngredientes.CodigoIngrediente;
      edtCODIGOExit(self);
      edtQTDE.SetFocus;
    end;
  finally
    FreeAndNil(frmCadastroIngredientes);
  end;
end;

procedure TfrmCadastroLanches.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmCadastroLanches.btnSalvarLancheClick(Sender: TObject);
var CodigoLanche: Integer;
    NovoRegistro: Boolean;
begin
  with CM do
  begin
    if ValidaCadastroLanche then
    begin
      if cdsGravaLanches.State = dsInsert then
      begin
        NovoRegistro := True;
        CodigoLanche := CM.SMClient.GeraCodigoLanche;
        cdsGravaLanchesLAN_CODIGO.AsInteger := CodigoLanche;
      end
      else
      begin
        NovoRegistro := False;
        CodigoLanche := cdsGravaLanchesLAN_CODIGO.AsInteger;
      end;
      cdsGravaLanches.Post;
      if cdsGravaLanches.ApplyUpdates(0) = 0 then
      begin
        if (NovoRegistro) or
           ((not NovoRegistro) and (SMClient.DeletaItensLanche(CodigoLanche))) then
        begin
          cdsGravaLanchesItem.Close;
          cdsGravaLanchesItem.Params.ParamByName('CODIGO').AsInteger := 0;
          cdsGravaLanchesItem.Open;
          cdsLanchesItem.DisableControls;
          cdsLanchesItem.First;
          while not cdsLanchesItem.Eof do
          begin
            cdsGravaLanchesItem.Append;
            cdsGravaLanchesItemLAN_CODIGO.AsInteger := CodigoLanche;
            cdsGravaLanchesItemLAN_ITEM.AsInteger := cdsLanchesItemITEM.AsInteger;
            cdsGravaLanchesItemING_CODIGO.AsInteger := cdsLanchesItemCODIGO.AsInteger;
            cdsGravaLanchesItemLAN_QTDE.AsInteger := cdsLanchesItemQTDE.AsInteger;
            cdsGravaLanchesItemLAN_TOTAL.AsFloat := cdsLanchesItemTOTAL.AsFloat;
            cdsGravaLanchesItem.Post;
            cdsLanchesItem.Next;
          end;
          cdsLanchesItem.First;
          cdsLanchesItem.EnableControls;
          if cdsGravaLanchesItem.ApplyUpdates(0) = 0 then
            Application.MessageBox('Lanche gravado com sucesso!','Aviso',MB_ICONINFORMATION)
          else
            Application.MessageBox('Erro ao gravar itens do Lanche!','Aviso',MB_ICONERROR);
        end
        else
          Application.MessageBox('Erro ao gravar itens do Lanche!','Aviso',MB_ICONERROR);
      end
      else
        Application.MessageBox('Erro ao gravar Lanche!','Aviso',MB_ICONERROR);
      HabilitaCampos(false);
      HabilitaCamposItem(false);
    end;
  end;
end;

procedure TfrmCadastroLanches.btnSalvarItemClick(Sender: TObject);
begin
  with CM do
  begin
    if ValidaCadastroItem then
    begin
      CalculaTotalItem;
      cdsLanchesItem.Post;
      AtualizaTotalLanche;
      HabilitaCamposItem(false);
    end;
  end;
end;

procedure TfrmCadastroLanches.CalculaTotalItem;
begin
  with CM do
  begin
    if not cdsBuscaIngrediente.IsEmpty then
    begin
      cdsLanchesItemTOTAL.AsFloat := cdsBuscaIngredienteING_VALOR.AsFloat * cdsLanchesItemQTDE.AsInteger;
    end;
  end;
end;

function TfrmCadastroLanches.CalculaTotalLanche: Double;
var cdsLanchesItemCalc: TClientDataSet;
begin
  with CM do
  begin
    result := 0;
    if cdsLanchesItem.IsEmpty then
      Exit;
    try
      cdsLanchesItemCalc := TClientDataSet.Create(self);
      cdsLanchesItemCalc.CloneCursor(cdsLanchesItem,True,false);
      cdsLanchesItemCalc.First;
      while not cdsLanchesItemCalc.Eof do
      begin
        result := result + cdsLanchesItemCalc.FieldByName('TOTAL').AsFloat;
        cdsLanchesItemCalc.Next;
      end;
    finally
      FreeAndNil(cdsLanchesItemCalc);
    end;
  end;
end;

procedure TfrmCadastroLanches.CarregaItens(Codigo: Integer);
begin
  with CM do
  begin
    LimpaDadosItem;
    cdsLanchesItem.DisableControls;
    cdsGravaLanchesItem.Close;
    cdsGravaLanchesItem.Params.ParamByName('CODIGO').AsInteger := Codigo;
    cdsGravaLanchesItem.Open;
    while not cdsGravaLanchesItem.Eof do
    begin
      cdsLanchesItem.Append;
      cdsLanchesItemITEM.AsInteger := cdsGravaLanchesItemLAN_ITEM.AsInteger;
      cdsLanchesItemCODIGO.AsInteger := cdsGravaLanchesItemING_CODIGO.AsInteger;
      cdsLanchesItemNOME.AsString :=  cdsGravaLanchesItemING_NOME.AsString;
      cdsLanchesItemQTDE.AsInteger := cdsGravaLanchesItemLAN_QTDE.AsInteger;
      cdsLanchesItemTOTAL.AsFloat := cdsGravaLanchesItemLAN_TOTAL.AsFloat;
      cdsLanchesItem.Post;
      cdsGravaLanchesItem.Next;
    end;
    cdsLanchesItem.First;
    cdsLanchesItem.EnableControls;
  end;
end;

procedure TfrmCadastroLanches.cmbOpcaoClick(Sender: TObject);
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

procedure TfrmCadastroLanches.ConfiguraCamposTela;
begin
  edtLAN_CODIGO.Enabled := false;
  edtLAN_NOME.CharCase := ecUpperCase;
  edtLAN_VALOR.Enabled := false;
  edtITEM.Enabled := false;
  btnLocalizaIngrediente.TabStop := false;
  edtNOME.Enabled := False;
  edtTOTAL.Enabled := False;
  edtCampo.CharCase := ecUpperCase;
end;

procedure TfrmCadastroLanches.dbgLanchesDblClick(Sender: TObject);
begin
  pgcCadastro.ActivePageIndex := 1;
end;

procedure TfrmCadastroLanches.edtCODIGOExit(Sender: TObject);
begin
  with CM do
  begin
    if cdsLanchesItemCODIGO.AsInteger > 0 then
    begin
      if CM.BuscaIngrediente(cdsLanchesItemCODIGO.AsInteger) then
        cdsLanchesItemNOME.AsString := cdsBuscaIngredienteING_NOME.AsString
      else
      begin
        cdsLanchesItemCODIGO.AsInteger := 0;
        cdsLanchesItemNOME.AsString := '';
        Application.MessageBox('Selecione um ingrediente válido!','Aviso',MB_ICONWARNING);
      end;
    end;
  end;
end;

procedure TfrmCadastroLanches.edtQTDEExit(Sender: TObject);
begin
  CalculaTotalItem;
end;

procedure TfrmCadastroLanches.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CM.cdsGravaLanches.Close;
  CM.cdsGravaLanchesItem.Close;
  CM.cdsBuscaIngrediente.Close;
end;

procedure TfrmCadastroLanches.FormCreate(Sender: TObject);
begin
  with CM do
  begin
    ConfiguraCamposTela;
    LimpaDadosItem;
    SetaParametroscdsGravaLanches('CODIGO','0');
    cdsGravaLanches.close;
    cdsGravaLanches.Open;
  end;
end;

procedure TfrmCadastroLanches.FormShow(Sender: TObject);
begin
  pgcCadastro.ActivePageIndex := 0;
  cmbOpcao.ItemIndex := 2;
  cmbOpcaoClick(self);
  HabilitaCampos(false);
  HabilitaCamposItem(false);
end;

procedure TfrmCadastroLanches.HabilitaCampos(Habilita: Boolean);
begin
  with CM do
  begin
    btnInserirLanche.Enabled := not (cdsGravaLanches.State in [dsInsert,dsEdit]);
    btnEditarLanche.Enabled := (cdsGravaLanches.State = dsBrowse) and (not cdsGravaLanches.IsEmpty);
    btnDeletarLanche.Enabled := (cdsGravaLanches.State = dsBrowse) and (not cdsGravaLanches.IsEmpty);
    btnSalvarLanche.Enabled := (cdsGravaLanches.State in [dsInsert,dsEdit]);
    btnCancelarLanche.Enabled := (cdsGravaLanches.State in [dsInsert,dsEdit]);
    edtLAN_NOME.Enabled := Habilita;
    dbgLanches.Enabled := not Habilita;
    dbgLanches.Repaint;
  end;
end;

procedure TfrmCadastroLanches.HabilitaCamposItem(Habilita: Boolean);
begin
  with CM do
  begin
    btnInserirItem.Enabled := (btnSalvarLanche.Enabled) and (not (cdsLanchesItem.State in [dsInsert,dsEdit]));
    btnEditarItem.Enabled := (btnSalvarLanche.Enabled) and (cdsLanchesItem.State = dsBrowse) and (not cdsLanchesItem.IsEmpty);
    btnDeletarItem.Enabled := (btnSalvarLanche.Enabled) and (cdsLanchesItem.State = dsBrowse) and (not cdsLanchesItem.IsEmpty);
    btnSalvarItem.Enabled := (btnSalvarLanche.Enabled) and (cdsLanchesItem.State in [dsInsert,dsEdit]);
    btnCancelarItem.Enabled := (btnSalvarLanche.Enabled) and (cdsLanchesItem.State in [dsInsert,dsEdit]);
    edtCODIGO.Enabled := Habilita;
    btnLocalizaIngrediente.Enabled := Habilita;
    edtQTDE.Enabled := Habilita;
    dbgItem.Enabled := not Habilita;
    dbgItem.Repaint;
  end;
end;

procedure TfrmCadastroLanches.LimpaDadosItem;
begin
  with CM do
  begin
    cdsLanchesItem.Close;
    cdsLanchesItem.CreateDataSet;
    cdsLanchesItem.Open;
  end;
end;

procedure TfrmCadastroLanches.pgcCadastroChange(Sender: TObject);
begin
  if (CM.cdsGravaLanches.State in [dsInsert,dsEdit]) or
     (CM.cdsLanchesItem.State in [dsInsert,dsEdit]) then
  begin
    pgcCadastro.ActivePageIndex := 1;
    Application.MessageBox('Cancele ou salve o lanche e os ingredientes antes de mudar de aba!','Aviso',MB_ICONWARNING);
  end;
end;

procedure TfrmCadastroLanches.tabCadastroShow(Sender: TObject);
begin
  if CM.cdsGravaLanches.IsEmpty then
    LimpaDadosItem
  else if CM.cdsGravaLanches.State = dsBrowse then
    CarregaItens(CM.cdsGravaLanchesLAN_CODIGO.AsInteger);
end;

function TfrmCadastroLanches.ValidaCadastroLanche: Boolean;
begin
  with CM do
  begin
    result := false;
    if cdsGravaLanchesLAN_NOME.AsString = '' then
    begin
      Application.MessageBox('Digite o nome do lanche!','Aviso',MB_ICONWARNING);
      Exit;
    end
    else if (cdsGravaLanchesLAN_VALOR.AsFloat <= 0) or (cdsLanchesItem.IsEmpty) then
    begin
      Application.MessageBox('Selecione ingredientes para o lanche!','Aviso',MB_ICONWARNING);
      Exit;
    end
    else if (btnSalvarItem.Enabled) then
    begin
      Application.MessageBox('Salve ou cancele o item antes de salvar o lanche!','Aviso',MB_ICONWARNING);
      Exit;
    end
    else if (cdsGravaLanches.State = dsInsert) and (SMClient.ExisteLanche(cdsGravaLanchesLAN_NOME.AsString)) then
    begin
      Application.MessageBox('Já existe um lanche com este nome! Digite outro valor.','Aviso',MB_ICONWARNING);
      Exit;
    end;
    result := True;
  end;
end;

function TfrmCadastroLanches.ValidaCadastroItem: Boolean;
var cdsVerificaNumeroItem: TClientDataSet;
begin
  with CM do
  begin
    result := false;
    if cdsLanchesItemITEM.AsInteger <= 0 then
    begin
      Application.MessageBox('O número do item deve ser maior que zero!','Aviso',MB_ICONWARNING);
      Exit;
    end
    else if (cdsLanchesItemCODIGO.AsInteger <= 0) or (cdsLanchesItemNOME.AsString = '') then
    begin
      Application.MessageBox('Selecione um ingrediente válido para o lanche!','Aviso',MB_ICONWARNING);
      Exit;
    end
    else if cdsLanchesItemQTDE.AsInteger <= 0 then
    begin
      Application.MessageBox('Selecione uma quantidade para o ingrediente do lanche!','Aviso',MB_ICONWARNING);
      Exit;
    end;

    if (cdsLanchesItem.State = dsInsert) and (cdsLanchesItem.RecordCount > 0) then
    begin
      try
        cdsVerificaNumeroItem := TClientDataSet.Create(self);
        cdsVerificaNumeroItem.CloneCursor(cdsLanchesItem,True,false);
        if cdsVerificaNumeroItem.Locate('ITEM',cdsLanchesItemITEM.AsInteger,[]) then
        begin
          Application.MessageBox(PChar('Já existe um registro com o item número '+cdsLanchesItemITEM.AsString+'!'),'Aviso',MB_ICONWARNING);
          Exit;
        end;
      finally
        FreeAndNil(cdsVerificaNumeroItem);
      end;
    end;
    result := True;
  end;
end;

function TfrmCadastroLanches.ValidaConsulta: Boolean;
begin
  result := false;
  case cmbOpcao.ItemIndex of
    0,1: result := edtCampo.Text <> '';
    2: result := True;
  end;
end;

end.
