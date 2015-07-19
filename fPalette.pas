unit fPalette;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, GR32_Image, gr32, gr32_layers, cMegaROM,cConfiguration;

type
  TfrmPalette = class(TForm)
    lbl000F: TLabel;
    lbl101F: TLabel;
    lbl202F: TLabel;
    lbl303F: TLabel;
    lblCurrentPalette: TLabel;
    imgNESColours: TImage32;
    pgcPalette: TPageControl;
    tshCurrentLevel: TTabSheet;
    tshWeaponColours: TTabSheet;
    imgLevelBG1: TImage32;
    imgLevelBG2: TImage32;
    imgLevelBG3: TImage32;
    imgLevelBG4: TImage32;
    imgLevelSpr1: TImage32;
    imgLevelSpr2: TImage32;
    imgLevelSpr3: TImage32;
    imgLevelSpr4: TImage32;
    cmdOK: TButton;
    cmdCancel: TButton;
    imgLevelBG1After: TImage32;
    imgLevelBG2After: TImage32;
    imgLevelBG3After: TImage32;
    imgLevelBG4After: TImage32;
    lblBeforeDoors: TLabel;
    lblAfterDoors: TLabel;
    imgWeaponNormal: TImage32;
    imgWeaponCuts: TImage32;
    imgWeaponIce: TImage32;
    imgWeaponBomb: TImage32;
    imgWeaponFire: TImage32;
    imgWeaponElec: TImage32;
    imgWeaponGuts: TImage32;
    imgWeaponM: TImage32;
    lblNormal: TLabel;
    lblCuts: TLabel;
    lblIce: TLabel;
    lblBomb: TLabel;
    lblM: TLabel;
    lblGuts: TLabel;
    lblElec: TLabel;
    lblFire: TLabel;
    tshCycles: TTabSheet;
    imgCycleColours: TImage32;
    lblDescription: TLabel;
    imgAfterDeath: TImage32;
    lblAfterDeath: TLabel;
    cmdMatchMegamanPalettes: TButton;
    cmdAfterDoors: TButton;
    procedure FormShow(Sender: TObject);
    procedure imgNESColoursMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer; Layer: TCustomLayer);
    procedure imgNESColoursMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgLevelBG1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgLevelBG2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgLevelBG4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgLevelBG3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgLevelSpr1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgLevelSpr2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgLevelSpr3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgLevelSpr4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWeaponNormalMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgWeaponCutsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWeaponIceMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWeaponBombMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWeaponFireMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWeaponElecMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWeaponGutsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgWeaponMMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgLevelBG1AfterMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgLevelBG2AfterMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgLevelBG3AfterMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure imgLevelBG4AfterMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      Layer: TCustomLayer);
    procedure cmdOKClick(Sender: TObject);
    procedure imgAfterDeathMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure cmdMatchMegamanPalettesClick(Sender: TObject);
    procedure cmdAfterDoorsClick(Sender: TObject);
  private
    _TileX, _TileY : Integer;
    _CurColour : Byte;
    _CyclePalette : Array [0..2] of Byte;
    _WeaponPalette : Array [0..15] of Byte;
    _AfterDeath : Array [0..1] of Byte;
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    procedure DrawNESColours;
    procedure DrawLevelBGPalette;
    procedure DrawLevelSprPalette;
    procedure DrawLevelBGPaletteAfter;
//    procedure DrawLevelSprPaletteAfter;
    procedure DrawWeaponPalettes;
    procedure DrawCycleColours;

    procedure LoadCyclePalette;
    procedure SaveCyclePalette;
    procedure LoadWeaponPalette;
    procedure SaveWeaponPalette;
    { Private declarations }
  public
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;
    { Public declarations }
  end;

var
  frmPalette: TfrmPalette;

implementation

{$R *.dfm}

uses fRockAndRollMain;

procedure TfrmPalette.DrawNESColours;
var
  TempBitmap : TBitmap32;
