unit uFrmCadastroPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  Datasnap.DBClient, System.Math;

const TP_PEDIDO = 1;
const TP_ITEM = 2;
const TP_INGREDIENTE = 3;

type
  TfrmCadastroPedidos = class(TForm)
    pgcCadastro: TPageControl;
    tabConsulta: TTabSheet;
    pnlOpcaoConsulta: TPanel;
    Label4: TLabel;
    btnSair: TButton;
    btnConsultar: TButton;
    cmbOpcao: TComboBox;
    edtCampo: TEdit;
    dbgPedido: TDBGrid;
    tabCadastro: TTabSheet;
    pnlEdit: TPanel;
    btnInserirPedido: TButton;
    btnEditarPedido: TButton;
    btnDeletarPedido: TButton;
    btnSalvarPedido: TButton;
    btnCancelarPedido: TButton;
    pnlDados: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtPED_CODIGO: TDBEdit;
    edtPED_DATA: TDBEdit;
    edtPED_VRDESCONTO: TDBEdit;
    Label10: TLabel;
    edtPED_TOTALBRUTO: TDBEdit;
    Label11: TLabel;
    edtPED_TOTALLIQ: TDBEdit;
    pgcItem: TPageControl;
    tabPedidoItem: TTabSheet;
    tabPedidoItemDetalhe: TTabSheet;
    pnlEditItem: TPanel;
    btnInserirItem: TButton;
    btnEditarItem: TButton;
    btnDeletarItem: TButton;
    btnSalvarItem: TButton;
    btnCancelarItem: TButton;
    pnlItem: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtITE_NUMERO: TDBEdit;
    edtLAN_CODIGO: TDBEdit;
    edtLAN_NOME: TDBEdit;
    btnLocalizaLanches: TBitBtn;
    dbgPedidoItem: TDBGrid;
    pnlEditItemDetalhe: TPanel;
    btnInserirIngrediente: TButton;
    btnEditarIngrediente: TButton;
    btnDeletarIngrediente: TButton;
    btnSalvarIngrediente: TButton;
    btnCancelarIngrediente: TButton;
    pnlItemDetalhe: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edtLAN_ITEM: TDBEdit;
    edtING_CODIGO: TDBEdit;
    edtING_NOME: TDBEdit;
    edtITE_QTDE: TDBEdit;
    btnLocalizaIngrediente: TBitBtn;
    edtITE_TOTAL: TDBEdit;
    dbgPedidoItemDetalhe: TDBGrid;
    dtsPedido: TDataSource;
    dtsPedidoItem: TDataSource;
    dtsPedidoItemDetalhe: TDataSource;
    edtCampoData: TDateTimePicker;
    Label8: TLabel;
    edtITE_VRUNIT: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarPedidoClick(Sender: TObject);
    procedure btnCancelarItemClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnDeletarPedidoClick(Sender: TObject);
    procedure btnDeletarItemClick(Sender: TObject);
    procedure btnEditarPedidoClick(Sender: TObject);
    procedure btnEditarItemClick(Sender: TObject);
    procedure btnInserirPedidoClick(Sender: TObject);
    procedure btnInserirItemClick(Sender: TObject);
    procedure btnLocalizaIngredienteClick(Sender: TObject);
    procedure btnSalvarPedidoClick(Sender: TObject);
    procedure btnSalvarItemClick(Sender: TObject);
    procedure cmbOpcaoClick(Sender: TObject);
    procedure dbgPedidoDblClick(Sender: TObject);
    procedure edtING_CODIGOExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure pgcCadastroChange(Sender: TObject);
    procedure tabCadastroShow(Sender: TObject);
    procedure btnLocalizaLanchesClick(Sender: TObject);
    procedure edtLAN_CODIGOExit(Sender: TObject);
    procedure edtITE_QTDEExit(Sender: TObject);
    procedure edtITE_VRUNITExit(Sender: TObject);
    procedure btnInserirIngredienteClick(Sender: TObject);
    procedure btnEditarIngredienteClick(Sender: TObject);
    procedure btnDeletarIngredienteClick(Sender: TObject);
    procedure btnSalvarIngredienteClick(Sender: TObject);
    procedure btnCancelarIngredienteClick(Sender: TObject);
    procedure dbgPedidoItemDblClick(Sender: TObject);
    procedure tabPedidoItemDetalheShow(Sender: TObject);
    procedure pgcItemChange(Sender: TObject);
  private
    { Private declarations }
    function ValidaConsulta: Boolean;
    function ValidaCadastro(Tipo: Integer): Boolean;
    procedure HabilitaCampos(Tipo: Integer; Habilita: Boolean);
    procedure ConfiguraCamposTela;
    procedure CalculaTotalItemIngrediente;
    procedure CarregaDadosPedido(Codigo: Integer);
    procedure AtualizaTotalPedido;
    procedure InsereItemDetalhe(Item, CodigoLanche: Integer);
    procedure FiltraItemDetalhe(Item: Integer);
    procedure LimpaDadosItem;
    procedure LimpaDadosItemDetalhe;
    function GravaPedido: integer;
    function GravaPedidoItem(CodigoPedido: Integer): Boolean;
    function GravaPedidoItemDetalhe(CodigoPedido: Integer): Boolean;

  public
    { Public declarations }
  end;

var
  frmCadastroPedidos: TfrmCadastroPedidos;

implementation

uses
  uCM, ufrmCadastroIngredientes, uFrmConsultaCardapio;

