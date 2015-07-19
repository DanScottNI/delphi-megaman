unit fSpriteChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GR32_Image, gr32,DanHexEdit, Spin, gr32_layers, cMegaROM,
  cConfiguration;

type
  TfrmSpriteChange = class(TForm)
    lbl80: TLabel;
    lbl90: TLabel;
    lblA0: TLabel;
    lblBO: TLabel;
    lblC0: TLabel;
    imgSprPal3: TImage32;
    imgSprPal4: TImage32;
    cmdOK: TButton;
    cmdCancel: TButton;
    lblSpritePalette3: TLabel;
    lblSpritePalette4: TLabel;
    img80: TImage32;
    img90: TImage32;
    imgA0: TImage32;
    imgB0: TImage32;
    imgC0: TImage32;
    cb80: TComboBox;
    cb90: TComboBox;
    cbA0: TComboBox;
    cbB0: TComboBox;
    cbC0: TComboBox;
    lblSpriteChangeSet: TLabel;
    txtSpriteChangeSet: TSpinEdit;
    imgNESColours: TImage32;
    lbl000F: TLabel;
    lbl101F: TLabel;
    lbl202F: TLabel;
    lbl303F: TLabel;
    lblCurrentPalette: TLabel;
    lblRoom: TLabel;
    cbRoom: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure cb80Change(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure txtSpriteChangeSetChange(Sender: TObject);
    procedure imgSprPal3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgNESColoursMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgSprPal4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgNESColoursMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer; Layer: TCustomLayer);

  private
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    _TileX, _TileY : Integer;
    _CurColour : Byte;
    _CurrentSet : Byte;
//    _IgnoreChanges : Boolean;
    _SprPal3 : Array [0..2] of Byte;
    _SprPal4 : Array [0..2] of Byte;
    _SpriteSettings : Array [0..4] of Integer;
    procedure DrawNESColours;
    procedure DrawSpriteChange;
    procedure DrawPalettes;
    procedure SaveData;
    procedure LoadData;
    { Private declarations }
  public
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;
    { Public declarations }
  end;

var
  frmSpriteChange: TfrmSpriteChange;

implementation

{$R *.dfm}

uses uglobal;

procedure TfrmSpriteChange.FormShow(Sender: TObject);
var
  i : Integer;
begin

  _TileX := 0;
  _TileY := 0;
  _CurColour := 0;

  cb80.Items.Clear;
  cb80.Items.BeginUpdate;
  for i := 0 to $FF do
    cb80.Items.Add(IntToHex((i * $100) + $10,4));

  for i := 0 to $2F do
    cbRoom.Items.Add(IntToHex(i,2));
  cb80.ItemIndex := 0;
  cb80.Items.EndUpdate;
//  _IgnoreChanges := True;
  cb90.Items := cb80.Items;
  cbA0.Items := cb80.Items;
  cbB0.Items := cb80.Items;
  cbC0.Items := cb80.Items;

  _CurrentSet := _ROMData.GetSpriteSet(cbRoom.ItemIndex) div $B;

//  if MegamanROM.GetSpriteSet mod $B >0 then showmessage('eh');

  loaddata;

  cb80.ItemIndex := cb80.Items.IndexOf(IntTohex(_SpriteSettings[0],4));
  cb90.ItemIndex := cb90.Items.IndexOf(IntTohex(_SpriteSettings[1],4));
  cbA0.ItemIndex := cbA0.Items.IndexOf(IntTohex(_SpriteSettings[2],4));
  cbB0.ItemIndex := cbB0.Items.IndexOf(IntTohex(_SpriteSettings[3],4));
  cbC0.ItemIndex := cbC0.Items.IndexOf(IntTohex(_SpriteSettings[4],4));

  txtSpriteChangeSet.Value := _CurrentSet;

  DrawSpriteChange;
  DrawPalettes;
  DrawNESColours;
//  _IgnoreChanges := False;
end;

procedure TfrmSpriteChange.DrawSpriteChange;
var
  SprChange : TBitmap32;
begin
  SprChange := TBitmap32.Create;
  SprChange.Width := 128;
  SprChange.Height := 8;
  try
    if cb80.Text <> '' then
    begin
      _ROMData.DrawSpriteChangeTiles(StrToInt('$' + cb80.Text),SprChange);
      img80.Bitmap := SprChange;
    end;

    if cb90.Text <> '' then
    begin
      _ROMData.DrawSpriteChangeTiles(StrToInt('$' + cb90.Text),SprChange);
      img90.Bitmap := SprChange;
    end;

    if cbA0.Text <> '' then
    begin
      _ROMData.DrawSpriteChangeTiles(StrToInt('$' + cbA0.Text),SprChange);
      imgA0.Bitmap := SprChange;
    end;

    if cbB0.Text <> '' then
    begin
      _ROMData.DrawSpriteChangeTiles(StrToInt('$' + cbB0.Text),SprChange);
      imgB0.Bitmap := SprChange;
    end;

    if cbC0.Text <> '' then
    begin
      _ROMData.DrawSpriteChangeTiles(StrToInt('$' + cbC0.Text),SprChange);
      imgC0.Bitmap := SprChange;
    end;
  finally
    FreeAndNil(SprChange);
  end;
