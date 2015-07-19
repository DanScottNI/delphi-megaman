unit fDataDisp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cMegaROM;

type
  TfrmDataDisp = class(TForm)
    mmoData: TMemo;
    cmdOk: TButton;
    cmdExport: TButton;
    procedure FormShow(Sender: TObject);
  private
    _ROMData : TMegamanROM;
    procedure DisplayData;
    { Private declarations }
  public
    property ROMData : TMegamanROM read _ROMData write _ROMdata;
    { Public declarations }
  end;

var
  frmDataDisp: TfrmDataDisp;

implementation

{$R *.dfm}

procedure TfrmDataDisp.DisplayData;
var
  i : Integer;
begin

  for i := 0 to _ROMData.Levels.Count-1 do
  begin
    mmoData.Lines.Add( _ROMdata.Levels[i].Name);
    mmoData.Lines.Add('');
    mmoData.Lines.Add( IntToHex(_ROMData.Levels[i].RoomPointersOffset,2)  );
    mmoData.Lines.Add('TSA Data: 0x' + IntToHex(_ROMData.Levels[i].TSAOffset,2));
    mmoData.Lines.Add('0x' + IntToHex(_ROMData.Levels[i].AttributeOffset,2) + ' - 0x' + IntToHex(_ROMData.Levels[i].AttributeOffset + (_ROMData.Levels[i].NumberOfTiles - 1),2) + '- Attribute Data');
  end;
  
end;

procedure TfrmDataDisp.FormShow(Sender: TObject);
begin
  DisplayData;
end;

end.