{$R *.dfm}

procedure TfrmCadastroPedidos.AtualizaTotalPedido;
var CdsItemCalc: TClientDataSet;
    ValorBruto,ValorDesconto,PercentualDesconto: Double;
begin
  with CM do
  begin
    ValorBruto := 0;
    ValorDesconto := 0;
    if not cdsPedidosItem.IsEmpty then
    begin
      PercentualDesconto := CM.SMClient.RetornaPercentualDesconto(cdsPedidosItem.RecordCount);
      try
        CdsItemCalc := TClientDataSet.Create(self);
        CdsItemCalc.CloneCursor(cdsPedidosItemDetalhe,True,false);
        CdsItemCalc.First;
        while not CdsItemCalc.Eof do
        begin
          ValorBruto := ValorBruto + CdsItemCalc.FieldByName('ITE_TOTAL').AsFloat;
          CdsItemCalc.Next;
        end;
        if PercentualDesconto > 0 then
          ValorDesconto := SimpleRoundTo(ValorBruto * PercentualDesconto/100,-2);
      finally
        FreeAndNil(CdsItemCalc);
      end;
    end;
    cdsGravaPedidosPED_TOTALBRUTO.AsFloat := ValorBruto;
    cdsGravaPedidosPED_VRDESCONTO.AsFloat := ValorDesconto;
    cdsGravaPedidosPED_TOTALLIQ.AsFloat := ValorBruto - ValorDesconto;
  end;
end;

procedure TfrmCadastroPedidos.btnCancelarIngredienteClick(Sender: TObject);
begin
  CM.cdsPedidosItemDetalhe.Cancel;
  HabilitaCampos(TP_INGREDIENTE,false);
end;

procedure TfrmCadastroPedidos.btnCancelarItemClick(Sender: TObject);
begin
  CM.cdsPedidosItem.Cancel;
  HabilitaCampos(TP_ITEM,false);
end;

procedure TfrmCadastroPedidos.btnCancelarPedidoClick(Sender: TObject);
begin
  CM.cdsGravaPedidos.Cancel;
  if not CM.cdsGravaPedidos.IsEmpty then
    CarregaDadosPedido(CM.cdsGravaPedidosPED_CODIGO.AsInteger)
  else
    CarregaDadosPedido(0);
  HabilitaCampos(TP_PEDIDO,false);
  HabilitaCampos(TP_ITEM,false);
  HabilitaCampos(TP_INGREDIENTE,false);
  pgcItem.ActivePageIndex := 0;
end;

procedure TfrmCadastroPedidos.btnConsultarClick(Sender: TObject);
begin
  with CM do
  begin
    if ValidaConsulta then
    begin
      pgcItem.ActivePageIndex := 0;
      case cmbOpcao.ItemIndex of
        0: SetaParametrosCdsGravaPedidos('CODIGO',edtCampo.Text);
        1: SetaParametrosCdsGravaPedidos('DATA',FormatDateTime('dd/mm/yyyy',edtCampoData.date));
        2: SetaParametrosCdsGravaPedidos('','');
      end;
      cdsGravaPedidos.Close;
      cdsGravaPedidos.Open;
      CarregaDadosPedido(0);
      HabilitaCampos(TP_PEDIDO,false);
      HabilitaCampos(TP_ITEM,false);
      HabilitaCampos(TP_INGREDIENTE,false);
      if cdsGravaPedidos.IsEmpty then
        Application.MessageBox('A consulta não retornou resultados!','Aviso',MB_ICONWARNING);
    end
    else
    begin
      Application.MessageBox('Digite o valor do campo da consulta!','Aviso',MB_ICONWARNING);
      if edtCampo.Visible then
        edtCampo.SetFocus
      else if edtCampoData.Visible then
        edtCampoData.SetFocus
    end;
  end;
end;

procedure TfrmCadastroPedidos.btnDeletarIngredienteClick(Sender: TObject);
begin
  with CM do
  begin
    if Application.MessageBox('Deseja realmente deletar o ingrediente?','Aviso',MB_ICONWARNING+MB_YESNO+MB_DEFBUTTON2) = ID_YES then
    begin
      cdsPedidosItemDetalhe.Delete;
      HabilitaCampos(TP_INGREDIENTE,false);
      AtualizaTotalPedido;
    end;
  end;
end;

procedure TfrmCadastroPedidos.btnDeletarItemClick(Sender: TObject);
var Item: Integer;
begin
  with CM do
  begin
    if Application.MessageBox('Deseja realmente deletar o item?','Aviso',MB_ICONWARNING+MB_YESNO+MB_DEFBUTTON2) = ID_YES then
    begin
      Item := cdsPedidosItemITE_NUMERO.AsInteger;
      cdsPedidosItem.Delete;
      FiltraItemDetalhe(0);
      while cdsPedidosItemDetalhe.Locate('ITE_NUMERO',Item,[]) do
        cdsPedidosItemDetalhe.Delete;
      if not cdsPedidosItem.IsEmpty then
        FiltraItemDetalhe(cdsPedidosItemITE_NUMERO.AsInteger);
      HabilitaCampos(TP_ITEM,false);
      HabilitaCampos(TP_INGREDIENTE,False);
      AtualizaTotalPedido;
    end;
  end;
end;

