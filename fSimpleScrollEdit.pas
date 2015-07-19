unit fSimpleScrollEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DanHexEdit, ExtCtrls, Spin;

type
  TfrmSimpleScrollEd = class(TForm)
    rdgScrollSettings: TRadioGroup;
    lblScreens: TLabel;
    cmdOK: TButton;
    cmdCancel: TButton;
    txtScreens: TSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private
    _ScrollByte : Byte;
    { Private declarations }
  public
    property ScrollByte : Byte read _ScrollByte write _ScrollByte;
    { Public declarations }
  end;

var
  frmSimpleScrollEd: TfrmSimpleScrollEd;

implementation

{$R *.dfm}

procedure TfrmSimpleScrollEd.FormShow(Sender: TObject);
begin
  if _ScrollByte = $FF then
  begin
    rdgScrollSettings.ItemIndex := 3;
  end
  else if _ScrollByte = $00 then
  begin
    rdgScrollSettings.ItemIndex := 4;
  end
  else if _ScrollByte and $80 = $80 then
  begin
    rdgScrollSettings.ItemIndex := 0;
    txtScreens.Value := (_ScrollByte and $1f) + 1;
  end
  else if _ScrollByte and $40 = $40 then
  begin
    rdgScrollSettings.ItemIndex := 1;
    txtScreens.Value := (_ScrollByte and $1f) + 1;
  end
  else if _ScrollByte and $20 = $20 then
  begin
    rdgScrollSettings.ItemIndex := 2;
    txtScreens.Value := (_ScrollByte and $1f) + 1;
  end;

end;

procedure TfrmSimpleScrollEd.cmdOKClick(Sender: TObject);
begin

  if rdgScrollSettings.ItemIndex = 3 then
    _ScrollByte := $FF
  else if rdgScrollSettings.ItemIndex = 4 then
    _ScrollByte := $00
  else if rdgScrollSettings.ItemIndex = 0 then
  begin
    _ScrollByte := $80;
    _ScrollByte := _ScrollByte + (txtScreens.Value - 1) and $1F;
  end
  else if rdgScrollSettings.ItemIndex = 1 then
  begin
    _ScrollByte := $40;
    _ScrollByte := _ScrollByte + (txtScreens.Value - 1) and $1F;
  end
  else if rdgScrollSettings.ItemIndex = 2 then
  begin
    _ScrollByte := $20;
    _ScrollByte := _ScrollByte + (txtScreens.Value - 1) and $1F;
  end;


end;

end.