end;

procedure TfrmSpriteChange.cb80Change(Sender: TObject);
begin
  DrawSpriteChange;
end;

procedure TfrmSpriteChange.cmdOKClick(Sender: TObject);
begin

  SaveData;

end;

procedure TfrmSpriteChange.txtSpriteChangeSetChange(Sender: TObject);
begin
//  if _IgnoreChanges = false then
  SaveData;
  
  _CurrentSet := txtSpriteChangeSet.Value;
  LoadData;

  cb80.ItemIndex := cb80.Items.IndexOf(IntTohex(_SpriteSettings[0],4));
  cb90.ItemIndex := cb90.Items.IndexOf(IntTohex(_SpriteSettings[1],4));
  cbA0.ItemIndex := cbA0.Items.IndexOf(IntTohex(_SpriteSettings[2],4));
  cbB0.ItemIndex := cbB0.Items.IndexOf(IntTohex(_SpriteSettings[3],4));
  cbC0.ItemIndex := cbC0.Items.IndexOf(IntTohex(_SpriteSettings[4],4));

  DrawSpriteChange;
  DrawPalettes;
end;

procedure TfrmSpriteChange.DrawPalettes;
var
  PalBit : TBitmap32;
begin

  PalBit := TBitmap32.Create;
  try
    PalBit.Width := 75;
    PalBit.Height := 25;

    PalBit.FillRect(0,0,25,25, _ROMData.NESPal[_SprPal3[0]]);
    PalBit.FillRect(25,0,50,25, _ROMData.NESPal[_SprPal3[1]]);
    PalBit.FillRect(50,0,75,25, _ROMData.NESPal[_SprPal3[2]]);
    imgSprPal3.Hint := '$' + IntToHex(_SprPal3[0],2) + ' $' + IntToHex(_SprPal3[1],2) + ' $'
      + IntToHex(_SprPal3[2],2);
    imgSprPal3.Bitmap := PalBit;

    PalBit.FillRect(0,0,25,25, _ROMData.NESPal[_SprPal4[0]]);
    PalBit.FillRect(25,0,50,25, _ROMData.NESPal[_SprPal4[1]]);
    PalBit.FillRect(50,0,75,25, _ROMData.NESPal[_SprPal4[2]]);
    imgSprPal4.Hint := '$' + IntToHex(_SprPal4[0],2) + ' $' + IntToHex(_SprPal4[1],2) + ' $' +
      IntToHex(_SprPal4[2],2);
    imgSprPal4.Bitmap := PalBit;

  finally
    FreeAndNil(PalBit);
  end;

end;

procedure TfrmSpriteChange.LoadData;
var
  i : Integer;
begin
  for i := 0 to 4 do
    _SpriteSettings[i] := _ROMData.GetSpriteChangeOffset(_CurrentSet * $B,i);
  for i := 0 to 2 do
    _SprPal3[i] := _ROMData.GetSpriteChangePal(_CurrentSet * $B,i);
  for i := 0 to 2 do
    _SprPal4[i] := _ROMData.GetSpriteChangePal(_CurrentSet * $B,i+3);
end;

procedure TfrmSpriteChange.SaveData;
var
  i : Integer;
begin

  _ROMData.SetSpriteSet(_CurrentSet * $B,(cbRoom.ItemIndex));
  _ROMData.SetSpriteChangeOffset(_CurrentSet * $B,0,StrToInt('$' + cb80.Text));
  _ROMData.SetSpriteChangeOffset(_CurrentSet * $B,1,StrToInt('$' + cb90.Text));
  _ROMData.SetSpriteChangeOffset(_CurrentSet * $B,2,StrToInt('$' + cbA0.Text));
  _ROMData.SetSpriteChangeOffset(_CurrentSet * $B,3,StrToInt('$' + cbB0.Text));
  _ROMData.SetSpriteChangeOffset(_CurrentSet * $B,4,StrToInt('$' + cbC0.Text));

  for i := 0 to 2 do
    _ROMData.SetSpriteChangePal(_CurrentSet * $B,i,_SprPal3[i]);
  for i := 0 to 2 do
    _ROMData.SetSpriteChangePal(_CurrentSet * $B,i+3,_SprPal4[i]);

end;

procedure TfrmSpriteChange.DrawNESColours;
var
  TempBitmap : TBitmap32;
begin
  TempBitmap := TBitmap32.Create;
  try
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

procedure TfrmSpriteChange.imgSprPal3MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _SprPal3[x div 25] := _CurColour;
  DrawPalettes;
end;

procedure TfrmSpriteChange.imgNESColoursMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _CurColour := ((X div 18) + (Y div 18) * 16);
  _TileX := (X div 18) * 18;
  _TileY := (y div 18) * 18;
  DrawNESColours();
end;

procedure TfrmSpriteChange.imgSprPal4MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _SprPal4[x div 25] := _CurColour;
  DrawPalettes;
end;

procedure TfrmSpriteChange.imgNESColoursMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
begin
  lblCurrentPalette.Caption := 'Palette Colour Under Mouse: $' + IntToHex(((X div 18) + (Y div 18) * 16),2);
end;

end.

