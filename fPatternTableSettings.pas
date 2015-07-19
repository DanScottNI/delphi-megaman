unit fPatternTableSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, GR32_Image,gr32, DanHexEdit, cMegaROM, cConfiguration;

type
  TfrmPatternTableSettings = class(TForm)
    lvwPatternTableSettings: TListView;
    cmdOK: TButton;
    cmdCancel: TButton;
    imgBGTable: TImage32;
    imgSpriteTable: TImage32;
    cmdAddNew: TButton;
    cmdDelete: TButton;
    cmdMoveUp: TButton;
    cmdMoveDown: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure cmdCancelClick(Sender: TObject);
    procedure cmdDeleteClick(Sender: TObject);
    procedure lvwPatternTableSettingsDblClick(Sender: TObject);
    procedure cmdMoveUpClick(Sender: TObject);
    procedure cmdMoveDownClick(Sender: TObject);
  private
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    procedure LoadPatternTableSettings;
    procedure DrawPatternTables;
    function CalculatePatternTableSize : Boolean;
    { Private declarations }
  public
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;
    { Public declarations }
  end;

var
  frmPatternTableSettings: TfrmPatternTableSettings;

implementation

{$R *.dfm}

uses uGlobal,fPatEdit;

procedure TfrmPatternTableSettings.LoadPatternTableSettings;
var
  i : Integer;
begin
  lvwPatternTableSettings.Items.BeginUpdate;

  lvwPatternTableSettings.Items.Clear;

  for i := 0 to _ROMData.CurrLevel.PatternTableSettings.Count -1 do
  begin
    with lvwPatternTableSettings.Items.Add do
    begin
      Caption := IntToHex(_ROMData.CurrLevel.PatternTableSettings[i].Offset,2);
      SubItems.Add(IntToHex(_ROMData.CurrLevel.PatternTableSettings[i].Size,2));
    end;
  end;



  lvwPatternTableSettings.Items.EndUpdate;
end;

procedure TfrmPatternTableSettings.FormShow(Sender: TObject);
begin

  LoadPatternTableSettings;
  lvwPatternTableSettings.ItemIndex := 0;


  DrawPatternTables;

  cmdAddNew.Enabled := CalculatePatternTableSize;


end;

procedure TfrmPatternTableSettings.cmdOKClick(Sender: TObject);
begin
  _ROMData.SavePatternTableSettings;

end;

procedure TfrmPatternTableSettings.cmdCancelClick(Sender: TObject);
begin
  _ROMData.LoadPatternTableSettings;
  _ROMData.LoadPatternTable;
end;

procedure TfrmPatternTableSettings.DrawPatternTables;
var
  tempbitmap : TBitmap32;
begin
  TempBitmap := TBitmap32.Create;
  try
    TempBitmap.Width := 128;
    TempBitmap.Height := 128;
    _ROMData.DrawPatternTable(TempBitmap,$0,0);
    imgSpriteTable.Bitmap := TempBitmap;
    _ROMData.DrawPatternTable(TempBitmap,$1000,0);
    imgBGTable.Bitmap := TempBitmap;
  finally
    FreeAndNil(TempBitmap);
  end;
end;

function TfrmPatternTableSettings.CalculatePatternTableSize : Boolean;
var
  i,size : Integer;
begin
  size := 0;
  for i := 0 to _ROMData.CurrLevel.PatternTableSettings.Count -1 do
    size := size + _ROMData.CurrLevel.PatternTableSettings[i].Size;
  if Size = $2000 then
    result := false
  else
    result := true;
end;



procedure TfrmPatternTableSettings.cmdDeleteClick(Sender: TObject);
begin
  if lvwPatternTableSettings.ItemIndex > -1 then
  begin
    _ROMData.CurrLevel.PatternTableSettings.Delete(lvwPatternTableSettings.ItemIndex);
    cmdAddNew.Enabled := CalculatePatternTableSize;
    LoadPatternTableSettings;
    _ROMData.LoadPatternTable;
    DrawPatternTables;
  end;
end;

procedure TfrmPatternTableSettings.lvwPatternTableSettingsDblClick(
  Sender: TObject);
var
  PatEdit : TfrmPatEdit;
begin
  if lvwPatternTableSettings.ItemIndex > -1 then
  begin
    PatEdit := TfrmPatEdit.Create(self);
    try
      PatEdit.Offset := _ROMData.CurrLevel.PatternTableSettings[lvwPatternTableSettings.ItemIndex].Offset;
      PatEdit.Size := _ROMData.CurrLevel.PatternTableSettings[lvwPatternTableSettings.ItemIndex].Size;
      if PatEdit.ShowModal = mrok then
      begin
        _ROMData.CurrLevel.PatternTableSettings[lvwPatternTableSettings.ItemIndex].Offset := PatEdit.Offset;
        _ROMData.CurrLevel.PatternTableSettings[lvwPatternTableSettings.ItemIndex].Size := PatEdit.Size;
        LoadPatternTableSettings;
        _ROMData.LoadPatternTable;
        DrawPatternTables;
      end;
    finally
      FreeAndNil(PatEdit);
    end;
  end;
end;

procedure TfrmPatternTableSettings.cmdMoveUpClick(Sender: TObject);
var
  oldindex : Integer;
begin
  if lvwPatternTableSettings.ItemIndex > 0 then
  begin
    _ROMData.CurrLevel.PatternTableSettings.Exchange(lvwPatternTableSettings.ItemIndex,lvwPatternTableSettings.ItemIndex -1);
    oldindex := lvwPatternTableSettings.ItemIndex - 1;
    LoadPatternTableSettings;
    _ROMData.LoadPatternTable;
    DrawPatternTables;
    lvwPatternTableSettings.ItemIndex := oldindex;
    
  end;
end;

procedure TfrmPatternTableSettings.cmdMoveDownClick(Sender: TObject);
var
  oldindex : Integer;
begin
  if (lvwPatternTableSettings.ItemIndex < lvwPatternTableSettings.Items.Count -1) and (lvwPatternTableSettings.ItemIndex > -1) then
  begin
    _ROMData.CurrLevel.PatternTableSettings.Exchange(lvwPatternTableSettings.ItemIndex,lvwPatternTableSettings.ItemIndex+1);
    oldindex := lvwPatternTableSettings.ItemIndex + 1;
    LoadPatternTableSettings;
    _ROMData.LoadPatternTable;
    DrawPatternTables;
    lvwPatternTableSettings.ItemIndex := oldindex;

  end;

end;

end.