procedure TfrmCadastroPedidos.btnDeletarPedidoClick(Sender: TObject);
begin
  with CM do
  begin
    if Application.MessageBox('Deseja realmente deletar o pedido?','Aviso',MB_ICONWARNING+MB_YESNO+MB_DEFBUTTON2) = ID_YES then
    begin
      cdsGravaPedidos.Delete;
      if cdsGravaPedidos.ApplyUpdates(0) = 0 then
        Application.MessageBox('Pedido deletado com sucesso!','Aviso',MB_ICONINFORMATION)
      else
        Application.MessageBox('Erro ao deletar pedido!','Aviso',MB_ICONERROR);
      cdsGravaPedidos.close;
      cdsGravaPedidos.Open;
      CarregaDadosPedido(0);
      HabilitaCampos(TP_PEDIDO,false);
      HabilitaCampos(TP_ITEM,false);
      HabilitaCampos(TP_INGREDIENTE,false);
      pgcCadastro.ActivePageIndex := 0;
      pgcItem.ActivePageIndex := 0;
    end;
  end;
end;

procedure TfrmCadastroPedidos.btnEditarIngredienteClick(Sender: TObject);
begin
  CM.cdsPedidosItemDetalhe.Edit;
  HabilitaCampos(TP_INGREDIENTE,true);
  edtITE_QTDE.SetFocus;
end;

procedure TfrmCadastroPedidos.btnEditarItemClick(Sender: TObject);
begin
  CM.cdsPedidosItem.Edit;
  HabilitaCampos(TP_ITEM,true);
  edtLAN_CODIGO.SetFocus;
end;

procedure TfrmCadastroPedidos.btnEditarPedidoClick(Sender: TObject);
begin
  CM.cdsGravaPedidos.Edit;
  HabilitaCampos(TP_PEDIDO,true);
  HabilitaCampos(TP_ITEM,false);
  HabilitaCampos(TP_INGREDIENTE,false);
  edtPED_DATA.SetFocus;
end;

procedure TfrmCadastroPedidos.btnInserirIngredienteClick(Sender: TObject);
begin
  with CM do
  begin
    cdsPedidosItemDetalhe.Append;
    cdsPedidosItemDetalheITE_NUMERO.AsInteger := cdsPedidosItemITE_NUMERO.AsInteger;
    cdsPedidosItemDetalheLAN_CODIGO.AsInteger := cdsPedidosItemLAN_CODIGO.AsInteger;
    cdsPedidosItemDetalheLAN_ITEM.AsInteger := cdsPedidosItemDetalhe.RecordCount + 1;
    cdsPedidosItemDetalheING_CODIGO.AsInteger := 0;
    cdsPedidosItemDetalheITE_QTDE.AsInteger := 0;
    cdsPedidosItemDetalheITE_VRUNIT.AsFloat := 0;
    cdsPedidosItemDetalheITE_TOTAL.AsFloat := 0;
    HabilitaCampos(TP_INGREDIENTE,true);
    edtING_CODIGO.SetFocus;
  end;
end;

procedure TfrmCadastroPedidos.btnInserirItemClick(Sender: TObject);
begin
  with CM do
  begin
    cdsPedidosItem.Append;
    cdsPedidosItemITE_NUMERO.AsInteger := cdsPedidosItem.RecordCount + 1;
    cdsPedidosItemLAN_CODIGO.AsInteger := 0;
    HabilitaCampos(TP_ITEM,true);
    edtLAN_CODIGO.SetFocus;
  end;
end;

procedure TfrmCadastroPedidos.btnInserirPedidoClick(Sender: TObject);
begin
  with CM do
  begin
    pgcItem.ActivePageIndex := 0;
    CarregaDadosPedido(0);
    cdsGravaPedidos.Append;
    cdsGravaPedidosPED_DATA.AsDateTime := Date;
    cdsGravaPedidosPED_TOTALBRUTO.AsFloat := 0;
    cdsGravaPedidosPED_TOTALLIQ.AsFloat := 0;
    cdsGravaPedidosPED_VRDESCONTO.AsFloat := 0;
    HabilitaCampos(TP_PEDIDO,true);
    HabilitaCampos(TP_ITEM,false);
    HabilitaCampos(TP_INGREDIENTE,false);
    edtPED_DATA.SetFocus;
  end;
end;

procedure TfrmCadastroPedidos.btnLocalizaIngredienteClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadastroIngredientes,frmCadastroIngredientes);
    frmCadastroIngredientes.ModoSelecionaIngrediente := true;
    frmCadastroIngredientes.ShowModal;
    if frmCadastroIngredientes.CodigoIngrediente > 0 then
      CM.cdsPedidosItemDetalheING_CODIGO.AsInteger := frmCadastroIngredientes.CodigoIngrediente;
    edtING_CODIGOExit(self);
    edtITE_QTDE.SetFocus;
  finally
    FreeAndNil(frmCadastroIngredientes);
  end;
end;

procedure TfrmCadastroPedidos.btnLocalizaLanchesClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmConsultaCardapio,frmConsultaCardapio);
    frmConsultaCardapio.ModoSelecionaLanche := true;
    frmConsultaCardapio.ShowModal;
    if frmConsultaCardapio.CodigoLanche > 0 then
      CM.cdsPedidosItemLAN_CODIGO.AsInteger := frmConsultaCardapio.CodigoLanche;
    edtLAN_CODIGOExit(self);
  finally
    FreeAndNil(frmConsultaCardapio);
  end;
end;

