unit fTileEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GR32, GR32_Image, GR32_layers,StdCtrls, cMegaROM, cConfiguration;

type
  Tfrm16x16TileEditor = class(TForm)
    imgTile: TImage32;
    imgAvailPal: TImage32;
    cmdOK: TButton;
    cmdCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure imgTileMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgTileMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer; Layer: TCustomLayer);
    procedure imgAvailPalMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure cmdOKClick(Sender: TObject);
  private
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    SelPalLeft,SelPalRight : Byte;
    procedure Draw8x8Tile;
    procedure DisplayPalette;
    { Private declarations }
  public
    pMode : Byte;
    TileID : Integer;
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;
    { Public declarations }
  end;

var
  frm16x16TileEditor: Tfrm16x16TileEditor;


implementation

uses uglobal;

var
  DaTile : T16x16Graphic;

{$R *.dfm}
const
  LEVEL : Byte = 0;
  TITLESCREEN : Byte = 1;
  INTRO : Byte = 2;
  ENDING : Byte = 3;

procedure Tfrm16x16TileEditor.FormShow(Sender: TObject);
begin
  if pMode = LEVEL then
  begin
    DaTile := _ROMData.Export8x8Pat(TileID);
  end;

  Draw8x8Tile();
  DisplayPalette();
end;

procedure Tfrm16x16TileEditor.DisplayPalette();
var
  TempBitmap : TBitmap32;
begin
  TempBitmap := TBitmap32.Create;
  try
    TempBitmap.Width := 100;
    TempBitmap.Height := 25;
    if pMode = LEVEL then
    begin
      TempBitmap.FillRect(0,0,25,25, _ROMData.NESPal[_ROMData.Palette[_EditorConfig.LastPaletteTileEditor,0]]);
      TempBitmap.FillRect(25,0,50,25, _ROMData.NESPal[_ROMData.Palette[_EditorConfig.LastPaletteTileEditor,1]]);
      TempBitmap.FillRect(50,0,75,25, _ROMData.NESPal[_ROMData.Palette[_EditorConfig.LastPaletteTileEditor,2]]);
      TempBitmap.FillRect(75,0,100,25, _ROMData.NESPal[_ROMData.Palette[_EditorConfig.LastPaletteTileEditor,3]]);
    end;
    
    TempBitmap.FrameRectS(SelPalLeft * 25,0,SelPalLeft * 25 + 25,25,clRed32);
    TempBitmap.FrameRectS(SelPalRight * 25,0,SelPalRight * 25 + 25,25,clAqua32);
    imgAvailPal.Bitmap := TempBitmap;
  finally
    FreeAndNil(TempBitmap);
  end;
end;

procedure Tfrm16x16TileEditor.Draw8x8Tile();
var
  i,x : Integer;
  TempBitmap : TBitmap32;
begin
  TempBitmap := TBitmap32.Create;
  try
    TempBitmap.Width := 16;
    TempBitmap.Height := 16;
    if pMode = LEVEL then
    begin
      for x := 0 to 15 do
        for i := 0 to 15 do
          TempBitmap.Pixel[x,i] := _ROMData.NESPal[_ROMData.Palette[_EditorConfig.LastPaletteTileEditor,DaTile.Pixels[i,x]]];

    end;
    imgTile.Bitmap := TempBitmap;
  finally
    FreeAndNil(TempBitmap);
  end;
end;

procedure Tfrm16x16TileEditor.imgTileMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if Button = mbLeft then
  begin
    if (x <= 0) or (x >= 160) then exit;
    if (y <= 0) or (y >= 160) then exit;

    DaTile.Pixels[Y div 10,X div 10] := SelPalLeft;

    Draw8x8Tile();
  end
  else if Button = mbRight then
  begin
    if (x <= 0) or (x >= 160) then exit;
    if (y <= 0) or (y >= 160) then exit;
    DaTile.Pixels[Y div 10,X div 10] := SelPalRight;
    Draw8x8Tile();
  end;
end;

procedure Tfrm16x16TileEditor.imgTileMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
begin
  if ssLeft in Shift then
  begin
    if (x <= 0) or (x >= 160) then exit;
    if (y <= 0) or (y >= 160) then exit;

    DaTile.Pixels[Y div 10,X div 10] := SelPalLeft;

    Draw8x8Tile();
  end
  else if ssRight in Shift then
  begin
    if (x <= 0) or (x >= 160) then exit;
    if (y <= 0) or (y >= 160) then exit;
    
    DaTile.Pixels[Y div 10,X div 10] := SelPalRight;
    Draw8x8Tile();
  end
end;

procedure Tfrm16x16TileEditor.imgAvailPalMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if (Button = mbMiddle) or ((Button = mbLeft) and (ssShift in Shift)) then
  begin
    if _EditorConfig.LastPaletteTileEditor = 3 then
      _EditorConfig.LastPaletteTileEditor := 0
    else
      _EditorConfig.LastPaletteTileEditor := _EditorConfig.LastPaletteTileEditor +1;

    DisplayPalette;
    Draw8x8Tile();
  end
  else if button = mbLeft then
  begin
    SelPalLeft := X div 25;
    DisplayPalette();
  end
  else if button = mbRight then
  begin
    SelPalRight := X div 25;
    DisplayPalette();
  end
end;

procedure Tfrm16x16TileEditor.cmdOKClick(Sender: TObject);
begin
  if pMode = LEVEL then
    _ROMData.Import8x8Pat(TileID,DaTile);
end;

end.
