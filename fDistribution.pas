unit fDistribution;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,cMegaROM,cConfiguration;

type
  TfrmDistribution = class(TForm)
    lblOriginalFile: TLabel;
    lblOutputPatch: TLabel;
    txtOriginalROM: TEdit;
    txtOutputPatch: TEdit;
    lblPatchFormat: TLabel;
    cbPatchFormat: TComboBox;
    cmdOK: TButton;
    cmdCancel: TButton;
    OpenDialog: TOpenDialog;
    cmdOriginal: TButton;
    cmdOutput: TButton;
    SaveDialog: TSaveDialog;
    procedure cmdOriginalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdOutputClick(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    { Private declarations }
  public
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;
    { Public declarations }
  end;

var
  frmDistribution: TfrmDistribution;

implementation

uses uglobal, ulunarcompress;

{$R *.dfm}

procedure TfrmDistribution.cmdOriginalClick(Sender: TObject);
begin
  if (txtOriginalROM.Text <> '') and (DirectoryExists(ExtractFileDir(txtOriginalROM.Text))) then
    OpenDialog.InitialDir := ExtractFileDir(txtOriginalROM.Text)
  else
    OpenDialog.InitialDir := ExtractFileDir(Application.ExeName);

  if OpenDialog.Execute then
  begin
    if (OpenDialog.FileName <> '') and (FileExists(OpenDialog.Filename)) then
    begin
      txtOriginalROM.Text := OpenDialog.FileName;
      txtOriginalROM.SelStart := Length(txtOriginalROM.Text);
    end;
  end;

end;

procedure TfrmDistribution.FormShow(Sender: TObject);
begin
  txtOriginalROM.Text := _EditorConfig.OriginalROMFile;
  txtOutputPatch.Text := _EditorConfig.IPSOutput;
end;

procedure TfrmDistribution.cmdOutputClick(Sender: TObject);
begin

  if (txtOutputPatch.Text <> '') and (DirectoryExists(ExtractFileDir(txtOutputPatch.Text))) then
    SaveDialog.InitialDir := ExtractFileDir(txtOutputPatch.Text)
  else
    SaveDialog.InitialDir := ExtractFileDir(Application.ExeName);

  if SaveDialog.Execute then
  begin
    txtOutputPatch.Text := SaveDialog.FileName;
    txtOutputPatch.SelStart := Length(txtOutputPatch.Text);
  end;

end;

procedure TfrmDistribution.cmdOKClick(Sender: TObject);
var
  output : String;
begin
  if Assigned(_ROMData) then
  begin
    if (FileExists(txtOriginalROM.Text) = true) then
    begin
      if cbPatchFormat.ItemIndex = 0 then
      begin
        if txtOutputPatch.Text = '' then
          Output := ChangeFileExt(_ROMData.Filename,'.ips')
        else
          Output := _EditorConfig.IPSOutput;

        _ROMData.Save;
        LunarIPSCreate(handle,PChar(Output),PChar(txtOriginalROM.Text),PChar(_ROMData.Filename),0);
      end;
      
    end
    else
    begin
      ModalResult := mrNone;
      showmessage('Please enter the original ROM filename to base the patch off.');
    end;
  end;
end;

end.
