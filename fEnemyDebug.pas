unit fEnemyDebug;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DanHexEdit, StrUtils,cMegaROM, cConfiguration;

type
  TfrmEnemyDebug = class(TForm)
    lblScan: TLabel;
    txtScan: TDanHexEdit;
    cmdScan: TButton;
    cmdOK: TButton;
    mmoScan: TMemo;
    cmdScanUnk: TButton;
    procedure cmdScanClick(Sender: TObject);
    procedure cmdScanUnkClick(Sender: TObject);
  private
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    { Private declarations }
  public
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;
    { Public declarations }
  end;

var
  frmEnemyDebug: TfrmEnemyDebug;

implementation

uses uGlobal;

{$R *.dfm}


procedure TfrmEnemyDebug.cmdScanClick(Sender: TObject);
var
  i,x : Integer;
begin
  mmoScan.Lines.Clear;
  for i := 0 to _ROMData.Levels.Count -1 do
  begin
    for x := 0 to _ROMData.Levels[i].Enemies.Count -1 do
    begin
      if _ROMData.Levels[i].Enemies[x].ID = StrToInt('$' + txtScan.Text) then
      begin
        mmoScan.Lines.Add(  _ROMData.Levels[i].Name + ' - ' + IntToHex(x,2));
      end;
    end;
  end;
end;

procedure TfrmEnemyDebug.cmdScanUnkClick(Sender: TObject);
var
  i,x : Integer;
begin

  mmoScan.Lines.Clear;
  for i := 0 to _ROMData.Levels.Count -1 do
  begin
    for x := 0 to _ROMData.Levels[i].Enemies.Count -1 do
    begin

      if  AnsiPos('N\A', _ROMData.EnemyDescriptions[_ROMData.Levels[i].Enemies[x].ID]) > 0 then
      begin
        mmoScan.Lines.Add(  _ROMData.Levels[i].Name + ' - ' + IntToHex(x,2) + ' ' + IntToHex(_ROMData.Levels[i].Enemies[x].ID,2));
      end;
    end;
  end;

end;

end.
