unit fRoomOrderEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GR32_Image, GR32, Buttons, cMegaROM, cConfiguration;

type
  TfrmRoomOrder = class(TForm)
    lstRooms: TListBox;
    imgRoomPreview: TImage32;
    cmdOK: TButton;
    cmdCancel: TButton;
    cmdSetRoomStart: TSpeedButton;
    cmdSetCheckPoint1: TSpeedButton;
    cmdSetCheckPoint2: TSpeedButton;
    cmdChk1Activate: TSpeedButton;
    cmdChk2Activate: TSpeedButton;
    cmdRoomOrderKey: TButton;
    procedure FormShow(Sender: TObject);
    procedure lstRoomsClick(Sender: TObject);
    procedure lstRoomsDblClick(Sender: TObject);
    procedure lstRoomsDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cmdSetRoomOrderStartClick(Sender: TObject);
    procedure cmdSetRoomCheckpoint1Click(Sender: TObject);
    procedure cmdSetRoomCheckpoint2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmdChk1ActivateClick(Sender: TObject);
    procedure cmdChk2ActivateClick(Sender: TObject);
    procedure cmdRoomOrderKeyClick(Sender: TObject);
  private
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    _RoomOrderStart, _RoomOrderChk1, _RoomOrderChk2, _Chk1Activate,_Chk2Activate : Byte;
    Chk1Respawn,Chk2Respawn,Chk1Act,Chk2Act : TBitmap;
    procedure LoadRoomOrder();
    procedure DisplayRoom();
    { Private declarations }
  public
    property RoomOrderStart : Byte read _RoomOrderStart write _RoomOrderStart;
    property RoomOrderChk1 : Byte read _RoomOrderChk1 write _RoomOrderChk1;
    property RoomOrderChk2 : Byte read _RoomOrderChk2 write _RoomOrderChk2;
    property Chk1Activate : Byte read _Chk1Activate write _Chk1Activate;
    property Chk2Activate : Byte read _Chk2Activate write _Chk2Activate;
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;
    { Public declarations }
  end;

var
  frmRoomOrder: TfrmRoomOrder;

implementation

{$R *.dfm}
uses uglobal, fHexadecimalEntry, fRoomOrderKey;

procedure TfrmRoomOrder.LoadRoomOrder();
var
  i : Integer;
begin
  // Cease the drawing on the listbox. This means that
  // the listbox doesn't redraw every time we add a new entry,
  // which is probably one of the major causes of slow applications.
  lstRooms.Items.BeginUpdate;
  // Clear the listbox, if it has any contents.
  lstRooms.Items.Clear;
  // Loop through all the room order data and load it into the listbox.
  for i := 0 to _ROMData.RoomOrder.Count - 1 do
    lstRooms.Items.Add(IntToHex(_ROMData.RoomOrder[i],2));
  // Resume painting of the listbox.
  lstRooms.Items.EndUpdate;
end;

procedure TfrmRoomOrder.FormShow(Sender: TObject);
begin

  Chk1Respawn := TBitmap.Create;
  Chk1Respawn.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\chk1.bmp');
  Chk1Respawn.TransparentMode := tmFixed;
  Chk1Respawn.TransparentColor := Chk1Respawn.Canvas.Pixels[0,0];
  Chk1Respawn.Transparent := True;

  Chk2Respawn := TBitmap.Create;
  Chk2Respawn.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\chk2.bmp');
  Chk2Respawn.TransparentMode := tmFixed;
  Chk2Respawn.TransparentColor := Chk2Respawn.Canvas.Pixels[0,0];
  Chk2Respawn.Transparent := True;

  Chk1Act := TBitmap.Create;
  Chk1Act.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\chk1-2.bmp');
  Chk1Act.TransparentMode := tmFixed;
  Chk1Act.TransparentColor := Chk1Respawn.Canvas.Pixels[0,0];
  Chk1Act.Transparent := True;

  Chk2Act := TBitmap.Create;
  Chk2Act.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\chk2-2.bmp');
  Chk2Act.TransparentMode := tmFixed;
  Chk2Act.TransparentColor := Chk2Respawn.Canvas.Pixels[0,0];
  Chk2Act.Transparent := True;

  // Initialise the various variables that this screen can
  // edit in relation to the room order list. Mostly where to load the
  // data from.
  _RoomOrderStart := _ROMData.CurrLevel.Properties['ScreenStartCheck1'].Value;
  _RoomOrderChk1 := _ROMData.CurrLevel.Properties['ScreenStartCheck2'].Value;
  _RoomOrderChk2 := _ROMData.CurrLevel.Properties['ScreenStartCheck3'].Value;
  _Chk1Activate := _ROMData.CurrLevel.Properties['ScreenStartChk2Trig'].Value;
  _Chk2Activate := _ROMData.CurrLevel.Properties['ScreenStartChk3Trig'].Value;
  // Load in the room order into the listbox. (Perhaps this procedure should
  // be changed in name, as it could potentially confuse people with the
  // MegamanROM.LoadRoomOrder procedure)
  LoadRoomOrder();
  // Set the initial item index to the current room.
  // Maybe this should be the first room in the level? I don't
  // know.
  lstRooms.ItemIndex := _RoomOrderStart;
  // Display the room in the preview image.
  DisplayRoom;

end;

procedure TfrmRoomOrder.lstRoomsClick(Sender: TObject);
begin
  // Change the room that is currently displayed.
  DisplayRoom;
end;

