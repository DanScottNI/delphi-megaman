unit fSpecObjProp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DanHexEdit,cMegaROM, cConfiguration;

type
  TfrmSpecObjProp = class(TForm)
    cbSpecialObjects: TComboBox;
    lblSpecialObjects: TLabel;
    lblScreenNumber: TLabel;
    cbScreens: TComboBox;
    cmdCancel: TButton;
    cmdOK: TButton;
    lblWidth: TLabel;
    lblHeight: TLabel;
    txtWidth: TDanHexEdit;
    txtHeight: TDanHexEdit;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private
    { Private declarations }
    _ID : Integer;
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
  public
    property ID : Integer read _ID write _ID;
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;
    { Public declarations }
  end;

var
  frmSpecObjProp: TfrmSpecObjProp;

implementation

{$R *.dfm}

uses uglobal;

procedure TfrmSpecObjProp.FormShow(Sender: TObject);
var
  i : Integer;
begin
  cbSpecialObjects.ItemIndex := _ROMData.CurrLevel.SpecObj[_ID].ID;
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

//  cbScreens.ItemIndex := cbScreens.Items.IndexOf (IntToHex(_ROMData.CurrLevel.SpecObj[_ID].ScreenID,2));

  txtWidth.Text := IntToHex(_ROMData.CurrLevel.SpecObj[_ID].Width,2);
  txtHeight.Text := IntToHex(_ROMData.CurrLevel.SpecObj[_ID].Height,2);

end;

procedure TfrmSpecObjProp.cmdOKClick(Sender: TObject);
begin
{  if _ROMData.CurrLevel.SpecObj[_ID].ScreenID <> StrToInt('$' + cbScreens.Items[cbScreens.ItemIndex]) then
    _ROMData.Changed := True;
  _ROMData.CurrLevel.SpecObj[_ID].ScreenID := StrToInt('$' + cbScreens.Items[cbScreens.ItemIndex]);}

  if _ROMData.CurrLevel.SpecObj[_ID].ID <> cbSpecialObjects.ItemIndex then
    _ROMData.Changed := True;

  _ROMData.CurrLevel.SpecObj[_ID].ID := cbSpecialObjects.ItemIndex;

  if StrToInt('$' + txtWidth.Text) <> _ROMData.CurrLevel.SpecObj[_ID].Width then
    _ROMData.Changed := True;

  if StrToInt('$' + txtHeight.Text) <> _ROMData.CurrLevel.SpecObj[_ID].Height then
    _ROMData.Changed := True;

  // Store the new dimensions.
  _ROMData.CurrLevel.SpecObj[_ID].Width := StrToInt('$' + txtWidth.Text);
  _ROMData.CurrLevel.SpecObj[_ID].Height := StrToInt('$' + txtHeight.Text);

  _ROMData.CurrLevel.SpecObj[_ID].X2 := _ROMData.CurrLevel.SpecObj[_ID].X1 + _ROMData.CurrLevel.SpecObj[_ID].Width;
  _ROMData.CurrLevel.SpecObj[_ID].Y2 := _ROMData.CurrLevel.SpecObj[_ID].Y1 + _ROMData.CurrLevel.SpecObj[_ID].Height;

{  if chkFollow.Checked = True then
    _ROMData.Room := StrToInt('$' + cbScreens.Items[cbScreens.ItemIndex]);}
end;

end.
