unit fSoundEffectEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ValEdit, cMegaROM, cConfiguration;

type
  TfrmSoundEffectEditor = class(TForm)
    vleSoundEffects: TValueListEditor;
    cmdOK: TButton;
    cmdCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    procedure SaveSoundEffects;
    procedure FillListEditor;
    procedure ClearItemProps;
    { Private declarations }
  public
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;
    { Public declarations }
  end;

var
  frmSoundEffectEditor: TfrmSoundEffectEditor;

implementation

uses uglobal, csound;

{$R *.dfm}


procedure TfrmSoundEffectEditor.SaveSoundEffects;
var
  i : Integer;
begin
  for i := 1 to _ROMData.SoundEffects.Count do
  begin
    _ROMData.SoundEffects[i - 1].SEIndex := _ROMData.SoundEffectList.IndexOf(vleSoundEffects.Values[vleSoundEffects.Keys[i]]);
  end;
end;

procedure TfrmSoundEffectEditor.FillListEditor;
var
  i : Integer;
begin

  for i := 0 to _ROMData.SoundEffects.Count -1 do
  begin

    vleSoundEffects.InsertRow(_ROMData.SoundEffects[i].Name,_ROMData.SoundEffectList[_ROMData.SoundEffects[i].SEIndex],True);
    vleSoundEffects.ItemProps[i].EditStyle := esPickList;
    vleSoundEffects.ItemProps[i].PickList := _ROMData.SoundEffectList;
    vleSoundEffects.ItemProps[i].ReadOnly := True;
  end;

end;

procedure TfrmSoundEffectEditor.cmdOKClick(Sender: TObject);
begin

  SaveSoundEffects;

end;

procedure TfrmSoundEffectEditor.ClearItemProps;
var
  i : Integer;
begin
  for i := 0 to _ROMData.SoundEffects.Count -1 do
  begin
    vleSoundEffects.ItemProps[i].Destroy;
  end;
end;

procedure TfrmSoundEffectEditor.FormDestroy(Sender: TObject);
begin
  ClearItemProps;
end;

procedure TfrmSoundEffectEditor.FormShow(Sender: TObject);
begin
  FillListEditor;
end;

end.