procedure TfrmCadastroPedidos.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmCadastroPedidos.btnSalvarIngredienteClick(Sender: TObject);
begin
  with CM do
  begin
    if ValidaCadastro(TP_INGREDIENTE) then
    begin
      cdsPedidosItemDetalhe.Post;
      AtualizaTotalPedido;
      HabilitaCampos(TP_INGREDIENTE,false);
    end;
  end;
end;

procedure TfrmCadastroPedidos.btnSalvarItemClick(Sender: TObject);
begin
  with CM do
  begin
    if ValidaCadastro(TP_ITEM) then
    begin
      cdsPedidosItem.Post;
      InsereItemDetalhe(cdsPedidosItemITE_NUMERO.AsInteger,cdsPedidosItemLAN_CODIGO.AsInteger);
      AtualizaTotalPedido;
      HabilitaCampos(TP_ITEM,false);
      HabilitaCampos(TP_INGREDIENTE,False);
    end;
  end;
end;

procedure TfrmCadastroPedidos.btnSalvarPedidoClick(Sender: TObject);
var CodigoPedido: Integer;
begin
  with CM do
  begin
    if ValidaCadastro(TP_PEDIDO) then
    begin
      pgcItem.ActivePageIndex := 0;
      CodigoPedido := GravaPedido;
      if CodigoPedido > 0 then
      begin
        if GravaPedidoItem(CodigoPedido) then
        begin
          if GravaPedidoItemDetalhe(CodigoPedido) then
            Application.MessageBox('Pedido gravado com sucesso!','Aviso',MB_ICONINFORMATION)
          else
            Application.MessageBox('Erro ao gravar detalhes do itens do Pedido!','Aviso',MB_ICONERROR);
        end
        else
          Application.MessageBox('Erro ao gravar itens do Pedido!','Aviso',MB_ICONERROR);
      end
      else
        Application.MessageBox('Erro ao gravar Pedido!','Aviso',MB_ICONERROR);
      if not cdsPedidosItem.IsEmpty then
        FiltraItemDetalhe(cdsPedidosItemITE_NUMERO.AsInteger);
      HabilitaCampos(TP_PEDIDO,false);
      HabilitaCampos(TP_ITEM,false);
      HabilitaCampos(TP_INGREDIENTE,false);
    end;
  end;
end;

procedure TfrmCadastroPedidos.CalculaTotalItemIngrediente;
begin
  CM.cdsPedidosItemDetalheITE_TOTAL.AsFloat := CM.cdsPedidosItemDetalheITE_QTDE.AsInteger *
    CM.cdsPedidosItemDetalheITE_VRUNIT.AsFloat;
end;

procedure TfrmCadastroPedidos.CarregaDadosPedido(Codigo: Integer);
begin
  with CM do
  begin
    LimpaDadosItem;
    LimpaDadosItemDetalhe;

    // itens
    cdsPedidosItem.DisableControls;
    cdsGravaPedidosItem.Close;
    cdsGravaPedidosItem.Params.ParamByName('CODIGO').AsInteger := Codigo;
    cdsGravaPedidosItem.Open;
    while not cdsGravaPedidosItem.Eof do
    begin
      cdsPedidosItem.Append;
      cdsPedidosItemITE_NUMERO.AsInteger := cdsGravaPedidosItemITE_NUMERO.AsInteger;
      cdsPedidosItemLAN_CODIGO.AsInteger := cdsGravaPedidosItemLAN_CODIGO.AsInteger;
      cdsPedidosItemLAN_NOME.AsString := cdsGravaPedidosItemLAN_NOME.AsString;
      cdsPedidosItem.Post;
      cdsGravaPedidosItem.Next;
    end;
    if not cdsGravaPedidosItem.IsEmpty then
      cdsGravaPedidosItem.First;
    cdsPedidosItem.EnableControls;

    // itens detalhe
    cdsPedidosItemDetalhe.DisableControls;
    FiltraItemDetalhe(0);
    cdsGravaPedidosItemDetalhe.Close;
    cdsGravaPedidosItemDetalhe.Params.ParamByName('CODIGO').AsInteger := Codigo;
    cdsGravaPedidosItemDetalhe.Open;
    while not cdsGravaPedidosItemDetalhe.Eof do
    begin
      cdsPedidosItemDetalhe.Append;
      cdsPedidosItemDetalheITE_NUMERO.AsInteger := cdsGravaPedidosItemDetalheITE_NUMERO.AsInteger;
      cdsPedidosItemDetalheLAN_CODIGO.AsInteger := cdsGravaPedidosItemDetalheLAN_CODIGO.AsInteger;
      cdsPedidosItemDetalheLAN_ITEM.AsInteger := cdsGravaPedidosItemDetalheLAN_ITEM.AsInteger;
      cdsPedidosItemDetalheING_CODIGO.AsInteger := cdsGravaPedidosItemDetalheING_CODIGO.AsInteger;
      cdsPedidosItemDetalheITE_QTDE.AsInteger := cdsGravaPedidosItemDetalheITE_QTDE.AsInteger;
      cdsPedidosItemDetalheITE_VRUNIT.AsInteger := cdsGravaPedidosItemDetalheITE_VRUNIT.AsInteger;
      cdsPedidosItemDetalheITE_TOTAL.AsInteger := cdsGravaPedidosItemDetalheITE_TOTAL.AsInteger;
      cdsPedidosItemDetalheING_NOME.AsString := cdsGravaPedidosItemDetalheING_NOME.AsString;
      cdsPedidosItemDetalheLAN_NOME.AsString := cdsGravaPedidosItemDetalheLAN_NOME.AsString;
      cdsPedidosItemDetalhe.Post;
      cdsGravaPedidosItemDetalhe.Next;
    end;
    if not cdsPedidosItem.IsEmpty then
      FiltraItemDetalhe(cdsPedidosItemITE_NUMERO.AsInteger);
    if not cdsPedidosItemDetalhe.IsEmpty then
      cdsPedidosItemDetalhe.First;
    cdsPedidosItemDetalhe.EnableControls;
  end;
