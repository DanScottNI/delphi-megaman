unit fPreferences;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Spin, GR32_Image, GR32, ComCtrls, cConfiguration, cMegaROM;

type
  TfrmPreferences = class(TForm)
    cmdOK: TButton;
    cmdCancel: TButton;
    cmdRestoreDefaults: TButton;
    pgcPreferences: TPageControl;
    tshGeneral: TTabSheet;
    tshEmulatorSettings: TTabSheet;
    rdgEmuFileSettings: TRadioGroup;
    txtEmulatorPath: TEdit;
    lblEmulatorPath: TLabel;
    cmdBrowse: TButton;
    chkDisplayEmulatorSaveWarning: TCheckBox;
    tshDisplayOptions: TTabSheet;
    chkShowLeftMidText: TCheckBox;
    lblLeftTextColour: TLabel;
    imgLeftText: TImage32;
    cmdBrowseLeft: TButton;
    ColorDialog: TColorDialog;
    cmdBrowseRight: TButton;
    imgRightText: TImage32;
    lblMiddleTextColour: TLabel;
    imgGridlineColour: TImage32;
    cmdBrowseGridlines: TButton;
    chkShowGridlinesByDefault: TCheckBox;
    OpenDialog: TOpenDialog;
    lblGridlineColour: TLabel;
    cbDataFile: TComboBox;
    lblDatafile: TLabel;
    lblPalette: TLabel;
    cbPaletteFile: TComboBox;
    chkBackupFiles: TCheckBox;
    rdgWhenIncorrectMapper: TRadioGroup;
    chkAutoCheck: TCheckBox;
    tshIPS: TTabSheet;
    lblOriginalFile: TLabel;
    txtOriginalROMFilename: TEdit;
    cmdIPSBrowse: TButton;
    grpPatching: TGroupBox;
    lblSaveAsIPS: TLabel;
    txtSaveAsIPS: TEdit;
    cmdBrowseIPSSaveAs: TButton;
    lblIPSNoteSaveAs: TLabel;
    imgLunarIPS: TImage;
    lblLunarCompress: TLabel;
    lblFuSoYa: TLabel;
    SaveDialog: TSaveDialog;
    chkAutoGotoObjEditing: TCheckBox;
    lblSpecObjOutline: TLabel;
    imgSpecObjOutline: TImage32;
    cmdSpecObjOutline: TButton;
    chkIconTransparency: TCheckBox;
    lblIconTransparency: TLabel;
    txtIconTransparency: TSpinEdit;
    chkDisableDeleteEnemyPrompt: TCheckBox;
    chkUseStandardScrollLengths: TCheckBox;
    procedure cmdBrowseLeftClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure cmdBrowseRightClick(Sender: TObject);
    procedure cmdBrowseGridlinesClick(Sender: TObject);
    procedure cmdBrowseClick(Sender: TObject);
    procedure cmdRestoreDefaultsClick(Sender: TObject);
    procedure cmdIPSBrowseClick(Sender: TObject);
    procedure cmdBrowseIPSSaveAsClick(Sender: TObject);
    procedure cmdSpecObjOutlineClick(Sender: TObject);
  private
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    procedure LoadPreferences();
    procedure SavePreferences();
    procedure LoadDataFiles();
    procedure LoadPaletteFiles();
    { Private declarations }
  public
    property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    { Public declarations }
  end;

var
  frmPreferences: TfrmPreferences;

implementation

{$R *.dfm}

uses ulunarcompress;

procedure TfrmPreferences.cmdBrowseLeftClick(Sender: TObject);
begin
  ColorDialog.Color := imgLeftText.Color;
  if ColorDialog.Execute then
  begin
    imgLeftText.Color := ColorDialog.Color;
  end;
end;