begin
  TempBitmap := TBitmap32.Create;
  try
    TempBitmap.Width := 287;
    TempBitmap.Height := 74;

    _ROMData.DrawNESColours(TempBitmap);

    if _TileX = 0 then
      TempBitmap.FrameRectS(_TileX,_TileY,_TileX+18,_TileY+19,clRed32)
    else
      TempBitmap.FrameRectS(_TileX-1,_TileY,_TileX+18,_TileY+19,clRed32);

    imgNESColours.Bitmap := TempBitmap;
  finally
    FreeAndNil(TempBitmap);
  end;

end;

procedure TfrmPalette.DrawWeaponPalettes;
var
  TempBitmap : TBitmap32;
begin
  TempBitmap := TBitmap32.Create;
  TempBitmap.Width := 50;
  TempBitmap.Height := 25;

  _ROMData.DrawPaletteData(TempBitmap,@_WeaponPalette[0],2);
  imgWeaponNormal.Bitmap := TempBitmap;
  imgWeaponNormal.Hint := _ROMData.ListPaletteData(@_WeaponPalette[0],2);

  _ROMData.DrawPaletteData(TempBitmap,@_WeaponPalette[2],2);
  imgWeaponCuts.Bitmap := TempBitmap;
  imgWeaponCuts.Hint := _ROMData.ListPaletteData(@_WeaponPalette[2],2);

  _ROMData.DrawPaletteData(TempBitmap,@_WeaponPalette[4],2);
  imgWeaponIce.Bitmap := TempBitmap;
  imgWeaponIce.Hint := _ROMData.ListPaletteData(@_WeaponPalette[4],2);

  _ROMData.DrawPaletteData(TempBitmap,@_WeaponPalette[6],2);
  imgWeaponBomb.Bitmap := TempBitmap;
  imgWeaponBomb.Hint := _ROMData.ListPaletteData(@_WeaponPalette[6],2);

  _ROMData.DrawPaletteData(TempBitmap,@_WeaponPalette[8],2);
  imgWeaponFire.Bitmap := TempBitmap;
  imgWeaponFire.Hint := _ROMData.ListPaletteData(@_WeaponPalette[8],2);

  _ROMData.DrawPaletteData(TempBitmap,@_WeaponPalette[10],2);
  imgWeaponElec.Bitmap := TempBitmap;
  imgWeaponElec.Hint := _ROMData.ListPaletteData(@_WeaponPalette[10],2);

  _ROMData.DrawPaletteData(TempBitmap,@_WeaponPalette[12],2);
  imgWeaponGuts.Bitmap := TempBitmap;
  imgWeaponGuts.Hint := _ROMData.ListPaletteData(@_WeaponPalette[12],2);

  _ROMData.DrawPaletteData(TempBitmap,@_WeaponPalette[14],2);
  imgWeaponM.Bitmap := TempBitmap;
  imgWeaponM.Hint := _ROMData.ListPaletteData(@_WeaponPalette[14],2);

  _ROMData.DrawPaletteData(TempBitmap,@_AfterDeath[0],2);
  imgAfterDeath.Bitmap := TempBitmap;
  imgAfterDeath.Hint := _ROMData.ListPaletteData(@_AfterDeath[0],2);

  FreeAndNil(TempBitmap);

end;

procedure TfrmPalette.DrawLevelBGPaletteAfter;
var
  TempBitmap : TBitmap32;
