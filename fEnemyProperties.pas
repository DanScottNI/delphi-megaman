unit fEnemyProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GR32_Image, DanHexEdit, cMegaROM, cConfiguration;

type
  TfrmEnemyScreenChanger = class(TForm)
    imgEnemyPortrait: TImage32;
    lblEnemy: TLabel;
    cbEnemies: TComboBox;
    cmdCancel: TButton;
    cmdOK: TButton;
    lblScreenNumber: TLabel;
    bitmap32list: TBitmap32List;
    cbScreens: TComboBox;
    lblX: TLabel;
    lblY: TLabel;
    txtX: TDanHexEdit;
    txtY: TDanHexEdit;
    procedure FormShow(Sender: TObject);
    procedure cbEnemiesChange(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    _ID : Integer;
    _PrevID : Byte;
    procedure LoadEnemyBitmap(pID : Integer);
    { Private declarations }
  public
    property ID : Integer read _ID write _ID;
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;
    { Public declarations }
  end;

var
  frmEnemyScreenChanger: TfrmEnemyScreenChanger;

implementation

{$R *.dfm}

procedure TfrmEnemyScreenChanger.FormShow(Sender: TObject);
var
  i : Integer;
begin
  LoadEnemyBitmap(_ROMData.CurrLevel.Enemies[_ID].ID);
  cbEnemies.Items := _ROMData.EnemyDescriptions;
  cbEnemies.ItemIndex := _ROMData.CurrLevel.Enemies[_ID].ID;
  txtX.Text := IntToHex(_ROMData.CurrLevel.Enemies[_ID].X,2);
  txtY.Text := IntToHex(_ROMData.CurrLevel.Enemies[_ID].Y,2);

{  if _EditorConfig.UseStandardScrolllengths = true then
  begin
    for i := _ROMData.CurrLevel.Properties['ScreenStartCheck1'].Value to _ROMData.CurrLevel.Properties['ScreenStartCheck1'].Value + _ROMData.CurrLevel.RoomAmount do
      cbScreens.Items.Add(IntToHex(i,2));
  end
  else
  begin}
    for i := _ROMData.CurrLevel.Properties['ScreenStartCheck1'].Value to $2F do
      cbScreens.Items.Add(IntToHex(i,2));
//  end;

  cbScreens.ItemIndex := cbScreens.Items.IndexOf (IntToHex(  _ROMData.CurrLevel.Enemies[_ID].ScreenID,2));
  _PrevID := _ROMData.CurrLevel.Enemies[_ID].ID;


end;

procedure TfrmEnemyScreenChanger.LoadEnemyBitmap(pID : Integer);
var
  Bitmap : TBitmap;
begin
  if FileExists(ExtractFileDir(Application.ExeName) + '\Data\EnemyGFX\' + IntToHex(pID,2) + '.bmp') = True then
  begin
    Bitmap := TBitmap.Create;
    try
      Bitmap.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\EnemyGFX\' + IntToHex(pID,2) + '.bmp');
      imgEnemyPortrait.ClientWidth := Bitmap.Width;
      imgEnemyPortrait.ClientHeight := Bitmap.Height;
    finally
      FreeAndNil(Bitmap);
    end;
    self.ClientWidth := imgEnemyPortrait.Left + imgEnemyPortrait.Width + 7;
    imgEnemyPortrait.Bitmap.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\EnemyGFX\' + IntToHex(pID,2) + '.bmp');
  end
  else
  begin
    imgEnemyPortrait.ClientWidth := bitmap32list.Bitmap[0].Width;
    imgEnemyPortrait.ClientHeight := bitmap32list.Bitmap[0].Height;
    ClientWidth := imgEnemyPortrait.Left + imgEnemyPortrait.Width + 7;    
    imgEnemyPortrait.Bitmap :=  bitmap32list.Bitmap[0];
  end;
end;

procedure TfrmEnemyScreenChanger.cbEnemiesChange(Sender: TObject);
begin
  _PrevID := cbEnemies.ItemIndex;
  LoadEnemyBitmap(cbEnemies.ItemIndex);
end;

procedure TfrmEnemyScreenChanger.cmdOKClick(Sender: TObject);
begin
  if _ROMData.CurrLevel.Enemies[_ID].ScreenID <> StrToInt('$' + cbScreens.Items[cbScreens.ItemIndex]) then
    _ROMData.Changed := True;
  _ROMData.CurrLevel.Enemies[_ID].ScreenID := StrToInt('$' + cbScreens.Items[cbScreens.ItemIndex]);

  if _ROMData.CurrLevel.Enemies[_ID].ID <> cbEnemies.ItemIndex then
    _ROMData.Changed := True;

  _ROMData.CurrLevel.Enemies[_ID].ID := cbEnemies.ItemIndex;
  _ROMData.CurrLevel.Enemies[_ID].X := StrToInt('$' + txtX.Text);
  _ROMData.CurrLevel.Enemies[_ID].Y := StrToInt('$' + txtY.Text);

{  if chkFollow.Checked = True then
    _ROMData.Room := StrToInt('$' + cbScreens.Items[cbScreens.ItemIndex]);}

end;

end.