procedure TfrmPreferences.LoadPreferences();
begin
  imgLeftText.Color := WinColor(_EditorConfig.LeftTextColour);
  imgRightText.Color := WinColor(_EditorConfig.MiddleTextColour);
  imgGridlineColour.Color := WinColor(_EditorConfig.GridlineColour);
  imgSpecObjOutline.Color := WinColor(_EditorConfig.SpecObjOutline);
  cbDataFile.ItemIndex := cbDataFile.Items.IndexOf(_EditorConfig.DataFileName);
  cbPaletteFile.ItemIndex := cbPaletteFile.Items.IndexOf(_EditorConfig.Palette);
  if cbPaletteFile.ItemIndex = -1 then
    cbPaletteFile.ItemIndex := 0;
  chkShowLeftMidText.Checked := _EditorConfig.DispLeftMidText;
  chkShowGridlinesByDefault.Checked := _EditorConfig.GridlinesOnByDefault;
  chkBackupFiles.Checked := _EditorConfig.BackupFilesWhenSaving;
  chkDisplayEmulatorSaveWarning.Checked := _EditorConfig.EmulatorDisplaySaveWarning;
  rdgEmuFileSettings.ItemIndex := _EditorConfig.EmulatorFileSettings;
  txtEmulatorPath.Text := _EditorConfig.EmulatorPath;
  rdgWhenIncorrectMapper.ItemIndex := _EditorConfig.MapperWarnings;
  chkAutoCheck.Checked := _EditorConfig.AutoCheck;
  txtOriginalROMFilename.Text := _EditorConfig.OriginalROMFile;
  txtSaveAsIPS.Text := _EditorConfig.IPSOutput;
  chkAutoGotoObjEditing.Checked := _EditorConfig.AutoObjMode;
  chkIconTransparency.Checked := _EditorConfig.DrawTransparentIcons;
  txtIconTransparency.Value := _EditorConfig.IconTransparency;
  chkDisableDeleteEnemyPrompt.Checked := _EditorConfig.DisableEnemyDeletePrompt;
  chkUseStandardScrollLengths.Checked := _EditorConfig.DontAllowEdits;
end;

procedure TfrmPreferences.SavePreferences();
begin
  _EditorConfig.LeftTextColour := Color32(imgLeftText.Color);
  _EditorConfig.MiddleTextColour := Color32(imgRightText.Color);
  _EditorConfig.GridlineColour := Color32(imgGridlineColour.Color);
  _EditorConfig.SpecObjOutline := Color32(imgSpecObjOutline.Color);
  _EditorConfig.DataFileName := cbDataFile.Items[cbDataFile.ItemIndex];
  _EditorConfig.Palette := cbPaletteFile.Items[cbPaletteFile.ItemIndex];
  _EditorConfig.DispLeftMidText := chkShowLeftMidText.Checked;
  _EditorConfig.GridlinesOnByDefault := chkShowGridlinesByDefault.Checked;
  _EditorConfig.BackupFilesWhenSaving := chkBackupFiles.Checked;
  _EditorConfig.EmulatorDisplaySaveWarning := chkDisplayEmulatorSaveWarning.Checked;
  _EditorConfig.EmulatorFileSettings := rdgEmuFileSettings.ItemIndex;
  _EditorConfig.EmulatorPath := txtEmulatorPath.Text;
  _EditorConfig.MapperWarnings :=rdgWhenIncorrectMapper.ItemIndex;
  _EditorConfig.AutoCheck := chkAutoCheck.Checked;
  _EditorConfig.OriginalROMFile := txtOriginalROMFilename.Text;
  _EditorConfig.IPSOutput := txtSaveAsIPS.Text;
  _EditorConfig.AutoObjMode := chkAutoGotoObjEditing.Checked;
  _EditorConfig.DrawTransparentIcons := chkIconTransparency.Checked;
  _EditorConfig.IconTransparency := txtIconTransparency.Value;
  _EditorConfig.DisableEnemyDeletePrompt := chkDisableDeleteEnemyPrompt.Checked;
  _EditorConfig.DontAllowEdits := chkUseStandardScrollLengths.Checked;
end;

procedure TfrmPreferences.FormShow(Sender: TObject);
begin
  if Assigned(_ROMData) = False then
  begin
    cbDataFile.Enabled := True;
    lblDataFile.Enabled := True;
  end
  else
  begin
    cbDataFile.Enabled := False;
    lblDataFile.Enabled := False;
  end;

  LoadPaletteFiles();
  LoadDataFiles();

  LoadPreferences;
  lblLunarCompress.Caption := 'Lunar Compress.dll v'+ FloatToStr(LunarVersion / 100);
end;

procedure TfrmPreferences.cmdOKClick(Sender: TObject);
begin
  SavePreferences;
