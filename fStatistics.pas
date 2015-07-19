unit fStatistics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ValEdit, cMegaROM, cConfiguration;

type
  TfrmStatistics = class(TForm)
    vleStatistics: TValueListEditor;
    cmdOK: TButton;
    cmdCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    { Private declarations }
    procedure PopulateStatistics;
    procedure SaveStatistics;
    procedure ClearItemProps;
  public
    { Public declarations }
  end;

var
  frmStatistics: TfrmStatistics;

implementation

{$R *.dfm}

uses uGlobal;

procedure TfrmStatistics.PopulateStatistics;
var
  i : Integer;
  TempStringList : TStringList;
begin

  if _ROMData.Statistics.Count = 0 then exit;

  for i := 0 to _ROMData.Statistics.Count -1 do
  begin
    if _ROMData.Statistics[i].List = '' then
      vleStatistics.InsertRow(_ROMData.Statistics[i].Name,IntToHex(_ROMData.Statistics[i].Value,2),True)
    else
    begin
      TempStringList := TStringList.Create;
      TempStringList.LoadFromFile(ExtractFileDir(Application.EXEname) + '\Data\' + _ROMData.Statistics[i].List);

      vleStatistics.InsertRow(_ROMData.Statistics[i].Name,TempStringList[_ROMData.Statistics[i].Value],True);
      FreeAndNil(TempStringList);
      vleStatistics.ItemProps[i].EditStyle := esPickList;
      vleStatistics.ItemProps[i].PickList.LoadFromFile(ExtractFileDir(Application.EXEname) + '\Data\' + _ROMData.Statistics[i].List);
      vleStatistics.ItemProps[i].ReadOnly := True;
    end;
  end;
end;

procedure TfrmStatistics.SaveStatistics;
var
  i : integer;
  TempStringList : TStringList;
begin
  for i := 1 to _ROMData.Statistics.Count do
  begin
    if _ROMData.Statistics[i - 1].List = '' then
    begin
      if StrToInt('$' + vleStatistics.Values[vleStatistics.Keys[i]]) > _ROMData.Statistics[i-1].MaximumValue then
        _ROMData.Statistics[i-1].Value := _ROMData.Statistics[i-1].MaximumValue
      else
        _ROMData.Statistics[i -1].Value := StrToInt('$' + vleStatistics.Values[vleStatistics.Keys[i]]);
    end
    else
    begin
      TempStringList := TStringList.Create;
      TempStringList.LoadFromFile(ExtractFileDir(Application.EXEname) + '\Data\' + _ROMData.Statistics[i -1].List);
      _ROMData.Statistics[i - 1].Value := TempStringList.IndexOf(vleStatistics.Values[vleStatistics.Keys[i]]);
      FreeAndNil(TempStringList);
    end;
  end;
end;

procedure TfrmStatistics.cmdOKClick(Sender: TObject);
begin
  SaveStatistics;
end;

procedure TfrmStatistics.ClearItemProps;
var
  i : Integer;
begin
  for i := 0 to _ROMData.Statistics.Count -1 do
  begin
    vleStatistics.ItemProps[i].Destroy;
  end;
end;

procedure TfrmStatistics.FormDestroy(Sender: TObject);
begin
  ClearItemProps;
end;

procedure TfrmStatistics.FormShow(Sender: TObject);
begin
  PopulateStatistics;
end;

end.
