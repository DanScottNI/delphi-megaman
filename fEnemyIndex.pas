unit fEnemyIndex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ByteList,cMegaROM, cConfiguration;

type
  TfrmEnemyIndexEditor = class(TForm)
    lvwEnemyIndex: TListView;
    cmdMoveUp: TButton;
    cmdMoveDown: TButton;
    cmdAutoSort: TButton;
    cmdOk: TButton;
    cmdAutoSortLevel: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmdMoveUpClick(Sender: TObject);
    procedure cmdMoveDownClick(Sender: TObject);
    procedure cmdAutoSortClick(Sender: TObject);
    procedure cmdAutoSortLevelClick(Sender: TObject);
  private
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    _IDs : TByteList;
    procedure LoadIDs;
    { Private declarations }
  public
    procedure PopulateList;
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;
    { Public declarations }
  end;

var
  frmEnemyIndexEditor: TfrmEnemyIndexEditor;

implementation

{$R *.dfm}

uses uGlobal;

procedure TfrmEnemyIndexEditor.PopulateList;
var
  i,count : Integer;
begin
  lvwEnemyIndex.Items.BeginUpdate;
  lvwEnemyIndex.Items.Clear;
  count := 0;
  for i := 0 to _IDs.Count -1 do
  begin

    with lvwEnemyIndex.Items.Add do
    begin
      Caption := IntToHex(Count,2);
      SubItems.Add(_ROMData.EnemyDescriptions[_ROMData.CurrLevel.Enemies[_IDs[i]].ID] );
      SubItems.Add(IntToHex(_ROMData.CurrLevel.Enemies[_IDs[i]].X,2));
      SubItems.Add(IntToHex(_ROMData.CurrLevel.Enemies[_IDs[i]].Y,2));
    end;
    inc(count);

  end;
  lvwEnemyIndex.Items.EndUpdate;
end;

procedure TfrmEnemyIndexEditor.LoadIDs;
var
  i : Integer;
begin
  _IDs := TByteList.Create(0);
  for i := 0 to _ROMData.CurrLevel.Enemies.Count -1 do
  begin
//    if _ROMData.CurrLevel.Enemies[i].ScreenID = _ROMData.Room then
//    begin
    _IDs.Add(i);
//    end;
  end;
end;

procedure TfrmEnemyIndexEditor.FormShow(Sender: TObject);
begin
  LoadIDs;
  PopulateList;
end;

procedure TfrmEnemyIndexEditor.FormDestroy(Sender: TObject);
begin
  FreeAndNil(_IDs);
end;

procedure TfrmEnemyIndexEditor.cmdMoveUpClick(Sender: TObject);
var
  oldindex : Integer;
begin
  if lvwEnemyIndex.ItemIndex > 0 then
  begin
    _ROMData.CurrLevel.Enemies.Exchange(_IDs[lvwEnemyIndex.ItemIndex],_IDs[lvwEnemyIndex.ItemIndex -1]);
    oldindex := lvwEnemyIndex.ItemIndex - 1;
    PopulateList;
    lvwEnemyIndex.ItemIndex := oldindex;
    _ROMData.Changed := True;
  end;
end;

procedure TfrmEnemyIndexEditor.cmdMoveDownClick(Sender: TObject);
var
  oldindex : Integer;
begin
  if (lvwEnemyIndex.ItemIndex < lvwEnemyIndex.Items.Count -1) and (lvwEnemyIndex.ItemIndex > -1) then
  begin
    _ROMData.CurrLevel.Enemies.Exchange(_IDs[lvwEnemyIndex.ItemIndex],_IDs[lvwEnemyIndex.ItemIndex+1]);
    oldindex := lvwEnemyIndex.ItemIndex + 1;
    PopulateList;
    lvwEnemyIndex.ItemIndex := oldindex;
    _ROMData.Changed := True;
  end;
end;

procedure TfrmEnemyIndexEditor.cmdAutoSortClick(Sender: TObject);
var
  unsorted : boolean;
  i : integer;
begin
  if _IDs.Count = 2 then
  begin
    if _ROMData.CurrLevel.Enemies[_IDs[0]].X > _ROMData.CurrLevel.Enemies[_IDs[1]].X then
      _ROMData.CurrLevel.Enemies.Exchange(_IDs[0],_IDs[1]);
  end
  else if _IDs.Count > 1 then
  begin

    repeat
      unsorted := true;
      for i := 0 to _IDs.Count -2 do
      begin
        if _ROMData.CurrLevel.Enemies[_IDs[i]].X > _ROMData.CurrLevel.Enemies[_IDs[i + 1]].X then
        begin

          _ROMData.CurrLevel.Enemies.Exchange(_IDs[i],_IDs[i+1]);
          unsorted := false;
        end;
      end;
    until unsorted;

  end;

  PopulateList;

end;

procedure TfrmEnemyIndexEditor.cmdAutoSortLevelClick(Sender: TObject);
begin
  _ROMData.SortEnemyData(_ROMData.CurrentLevel);
  _ROMData.SortEnemyDataByX(_ROMData.CurrentLevel);
  PopulateList; 
end;

end.
