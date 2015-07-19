unit fNewStatistics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DanHexEdit, ComCtrls,cMegaROM, cConfiguration;

type
  TfrmNStatistics = class(TForm)
    lblStatisticsName: TLabel;
    lblValue: TLabel;
    txtValue: TDanHexEdit;
    lstStatistics: TListBox;
    cbValue: TComboBox;
    cmdOK: TButton;
    cmdCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure lstStatisticsClick(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private
    _Stats : Array Of Byte;
    _PrevID : Integer;
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    procedure LoadStatistics;
    procedure SaveStatistics;
    procedure PopulateTreeView;
    procedure LoadData(pIndex : Integer);
    procedure SaveData(pIndex : Integer);
    { Private declarations }
  public
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;
    { Public declarations }
  end;

var
  frmNStatistics: TfrmNStatistics;

implementation

{$R *.dfm}

procedure TfrmNStatistics.LoadStatistics;
var
  i : Integer;
begin
  setlength(_Stats,_ROMData.Statistics.Count);
  for i := 0 to high(_Stats) do
  begin
    _Stats[i] := _ROMData.Statistics[i].Value;
  end;

end;

procedure TfrmNStatistics.SaveStatistics;
var
  i : Integer;
begin
  for i := 0 to high(_Stats) do
  begin
    _ROMData.Statistics[i].Value :=   _Stats[i];
  end;
end;

procedure TfrmNStatistics.FormShow(Sender: TObject);
begin

  LoadStatistics;
  PopulateTreeview;
end;

procedure TfrmNStatistics.LoadData(pIndex : Integer);
begin
  lblStatisticsName.Caption := 'Statistics Name: ' + _ROMData.Statistics[pIndex].Name;
  if _ROMData.Statistics[pIndex].List <> '' then
  begin
    cbValue.Visible := True;
    txtValue.Visible := False;
    cbValue.Items.BeginUpdate;
    cbValue.Items.Clear;
    cbValue.Items.LoadFromFile(ExtractFileDir(Application.EXEname) + '\Data\' + _ROMData.Statistics[pIndex].List);
    cbValue.Items.EndUpdate;
    cbValue.ItemIndex := _Stats[pIndex];
  end
  else
  begin
    cbValue.Visible := False;
    txtValue.Visible := True;
    txtValue.Text := IntToHex(_Stats[pIndex],2);
  end;
end;

procedure TfrmNStatistics.SaveData(pIndex : Integer);
begin
  if _ROMData.Statistics[pIndex].List <> '' then
  begin
    _Stats[pIndex] := cbValue.ItemIndex;
  end
  else
  begin

    _Stats[pIndex] := StrToInt('$' + txtValue.Text);
    if (_Stats[pIndex] > _ROMData.Statistics[pIndex].MaximumValue) then
      _Stats[pIndex] := _ROMData.Statistics[pIndex].MaximumValue;

  end;
end;

procedure TfrmNStatistics.PopulateTreeView;
var
  i : Integer;
begin
  lstStatistics.Items.BeginUpdate;

  lstStatistics.Items.Clear;

  for i := 0 to _ROMData.Statistics.Count -1 do
  begin
    lstStatistics.Items.Add(_ROMData.Statistics[i].Name);
  end;

  lstStatistics.Items.EndUpdate;
  lstStatistics.ItemIndex := 0;
  _PrevID := 0;
  LoadData(_PrevID);
end;

procedure TfrmNStatistics.lstStatisticsClick(Sender: TObject);
begin
  SaveData(_PrevID);
  _PrevID := lstStatistics.ItemIndex;
  LoadData(_PrevID);
end;

procedure TfrmNStatistics.cmdOKClick(Sender: TObject);
begin
  SaveData(_PrevID);
  SaveStatistics;

end;

end.