begin
  TempBitmap := TBitmap32.Create;
  TempBitmap.Width := 100;
  TempBitmap.Height := 25;

  _ROMData.DrawPaletteData( TempBitmap,@_ROMData.AfterDoorsPalette[0,0],4);

  imgLevelBG1After.Hint := _ROMData.ListPaletteData(@_ROMData.AfterDoorsPalette[0,0],4);
  imgLevelBG1After.Bitmap := TempBitmap;

  _ROMData.DrawPaletteData( TempBitmap,@_ROMData.AfterDoorsPalette[1,0],4);
  imgLevelBG2After.Hint := _ROMData.ListPaletteData(@_ROMData.AfterDoorsPalette[1,0],4);
  imgLevelBG2After.Bitmap := TempBitmap;

  _ROMData.DrawPaletteData( TempBitmap,@_ROMData.AfterDoorsPalette[2,0],4);
  imgLevelBG3After.Hint := _ROMData.ListPaletteData(@_ROMData.AfterDoorsPalette[2,0],4);
  imgLevelBG3After.Bitmap := TempBitmap;

  _ROMData.DrawPaletteData( TempBitmap,@_ROMData.AfterDoorsPalette[3,0],4);
  imgLevelBG4After.Hint := _ROMData.ListPaletteData(@_ROMData.AfterDoorsPalette[3,0],4);
  imgLevelBG4After.Bitmap := TempBitmap;

  FreeAndNil(TempBitmap);
end;

procedure TfrmPalette.DrawLevelBGPalette;
var
  TempBitmap : TBitmap32;
begin
  TempBitmap := TBitmap32.Create;
  TempBitmap.Width := 100;
  TempBitmap.Height := 25;

  _ROMData.DrawPaletteData( TempBitmap,@_ROMData.Palette[0,0],4);
  imgLevelBG1.Hint := _ROMData.ListPaletteData(@_ROMData.Palette[0,0],4);
  imgLevelBG1.Bitmap := TempBitmap;

  _ROMData.DrawPaletteData( TempBitmap,@_ROMData.Palette[1,0],4);
  imgLevelBG2.Hint := _ROMData.ListPaletteData(@_ROMData.Palette[1,0],4);
  imgLevelBG2.Bitmap := TempBitmap;

  _ROMData.DrawPaletteData( TempBitmap,@_ROMData.Palette[2,0],4);
  imgLevelBG3.Hint := _ROMData.ListPaletteData(@_ROMData.Palette[2,0],4);
  imgLevelBG3.Bitmap := TempBitmap;

  _ROMData.DrawPaletteData( TempBitmap,@_ROMData.Palette[3,0],4);
  imgLevelBG4.Hint := _ROMData.ListPaletteData(@_ROMData.Palette[3,0],4);
  imgLevelBG4.Bitmap := TempBitmap;

  FreeAndNil(TempBitmap);
end;

procedure TfrmPalette.DrawLevelSprPalette;
var
  TempBitmap : TBitmap32;
begin
  TempBitmap := TBitmap32.Create;
  TempBitmap.Width := 100;
  TempBitmap.Height := 25;

  _ROMData.DrawPaletteData( TempBitmap,@_ROMData.Palette[4,0],4);
  imgLevelSpr1.Hint := _ROMData.ListPaletteData(@_ROMData.Palette[4,0],4);
  imgLevelSpr1.Bitmap := TempBitmap;

  _ROMData.DrawPaletteData( TempBitmap,@_ROMData.Palette[5,0],4);
  imgLevelSpr2.Hint := _ROMData.ListPaletteData(@_ROMData.Palette[5,0],4);
  imgLevelSpr2.Bitmap := TempBitmap;

    _ROMData.DrawPaletteData( TempBitmap,@_ROMData.Palette[6,0],4);
  imgLevelSpr3.Hint := _ROMData.ListPaletteData(@_ROMData.Palette[6,0],4);
  imgLevelSpr3.Bitmap := TempBitmap;

  _ROMData.DrawPaletteData( TempBitmap,@_ROMData.Palette[7,0],4);
  imgLevelSpr4.Hint := _ROMData.ListPaletteData(@_ROMData.Palette[7,0],4);
  imgLevelSpr4.Bitmap := TempBitmap;

  FreeAndNil(TempBitmap);
end;

