unit fTSAEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GR32_Image, GR32, GR32_Layers, ComCtrls, cMegaROM, cConfiguration;

type
  TfrmTSA = class(TForm)
    imgTSA: TImage32;
    StatusBar: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure imgTSAMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgTSAMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer; Layer: TCustomLayer);
  private
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    TileX, TileY : Integer;
    { Private declarations }
  public
    procedure DrawPatternTable();
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;
    { Public declarations }
  end;

var
  frmTSA: TfrmTSA;

implementation

uses fRockAndRollMain, uGlobal, fTileEditor;

{$R *.dfm}

procedure TfrmTSA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmRockAndRollMain.CurTSABlock := -1;
  frmRockAndRollMain.UpdateTitleCaption;
  frmRockAndROllMain.DrawTileSelector;
  Action := caFree;
end;

procedure TfrmTSA.DrawPatternTable();
var
  TSA : TBitmap32;
begin
  TSA := TBitmap32.Create;
  try
    TSA.Width := 128;
    TSA.Height := 128;
    _ROMData.DrawTSAPatternTable(TSA,_EditorConfig.LastPaletteTSA);
    TSA.FrameRectS(TileX,TileY,TileX+16,TileY + 16,clRed32);
    imgTSA.Bitmap := TSA;
  finally
    FreeAndNil(TSA);
  end;
end;

procedure TfrmTSA.FormShow(Sender: TObject);
begin
  DrawPatternTable();
  frmRockAndRollMain.CurTSABlock := 0;
end;

procedure TfrmTSA.imgTSAMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
var
  Tile : Integer;
  TilEd : Tfrm16x16TileEditor;
//  Erase : TfrmErasePatRange;
begin
  if (Button = mbMiddle) or ((ssShift in Shift) and (Button = mbLeft)) then
  begin
    TileX := ((X div 2) div 16) * 16;
    TileY := ((y div 2) div 16) * 16;

    Tile := ((TileY div 16) * 8) + (TileX div 16);
    //showmessage(IntToStr(Y));
    frmRockAndRollMain.CurTSABlock := Tile;
//    showmessage(IntToStr(Tile div 32));
    DrawPatternTable();
    TilEd := Tfrm16x16TileEditor.Create(self);
    try
      TilEd.TileID := frmRockAndRollMain.CurTSABlock + $40;
      TilEd.ROMData := _ROMData;
      TilEd.EditorConfig := _EditorConfig;
      if TilEd.ShowModal = mrOK then
      begin
        _ROMData.SavePatternTable();
        DrawPatternTable();
        frmRockAndRollMain.RedrawScreen;
        frmRockAndRollMain.UpdateTitleCaption;
      end;
    finally
      FreeAndNil(TilEd);
    end;
  end
  else if button = mbLeft then
  begin
    TileX := ((X div 2) div 16) * 16;
    TileY := ((y div 2) div 16) * 16;

    Tile := ((TileY div 16) * 8) + (TileX div 16);

    frmRockAndRollMain.CurTSABlock := Tile;

  end
  else if button = mbRight then
  begin
{    if ssShift in Shift then
    begin
      Erase := TfrmErasePatRange.Create(self);
      try
        Erase.Mode := 0;
        if Erase.ShowModal = mrOk then
        begin
          CVROM.SavePatternTable();
          DrawPatternTable();
          frmStake.RedrawScreen;
        end;
      finally
        FreeAndNil(Erase);
      end;
    end
    else}
    begin
      if _EditorConfig.LastPaletteTSA = 3 then
        _EditorConfig.LastPaletteTSA := 0
      else
        _EditorConfig.LastPaletteTSA := _EditorConfig.LastPaletteTSA + 1;
    end;
  end;
  DrawPatternTable();

end;

procedure TfrmTSA.imgTSAMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer; Layer: TCustomLayer);
begin
  StatusBar.Panels[0].Text := 'Selected: ' + IntToHex(frmRockAndRollMain.CurTSABlock,2);
  StatusBar.Panels[1].Text := IntToHex(((((X div 2) div 16) * 16) div 16) + (((((y div 2) div 16) * 16) div 16) * 8),2);
end;

end.
