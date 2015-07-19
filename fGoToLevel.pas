unit fGoToLevel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cMegaROM, cConfiguration;

type
  TfrmGoToLevel = class(TForm)
    lstLevels: TListBox;
    cmdOK: TButton;
    cmdCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    { Private declarations }
  public
    Level : Integer;
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;
    { Public declarations }
  end;

var
  frmGoToLevel: TfrmGoToLevel;

implementation

uses uglobal;

{$R *.dfm}

procedure TfrmGoToLevel.FormShow(Sender: TObject);
var
  i : Integer;
begin
  lstLevels.Items.BeginUpdate;
  lstLevels.Clear;
  for i := 0 to _ROMData.Levels.Count -1 do
    lstLevels.Items.Add(_ROMData.Levels[i].Name);
  lstLevels.Items.EndUpdate;
  lstLevels.ItemIndex := _ROMData.CurrentLevel;
end;

procedure TfrmGoToLevel.cmdOKClick(Sender: TObject);
begin
  Level := lstLevels.ItemIndex;
end;

end.