end;

procedure TfrmCadastroPedidos.cmbOpcaoClick(Sender: TObject);
begin
  edtCampo.Clear;
  edtCampo.NumbersOnly := True;
  edtCampo.Visible := false;
  edtCampoData.Visible := false;
  case cmbOpcao.ItemIndex of
    0:
    begin
      edtCampo.Visible := True;
      edtCampo.SetFocus;
    end;
    1:
    begin
      edtCampoData.Visible := True;
      edtCampoData.SetFocus;
    end;
    2:
    begin
      btnConsultar.SetFocus;
    end;
  end;
end;

procedure TfrmCadastroPedidos.dbgPedidoDblClick(Sender: TObject);
begin
  pgcCadastro.ActivePageIndex := 1;
end;

procedure TfrmCadastroPedidos.dbgPedidoItemDblClick(Sender: TObject);
begin
  if not CM.cdsPedidosItem.IsEmpty then
    pgcItem.ActivePageIndex := 1;
end;

procedure TfrmCadastroPedidos.edtING_CODIGOExit(Sender: TObject);
begin
  with CM do
  begin
    if cdsPedidosItemDetalheING_CODIGO.AsInteger > 0 then
    begin
      if CM.BuscaIngrediente(cdsPedidosItemDetalheING_CODIGO.AsInteger) then
      begin
        cdsPedidosItemDetalheING_NOME.AsString := cdsBuscaIngredienteING_NOME.AsString;
        cdsPedidosItemDetalheITE_VRUNIT.AsFloat := cdsBuscaIngredienteING_VALOR.AsFloat;
        if cdsPedidosItemDetalheITE_QTDE.AsInteger = 0 then
          cdsPedidosItemDetalheITE_QTDE.AsInteger := 1;
        CalculaTotalItemIngrediente;
      end
      else
      begin
        cdsPedidosItemDetalheING_CODIGO.AsInteger := 0;
        cdsPedidosItemDetalheING_NOME.AsString := '';
        Application.MessageBox('Selecione um ingrediente válido!','Aviso',MB_ICONWARNING);
      end;
    end;
  end;
end;

procedure TfrmCadastroPedidos.edtITE_QTDEExit(Sender: TObject);
begin
  CalculaTotalItemIngrediente;
end;

procedure TfrmCadastroPedidos.edtITE_VRUNITExit(Sender: TObject);
begin
  CalculaTotalItemIngrediente;
end;

procedure TfrmCadastroPedidos.edtLAN_CODIGOExit(Sender: TObject);
begin
  with CM do
  begin
    if cdsPedidosItemLAN_CODIGO.AsInteger > 0 then
    begin
      if CM.BuscaLanche(cdsPedidosItemLAN_CODIGO.AsInteger) then
        cdsPedidosItemLAN_NOME.AsString := cdsBuscaLancheLAN_NOME.AsString
      else
      begin
        cdsPedidosItemLAN_CODIGO.AsInteger := 0;
        cdsPedidosItemLAN_NOME.AsString := '';
        Application.MessageBox('Selecione um lanche válido!','Aviso',MB_ICONWARNING);
      end;
    end;
  end;
end;

procedure TfrmCadastroPedidos.FiltraItemDetalhe(Item: Integer);
begin
  if Item > 0 then
  begin
    CM.cdsPedidosItemDetalhe.Filter := 'ITE_NUMERO = '+IntToStr(Item);
    CM.cdsPedidosItemDetalhe.Filtered := True;
  end
  else
  begin
    CM.cdsPedidosItemDetalhe.Filter := '';
    CM.cdsPedidosItemDetalhe.Filtered := False;
  end
end;

procedure TfrmCadastroPedidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CM.cdsGravaPedidos.Close;
  CM.cdsGravaPedidosItem.Close;
  CM.cdsGravaPedidosItemDetalhe.Close;
  CM.cdsBuscaLanche.Close;
  CM.cdsBuscaLancheItem.Close;
  CM.cdsBuscaIngrediente.Close;
  CM.cdsPedidosItemDetalhe.Filter := '';
  CM.cdsPedidosItemDetalhe.Filtered := False;
  CM.cdsPedidosItemDetalhe.Close;
  CM.cdsPedidosItem.Close;
end;

procedure TfrmCadastroPedidos.FormCreate(Sender: TObject);
begin
  with CM do
  begin
    edtCampoData.Date := Date;
    ConfiguraCamposTela;
    LimpaDadosItem;
    LimpaDadosItemDetalhe;
    SetaParametrosCdsGravaPedidos('CODIGO','0');
    cdsGravaPedidos.close;
    cdsGravaPedidos.Open;
  end;
end;

procedure TfrmCadastroPedidos.FormShow(Sender: TObject);
begin
  pgcCadastro.ActivePageIndex := 0;
  pgcItem.ActivePageIndex := 0;
  cmbOpcao.ItemIndex := 2;
  cmbOpcaoClick(self);
  HabilitaCampos(TP_PEDIDO,false);
  HabilitaCampos(TP_ITEM,false);
  HabilitaCampos(TP_INGREDIENTE,false);
