unit fFileProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cMegaROM, iNESImage;

type
  TfrmFileProperties = class(TForm)
    lblFilename: TLabel;
    txtFilename: TEdit;
    lblMemoryMapper: TLabel;
    lblPRGCount: TLabel;
    lblCHRCount: TLabel;
    lblFileSize: TLabel;
    cmdOK: TButton;
    cmdRestoreHeaderToDefault: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmdRestoreHeaderToDefaultClick(Sender: TObject);
  private
    _ROMData : TMegamanROM;
    procedure Load;
    { Private declarations }
  public
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    { Public declarations }
  end;

var
  frmFileProperties: TfrmFileProperties;

implementation

{$R *.dfm}

uses uglobal, inifiles;

procedure TfrmFileProperties.FormShow(Sender: TObject);
begin
  Load;
end;

procedure TfrmFileProperties.Load;
begin
  txtFilename.Text := ROMData.Filename;
{  lblCHRCount.Caption := 'CHR Count: ' + IntToStr(_ROMdata.ROM.CHRCount);
  lblPRGCount.Caption := 'PRG Count: ' + IntToStr(_ROMdata.ROM.PRGCount);
  lblMemoryMapper.Caption := 'Memory Mapper: ' + IntToStr(_ROMdata.ROM.MapperNumber) + ' (' + _ROMdata.ROM.MapperName + ')';
  if _ROMdata.ROM.DiskDudePresent = True then
    lblMemoryMapper.Caption := lblMemoryMapper.Caption + ' (Diskdude Tag Present)';
  lblFilesize.Caption := 'File Size: ' + IntToStr(_ROMdata.ROM.ROMSize) + ' bytes';}
end;

procedure TfrmFileProperties.cmdRestoreHeaderToDefaultClick(
  Sender: TObject);
begin
  ROMData.RestoreDefaultiNESHeader;
  Load;
  showmessage('Header restored.');
end;

end.
