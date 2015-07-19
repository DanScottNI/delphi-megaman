unit fScrollEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GR32_Image, GR32, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList,
  Buttons, cMegaROM, cConfiguration;

type
  TfrmScrollEditor = class(TForm)
    cmdOK: TButton;
    cmdCancel: TButton;
    imgScroll: TImage32;
    lstScrollProperties: TListBox;
    ImageList1: TImageList;
    cmdSetScrollStart: TSpeedButton;
    cmdSetCheckPoint1: TSpeedButton;
    cmdSetCheckPoint2: TSpeedButton;
    cmdScrollKey: TButton;
    chkSimpleMode: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure lstScrollPropertiesDblClick(Sender: TObject);
    procedure cmdCancelClick(Sender: TObject);
    procedure lstScrollPropertiesDrawItem(Control: TWinControl;
      Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure cmdSetStartScrollDataClick(Sender: TObject);
    procedure cmdSetCheckPoint1Click(Sender: TObject);
    procedure cmdSetCheckPoint2Click(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure cmdScrollKeyClick(Sender: TObject);
    procedure lstScrollPropertiesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkSimpleModeClick(Sender: TObject);
  private
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    _ScrollStart, _ScrollChk1Respawn,_ScrollChk2Respawn, ItemIndex : Byte;
    Chk1Respawn,Chk2Respawn : TBitmap;
    procedure DrawScroll();
    function WorkOutEndOfScrollData() : Integer;
    function CreateScrollText(pID : Byte): String;
    procedure LoadScrollData();
    { Private declarations }
  public
    property ScrollStart : Byte read _ScrollStart write _ScrollStart;
    property ScrollChk1Respawn : Byte read _ScrollChk1Respawn write _ScrollChk1Respawn;
    property ScrollChk2Respawn : Byte read _ScrollChk2Respawn write _ScrollChk2Respawn;
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;    
    { Public declarations }
  end;

var
  frmScrollEditor: TfrmScrollEditor;

implementation

uses uglobal, fScrKey,fHexadecimalEntry, fSimpleScrollEdit;

{$R *.dfm}

procedure TfrmScrollEditor.DrawScroll();
var
  DrawBitmap : TBitmap32;
begin
  DrawBitmap := TBitmap32.Create;
  try
    DrawBitmap.Height := 400;
    DrawBitmap.Width := 400;

    _ROMData.DrawScrollData(DrawBitmap, _ScrollStart, _ScrollChk1Respawn, _ScrollChk2Respawn);
    imgScroll.Bitmap := DrawBitmap;
  finally
    FreeAndNil(DrawBitmap);
  end;

end;

procedure TfrmScrollEditor.LoadScrollData();
var
  i : Integer;
begin
//  lstScrollProperties.Items.BeginUpdate;
  lstScrollProperties.Items.Clear;

  if chkSimpleMode.checked = True then
  begin
    for i := 0 to _ROMData.CurrLevel.ScrollData.Count -1 do
    begin
      lstScrollProperties.Items.Add(CreateScrollText(_ROMData.CurrLevel.ScrollData[i]));
    end;
  end
  else
  begin
    for i := 0 to _ROMData.CurrLevel.ScrollData.Count - 1 do
    begin
      lstScrollProperties.Items.Add(IntToHex(_ROMData.CurrLevel.ScrollData[i],2));
    end;
  end;


  lstScrollProperties.ItemIndex := _ScrollStart;
//  lstScrollProperties.Items.EndUpdate;
  lstScrollproperties.Refresh;
end;

function TfrmScrollEditor.CreateScrollText(pID : Byte): String;
var
  res : String;
begin

  if pID = $FF then
  begin
    result := 'Nothing';
    exit;
  end
  else if pID = $00 then
  begin
    result := 'Boss/End';
    exit;
  end;

  // up
  if pID and $80 = $80 then
  begin
    res := 'Up After ';
  end
  // down
  else if pID and $40 = $40 then
  begin
    res := 'Down After ';
  end
  // stop.
  else if pID and $20 = $20 then
  begin
    res := 'Right - Stop ';
  end
  else
  begin
    res := 'Right ';
  end;


  res := res + IntToStr(pID and $1F + 1);
  result := res;
end;

procedure TfrmScrollEditor.FormShow(Sender: TObject);
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

  _ScrollStart := _ROMData.CurrLevel.ScrollStart;
  _ScrollChk1Respawn := _ROMData.CurrLevel.Properties['ScrollPosChk1'].Value;
  _ScrollChk2Respawn := _ROMData.CurrLevel.Properties['ScrollPosChk2'].Value;

  DrawScroll();
  LoadScrollData();
end;

procedure TfrmScrollEditor.lstScrollPropertiesDblClick(Sender: TObject);
var
//  NewVal : String;
  Hex : TfrmHex;
  ScrEd : TfrmSimpleScrollEd;
begin
  if chkSimpleMode.Checked = false then
  begin
    Hex := TfrmHex.Create(self);
    try
      Hex.Caption := 'Scroll Byte Entry';
      Hex.Description := 'Please enter a scroll byte:';
      Hex.InitValue := lstScrollProperties.Items[lstScrollProperties.ItemIndex];
      if Hex.ShowModal = mrOk then
      begin
        _ROMData.CurrLevel.ScrollData[lstScrollProperties.ItemIndex] := Hex.ReturnValue;
        LoadScrollData();
        DrawScroll();
      end;
    finally
      FreeAndNil(Hex);
    end;
  end
  else
  begin
    ScrEd := TfrmSimpleScrollEd.Create(self);
    try
      ScrEd.ScrollByte := _ROMData.CurrLevel.ScrollData[lstScrollProperties.ItemIndex];
      if ScrEd.ShowModal = mrOk then
      begin
        _ROMData.CurrLevel.ScrollData[lstScrollProperties.ItemIndex] := ScrEd.ScrollByte;
        LoadScrollData();
        DrawScroll();
      end;
    finally
      FreeAndNil(ScrEd);
    end;
  end;

end;

procedure TfrmScrollEditor.cmdCancelClick(Sender: TObject);
begin
  _ROMData.LoadScrollData;
end;

procedure TfrmScrollEditor.lstScrollPropertiesDrawItem(
  Control: TWinControl; Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
begin
  lstScrollProperties.Canvas.Brush.Color := clWhite;
  lstScrollProperties.Canvas.FillRect(Rect);

  if (Index >= _ScrollStart) and (Index <= WorkOutEndOfScrollData()) then
  begin
    lstScrollProperties.Canvas.Brush.Color := clSkyBlue;
    lstScrollProperties.Canvas.FillRect(Rect);

    lstScrollProperties.Canvas.Font.Color := clBlack;
    lstScrollProperties.Canvas.TextOut(Rect.Left + 1,Rect.Top + 1,lstScrollProperties.Items[index]);

  end
  else
  begin
    lstScrollProperties.Canvas.Brush.Color := clWhite;
    lstScrollProperties.Canvas.FillRect(Rect);

    lstScrollProperties.Canvas.Font.Color := clBlack;
    lstScrollProperties.Canvas.TextOut(Rect.Left + 1,Rect.Top + 1,lstScrollProperties.Items[index]);
  end;

  if Index = _ScrollChk1Respawn then
  begin
    lstScrollProperties.Canvas.Draw(80,Rect.Top,Chk1Respawn);
  end;

  if Index = _ScrollChk2Respawn then
  begin
      lstScrollProperties.Canvas.Draw(96,Rect.Top,Chk2Respawn);
  end;
  if odSelected in State  then
  begin
    lstScrollProperties.Canvas.FrameRect(Rect);
    lstScrollProperties.Font.Color := clBlack;
  end;

end;

function TfrmScrollEditor.WorkOutEndOfScrollData() : Integer;
var
  pos : Integer;
begin
  pos := _ScrollStart;
  while (_ROMData.CurrLevel.ScrollData[pos] <> $00) and (pos < _ROMData.CurrLevel.ScrollData.Count) do
  begin
    inc(pos);
  end;
  result := pos;
end;

procedure TfrmScrollEditor.cmdSetStartScrollDataClick(Sender: TObject);
begin
  if lstScrollProperties.ItemIndex > -1 then
  begin
    _ScrollStart := lstScrollProperties.ItemIndex;
    DrawScroll;
    lstScrollProperties.Refresh;
  end;
end;

procedure TfrmScrollEditor.cmdSetCheckPoint1Click(Sender: TObject);
begin
  if lstScrollProperties.ItemIndex > -1 then
  begin
    _ScrollChk1Respawn := lstScrollProperties.ItemIndex;
    DrawScroll();
    lstScrollProperties.Refresh;
  end;
end;

procedure TfrmScrollEditor.cmdSetCheckPoint2Click(Sender: TObject);
begin
  if lstScrollProperties.ItemIndex > -1 then
  begin
    _ScrollChk2Respawn := lstScrollProperties.ItemIndex;
    DrawScroll();
    lstScrollProperties.Refresh;
  end;
end;

procedure TfrmScrollEditor.cmdOKClick(Sender: TObject);
begin
  // Run a check that the check point 1+2 are inside the range of the
  // scroll for this level.
  if (_ScrollChk1Respawn < _ScrollStart) or (_ScrollChk2Respawn < _ScrollStart) then
  begin
    showmessage('One of the scroll checkpoints are not located within the scroll data.');
    modalresult := mrNone;
    exit;
  end;
  // Check that scroll checkpoint 1 isn't greater than scroll checkpoint 2.
  if (_ScrollChk1Respawn > _ScrollChk2Respawn) then
  begin
    showmessage('Scroll checkpoint 1 is greater than scroll checkpoint 2. This could cause anomalous effects.');
    modalresult := mrNone;
    exit;
  end;

  // Check that scroll checkpoint 1+2 are not outside of the range
  // of the scroll data.
  if (_ScrollChk1Respawn > WorkOutEndOfScrollData) or (_ScrollChk2Respawn > WorkOutEndOfScrollData) then
  begin
    showmessage('Scroll checkpoint 1 or 2 is outside of the scroll data. Please fix this.');
    modalresult := mrNone;
    exit;
  end;



end;

procedure TfrmScrollEditor.cmdScrollKeyClick(Sender: TObject);
var
  ScrKey : TfrmScrollKey;
begin
  ScrKey := TfrmScrollKey.Create(self);
  try
    ScrKey.ShowModal;
  finally
    FreeAndNil(ScrKey);
  end;
end;

procedure TfrmScrollEditor.lstScrollPropertiesClick(Sender: TObject);
begin
  ItemIndex := lstScrollProperties.ItemIndex;
end;

procedure TfrmScrollEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(Chk1Respawn);
  FreeAndNil(Chk2Respawn);
end;

procedure TfrmScrollEditor.chkSimpleModeClick(Sender: TObject);
begin
  LoadScrollData();
end;

end.