end;

function TfrmCadastroPedidos.GravaPedido: integer;
begin
  with CM do
  begin
    if cdsGravaPedidos.State = dsInsert then
    begin
      result := CM.SMClient.GeraCodigoPedido;
      cdsGravaPedidosPED_CODIGO.AsInteger := result;
    end
    else
    begin
      result := cdsGravaPedidosPED_CODIGO.AsInteger;
    end;
    cdsGravaPedidos.Post;
    if cdsGravaPedidos.ApplyUpdates(0) > 0 then
      result := 0;
  end;
end;

function TfrmCadastroPedidos.GravaPedidoItem(CodigoPedido: Integer): Boolean;
begin
  with CM do
  begin
    result := false;
    if not SMClient.DeletaItensPedido(CodigoPedido) then
      Exit;

    cdsGravaPedidosItem.Close;
    cdsGravaPedidosItem.Params.ParamByName('CODIGO').AsInteger := 0;
    cdsGravaPedidosItem.Open;
    cdsPedidosItem.DisableControls;
    cdsPedidosItem.First;
    while not cdsPedidosItem.Eof do
    begin
      cdsGravaPedidosItem.Append;
      cdsGravaPedidosItemPED_CODIGO.AsInteger := CodigoPedido;
      cdsGravaPedidosItemITE_NUMERO.AsInteger := cdsPedidosItemITE_NUMERO.AsInteger;
      cdsGravaPedidosItemLAN_CODIGO.AsInteger := cdsPedidosItemLAN_CODIGO.AsInteger;
      cdsGravaPedidosItem.Post;

      cdsPedidosItem.Next;
    end;
    cdsPedidosItem.First;
    cdsPedidosItem.EnableControls;
    if cdsGravaPedidosItem.ApplyUpdates(0) = 0 then
      result := True;
  end;
end;

function TfrmCadastroPedidos.GravaPedidoItemDetalhe(CodigoPedido: Integer): Boolean;
begin
  with CM do
  begin
    result := false;
    cdsGravaPedidosItemDetalhe.Close;
    cdsGravaPedidosItemDetalhe.Params.ParamByName('CODIGO').AsInteger := 0;
    cdsGravaPedidosItemDetalhe.Open;
    cdsPedidosItemDetalhe.DisableControls;
    FiltraItemDetalhe(0);
    cdsPedidosItemDetalhe.First;
    while not cdsPedidosItemDetalhe.Eof do
    begin
      cdsGravaPedidosItemDetalhe.Append;
      cdsGravaPedidosItemDetalhePED_CODIGO.AsInteger := CodigoPedido;
      cdsGravaPedidosItemDetalheITE_NUMERO.AsInteger := cdsPedidosItemDetalheITE_NUMERO.AsInteger;
      cdsGravaPedidosItemDetalheLAN_CODIGO.AsInteger := cdsPedidosItemDetalheLAN_CODIGO.AsInteger;
      cdsGravaPedidosItemDetalheLAN_ITEM.AsInteger := cdsPedidosItemDetalheLAN_ITEM.AsInteger;
      cdsGravaPedidosItemDetalheING_CODIGO.AsInteger := cdsPedidosItemDetalheING_CODIGO.AsInteger;
      cdsGravaPedidosItemDetalheITE_QTDE.AsInteger := cdsPedidosItemDetalheITE_QTDE.AsInteger;
      cdsGravaPedidosItemDetalheITE_VRUNIT.AsFloat := cdsPedidosItemDetalheITE_VRUNIT.AsFloat;
      cdsGravaPedidosItemDetalheITE_TOTAL.AsFloat := cdsPedidosItemDetalheITE_TOTAL.AsFloat;
      cdsGravaPedidosItemDetalhe.Post;

      cdsPedidosItemDetalhe.Next;
    end;
    cdsPedidosItemDetalhe.First;
    cdsPedidosItemDetalhe.EnableControls;
    if cdsGravaPedidosItemDetalhe.ApplyUpdates(0) = 0 then
      result := True;
  end;
end;

procedure TfrmCadastroPedidos.ConfiguraCamposTela;
begin
  edtPED_CODIGO.Enabled := false;
  edtPED_TOTALBRUTO.Enabled := false;
  edtPED_TOTALLIQ.Enabled := false;
  edtPED_VRDESCONTO.Enabled := false;
  edtLAN_NOME.Enabled := false;
  edtING_NOME.Enabled := false;
  edtITE_TOTAL.Enabled := false;
  btnLocalizaLanches.TabStop := false;
  btnLocalizaIngrediente.TabStop := false;
end;