end;

procedure TfrmPreferences.cmdBrowseRightClick(Sender: TObject);
begin
  ColorDialog.Color := imgRightText.Color;
  if ColorDialog.Execute then
  begin
    imgRightText.Color := ColorDialog.Color;
  end;
end;

procedure TfrmPreferences.cmdBrowseGridlinesClick(Sender: TObject);
begin
  ColorDialog.Color := imgGridlineColour.Color;
  if ColorDialog.Execute then
  begin
    imgGridlineColour.Color := ColorDialog.Color;
  end;
end;

procedure TfrmPreferences.cmdBrowseClick(Sender: TObject);
begin
  OpenDialog.Title := 'Please select a NES emulator';
  OpenDialog.Filter := 'NES Emulator (*.exe)|*.exe';
  if (txtEmulatorPath.Text <> '') and (DirectoryExists(ExtractFileDir(txtEmulatorPath.Text))) then
    OpenDialog.InitialDir := ExtractFileDir(txtEmulatorPath.Text);

  if OpenDialog.Execute then
  begin
    if (OpenDialog.FileName <> '') and (FileExists(OpenDialog.Filename)) then
    begin
      txtEmulatorPath.Text := OpenDialog.FileName;
      txtEmulatorPath.SelStart := Length(txtEmulatorPath.Text);
    end;
  end;
end;

procedure TfrmPreferences.cmdRestoreDefaultsClick(Sender: TObject);
begin
  EditorConfig.LoadDefaultSettings;
  EditorConfig.Save;
  LoadPreferences;
end;

procedure TfrmPreferences.LoadDataFiles();
begin

  cbDataFile.Items.Clear;
  cbDataFile.Items.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\data.dat');

end;

procedure TfrmPreferences.LoadPaletteFiles();
var
  sr: TSearchRec;
begin
  cbPaletteFile.Items.BeginUpdate;
  cbPaletteFile.Items.Clear;

  if FindFirst(ExtractFileDir(Application.ExeName)+ '\Data\Palettes\*.pal', faAnyFile, sr) = 0 then
  begin
    repeat
      cbPaletteFile.Items.Add(sr.Name);

    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
  cbPaletteFile.Items.EndUpdate;
//  cbPaletteFile.Items.LoadFromFile(ExtractFileDir(Application.Exename) + '\Data\Palettes\pal.dat');
end;

procedure TfrmPreferences.cmdIPSBrowseClick(Sender: TObject);
begin

  OpenDialog.Title := 'Select an original unmodified Rush''n Attack ROM';
  OpenDialog.Filter := 'iNES Image (*.nes)|*.nes';

  if (txtOriginalROMFilename.Text <> '') and (DirectoryExists(ExtractFileDir(txtOriginalROMFilename.Text))) then
    OpenDialog.InitialDir := ExtractFileDir(txtOriginalROMFilename.Text)
  else
    OpenDialog.InitialDir := ExtractFileDir(Application.ExeName);

  if OpenDialog.Execute then
  begin
    if (OpenDialog.FileName <> '') and (FileExists(OpenDialog.Filename)) then
    begin
      txtOriginalROMFilename.Text := OpenDialog.FileName;
      txtOriginalROMFilename.SelStart := Length(txtOriginalROMFilename.Text);
    end;
  end;

end;

procedure TfrmPreferences.cmdBrowseIPSSaveAsClick(Sender: TObject);
begin
  if (txtSaveAsIPS.Text <> '') and (DirectoryExists(ExtractFileDir(txtSaveAsIPS.Text))) then
    SaveDialog.InitialDir := ExtractFileDir(txtSaveAsIPS.Text)
  else
    SaveDialog.InitialDir := ExtractFileDir(Application.ExeName);

  if SaveDialog.Execute then
  begin
    txtSaveAsIPS.Text := SaveDialog.FileName;
    txtSaveAsIPS.SelStart := Length(txtSaveAsIPS.Text);
  end;
end;

procedure TfrmPreferences.cmdSpecObjOutlineClick(Sender: TObject);
begin
  ColorDialog.Color := imgSpecObjOutline.Color;
  if ColorDialog.Execute then
  begin
    imgSpecObjOutline.Color := ColorDialog.Color;
  end;
end;

end.