procedure TfrmPalette.FormShow(Sender: TObject);
begin

  if _ROMData.CurrLevel.Properties.ValueExists('AfterDoorsPalette') = false then
  begin
    lblAfterDoors.Enabled := False;
    imgLevelBG1After.Enabled := False;
    imgLevelBG2After.Enabled := False;
    imgLevelBG3After.Enabled := False;
    imgLevelBG4After.Enabled := False;
  end
  else
  begin
    DrawLevelBGPaletteAfter;
  end;

  if _ROMData.CurrLevel.Properties.ValueExists('ColourCycles') = false then
  begin

    tshCycles.Enabled := False;
    imgCycleColours.Enabled := False;
    pgcPalette.Pages[2].Enabled := False;
    lblDescription.Enabled := False;
  end
  else
  begin
    LoadCyclePalette;
    DrawCycleColours;
  end;

  DrawNESColours;
  LoadWeaponPalette;
  DrawLevelBGPalette;
  DrawLevelSprPalette;
  DrawWeaponPalettes;
end;

procedure TfrmPalette.cmdOKClick(Sender: TObject);
begin
  if _ROMData.CurrLevel.Properties.ValueExists('ColourCycles') = true then
    SaveCyclePalette;

  SaveWeaponPalette;
end;

procedure TfrmPalette.DrawCycleColours;
var
  TempBitmap : TBitmap32;
begin
  TempBitmap := TBitmap32.Create;
  TempBitmap.Width := 50;
  TempBitmap.Height := 25;

  _ROMData.DrawPaletteData(TempBitmap,@_CyclePalette[0],3);
  
  imgCycleColours.Bitmap := TempBitmap;
  imgCycleColours.Hint := _ROMData.ListPaletteData(@_CyclePalette[0],3);
  FreeAndNil(TempBitmap);

end;


procedure TfrmPalette.imgNESColoursMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
begin
  lblCurrentPalette.Caption := 'Palette Colour Under Mouse: $' + IntToHex(((X div 18) + (Y div 18) * 16),2);
end;

procedure TfrmPalette.imgNESColoursMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _CurColour := ((X div 18) + (Y div 18) * 16);
  _TileX := (X div 18) * 18;
  _TileY := (y div 18) * 18;
  DrawNESColours();
end;

procedure TfrmPalette.imgLevelBG1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _ROMData.Palette[0,x div 25] := _CurColour;
  TfrmRockAndRollMain(owner).RedrawScreen;
  DrawLevelBGPalette;
end;

procedure TfrmPalette.imgLevelBG2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _ROMData.Palette[1,x div 25] := _CurColour;
  TfrmRockAndRollMain(owner).RedrawScreen;
  DrawLevelBGPalette;
end;

procedure TfrmPalette.imgLevelBG4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _ROMData.Palette[3,x div 25] := _CurColour;
  TfrmRockAndRollMain(owner).RedrawScreen;
  DrawLevelBGPalette;
end;

procedure TfrmPalette.imgLevelBG3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _ROMData.Palette[2,x div 25] := _CurColour;
  TfrmRockAndRollMain(owner).RedrawScreen;
  DrawLevelBGPalette;
end;

procedure TfrmPalette.imgLevelSpr1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _ROMData.Palette[4,x div 25] := _CurColour;
  DrawLevelSprPalette;
end;

procedure TfrmPalette.imgLevelSpr2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _ROMData.Palette[5,x div 25] := _CurColour;
  DrawLevelSprPalette;
end;

procedure TfrmPalette.imgLevelSpr3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _ROMData.Palette[6,x div 25] := _CurColour;
  DrawLevelSprPalette;
end;

procedure TfrmPalette.imgLevelSpr4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _ROMData.Palette[7,x div 25] := _CurColour;
  DrawLevelSprPalette;
end;

procedure TfrmPalette.imgWeaponNormalMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _WeaponPalette[x div 25] := _CurColour;
  DrawWeaponPalettes;
end;

procedure TfrmPalette.imgWeaponCutsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _WeaponPalette[(x div 25) + 2] := _CurColour;
  DrawWeaponPalettes;
end;

procedure TfrmPalette.imgWeaponIceMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _WeaponPalette[(x div 25) + 4] := _CurColour;
  DrawWeaponPalettes;
end;