procedure TfrmCadastroPedidos.HabilitaCampos(Tipo: Integer; Habilita: Boolean);
begin
  with CM do
  begin
    case Tipo of
      TP_PEDIDO:
      begin
        btnInserirPedido.Enabled := not (cdsGravaPedidos.State in [dsInsert,dsEdit]);
        btnEditarPedido.Enabled := (cdsGravaPedidos.State = dsBrowse) and (not cdsGravaPedidos.IsEmpty);
        btnDeletarPedido.Enabled := (cdsGravaPedidos.State = dsBrowse) and (not cdsGravaPedidos.IsEmpty);
        btnSalvarPedido.Enabled := (cdsGravaPedidos.State in [dsInsert,dsEdit]);
        btnCancelarPedido.Enabled := (cdsGravaPedidos.State in [dsInsert,dsEdit]);
        edtPED_DATA.Enabled := Habilita;
        dbgPedido.Enabled := not Habilita;
        dbgPedido.Repaint;
      end;

      TP_ITEM:
      begin
        btnInserirItem.Enabled := (btnSalvarPedido.Enabled) and (not (cdsPedidosItem.State in [dsInsert,dsEdit]));
        btnEditarItem.Enabled := (btnSalvarPedido.Enabled) and (cdsPedidosItem.State = dsBrowse) and (not cdsPedidosItem.IsEmpty);
        btnDeletarItem.Enabled := (btnSalvarPedido.Enabled) and (cdsPedidosItem.State = dsBrowse) and (not cdsPedidosItem.IsEmpty);
        btnSalvarItem.Enabled := (btnSalvarPedido.Enabled) and (cdsPedidosItem.State in [dsInsert,dsEdit]);
        btnCancelarItem.Enabled := (btnSalvarPedido.Enabled) and (cdsPedidosItem.State in [dsInsert,dsEdit]);
        edtITE_NUMERO.Enabled := Habilita;
        edtLAN_CODIGO.Enabled := Habilita;
        btnLocalizaLanches.Enabled := Habilita;
        dbgPedidoItem.Enabled := not Habilita;
        dbgPedidoItem.Repaint;
      end;

      TP_INGREDIENTE:
      begin
        btnInserirIngrediente.Enabled := (btnSalvarPedido.Enabled) and (not (cdsPedidosItem.IsEmpty)) and
          (not (cdsPedidosItemDetalhe.State in [dsInsert,dsEdit]));
        btnEditarIngrediente.Enabled := (btnSalvarPedido.Enabled) and  (cdsPedidosItemDetalhe.State = dsBrowse) and
          (not cdsPedidosItemDetalhe.IsEmpty);
        btnDeletarIngrediente.Enabled := (btnSalvarPedido.Enabled) and (cdsPedidosItemDetalhe.State = dsBrowse) and
          (not cdsPedidosItemDetalhe.IsEmpty);
        btnSalvarIngrediente.Enabled := (btnSalvarPedido.Enabled) and (cdsPedidosItemDetalhe.State in [dsInsert,dsEdit]);
        btnCancelarIngrediente.Enabled := (btnSalvarPedido.Enabled) and (cdsPedidosItemDetalhe.State in [dsInsert,dsEdit]);
        edtLAN_ITEM.Enabled := Habilita;
        edtING_CODIGO.Enabled := Habilita;
        edtITE_QTDE.Enabled := Habilita;
        edtITE_VRUNIT.Enabled := Habilita;
        edtITE_TOTAL.Enabled := Habilita;
        btnLocalizaIngrediente.Enabled := Habilita;
        dbgPedidoItemDetalhe.Enabled := not Habilita;
        dbgPedidoItemDetalhe.Repaint;
      end;
    end;
  end;
end;

procedure TfrmCadastroPedidos.InsereItemDetalhe(Item, CodigoLanche: Integer);
begin
  with CM do
  begin
    cdsPedidosItemDetalhe.DisableControls;
    FiltraItemDetalhe(0);
    if not cdsPedidosItemDetalhe.Locate('ITE_NUMERO;LAN_CODIGO',VarArrayOf([Item,CodigoLanche]),[]) then
    begin
      while cdsPedidosItemDetalhe.Locate('ITE_NUMERO',Item,[]) do
        cdsPedidosItemDetalhe.Delete;

      cdsBuscaLancheItem.Close;
      cdsBuscaLancheItem.Params.ParamByName('CODIGO').AsInteger := CodigoLanche;
      cdsBuscaLancheItem.Open;
      while not cdsBuscaLancheItem.Eof do
      begin
        cdsPedidosItemDetalhe.Append;
        cdsPedidosItemDetalheITE_NUMERO.AsInteger := Item;
        cdsPedidosItemDetalheLAN_CODIGO.AsInteger := CodigoLanche;
        cdsPedidosItemDetalheLAN_ITEM.AsInteger := cdsBuscaLancheItemLAN_ITEM.AsInteger;
        cdsPedidosItemDetalheING_CODIGO.AsInteger := cdsBuscaLancheItemING_CODIGO.AsInteger;
        cdsPedidosItemDetalheITE_QTDE.AsInteger := cdsBuscaLancheItemLAN_QTDE.AsInteger;
        cdsPedidosItemDetalheITE_VRUNIT.AsFloat := cdsBuscaLancheItemING_VALOR.AsFloat;
        cdsPedidosItemDetalheITE_TOTAL.AsFloat := cdsBuscaLancheItemLAN_QTDE.AsInteger * cdsBuscaLancheItemING_VALOR.AsFloat;
        cdsPedidosItemDetalheING_NOME.AsString := cdsBuscaLancheItemING_NOME.AsString;
        cdsPedidosItemDetalheLAN_NOME.AsString := cdsBuscaLancheItemLAN_NOME.AsString;
        cdsPedidosItemDetalhe.Post;

        cdsBuscaLancheItem.Next;
      end;
    end
    else
      FiltraItemDetalhe(Item);
    if not cdsPedidosItemDetalhe.IsEmpty then
      cdsPedidosItemDetalhe.First;
    cdsPedidosItemDetalhe.EnableControls;
  end;
