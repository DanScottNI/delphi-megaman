unit fLevelProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, ComCtrls, StrUtils, DanHexEdit, cMegaROM, cConfiguration, dialogs;

type
  TfrmLevelProperties = class(TForm)
    pgcLevelProperties: TPageControl;
    tshLevelSettings: TTabSheet;
    tshBossSettings: TTabSheet;
    cmdCancel: TButton;
    cmdOK: TButton;
    lblTSASettings1: TLabel;
    lblTSASettings0: TLabel;
    lblTSASettings2: TLabel;
    lblTSASettings3: TLabel;
    lblMusic: TLabel;
    cbMusic: TComboBox;
    cbTSASettings0: TComboBox;
    cbTSASettings1: TComboBox;
    cbTSASettings2: TComboBox;
    cbTSASettings3: TComboBox;
    lblDoorsFromScreen: TLabel;
    txtDoorsWorkFromScreen: TDanHexEdit;
    lblProjectileDamage: TLabel;
    txtProjectileDamage: TDanHexEdit;
    grpBossVulnerabilities: TGroupBox;
    lblPBlaster: TLabel;
    txtPBlaster: TDanHexEdit;
    lblBomb: TLabel;
    txtBomb: TDanHexEdit;
    txtFire: TDanHexEdit;
    txtElec: TDanHexEdit;
    txtIce: TDanHexEdit;
    txtCut: TDanHexEdit;
    lblFire: TLabel;
    lblElec: TLabel;
    lblCutman: TLabel;
    lblIce: TLabel;
    lblGuts: TLabel;
    txtGuts: TDanHexEdit;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    procedure LoadSettings;
    procedure SaveSettings;
  public
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;
    { Public declarations }
  end;

var
  frmLevelProperties: TfrmLevelProperties;

implementation

{$R *.dfm}

procedure TfrmLevelProperties.LoadSettings;
begin
  cbTSASettings0.Items := _ROMData.TSASettingsList;
  cbTSASettings1.Items := _ROMData.TSASettingsList;
  cbTSASettings2.Items := _ROMData.TSASettingsList;
  cbTSASettings3.Items := _ROMData.TSASettingsList;
  cbTSASettings0.ItemIndex := _ROMData.CurrLevel.Properties['TSASetting0'].Value;
  cbTSASettings1.ItemIndex := _ROMData.CurrLevel.Properties['TSASetting1'].Value;
  cbTSASettings2.ItemIndex := _ROMData.CurrLevel.Properties['TSASetting2'].Value;
  cbTSASettings3.ItemIndex := _ROMData.CurrLevel.Properties['TSASetting3'].Value;
  cbMusic.Items := _ROMData.SoundEffectList;
  cbMusic.ItemIndex := _ROMData.CurrLevel.Properties['Music'].Value;
  txtDoorsWorkFromScreen.Text := IntToHex(_ROMData.CurrLevel.Properties['DoorsWorkFrom'].Value,2);
  // Boss Damage Settings
  txtPBlaster.Text := IntToHex(_ROMData.CurrLevel.Properties['BossPBlaster'].Value,2);
  txtCut.Text := IntToHex(_ROMData.CurrLevel.Properties['BossCut'].Value,2);
  txtIce.Text := IntToHex(_ROMData.CurrLevel.Properties['BossIce'].Value,2);
  txtBomb.Text := IntToHex(_ROMData.CurrLevel.Properties['BossBomb'].Value,2);
  txtFire.Text := IntToHex(_ROMData.CurrLevel.Properties['BossFire'].Value,2);
  txtElec.Text := IntToHex(_ROMData.CurrLevel.Properties['BossElec'].Value,2);
  txtGuts.Text := IntToHex(_ROMData.CurrLevel.Properties['BossGuts'].Value,2);
  txtProjectileDamage.Text := IntToHex(_ROMData.CurrLevel.Properties['ProjectileDamage'].Value,2);


//  if MegamanROM.CurrLevel.Properties['ScreenStartChk2Trig') <> nil then
//    txtCheckpointFix3.Text := IntToHex(MegamanROM.CurrLevel.Properties['ScreenStartChk2Trig').Value,2);
end;

procedure TfrmLevelProperties.SaveSettings;
begin
  _ROMData.CurrLevel.Properties['Music'].Value := cbMusic.ItemIndex;
//  MegamanROM.CurrLevel.CheckPoint1Screen := _Scr1Chk;
//  MegamanROM.CurrLevel.CheckPoint2Screen := _Scr2Chk;
  _ROMData.CurrLevel.Properties['TSASetting0'].Value := cbTSASettings0.ItemIndex;
  _ROMData.CurrLevel.Properties['TSASetting1'].Value := cbTSASettings1.ItemIndex;
  _ROMData.CurrLevel.Properties['TSASetting2'].Value := cbTSASettings2.ItemIndex;
  _ROMData.CurrLevel.Properties['TSASetting3'].Value := cbTSASettings3.ItemIndex;
  _ROMData.CurrLevel.Properties['DoorsWorkFrom'].Value := StrToInt('$' + txtDoorsWorkFromScreen.Text);

  // Boss Damage Settings
  _ROMData.CurrLevel.Properties['BossPBlaster'].Value := StrToInt('$' + txtPBlaster.Text);
  _ROMData.CurrLevel.Properties['BossCut'].Value := StrToInt('$' + txtCut.Text);
  _ROMData.CurrLevel.Properties['BossIce'].Value := StrToInt('$' + txtIce.Text);
  _ROMData.CurrLevel.Properties['BossBomb'].Value := StrToInt('$' + txtBomb.Text);
  _ROMData.CurrLevel.Properties['BossFire'].Value := StrToInt('$' + txtFire.Text);
  _ROMData.CurrLevel.Properties['BossElec'].Value := StrToInt('$' + txtElec.Text);
  _ROMData.CurrLevel.Properties['BossGuts'].Value := StrToInt('$' + txtGuts.Text);
  _ROMData.CurrLevel.Properties['ProjectileDamage'].Value := StrToInt('$' + txtProjectileDamage.Text);

end;

procedure TfrmLevelProperties.cmdOKClick(Sender: TObject);
begin
  SaveSettings;
end;

procedure TfrmLevelProperties.FormShow(Sender: TObject);
begin
  LoadSettings;
end;

end.
