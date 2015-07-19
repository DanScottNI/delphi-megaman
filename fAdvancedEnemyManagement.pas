unit fAdvancedEnemyManagement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, gr32, cenemy, Menus, StrUtils, cMegaROM, cConfiguration;

type
  TfrmAdvancedEnemyInfo = class(TForm)
    grpCheckPointInfo: TGroupBox;
    lblCheckpoint1Screen: TLabel;
    lblCheckPoint2Screen: TLabel;
    cmdOK: TButton;
    lstEnemies: TListBox;
    cmdDelete: TButton;
    cmdSetEnemyCheckpoint1: TButton;
    cmdSetEnemyCheckpoint2: TButton;
    cmdSort: TButton;
    cmdMoveUp: TButton;
    cmdMoveDown: TButton;
    cmdSortByX: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure lstEnemiesDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cmdDeleteClick(Sender: TObject);
    procedure cmdSetEnemyCheckpoint1Click(Sender: TObject);
    procedure cmdSetEnemyCheckpoint2Click(Sender: TObject);
    procedure cmdSortClick(Sender: TObject);
    procedure cmdMoveUpClick(Sender: TObject);
    procedure cmdMoveDownClick(Sender: TObject);
    procedure cmdSortByXClick(Sender: TObject);
  private
    _ROMData : TMegamanROM;
    _EditorConfig : TRRConfig;
    procedure LoadEnemies();
    { Private declarations }
  public
    property ROMData : TMegamanROM read _ROMData write _ROMData;
    property EditorConfig : TRRConfig read _EditorConfig write _EditorConfig;
    { Public declarations }
  end;

var
  frmAdvancedEnemyInfo: TfrmAdvancedEnemyInfo;

implementation

{$R *.dfm}

procedure TfrmAdvancedEnemyInfo.LoadEnemies();
var
  Space : String;
  i,x : Integer;
begin
  with lstEnemies.Items do
  begin
    BeginUpdate;
    Clear;

    for i := 0 to _ROMData.CurrLevel.Enemies.Count -1 do
    begin
      // Calculate the space.
      Space := '';
      if length(_ROMData.EnemyDescriptions[_ROMData.CurrLevel.Enemies[i].ID]) < 43 then
      begin
        for x := length(_ROMData.EnemyDescriptions[_ROMData.CurrLevel.Enemies[i].ID]) to 43 do
          Space := Space + ' ';
      end
      else
        Space := ' ';
      Add(AnsiMidStr(_ROMData.EnemyDescriptions[_ROMData.CurrLevel.Enemies[i].ID],0,43) + Space + '$' + IntToHex(_ROMData.CurrLevel.Enemies[i].ScreenID,2) + '   ' + IntToHex(_ROMData.CurrLevel.Enemies[i].X,2) + '   ' + IntToHex(_ROMData.CurrLevel.Enemies[i].Y,2) + '   ' + IntToHex(_ROMData.CurrLevel.Enemies[i].CheckPointStatus,2) );
    end;
    EndUpdate;
  end;
end;

procedure TfrmAdvancedEnemyInfo.FormShow(Sender: TObject);
begin
  lblCheckPoint1Screen.Caption := 'Checkpoint 1 Screen: $' + IntToHex(_ROMData.CurrLevel.Properties['ScreenStartCheck2'].Value,2);
  lblCheckPoint2Screen.Caption := 'Checkpoint 2 Screen: $' + IntToHex(_ROMData.CurrLevel.Properties['ScreenStartCheck3'].Value,2);
  LoadEnemies();
end;


procedure TfrmAdvancedEnemyInfo.cmdOKClick(Sender: TObject);
begin
  _ROMData.SaveEnemyData;
end;

procedure TfrmAdvancedEnemyInfo.lstEnemiesDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  TempRect : TRect;
begin
  // First, fill the current area with the colour of the window.
  lstEnemies.Canvas.Brush.Color := clWindow;
  lstEnemies.Canvas.FillRect(Rect);

  if _ROMData.CurrLevel.Enemies[Index].CheckPointStatus = 3 then
  begin
    TempRect := Rect;
    TempRect.Right := TempRect.Right div 2;
    lstEnemies.Canvas.Brush.Color := clGreen;
    lstEnemies.Canvas.FillRect(TempRect);
    TempRect.Right := Rect.Right;
    TempRect.Left := TempRect.Right div 2;
    lstEnemies.Canvas.Brush.Color := clYellow;
    lstEnemies.Canvas.FillRect(TempRect);
    lstEnemies.Canvas.Brush.Color := clGreen;
  end
  else if _ROMData.CurrLevel.Enemies[Index].CheckPointStatus = 1 then
  begin
    lstEnemies.Canvas.Brush.Color := clGreen;
    lstEnemies.Canvas.FillRect(Rect);
  end
  else if _ROMData.CurrLevel.Enemies[Index].CheckPointStatus = 2 then
  begin
    lstEnemies.Canvas.Brush.Color := clYellow;
    lstEnemies.Canvas.FillRect(Rect);
  end
  else
  begin
    lstEnemies.Canvas.Brush.Color := clWindow;
    lstEnemies.Canvas.FillRect(Rect);
  end;

  lstEnemies.Canvas.Font.Color := clBlack;
  lstEnemies.Canvas.TextOut(Rect.Left + 1,Rect.Top + 1,lstEnemies.Items[index]);
end;

procedure TfrmAdvancedEnemyInfo.cmdDeleteClick(Sender: TObject);
var
  Selected : Integer;
begin

  if lstEnemies.ItemIndex > -1 then
  begin
    Selected := lstEnemies.ItemIndex;
    _ROMData.DeleteEnemy(Selected);

    LoadEnemies();
    lstEnemies.ItemIndex := Selected;
  end;

end;

procedure TfrmAdvancedEnemyInfo.cmdSetEnemyCheckpoint1Click(
  Sender: TObject);
begin
  if lstEnemies.ItemIndex > -1 then
  begin
    lstEnemies.Refresh;
  end;

end;

procedure TfrmAdvancedEnemyInfo.cmdSetEnemyCheckpoint2Click(
  Sender: TObject);
begin
  if lstEnemies.ItemIndex > -1 then
  begin
    lstEnemies.Refresh;
  end;
end;

procedure TfrmAdvancedEnemyInfo.cmdSortClick(Sender: TObject);
begin
  _ROMData.SortEnemyData(_ROMData.CurrentLevel);
  LoadEnemies();
end;

procedure TfrmAdvancedEnemyInfo.cmdMoveUpClick(Sender: TObject);
begin
  if lstEnemies.ItemIndex > 0 then
  begin
    _ROMData.CurrLevel.Enemies.Exchange(lstEnemies.ItemIndex,lstEnemies.ItemIndex -1);
    LoadEnemies();
  end;
end;

procedure TfrmAdvancedEnemyInfo.cmdMoveDownClick(Sender: TObject);
begin
  if (lstEnemies.ItemIndex < lstEnemies.Items.Count -1) and (lstEnemies.ItemIndex > -1) then
  begin
    _ROMData.CurrLevel.Enemies.Exchange(lstEnemies.ItemIndex,lstEnemies.ItemIndex +1);
    LoadEnemies();
  end;
end;

procedure TfrmAdvancedEnemyInfo.cmdSortByXClick(Sender: TObject);
begin
  _ROMData.SortEnemyDataByX(_ROMData.CurrentLevel);
  LoadEnemies();
end;

end.