// This function draws the screen preview that is displayed on the right.
procedure TfrmRoomOrder.DisplayRoom();
var
  TempBitmap : TBitmap32;
begin
  TempBitmap := TBitmap32.create;
  try
    TempBitmap.Width := 256;
    TempBitmap.Height := 256;

    _ROMData.DrawScreenIndex(TempBitmap,lstRooms.ItemIndex);
    imgRoomPreview.Bitmap := TempBitmap;
  finally
    FreeAndNil(TempBitmap);
  end;
end;

procedure TfrmRoomOrder.lstRoomsDblClick(Sender: TObject);
var
//  NewVal : String;
  Hex : TfrmHex;
  OldItemIndex : Integer;
begin
  // If there is not any rooms selected, then do not bother
  // to edit.
  if lstRooms.ItemIndex > -1 then
  begin
    Hex := TfrmHex.Create(self);
    try
      Hex.Caption := 'Room Order Byte Entry';
      Hex.Description := 'Please enter the room ID:';
      Hex.InitValue := lstRooms.Items[lstRooms.ItemIndex];
      if Hex.ShowModal = mrOk then
      begin
        // Store the selected item, because when the list is reloaded, the item
        // index is set to -1.
        OldItemIndex := lstRooms.ItemIndex;

        // Now we set the room order to be the new value.
        _ROMData.RoomOrder[lstRooms.ItemIndex] := Hex.ReturnValue;
        // Repopulate the listbox, to make it look like we are updating the
        // listbox, not the stored byte array.
        LoadRoomOrder();
        // Reset the itemindex (which is now -1) to the last selected item.
        lstRooms.ItemIndex := OldItemIndex;
        // Display the currently selected room, again.
        DisplayRoom;

      end;
    finally
      FreeAndNil(Hex);
    end;
  end;
end;

procedure TfrmRoomOrder.lstRoomsDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  // First, fill the current area with the colour of the window.
  lstRooms.Canvas.Brush.Color := clWindow;
  lstRooms.Canvas.FillRect(Rect);

  if (Index >= _RoomOrderStart) and (Index <= _RoomOrderStart + _ROMData.CurrLevel.RoomAmount) then
  begin
    lstRooms.Canvas.Brush.Color := clSkyBlue;
    lstRooms.Canvas.FillRect(Rect);
    lstRooms.Canvas.Font.Color := clBlack;
    lstRooms.Canvas.TextOut(Rect.Left + 1,Rect.Top + 1,lstRooms.Items[index]);
  end
  else
  begin
    lstRooms.Canvas.Brush.Color := clWindow;
    lstRooms.Canvas.FillRect(Rect);
    lstRooms.Canvas.Font.Color := clBlack;
    lstRooms.Canvas.TextOut(Rect.Left + 1,Rect.Top + 1,lstRooms.Items[index]);
  end;

  if (Index = _RoomOrderChk1) then
  begin
    lstRooms.Canvas.Draw(60,Rect.Top,Chk1Respawn);
  end;

  if (Index = _RoomOrderChk2) then
  begin
    lstRooms.Canvas.Draw(76,Rect.Top,Chk2Respawn);
  end;

  if (Index = _Chk1Activate) then
  begin
    lstRooms.Canvas.Draw(92,Rect.Top,Chk1Act);
  end;

  if (Index = _Chk2Activate) then
  begin
    lstRooms.Canvas.Draw(108,Rect.Top,Chk2Act);
  end;

  if odSelected in State  then
  begin
    lstRooms.Canvas.FrameRect(Rect);
    lstRooms.Font.Color := clBlack;
  end;

end;

procedure TfrmRoomOrder.cmdSetRoomOrderStartClick(Sender: TObject);
begin
  if lstRooms.ItemIndex > -1 then
  begin
    _RoomOrderStart := lstRooms.ItemIndex;
    lstRooms.Refresh;
  end;
end;

procedure TfrmRoomOrder.cmdSetRoomCheckpoint1Click(Sender: TObject);
begin
  if lstRooms.ItemIndex > -1 then
  begin
    _RoomOrderChk1 := lstRooms.ItemIndex;
    lstRooms.Refresh;
  end;
end;

procedure TfrmRoomOrder.cmdSetRoomCheckpoint2Click(Sender: TObject);
begin
  if lstRooms.ItemIndex > -1 then
  begin
    _RoomOrderChk2 := lstRooms.ItemIndex;
    lstRooms.Refresh;
  end;
end;

procedure TfrmRoomOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(Chk1Respawn);
  FreeAndNil(Chk2Respawn);
  FreeAndNil(Chk1Act);
  FreeAndNil(Chk2Act);
end;

procedure TfrmRoomOrder.cmdChk1ActivateClick(Sender: TObject);
begin

  if lstRooms.ItemIndex > -1 then
  begin
    _Chk1Activate := lstRooms.ItemIndex;
    lstRooms.Refresh;
  end;

end;

procedure TfrmRoomOrder.cmdChk2ActivateClick(Sender: TObject);
begin
  if lstRooms.ItemIndex > -1 then
  begin
    _Chk2Activate := lstRooms.ItemIndex;
    lstRooms.Refresh;
  end;
end;

procedure TfrmRoomOrder.cmdRoomOrderKeyClick(Sender: TObject);
var
  RoomOrderKey : TfrmRoomOrderKey;
begin
  RoomOrderKey := TfrmRoomOrderKey.Create(self);
  try
    RoomOrderKey.ShowModal;
  finally
    FreeAndNil(RoomOrderKey);
  end;
end;

end.
