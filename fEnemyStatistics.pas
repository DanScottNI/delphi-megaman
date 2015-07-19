unit fEnemyStatistics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DanHexEdit,cMegaROM, cConfiguration;

type
  TfrmEnemyStatistics = class(TForm)
    lblGlobalEnemyHealth: TLabel;
    lblEnemy: TLabel;
    cbEnemy: TComboBox;
    txtGlobalHealth: TDanHexEdit;
    grpIndividualEnemy: TGroupBox;
    cmdOK: TButton;
    cmdCancel: TButton;
    lblPWeaponDamage: TLabel;
    lblCWeaponDamage: TLabel;
    lblIWeaponDamage: TLabel;
    lblBWeaponDamage: TLabel;
    lblFWeaponDamage: TLabel;
    lblEWeaponDamage: TLabel;
    lblGWeaponDamage: TLabel;
    lblPlayerDamage: TLabel;
    lblScore: TLabel;
    txtPWeaponDamage: TDanHexEdit;
    txtCWeaponDamage: TDanHexEdit;
    txtIWeaponDamage: TDanHexEdit;
    txtBWeaponDamage: TDanHexEdit;
    txtFWeaponDamage: TDanHexEdit;
    txtEWeaponDamage: TDanHexEdit;
    txtGWeaponDamage: TDanHexEdit;
    txtPlayerDamage: TDanHexEdit;
    txtScore: TDanHexEdit;
    procedure FormShow(Sender: TObject);
    procedure cbEnemyChange(Sender: TObject);
    procedure cmdCancelClick(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    _PrevID : Byte;
    procedure LoadEnemyData(pID : Byte);
    procedure SaveEnemyData(pID : Byte);
    procedure PopulateEnemyCombobox;
    { Private declarations }
  public
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;
    { Public declarations }
  end;

var
  frmEnemyStatistics: TfrmEnemyStatistics;

implementation

uses uGlobal;


{$R *.dfm}

procedure TfrmEnemyStatistics.PopulateEnemyCombobox;
var
  i : integer;
begin
  cbEnemy.Items.BeginUpdate;

  for i := 0 to $3A do
    cbEnemy.Items.Add(  _ROMData.EnemyDescriptions[i]);

  cbEnemy.ItemIndex := 0;
  cbEnemy.Items.EndUpdate;
end;

procedure TfrmEnemyStatistics.FormShow(Sender: TObject);
begin
  PopulateEnemyCombobox;
  _PrevID := cbEnemy.ItemIndex;
  LoadEnemyData(cbEnemy.ItemIndex);
end;

procedure TfrmEnemyStatistics.LoadEnemyData(pID : Byte);
begin
  txtGlobalHealth.Text := IntToHex(_ROMData.Properties['GlobalEnemyHealth'].Value,2);
  txtPWeaponDamage.Text := IntToHex(_ROMData.EnemyStatistics[pID].PWeaponDamage,2);
  txtCWeaponDamage.Text := IntToHex(_ROMData.EnemyStatistics[pID].CWeaponDamage,2);
  txtIWeaponDamage.Text := IntToHex(_ROMData.EnemyStatistics[pID].IWeaponDamage,2);
  txtBWeaponDamage.Text := IntToHex(_ROMData.EnemyStatistics[pID].BWeaponDamage,2);
  txtFWeaponDamage.Text := IntToHex(_ROMData.EnemyStatistics[pID].FWeaponDamage,2);
  txtEWeaponDamage.Text := IntToHex(_ROMData.EnemyStatistics[pID].EWeaponDamage,2);
  txtGWeaponDamage.Text := IntToHex(_ROMData.EnemyStatistics[pID].GWeaponDamage,2);
  txtPlayerDamage.Text := IntToHex(_ROMData.EnemyStatistics[pID].PlayerDamage,2);
  txtScore.Text := IntToHex(_ROMData.EnemyStatistics[pID].Score,2);
end;

procedure TfrmEnemyStatistics.SaveEnemyData(pID : Byte);
begin
  _ROMData.Properties['GlobalEnemyHealth'].Value := StrToInt('$' + txtGlobalHealth.Text);
  _ROMData.EnemyStatistics[pID].PWeaponDamage := StrToInt('$' + txtPWeaponDamage.Text);
  _ROMData.EnemyStatistics[pID].CWeaponDamage := StrToInt('$' + txtCWeaponDamage.Text);
  _ROMData.EnemyStatistics[pID].IWeaponDamage := StrToInt('$' + txtIWeaponDamage.Text);
  _ROMData.EnemyStatistics[pID].BWeaponDamage := StrToInt('$' + txtBWeaponDamage.Text);
  _ROMData.EnemyStatistics[pID].FWeaponDamage := StrToInt('$' + txtFWeaponDamage.Text);
  _ROMData.EnemyStatistics[pID].EWeaponDamage := StrToInt('$' + txtEWeaponDamage.Text);
  _ROMData.EnemyStatistics[pID].GWeaponDamage := StrToInt('$' + txtGWeaponDamage.Text);
  _ROMData.EnemyStatistics[pID].PlayerDamage := StrToInt('$' + txtPlayerDamage.Text);
  _ROMData.EnemyStatistics[pID].Score := StrToInt('$' + txtScore.Text);
end;


procedure TfrmEnemyStatistics.cbEnemyChange(Sender: TObject);
begin
  SaveEnemyData(_PrevID);
  _PrevID := cbEnemy.ItemIndex;
  LoadEnemyData(_PrevID);
end;

procedure TfrmEnemyStatistics.cmdCancelClick(Sender: TObject);
begin
  _ROMData.LoadEnemyStatistics;
end;

procedure TfrmEnemyStatistics.cmdOKClick(Sender: TObject);
begin
  _ROMData.SaveEnemyStatistics;
end;

end.
