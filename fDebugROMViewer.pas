unit fDebugROMViewer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, math, StdCtrls, cMegaROM, cConfiguration, iNESImage;

type
  TfrmDebugROMViewer = class(TForm)
    DrawGrid: TDrawGrid;
    lblLevel: TLabel;
    cbLevels: TComboBox;
    cmdRoomOrder: TButton;
    cmdLevelPointers: TButton;
    cmdEnemyPointer: TButton;
    cmdActualEnemyData: TButton;
    cmdPalette: TButton;
    cmdScroll: TButton;
    cmdRoomOrderStartOffset: TButton;
    cmdSpecObjData: TButton;
    procedure FormShow(Sender: TObject);
    procedure DrawGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure DrawGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure cmdRoomOrderClick(Sender: TObject);
    procedure cmdPaletteClick(Sender: TObject);
    procedure cmdEnemyPointerClick(Sender: TObject);
    procedure cmdActualEnemyDataClick(Sender: TObject);
    procedure cmdLevelPointersClick(Sender: TObject);
    procedure cmdScrollClick(Sender: TObject);
    procedure cmdRoomOrderStartOffsetClick(Sender: TObject);
    procedure cmdSpecObjDataClick(Sender: TObject);
  private
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    procedure JumpTo(pOffset : Integer);
    { Private declarations }
  public
      property ROMData : TMegamanROM read _ROMData write _ROMData;
      property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;
    { Public declarations }
  end;

var
  frmDebugROMViewer: TfrmDebugROMViewer;

implementation

{$R *.dfm}


procedure TfrmDebugROMViewer.FormShow(Sender: TObject);
var
  i : Integer;
begin

  cbLevels.Items.BeginUpdate;
  cbLevels.Items.Clear;
  for i := 0 to _ROMData.Levels.Count -1 do
    cbLevels.Items.Add(_ROMData.Levels[i].Name);
  cbLevels.Items.EndUpdate;
  cbLevels.ItemIndex := _ROMData.CurrentLevel;

  DrawGrid.ColWidths[0] := 80;
  DrawGrid.ColWidths[1] := 1;
  DrawGrid.ColWidths[34] := 1;
  DrawGrid.Col := 2;
//  DrawGrid.RowCount := floor(simpleroundto(_ROMData.ROM.ROMSize / $20,0));
end;

procedure TfrmDebugROMViewer.DrawGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ACol = 0 then CanSelect := False;
  if ACol = 1 then CanSelect := False;
  if ACol = 34 then CanSelect := False;
end;

procedure TfrmDebugROMViewer.DrawGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if ACol = 0 then
  begin

    DrawGrid.Font.Color := clBlack;

    DrawGrid.Canvas.TextOut(Rect.Left +4,Rect.Top+4,IntToHex(ARow * 32,8));
  end;

  if (ACol > 1) and (Acol < 34) then
  begin

{    if (ARow * 32) + (Acol - 2) < _ROMdata.ROM.ROMSize then
      DrawGrid.Canvas.TextOut(Rect.Left,Rect.Top+4,IntToHex(_ROMdata.ROM[(ARow * 32) + (Acol - 2)],2));}

  end;
  
  if (ACol = 34) or (ACol = 1) then
  begin
    DrawGrid.Canvas.Brush.Color := clBlack;
    DrawGrid.Canvas.FillRect(Rect);
  end;
  Caption := 'Debug ROM Viewer O:' + IntToHex((DrawGrid.Col - 2) + (DrawGrid.Row * 32),8); 
end;

procedure TfrmDebugROMViewer.JumpTo(pOffset : Integer);
begin
  DrawGrid.Row := pOffset div 32;
  DrawGrid.Col := (pOffset mod 32) + 2;
end;

procedure TfrmDebugROMViewer.cmdRoomOrderClick(Sender: TObject);
begin
//  JumpTo(_ROMData.Levels[cbLevels.ItemIndex].RoomOrderOffset + _ROMdata.ROM[_ROMData.Levels[cbLevels.ItemIndex].Properties['ScreenStartCheck1'].Value]);
end;

procedure TfrmDebugROMViewer.cmdPaletteClick(Sender: TObject);
begin
//  JumpTo(_ROMData.Levels[cbLevels.ItemIndex].PaletteOffset);
end;

procedure TfrmDebugROMViewer.cmdEnemyPointerClick(Sender: TObject);
begin
//  JumpTo(_ROMData.Levels[cbLevels.ItemIndex].EnemyPointerOffset);
end;

procedure TfrmDebugROMViewer.cmdActualEnemyDataClick(Sender: TObject);
begin
//  JumpTo(_ROMdata.ROM.PointerToOffset(_ROMData.Levels[cbLevels.ItemIndex].EnemyPointerOffset));
end;

procedure TfrmDebugROMViewer.cmdLevelPointersClick(Sender: TObject);
begin
//  JumpTo(_ROMData.Levels[cbLevels.ItemIndex].RoomPointersOffset);
end;

procedure TfrmDebugROMViewer.cmdScrollClick(Sender: TObject);
begin
//  JumpTo(_ROMData.Levels[cbLevels.ItemIndex].ScrollOffset + _ROMdata.ROM[_ROMData.Levels[cbLevels.ItemIndex].ScrollStartOffset]);
end;

procedure TfrmDebugROMViewer.cmdRoomOrderStartOffsetClick(Sender: TObject);
begin
//  JumpTo(_ROMData.Levels[cbLevels.ItemIndex].Properties['ScreenStartCheck1'].Offset);
end;

procedure TfrmDebugROMViewer.cmdSpecObjDataClick(Sender: TObject);
begin
//  JumpTo(_ROMData.Levels[cbLevels.ItemIndex].SpecObjOffset);
end;

end.