procedure TfrmPalette.imgWeaponBombMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _WeaponPalette[(x div 25) + 6] := _CurColour;
  DrawWeaponPalettes;
end;

procedure TfrmPalette.imgWeaponFireMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _WeaponPalette[(x div 25) + 8] := _CurColour;
  DrawWeaponPalettes;
end;

procedure TfrmPalette.imgWeaponElecMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _WeaponPalette[(x div 25) + 10] := _CurColour;
  DrawWeaponPalettes;
end;

procedure TfrmPalette.imgWeaponGutsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _WeaponPalette[(x div 25) + 12] := _CurColour;
  DrawWeaponPalettes;
end;

procedure TfrmPalette.imgWeaponMMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _WeaponPalette[(x div 25) + 14] := _CurColour;
  DrawWeaponPalettes;
end;

procedure TfrmPalette.imgLevelBG1AfterMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _ROMData.AfterDoorsPalette[0, x div 25] := _CurColour;
  TfrmRockAndRollMain(owner).RedrawScreen;
  DrawLevelBGPaletteAfter;
end;

procedure TfrmPalette.imgLevelBG2AfterMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _ROMData.AfterDoorsPalette[1, x div 25] := _CurColour;
  TfrmRockAndRollMain(owner).RedrawScreen;
  DrawLevelBGPaletteAfter;
end;

procedure TfrmPalette.imgLevelBG3AfterMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _ROMData.AfterDoorsPalette[2, x div 25] := _CurColour;
  TfrmRockAndRollMain(owner).RedrawScreen;
  DrawLevelBGPaletteAfter;
end;

procedure TfrmPalette.imgLevelBG4AfterMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _ROMData.AfterDoorsPalette[3, x div 25] := _CurColour;
  TfrmRockAndRollMain(owner).RedrawScreen;
  DrawLevelBGPaletteAfter;
end;


procedure TfrmPalette.LoadCyclePalette;
var
  i : Integer;
begin
  for i := 0 to 2 do
    _CyclePalette[i] := _ROMData.CurrLevel.CycleColours[i];
end;

procedure TfrmPalette.SaveCyclePalette;
var
  i : Integer;
begin
  for i := 0 to 2 do
    _ROMData.CurrLevel.CycleColours[i] := _CyclePalette[i];
end;

procedure TfrmPalette.LoadWeaponPalette;
var
  i : Integer;
begin
  for i := 0 to 15 do
    _WeaponPalette[i] := _ROMData.WeaponColour[i];
  _AfterDeath[0] := _ROMData.Properties['AfterDeath1'].Value;
  _AfterDeath[1] := _ROMData.Properties['AfterDeath2'].Value;
end;

procedure TfrmPalette.SaveWeaponPalette;
var
  i : Integer;
begin
  for i := 0 to 15 do
    _ROMData.WeaponColour[i] := _WeaponPalette[i];

  _ROMData.Properties['AfterDeath1'].Value := _AfterDeath[0];
  _ROMData.Properties['AfterDeath2'].Value := _AfterDeath[1];
end;

procedure TfrmPalette.imgAfterDeathMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _AfterDeath[x div 25] := _CurColour;
  DrawWeaponPalettes;
end;

procedure TfrmPalette.cmdMatchMegamanPalettesClick(Sender: TObject);
begin
  _AfterDeath[0] := _ROMData.Palette[4,1];
  _AfterDeath[1] := _ROMData.Palette[4,2];

  _WeaponPalette[0] := _ROMData.Palette[4,1];
  _WeaponPalette[1] := _ROMData.Palette[4,2];

  DrawWeaponPalettes;
end;

procedure TfrmPalette.cmdAfterDoorsClick(Sender: TObject);
var
  i,x : Integer;

begin
  for i := 0 to 3 do
  begin
    for x := 0 to 3 do
    begin
      _ROMData.AfterDoorsPalette[i,x] := _ROMData.Palette[i,x];
    end;
  end;

  self.DrawLevelBGPaletteAfter;
  
end;

end.