end;

procedure TfrmCadastroPedidos.LimpaDadosItem;
begin
  CM.cdsPedidosItem.Close;
  CM.cdsPedidosItem.CreateDataSet;
  CM.cdsPedidosItem.Open;
end;

procedure TfrmCadastroPedidos.LimpaDadosItemDetalhe;
begin
  CM.cdsPedidosItemDetalhe.Close;
  CM.cdsPedidosItemDetalhe.CreateDataSet;
  CM.cdsPedidosItemDetalhe.Open;
end;

procedure TfrmCadastroPedidos.pgcCadastroChange(Sender: TObject);
begin
  if (CM.cdsGravaPedidos.State in [dsInsert,dsEdit]) or
     (CM.cdsPedidosItem.State in [dsInsert,dsEdit]) or
     (CM.cdsPedidosItemDetalhe.State in [dsInsert,dsEdit]) then
  begin
    pgcCadastro.ActivePageIndex := 1;
    Application.MessageBox('Cancele ou salve o pedido e seus itens/ingredientes antes de mudar de aba!','Aviso',MB_ICONWARNING);
  end;
end;

procedure TfrmCadastroPedidos.pgcItemChange(Sender: TObject);
begin
  if (CM.cdsPedidosItem.State in [dsInsert,dsEdit]) then
  begin
    pgcItem.ActivePageIndex := 0;
    Application.MessageBox('Cancele ou salve o item antes de mudar de aba!','Aviso',MB_ICONWARNING);
  end
  else if (CM.cdsPedidosItemDetalhe.State in [dsInsert,dsEdit]) then
  begin
    pgcItem.ActivePageIndex := 1;
    Application.MessageBox('Cancele ou salve o ingrediente antes de mudar de aba!','Aviso',MB_ICONWARNING);
  end;
end;

procedure TfrmCadastroPedidos.tabCadastroShow(Sender: TObject);
begin
  pgcItem.ActivePageIndex := 0;
  if CM.cdsGravaPedidos.IsEmpty then
    CarregaDadosPedido(0)
  else if CM.cdsGravaPedidos.State = dsBrowse then
    CarregaDadosPedido(CM.cdsGravaPedidosPED_CODIGO.AsInteger)
end;

procedure TfrmCadastroPedidos.tabPedidoItemDetalheShow(Sender: TObject);
begin
  if not CM.cdsPedidosItem.IsEmpty then
    FiltraItemDetalhe(CM.cdsPedidosItemITE_NUMERO.AsInteger);
end;

function TfrmCadastroPedidos.ValidaCadastro(Tipo: Integer): Boolean;
begin
  with CM do
  begin
    result := false;
    case Tipo of
      TP_PEDIDO:
      begin
        if cdsGravaPedidosPED_DATA.AsDateTime <= 0 then
        begin
          Application.MessageBox('Digite a data do pedido!','Aviso',MB_ICONWARNING);
          Exit;
        end
        else if (cdsGravaPedidosPED_TOTALLIQ.AsFloat <= 0) then
        begin
          Application.MessageBox('O valor do pedido deve ser maior que zero!','Aviso',MB_ICONWARNING);
          Exit;
        end;
      end;

      TP_ITEM:
      begin
        if cdsPedidosItemITE_NUMERO.AsInteger <= 0 then
        begin
          Application.MessageBox('O número do item deve ser maior que zero!','Aviso',MB_ICONWARNING);
          Exit;
        end
        else if (cdsPedidosItemLAN_CODIGO.AsInteger <= 0) or (cdsPedidosItemLAN_NOME.AsString = '') then
        begin
          Application.MessageBox('Selecione um lanche válido para o item!','Aviso',MB_ICONWARNING);
          Exit;
        end;
      end;

      TP_INGREDIENTE:
      begin
        CalculaTotalItemIngrediente;
        if cdsPedidosItemDetalheLAN_ITEM.AsInteger <= 0 then
        begin
          Application.MessageBox('O número do item deve ser maior que zero!','Aviso',MB_ICONWARNING);
          Exit;
        end
        else if (cdsPedidosItemDetalheING_CODIGO.AsInteger <= 0) or (cdsPedidosItemDetalheING_NOME.AsString = '') then
        begin
          Application.MessageBox('Selecione um ingrediente válido para o lanche!','Aviso',MB_ICONWARNING);
          Exit;
        end
        else if cdsPedidosItemDetalheITE_QTDE.AsInteger <= 0 then
        begin
          Application.MessageBox('Digite uma quantidade válida para o ingrediente!','Aviso',MB_ICONWARNING);
          Exit;
        end
        else if cdsPedidosItemDetalheITE_VRUNIT.AsFloat <= 0 then
        begin
          Application.MessageBox('Digite um valor válido para o ingrediente!','Aviso',MB_ICONWARNING);
          Exit;
        end
        else if cdsPedidosItemDetalheITE_TOTAL.AsFloat <= 0 then
        begin
          Application.MessageBox('O valor total deve ser maior que zero!','Aviso',MB_ICONWARNING);
          Exit;
        end;
      end;
    end;
    result := True;
  end;
end;

function TfrmCadastroPedidos.ValidaConsulta: Boolean;
begin
  result := false;
  case cmbOpcao.ItemIndex of
    0: result := edtCampo.Text <> '';
    1: Result := edtCampoData.Date > 0;
    2: result := True;
  end;
end;

end.
