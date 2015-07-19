unit fRockAndRollMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  XPMan, Menus, ComCtrls, ToolWin, GR32_Image, StdCtrls, ImgList, ActnList,
  gr32, gr32_layers, AbBase, AbBrowse, AbZBrows, AbZipper, shellAPI,
  JvComponent, JvDragDrop, FileCtrl, Dialogs, cConfiguration,
  cMegarom, iNESImage, PatchIPS, JvComponentBase; //MemCheck;

type
  TfrmRockAndRollMain = class(TForm)
    XPManifest: TXPManifest;
    tlbToolbar: TToolBar;
    tlbOpenROM: TToolButton;
    imgTiles: TImage32;
    scrTiles: TScrollBar;
    StatusBar: TStatusBar;
    ActionList: TActionList;
    actPaletteEditor: TAction;
    actScrollEditor: TAction;
    actAbout: TAction;
    actPreferences: TAction;
    ImageList: TImageList;
    actOpenROM: TAction;
    actSaveROM: TAction;
    actCloseROM: TAction;
    tlbSaveROM: TToolButton;
    tlbCloseROM: TToolButton;
    actEnableGridlines: TAction;
    AbZipper: TAbZipper;
    tlbSep1: TToolButton;
    tlbMapEditingMode: TToolButton;
    tlbObjectEditingMode: TToolButton;
    actSetMapEditingMode: TAction;
    actObjectEditingMode: TAction;
    actProperties: TAction;
    JvDropTarget: TJvDropTarget;
    actRoomOrderEditor: TAction;
    actTSAEditor: TAction;
    tlbTSA: TToolButton;
    tlbSep2: TToolButton;
    tlbScrollEditor: TToolButton;
    tlbRoomOrder: TToolButton;
    tlbSoundEffects: TToolButton;
    actKeyboardLayout: TAction;
    tlbPaletteEditor: TToolButton;
    tlbAddNewEnemy: TToolButton;
    actAddNewEnemy: TAction;
    Bitmap32List: TBitmap32List;
    actGoToLevel: TAction;
    tlbGoToLevel: TToolButton;
    actAdvEnemy: TAction;
    actDebugROMViewer: TAction;
    actLevelProperties: TAction;
    actBackupManager: TAction;
    tlbAddNewSpecialObject: TToolButton;
    actAddNewSpecObj: TAction;
    actStatistics: TAction;
    actSoundEffectsEditor: TAction;
    tlbLevelProperties: TToolButton;
    tlbStatistics: TToolButton;
    tlbEnableGridlines: TToolButton;
    sep3: TToolButton;
    OpenDialog: TOpenDialog;
    tlbSpriteChange: TToolButton;
    actSpriteChange: TAction;
    actEnemyStatistics: TAction;
    actPatternTableSettings: TAction;
    actEnemyDebug: TAction;
    actDistribution: TAction;
    actEnemyIndexEditor: TAction;
    scrboxLevel: TScrollBox;
    imgScreen: TImage32;
    imgScreenInfo: TImage32;
    MainMenu: TMainMenu;
    mnuFile: TMenuItem;
    mnuOpenROM: TMenuItem;
    mnuRecent: TMenuItem;
    mnuRecentItem1: TMenuItem;
    mnuRecentItem2: TMenuItem;
    mnuRecentItem3: TMenuItem;
    mnuRecentItem4: TMenuItem;
    mnuRecentItem5: TMenuItem;
    mnuSaveROM: TMenuItem;
    mnuDistribution: TMenuItem;
    mnuCloseROM: TMenuItem;
    N1: TMenuItem;
    mnuBackupManager: TMenuItem;
    mnuPreferences: TMenuItem;
    mnuProperties: TMenuItem;
    mnuLaunchAssociatedEmulator: TMenuItem;
    N2: TMenuItem;
    mnuExit: TMenuItem;
    mnuEdit: TMenuItem;
    mnuMapEditingMode: TMenuItem;
    mnuObjectEditingMode: TMenuItem;
    N6: TMenuItem;
    mnuAddNewEnemy: TMenuItem;
    mnuAddNewObject: TMenuItem;
    mnuView: TMenuItem;
    mnuEnemies: TMenuItem;
    mnuObjects: TMenuItem;
    mnuBeamDownPoints: TMenuItem;
    mnuGridlines: TMenuItem;
    N4: TMenuItem;
    mnuGotolevel: TMenuItem;
    mnuTools: TMenuItem;
    mnu32x32TSAEditor: TMenuItem;
    mnuPaletteEditor: TMenuItem;
    mnuLevelProperties: TMenuItem;
    mnuLevelScrollEditor: TMenuItem;
    mnuLevelRoomOrder: TMenuItem;
    mnuSoundEffectsEditor: TMenuItem;
    mnuStatistics: TMenuItem;
    mnuSpriteChangeEditor: TMenuItem;
    mnuEnemyIndexEditor: TMenuItem;
    mnuEnemyStatistics: TMenuItem;
    mnuPatternTableSettings: TMenuItem;
    mnuAdvancedEnemyManagement: TMenuItem;
    mnuEnemyDebug: TMenuItem;
    mnuDebugROMViewer: TMenuItem;
    mnuHelp: TMenuItem;
    mnuKeyboardLayout: TMenuItem;
    N5: TMenuItem;
    mnuVisitRockAndRollHomepage: TMenuItem;
    N3: TMenuItem;
    mnuAbout: TMenuItem;
    actGoToLevelStart: TAction;
    GotoLevelStart1: TMenuItem;
    actDispData: TAction;
    mnuROMDataDisp: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure actOpenROMExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actAboutExecute(Sender: TObject);
    procedure imgScreenMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure scrTilesChange(Sender: TObject);
    procedure scrTilesScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure imgTilesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure actPreferencesExecute(Sender: TObject);
    procedure mnuRecentItem1Click(Sender: TObject);
    procedure actSaveROMExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure scrLevelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actObjectEditingModeExecute(Sender: TObject);
    procedure actSetMapEditingModeExecute(Sender: TObject);
    procedure mnuLaunchAssociatedEmulatorClick(Sender: TObject);
    procedure JvDropTargetDragDrop(Sender: TJvDropTarget;
      var Effect: TJvDropEffect; Shift: TShiftState; X, Y: Integer);
    procedure actRoomOrderEditorExecute(Sender: TObject);
    procedure actTSAEditorExecute(Sender: TObject);
    procedure actCloseROMExecute(Sender: TObject);
    procedure actScrollEditorExecute(Sender: TObject);
    procedure imgScreenMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer; Layer: TCustomLayer);
    procedure imgScreenMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
//    procedure actSoundEffectsExecute(Sender: TObject);
    procedure actKeyboardLayoutExecute(Sender: TObject);
    procedure mnuVisitRockAndRollHomepageClick(Sender: TObject);
    procedure actAddNewEnemyExecute(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure actGoToLevelExecute(Sender: TObject);
    procedure actAdvEnemyExecute(Sender: TObject);
    procedure actDebugROMViewerExecute(Sender: TObject);
    procedure actLevelPropertiesExecute(Sender: TObject);
    procedure mnuEnemiesClick(Sender: TObject);
    procedure actBackupManagerExecute(Sender: TObject);
    procedure actAddNewSpecObjExecute(Sender: TObject);
    procedure actPaletteEditorExecute(Sender: TObject);
    procedure actStatisticsExecute(Sender: TObject);
    procedure actSoundEffectsEditorExecute(Sender: TObject);
    procedure actPropertiesExecute(Sender: TObject);
    procedure actEnableGridlinesExecute(Sender: TObject);
    procedure actSpriteChangeExecute(Sender: TObject);
    procedure actEnemyStatisticsExecute(Sender: TObject);
    procedure actPatternTableSettingsExecute(Sender: TObject);
    procedure actEnemyDebugExecute(Sender: TObject);
    procedure actDistributionExecute(Sender: TObject);
    procedure actEnemyIndexEditorExecute(Sender: TObject);
    procedure actGoToLevelStartExecute(Sender: TObject);
    procedure actDispDataExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    _CurTileLeft, _CurTileMid : Byte;
    _EditingMode : Byte;
    TSA : TForm;
    _CurTSABlock : Integer;
    Obj : TObjDetect;
    _EditorConfig : TRRConfig;
    _ROMData : TMegamanROM;
//    _MouseDownX, _MouseDownY : INteger;
    procedure SetIconTransparency();
    procedure SetVisibleStatus(pVisible : Boolean);
    procedure DisplayScreenInfo;
    procedure SetTileScrMax;
    procedure LoadROM(pFilename,pDataFile : String;pAutoCheck : Boolean);
    procedure LoadEmulatorIcon;
    procedure CreateRecentMenu();
    procedure SetEmuMenuText();
    procedure BackupFile();
    procedure SetupLevel();
    procedure ExecuteEmulator;
    procedure ClearImageIndex;
    function  AutoCheckROMType(pFilename : String) : String;
    procedure CloseROM(pDisableCancel : Boolean);
    procedure DrawLevelData();overload;
    procedure DrawLevelData(pScreenID : Integer);overload;
    procedure DrawLevelDataObj(pScreenID : Integer);
    { Private declarations }
  public
    procedure RedrawScreen;
    procedure DrawTileSelector();
    procedure UpdateTitleCaption;
    property CurTSABlock : Integer read _CurTSABlock write _CurTSABlock;
    property CurTileLeft : Byte read _CurTileLeft write _CurTileLeft;
    property CurTileMid : Byte read _CurTileMid write _CurTileMid;
//    property CurrentObject : Integer read _CurrentObj write _CurrentObj;
    { Public declarations }
  end;

var
  frmRockAndRollMain: TfrmRockAndRollMain;

implementation

uses fAbout,fPreferences, uLunarCompress, fDataDisp,
  fOpenDialog, fRoomOrderEditor,fTSAEditor, fScrollEditor, fEnemyProperties,
  fFileProperties, fKeyboardLayouts, fGoToLevel, fAdvancedEnemyManagement,
  uresourcestring, fDebugROMViewer, fLevelProperties, fBackupManagement, fSpecObjProp,
  fPalette,fStatistics, fSoundEffectEditor,MemINIHexFile, fSpriteChange,
  fEnemyStatistics,fPatternTableSettings,fEnemyDebug,fDistribution,fNewStatistics,
  fEnemyIndex, uConsts;

{$R *.dfm}


procedure TfrmRockAndRollMain.SetVisibleStatus(pVisible : Boolean);
begin
  scrTiles.Visible := pVisible;

  imgScreen.Visible := pVisible;
  imgTiles.Visible := pVisible;
  scrboxLevel.Visible := pVisible;

  mnuLaunchAssociatedEmulator.Enabled := pVisible;
  actSetMapEditingMode.Enabled := pVisible;
  actObjectEditingMode.Enabled := pVisible;
  actRoomOrderEditor.Enabled := pVisible;
  actPaletteEditor.Enabled := pVisible;
  actScrollEditor.Enabled := pVisible;
  actSaveROM.Enabled := pVisible;
  actCloseROM.Enabled := pVisible;
  actProperties.Enabled := pVisible;
  actTSAEditor.Enabled := pVisible;
//  actAdvEnemy.Enabled := pVisible;
  actAdvEnemy.Visible := False;
  self.actEnemyIndexEditor.Enabled := pVisible;
  actSoundEffectsEditor.Enabled := pVisible;
  actAddNewEnemy.Enabled := pVisible;
  actGoToLevel.Enabled := pVisible;
  actDebugROMViewer.Enabled := pVisible;
  actEnemyDebug.Enabled := pVisible;
  actPatternTableSettings.Enabled := pVisible;
  actDistribution.Enabled := pVisible;
  actEnemyStatistics.Enabled := pVisible;
  actLevelProperties.Enabled := pVisible;
  actAddNewSpecObj.Enabled := pVisible;
  actStatistics.Enabled := pVisible;
  actSpriteChange.Enabled := pVisible;
  mnuEnemies.Enabled := pVisible;
  mnuObjects.Enabled := pVisible;
  mnuBeamDownPoints.Enabled := pVisible;
  mnuGridlines.Enabled := pVisible;
  actEnableGridlines.Enabled := pVisible;
  actGoToLevelStart.Enabled := pVisible;
  actDispData.Enabled := pVisible;
  if pVisible = False then
  begin
    Statusbar.Panels[0].Text := 'ROM not loaded.';
    Statusbar.Panels[0].Width := self.ClientWidth;
    Statusbar.Panels[1].Width := 0;
    Statusbar.Panels[2].Width := 0;
  end
  else
  begin
    Statusbar.Panels[0].Width := 125;
    Statusbar.Panels[1].Width := 320;
    Statusbar.Panels[2].Width := 50;
  end;

  
end;

procedure TfrmRockAndRollMain.FormCreate(Sender: TObject);
begin

//  MemCheckLogFileName := ExtractFileDir(Application.EXEName) + '\memory.log';
//  memchk();

  mnuDebugROMViewer.Visible := True;
  self.mnuEnemyDebug.Visible := True;


  Obj.ObjType := -1;
  Obj.ObjIndex := -1;


  _CurTSABlock := -1;

  _EditorConfig := TRRConfig.Create(ExtractFileDir(Application.ExeName) + '\options.ini');

  SetVisibleStatus(False);

  Caption := APPLICATIONTITLE;
  Application.Title := APPLICATIONTITLE;
  CreateRecentMenu();
  SetEmuMenuText;
  ClearImageIndex;
  UpdateTitleCaption();
  // to whether the gridlines are actually on.
  actEnableGridlines.Checked := _EditorConfig.GridlinesOn;
    // Now look up the commandline parameters. If the user has
  // passed a ROM's filename along with EXE name, open the ROM.
  if ParamCount = 1 then
    if FileExists(ParamStr(1)) then
      LoadROM(ParamStr(1),_EditorConfig.FullDataFileName, _EditorConfig.AutoCheck);

end;

procedure TfrmRockAndRollMain.actOpenROMExecute(Sender: TObject);
var
  OpDlg : TfrmOpenDialog;
begin
  OpDlg := TfrmOpenDialog.Create(self);
  try
    OpDlg.OpenDir := ExtractFileDir(_EditorConfig.RecentFile[0]);
    OpDlg.EditorConfig := _EditorConfig;
    OpDlg.ShowModal;

//    RRConfig.AddRecentFile(OpDlg.Filename);
    if FileExists(OpDlg.Filename) = True then
      LoadROM(OpDlg.FileName,OpDlg.DataFile,OpDlg.AutoCheck);
  finally
    FreeAndNil(OpDlg);
  end;
{  if OpenDialog.Execute then
  begin

    if FileExists(OpenDialog.Filename) = True then
      LoadROM(OpenDialog.FileName,RRConfig.DataFileName,RRConfig.AutoCheck);
  end;}
end;

procedure TfrmRockAndRollMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CloseROM(true);
  if Assigned(_EditorConfig) then
  begin
    if _EditorConfig.Changed = True then
      _EditorConfig.Save;

    FreeAndNil(_EditorConfig);
  end;

end;

procedure TfrmRockAndRollMain.CloseROM(pDisableCancel : Boolean);
var
  MsgRes : Integer;
begin
  if _EditorConfig.Changed = True then
    _EditorConfig.Save;

  if Assigned(_ROMData) = True then
  begin
    if _ROMData.Changed = True then
    begin
      if pDisableCancel = True then
        MsgRes := MessageDlg('This ROM has some changes. Do you wish to save?',mtConfirmation,[mbYes, mbNo],0)
      else
        MsgRes := MessageDlg('This ROM has some changes. Do you wish to save?',mtConfirmation,[mbYes, mbNo,mbCancel],0);
      if MsgRes = mrYes then
        _ROMData.Save;

      if MsgRes <> mrCancel then
      begin
        if CurTSABlock > -1 then
          FreeAndNil(TSA);
        _CurTSABlock := -1;
        FreeAndNil(_ROMData);
        UpdateTitleCaption;
        if pDisableCancel = False then
          SetVisibleStatus(False);
      end;
    end
    else
    begin
      if CurTSABlock > -1 then
        FreeAndNil(TSA);
      _CurTSABlock := -1;
      FreeAndNil(_ROMData);
      UpdateTitleCaption;
      if pDisableCancel = False then
        SetVisibleStatus(False);
    end;
  end;

end;

procedure TfrmRockAndRollMain.actAboutExecute(Sender: TObject);
var
  About : TfrmAbout;
begin
  About := TfrmAbout.Create(self);
  try
    About.ShowModal;
  finally
    FreeAndNil(About);
  end;
end;

procedure TfrmRockAndRollMain.DrawLevelData(pScreenID : Integer);
var
  Filter : Byte;
  i, Start,EndF : Integer;
begin

  if imgScreen.Bitmap.Width = 0 then
  begin
    imgscreen.Bitmap.Width := 256*$30;
    imgscreen.Bitmap.Height := 256;
    imgScreen.Width := imgscreen.Bitmap.Width *2;
  end;

  filter := 0;

  if mnuEnemies.Checked = True then
    Filter := Filter + 1;
  if mnuObjects.Checked = True then
    Filter := Filter + 2;
  if mnuBeamDownPoints.Checked = True then
    Filter := Filter + 4;
  _ROMData.UpdateScreen(imgScreen.Bitmap,_ROMData.RoomOrder[pScreenID]);

  if (pScreenID >0) and (pScreenID < $2F) then
  begin
    Start := pScreenID - 1;
    EndF := pScreenID + 1;
  end
  else if pScreenID = 0 then
  begin
    Start := pScreenID;
    Endf := pScreenID +1;
  end
  else if pScreenID = $2F then
  begin
    Start := pScreenID - 1;
    Endf := pScreenID;
  end
  else
  begin
    Start := pScreenID;
    EndF := pScreenID;
  end;

  _ROMData.DrawObjData(  imgScreen.Bitmap,Start,EndF,Filter,_EditorConfig.SpecObjOutline, Bitmap32List);
  if _EditorConfig.GridlinesOn = True then
  begin
    for i := 1 to (8 * (imgScreen.Bitmap.Width div 256)) - 1 do
      imgScreen.Bitmap.Line(i*32,0,i*32,imgScreen.Bitmap.Height,_EditorConfig.GridlineColour);
    for i := 1 to 7 do
      imgScreen.Bitmap.Line(0,i*32,imgScreen.Bitmap.Width,i*32,_EditorConfig.GridlineColour);
  end;

end;

procedure TfrmRockAndRollMain.DrawLevelDataObj(pScreenID : Integer);
var
  Filter : Byte;
  i, Start,EndF : Integer;
begin

  if imgScreen.Bitmap.Width = 0 then
  begin
    imgscreen.Bitmap.Width := 256*$30;
    imgscreen.Bitmap.Height := 256;
    imgScreen.Width := imgscreen.Bitmap.Width *2;
  end;

  filter := 0;

  if mnuEnemies.Checked = True then
    Filter := Filter + 1;
  if mnuObjects.Checked = True then
    Filter := Filter + 2;
  if mnuBeamDownPoints.Checked = True then
    Filter := Filter + 4;


  if (pScreenID >0) and (pScreenID < $2F) then
  begin
    Start := pScreenID - 1;
    EndF := pScreenID + 1;
  end
  else if pScreenID = 0 then
  begin
    Start := pScreenID;
    Endf := pScreenID +1;
  end
  else if pScreenID = $2F then
  begin
    Start := pScreenID - 1;
    Endf := pScreenID;
  end
  else
  begin
    Start := pScreenID;
    EndF := pScreenID;
  end;

  _ROMData.UpdateScreen(imgScreen.Bitmap,Start,EndF);
  _ROMData.DrawObjData(  imgScreen.Bitmap,Start,EndF,Filter,_EditorConfig.SpecObjOutline, Bitmap32List);
  if _EditorConfig.GridlinesOn = True then
  begin
    for i := 1 to (8 * (imgScreen.Bitmap.Width div 256)) - 1 do
      imgScreen.Bitmap.Line(i*32,0,i*32,imgScreen.Bitmap.Height,_EditorConfig.GridlineColour);
    for i := 1 to 7 do
      imgScreen.Bitmap.Line(0,i*32,imgScreen.Bitmap.Width,i*32,_EditorConfig.GridlineColour);
  end;

end;

procedure TfrmRockAndRollMain.DrawLevelData();
var
  Filter : Byte;
  i : Integer;
begin

    if imgScreen.Bitmap.Width = 0 then
    begin
      imgscreen.Bitmap.Width := 256*$30;
      imgscreen.Bitmap.Height := 256;
      imgScreen.Width := imgscreen.Bitmap.Width *2;
    end;

  filter := 0;
  if mnuEnemies.Checked = True then
    Filter := Filter + 1;
  if mnuObjects.Checked = True then
    Filter := Filter + 2;
  if mnuBeamDownPoints.Checked = True then
    Filter := Filter + 4;
  _ROMData.DrawAllScreens(imgScreen.Bitmap, $2F);
  _ROMData.DrawObjData(imgScreen.Bitmap,Filter,_EditorConfig.SpecObjOutline, Bitmap32List);
  if _EditorConfig.GridlinesOn = True then
  begin
    for i := 1 to (8 * (imgScreen.Bitmap.Width div 256)) - 1 do
      imgScreen.Bitmap.Line(i*32,0,i*32,imgScreen.Bitmap.Height,_EditorConfig.GridlineColour);
    for i := 1 to 7 do
      imgScreen.Bitmap.Line(0,i*32,imgScreen.Bitmap.Width,i*32,_EditorConfig.GridlineColour);
  end;

end;

procedure TfrmRockAndRollMain.SetIconTransparency();
var
  i : Integer;
begin
  for i := 0 to Bitmap32List.Bitmaps.Count - 1 do
  begin
    if _EditorConfig.DrawTransparentIcons = True then
      Bitmap32List.Bitmap[i].DrawMode := dmBlend
    else
      Bitmap32List.Bitmap[i].DrawMode := dmOpaque;

    Bitmap32List.Bitmap[i].MasterAlpha := _EditorConfig.IconTransparency;
  end;

end;

procedure TfrmRockAndRollMain.DrawTileSelector();
var
  TempBitmap : TBitmap32;
  tlFont : TFont;
  i : integer;
begin
  TempBitmap := TBitmap32.Create;
  try
    TempBitmap.Width := 32;
    TempBitmap.Height := 32 * 8;
    _ROMData.DrawTileSelector(TempBitmap,False,scrTiles.Position);    
    tlFont := TFont.Create;
    tlFont.Name := 'System';
    tlFont.Size := 4;
    tlFont.Color := wincolor(_EditorConfig.LeftTextColour);
    TempBitmap.Font := tlFont;

    for i := 1 to 7 do
      TempBitmap.Line(0,i*32,32,i*32,clwhite32);

    if (CurTileLeft >= scrTiles.Position) and (CurTileLeft <= scrTiles.Position + 7) then
    begin
      if CurTileLeft = CurTileMid then
      begin
        TempBitmap.Line(0,(CurTileLeft - scrTiles.Position)*32,0,(CurTileLeft-scrTiles.Position)* 32 + 32,_EditorConfig.LeftTextColour);
        TempBitmap.Line(0,(CurTileLeft - scrTiles.Position)*32,32,(CurTileLeft-scrTiles.Position)* 32,_EditorConfig.LeftTextColour);
      end
      else
        TempBitmap.FrameRectS(0,(CurTileLeft - scrTiles.Position)*32,32,(CurTileLeft-scrTiles.Position)* 32 + 32,_EditorConfig.LeftTextColour);
      if _EditorConfig.DispLeftMidText = true then
        TempBitmap.Textout(1,(CurTileLeft - scrTiles.Position)*32,'L');
    end;
    TempBitmap.Font.Color := wincolor(_EditorConfig.MiddleTextColour);
    if (CurTileMid >= scrTiles.Position) and (CurTileMid <= scrTiles.Position + 7) then
    begin
      if CurTileLeft = CurTileMid then
      begin
        TempBitmap.Line(31,(CurTileMid - scrTiles.Position)*32,31,(CurTileMid-scrTiles.Position)* 32 + 32,_EditorConfig.MiddleTextColour);
        TempBitmap.Line(0,(CurTileMid - scrTiles.Position)*32+31,32,(CurTileMid-scrTiles.Position)* 32+31,_EditorConfig.MiddleTextColour);
      end
      else
        TempBitmap.FrameRectS(0,(CurTileMid - scrTiles.Position)*32,32,(CurTileMid-scrTiles.Position)* 32 + 32,_EditorConfig.MiddleTextColour);
      if _EditorConfig.DispLeftMidText = true then
        TempBitmap.Textout(1,(CurTileMid - scrTiles.Position)*32+16,'M');
    end;

    if _CurTSABlock > -1 then
      _ROMData.DrawTSASettings(scrTiles.Position,TempBitmap);


    imgTiles.Bitmap := TempBitmap;
  finally
    FreeAndNil(tlFont);
    FreeAndNil(TempBitmap);
  end;
end;

procedure TfrmRockAndRollMain.SetTileScrMax;
begin
  scrTiles.Max := _ROMData.CurrLevel.NumberOfTiles - 8;
end;

procedure TfrmRockAndRollMain.DisplayScreenInfo;
var
  TempBitmap : TBitmap32;
  i : Integer;
  tlFont : TFont;
begin

  try
    TempBitmap := TBitmap32.Create;

    TempBitmap.Height := 40;
    TempBitmap.Width := 512 * $30;

    TempBitmap.FillRect(0,0,TempBitmap.Width,TempBitmap.Height,clNavy32);

    tlFont := TFont.Create;
    tlFont.Name := 'Courier New';
    tlFont.Size := 8;
    tlFont.Color := clWhite;
    tlFont.Style := [fsBold];

    TempBitmap.Font := tlFont;

    for i := 0 to $2F do
    begin

      if (i <  _ROMdata.CurrLevel.Properties['ScreenStartCheck1'].Value) or (i >= _ROMdata.CurrLevel.Properties['ScreenStartCheck1'].Value+_ROMData.CurrLevel.RoomAmount +1) then
      begin
        TempBitmap.FillRect(i*512,0,(i*512)+512,TempBitmap.Height,clRed32);
        TempBitmap.Textout( 1+ (i*512),20,'Not part of the current level. Do not edit.');
      end;

      TempBitmap.Textout(1+ (i*512),0,'Screen Number: ' );
      TempBitmap.Textout(1+(i*512)+120,0,'$' + IntToHex(I,2));
      TempBitmap.Textout(1+ (i*512),10,'Screen ID: ');
      TempBitmap.Textout(1+(i*512)+120,10,'$' + IntToHex(_ROMData.RoomOrder[i],2));
    end;

    // Write the start check point.
    TempBitmap.Textout((_ROMData.CurrLevel.Properties['ScreenStartCheck1'].Value * 512) + 160,0,'Start Room');
    TempBitmap.Textout((_ROMData.CurrLevel.Properties['ScreenStartCheck2'].Value * 512) + 160,0,'Checkpoint 2');
    TempBitmap.Textout((_ROMData.CurrLevel.Properties['ScreenStartCheck3'].Value * 512) + 160,0,'Checkpoint 3');

    imgScreenInfo.Bitmap := TempBitmap;
    imgScreenInfo.Bitmap.Width := TempBitmap.Width;

  finally
    FreeAndNil(tlFont);
    FreeAndNil(TempBitmap);
  end;

  StatusBar.Panels[1].Text := 'Level: ' + _ROMData.CurrLevel.Name + ' ' + IntToStr(_ROMData.RetrieveTotalEnemies) + '/' + IntToStr(_ROMData.MaximumNumOfEnemies);
end;

procedure TfrmRockAndRollMain.imgScreenMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
var
  EnemyProp : TfrmEnemyScreenChanger;
  SpecObjProp : TfrmSpecObjProp;
  CurTilePos : Integer;
  Screen : Integer;
begin

  // First, we should calculate what room we are actually on.
  Screen := X div 512;

  if _EditingMode = MAPEDITINGMODE then
  begin
    if button = mbLeft then
    begin
      if ssShift in Shift then
        _ROMData.RoomData[Screen,((x - (Screen * 512)) div 2) div 32,(y div 2) div 32] := _CurTileMid
      else
        _ROMData.RoomData[Screen,((x - (Screen * 512)) div 2) div 32,(y div 2) div 32] := _CurTileLeft;

      DrawLevelData(Screen);
    end
    else if button = mbRight then
    begin
      CurTilePos := _ROMData.RoomData[Screen,((x - (Screen * 512)) div 2) div 32,(y div 2) div 32];
      if ssShift in Shift then
        CurTileMid := CurTilePos
      else
        CurTileLeft := CurTilePos;
      if CurTilePos > scrTiles.Max then CurTilePos := scrTiles.Max;
      if (CurTilePos <= scrTiles.Position) or (CurTilePos >= scrTiles.Position + 7) then
        scrTiles.Position := CurTilePos;
      DrawTileSelector();

    end
    else if Button = mbMiddle then
    begin
      if ssShift in Shift then
        _CurTileMid := _ROMData.RoomData[Screen,((x - (Screen * 512)) div 2) div 32,(y div 2) div 32]
      else
        _ROMData.RoomData[Screen,((x - (Screen * 512)) div 2) div 32,(y div 2) div 32] := _CurTileMid;

      DrawLevelData(Screen);
    end;

  end
  else if _EditingMode = OBJECTEDITINGMODE then
  begin
//    _MouseDownX := X;
//    _MouseDownY := X;
    // Reinitialise the object that is selected
    Obj := _ROMData.DetectObjectUnderMouse(x div 2, y div 2);

    if Obj.ObjIndex > -1 then
    begin

      if Obj.ObjType = ENEMYTYPE then
      begin

        if Button = mbMiddle then
        begin
          _ROMData.IncrementEnemyIDby10(Obj.ObjIndex);
          DrawLevelData(Screen);
        end;

        if Button = mbRight then
        begin
          if ssShift in Shift then
          begin
            if (Obj.ObjIndex <= _ROMData.CurrLevel.Enemies.Count -1) then
            begin
              EnemyProp := TfrmEnemyScreenChanger.Create(self);
              try

                EnemyProp.ID := Obj.ObjIndex;
                EnemyProp.ROMData := _ROMData;
                EnemyProp.EditorConfig := _EditorConfig;
                if EnemyProp.ShowModal = mrOk then
                begin
                  DrawLevelData(Screen);
                  UpdateTitleCaption;
                end;
              finally
                FreeAndNil(EnemyProp);
              end;
            end;
            Obj.ObjIndex := -1;
          end
          else if ssCtrl in Shift then
          begin
            if _EditorConfig.DisableEnemyDeletePrompt = False then
            begin
              if MessageDlg('Are you sure that you wish to delete this enemy?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
                _ROMData.DeleteEnemy(Obj.ObjIndex)
            end
            else
              _ROMData.DeleteEnemy(Obj.ObjIndex);

            Obj.ObjIndex := -1;
            DrawLevelData(Screen);
            DisplayScreenInfo;
          end
          else
          begin
            _ROMData.IncrementEnemyID(Obj.ObjIndex);
            DrawLevelData(Screen);
          end;
        end;

      end
      else if Obj.ObjType = SPECOBJTYPE then
      begin
//        showmessage('specobj');
        if Button = mbRight then
        begin
          if ssShift in Shift then
          begin
            SpecObjProp := TfrmSpecObjProp.Create(self);
              try
                SpecObjProp.ID := Obj.ObjIndex;
                SpecObjProp.ROMData := _ROMData;
                SpecObjProp.EditorConfig := _EditorConfig;
                if SpecObjProp.ShowModal = mrOk then
                begin
                  DrawLevelData();
                  UpdateTitleCaption;
                end;
              finally
                FreeAndNil(SpecObjProp);
              end;

            Obj.ObjIndex := -1;

          end
          else if ssCtrl in Shift then
          begin
            if _EditorConfig.DisableEnemyDeletePrompt = False then
            begin
              if MessageDlg('Are you sure that you wish to delete this special object?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
                _ROMData.DeleteSpecObj(Obj.ObjIndex)
            end
            else
              _ROMData.DeleteSpecObj(Obj.ObjIndex);

            Obj.ObjIndex := -1;
            DrawLevelData;
          end
          else
          begin
            _ROMData.IncrementSpecObjID(Obj.ObjIndex);
            DrawLevelData;
          end;
        end;
      end;

    end;
  end;

  UpdateTitleCaption();
end;

procedure TfrmRockAndRollMain.scrTilesChange(Sender: TObject);
begin
  DrawTileSelector();
end;

procedure TfrmRockAndRollMain.scrTilesScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  DrawTileSelector();
end;

procedure TfrmRockAndRollMain.imgTilesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if _CurTSABlock = -1 then
  begin
    if ((Button = mbLeft) and (ssShift in Shift)) or (Button = mbMiddle) then
    begin
      _CurTileMid := scrTiles.Position + ((Y div 2) div 32);
    end
    else if Button = mbLeft then
    begin
      _CurTileLeft := scrTiles.Position + ((Y div 2) div 32);
    end;
  end
  else
  begin
    if Button = mbMiddle then
    begin
      _ROMData.IncrementTileSolidity((y div (32*2)) + scrTiles.Position,x div (16*2),(y mod (32 * 2)) div (16*2));
    end
    else if Button = mbRight then
    begin
      _ROMData.IncrementTileAttributes((y div (32*2)) + scrTiles.Position,x div (16*2),(y mod (32 * 2)) div (16*2));
      DrawLevelData();
    end
    else if Button = mbLeft then
    begin
      if ssShift in Shift then
      begin
        _ROMData.IncrementTileSolidity((y div (32*2)) + scrTiles.Position,x div (16*2),(y mod (32*2)) div (16*2));
      end
      else
      begin
        _ROMData.EditTSA((y div (32*2)) + scrTiles.Position,x div (16*2),(y mod (32*2)) div (16*2),_CurTSABlock);
        DrawLevelData();
      end;
    end;
  end;
  UpdateTitleCaption;
  DrawTileSelector();
end;

procedure TfrmRockAndRollMain.actPreferencesExecute(Sender: TObject);
var
  Pref : TfrmPreferences;
begin
  Pref := TfrmPreferences.Create(self);
  try
    
    Pref.ROMData := _ROMData;
    Pref.EditorConfig := _EditorConfig;
    
    if Pref.ShowModal = mrOk then
    begin
      _EditorConfig.Save;
      SetEmuMenuText();
      if _ROMData <> nil then
      begin
        _ROMData.LoadPaletteFile(_EditorConfig.FullPaletteName);
        _ROMData.RefreshOnScreenTiles(scrTiles.Position);
        SetIconTransparency;
        DrawLevelData();
        DrawTileSelector();
//        if scrLevel.Max < _ROMData.Room then

        actEnableGridlines.Checked := _EditorConfig.GridlinesOn;
      end;
    end;
  finally
    FreeAndNil(Pref);
  end;
end;

procedure TfrmRockAndRollMain.LoadROM(pFilename,pDataFile : String;pAutoCheck : Boolean);
var
  TempFilename : String;
begin
  // If the ROM file does not exist then exit the subroutine.
  if FileExists(pFilename) = False then
    exit;
  // Transfer the datafile's filename over to another variable.
  TempFilename := pDataFile;
  // If the user wants to automatically check the ROM type then
  // check it. If there is no matches, reset the TempFileName variable
  // back to pDataFile (Usually the default datafile).
  if pAutoCheck = True then
  begin
    TempFilename := AutoCheckROMType(pFilename);
    if TempFilename = '' then
      TempFilename := pDataFile
    else
      TempFilename := ExtractFileDir(Application.ExeName) + '\Data\' + TempFilename;
  end;

  // If the datafile does not exist, then exit the subroutine.
  if FileExists(TempFileName) = False then
    exit;

  // First check if the ROM is already loaded.
  if assigned(_ROMData) = True then
  begin
    FreeAndNil(_ROMData);
  end;
  _EditorConfig.AddRecentFile(pFilename);
  CreateRecentMenu();
  _ROMData := TMegamanROM.Create(pFilename, TempFilename);

  if _ROMData.IsMegamanROM = false then
  begin
    // If the user elects to not load the ROM, then
    // display a prompt informing the user that the ROM will
    // not be loaded, free the ROM, and exit the subroutine.
    if _EditorConfig.MapperWarnings = 0 then
    begin
        Messagebox(handle,'This is not a Mega Man ROM.',PChar(Application.Title),0);
        FreeAndNil(_ROMData);
        exit;
    end
    // If the user has elected to be prompted about the
    // ROM not conforming to the standard Mega Man settings
    // tell the user, and give them the choice of whether or not to load it.
    else if _EditorConfig.MapperWarnings = 1 then
    begin
      if MessageBox(Handle,'The memory mapper of this ROM does not match the specifications of'
        + chr (13) + chr(10) + 'the Mega Man ROMs. Do you wish to continue?',
            PChar(Application.Title),MB_YESNO) = IDNO	then
      begin
        FreeAndNil(_ROMData);
        exit;
      end;
    end;

  end;


  // If the palette specified exists, then load it.
  if FileExists(_EditorConfig.FullPaletteName) = True then
    _ROMData.LoadPaletteFile(_EditorConfig.FullPaletteName)
  else
    _ROMData.LoadDefaultPalette;
  _ROMData.CurrentLevel := 0;

  StatusBar.Panels[2].Text := ExtractFileName(_ROMData.DataFile);
  SetVisibleStatus(True);

  // If the ROM is write protected (has it's read-only flag set)
  // disable the save command.
{  if _ROMData.ROM.WriteProtected = True then
  begin
    showmessage('This ROM is currently set to read-only. Please remove the read-only flag.');
    actSaveROM.Enabled := False;
  end;}

  actSetMapEditingMode.Execute;
  SetIconTransparency;
  SetEmuMenuText();
  SetupLevel;
  UpdateTitleCaption();

  _CurTSABlock := -1;
end;

procedure TfrmRockAndRollMain.SetupLevel();
begin
  SetTileScrMax;
  scrTiles.Position := _ROMData.CurrLevel.StartTSAAt;

  scrboxLevel.HorzScrollBar.Position := _ROMdata.CurrLevel.Properties['ScreenStartCheck1'].Value * 512;
  DrawLevelData();
  DrawTileSelector();
  DisplayScreenInfo;
  UpdateTitleCaption();
end;

procedure TfrmRockAndRollMain.CreateRecentMenu();
var
  Bitmap : TBitmap;
begin
  if _EditorConfig.NumberOfRecentlyOpenedFiles = 0 then
    mnuRecent.Visible := False
  else
    mnuRecent.Visible := True;

  if _EditorConfig.RecentFile[0] = '' then
    mnuRecentItem1.Visible := False
  else
    mnuRecentItem1.Visible := True;

  if _EditorConfig.RecentFile[1] = '' then
    mnuRecentItem2.Visible := False
  else
    mnuRecentItem2.Visible := True;

  if _EditorConfig.RecentFile[2] = '' then
    mnuRecentItem3.Visible := False
  else
    mnuRecentItem3.Visible := True;
  if _EditorConfig.RecentFile[3] = '' then
    mnuRecentItem4.Visible := False
  else
    mnuRecentItem4.Visible := True;
  if _EditorConfig.RecentFile[4] = '' then
    mnuRecentItem5.Visible := False
  else
    mnuRecentItem5.Visible := True;

  Bitmap := TBitmap.Create;
  try
    Bitmap.Width := 400;
    Bitmap.Height :=  40;
//    self.FindChildControl()
    mnuRecentItem1.Caption := MinimizeName(_EditorConfig.RecentFile[0],Bitmap.Canvas,400);
    mnuRecentItem2.Caption := MinimizeName(_EditorConfig.RecentFile[1],Bitmap.Canvas,400);
    mnuRecentItem3.Caption := MinimizeName(_EditorConfig.RecentFile[2],Bitmap.Canvas,400);
    mnuRecentItem4.Caption := MinimizeName(_EditorConfig.RecentFile[3],Bitmap.Canvas,400);
    mnuRecentItem5.Caption := MinimizeName(_EditorConfig.RecentFile[4],Bitmap.Canvas,400);
  finally
    FreeAndNil(Bitmap);
  end;
end;

procedure TfrmRockAndRollMain.mnuRecentItem1Click(Sender: TObject);
begin
  LoadROM(_EditorConfig.RecentFile[TMenuItem(sender).MenuIndex],_EditorConfig.FullDataFileName, _EditorConfig.AutoCheck);
end;

procedure TfrmRockAndRollMain.SetEmuMenuText();
begin
  if (_EditorConfig.EmulatorPath <> '') and (FileExists(_EditorConfig.EmulatorPath) = True) then
  begin
    mnuLaunchAssociatedEmulator.Caption := 'Launch ' + ExtractFileName(_EditorConfig.EmulatorPath);
    mnuLaunchAssociatedEmulator.Enabled := True;
  end
  else
  begin
    mnuLaunchAssociatedEmulator.Caption := 'No Emulator Associated';
    mnuLaunchAssociatedEmulator.Enabled := False;
  end;

  LoadEmulatorIcon;
  if Assigned(_ROMData) = False then
    mnuLaunchAssociatedEmulator.Enabled := False;
end;

procedure TfrmRockAndRollMain.BackupFile();
begin

  if DirectoryExists(ExtractFileDir(ParamStr(0))+'\Backups') = false then
  begin
    CreateDir(ExtractFileDir(ParamStr(0))+'\Backups');
  end;
  ShortDateFormat := 'dd-mm-yyyy';
  TimeSeparator	:= '-';

  AbZipper.FileName := ExtractFileDir(ParamStr(0))+'\Backups\MM ' + DateTimeToStr(Now) + '.zip';
  AbZipper.AddFiles(_ROMData.Filename,0);
  AbZipper.ZipfileComment := 'ZIP Created By Rock And Roll on: ' + DateTimeToStr(Now);
  AbZipper.Save;
end;

procedure TfrmRockAndRollMain.actSaveROMExecute(Sender: TObject);
begin
  if _EditorConfig.BackupFilesWhenSaving = True then
    BackupFile();
  if Assigned(_ROMData)  then
  begin
    if _ROMData.Save = True then
      messagebox(Handle,'Changes saved.',PChar(APPLICATIONTITLE),0)
    else
      messagebox(Handle,'Save failed. Another program probably has the ROM opened.',PChar(APPLICATIONTITLE),0);
      UpdateTitleCaption();
  end;

end;

procedure TfrmRockAndRollMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if assigned(_ROMData) = True then
  begin

    if Key = VK_PRIOR	then
    begin
      if _ROMData.CurrentLevel = _ROMData.NumberOfLevels - 1 then
        _ROMData.CurrentLevel := 0
      else
        _ROMData.CurrentLevel := _ROMData.CurrentLevel + 1;
    end
    else if Key = VK_NEXT	then
    begin
      if _ROMData.CurrentLevel = 0 then
        _ROMData.CurrentLevel := _ROMData.NumberOfLevels - 1
      else
        _ROMData.CurrentLevel  := _ROMData.CurrentLevel - 1;
    end
    else
      exit;

    SetupLevel;
    if CurTSABlock > -1 then
      TfrmTSA(TSA).DrawPatternTable;
  end;
end;

procedure TfrmRockAndRollMain.scrLevelKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_PRIOR) or (Key = VK_NEXT) then
    Key := 0;
end;

procedure TfrmRockAndRollMain.actObjectEditingModeExecute(Sender: TObject);
begin
  actObjectEditingMode.Checked := True;
  actSetMapEditingMode.Checked := False;
  // Set the toolbar buttons
  tlbMapEditingMode.Down := actSetMapEditingMode.Checked;
  tlbObjectEditingMode.Down := actObjectEditingMode.Checked;
  _EditingMode := OBJECTEDITINGMODE;
  Statusbar.Panels[0].Text := 'Object Editing Mode';
end;

procedure TfrmRockAndRollMain.actSetMapEditingModeExecute(Sender: TObject);
begin
  actObjectEditingMode.Checked := False;
  actSetMapEditingMode.Checked := True;
  // Set the toolbar buttons
  tlbMapEditingMode.Down := actSetMapEditingMode.Checked;
  tlbObjectEditingMode.Down := actObjectEditingMode.Checked;
  _EditingMode := MAPEDITINGMODE;
  Statusbar.Panels[0].Text := 'Map Editing Mode';
end;

procedure TfrmRockAndRollMain.ExecuteEmulator;
begin
  if Assigned(_ROMData) = False then
  begin
    messagebox(handle,'Please load the ROM first.',PChar(Application.Title),0);
    exit;
  end;

  if (FileExists(_EditorConfig.EmulatorPath) = false) or (_EditorConfig.EmulatorPath = '') then
  begin
    messagebox(handle,'There is no emulator currently setup with Rock And Roll,' + chr(13) + chr(10)+'or the emulator cannot be found.',PChar(Application.Title),0);
    exit;
  end;

  if _EditorConfig.EmulatorDisplaySaveWarning = true then
    if MessageDlg('Warning: This will save all currently made changes to the ROM. Do you wish to proceed?'+chr(13) + chr(10) + chr(13) + chr(10) + 'Please note, this warning can be disabled in the Preferences dialog.',mtWarning,[mbYes, mbNo],0) = mrNo then
      exit;

  if _EditorConfig.BackupFilesWhenSaving = True then
    BackupFile();
  
  _ROMData.Save;

  UpdateTitleCaption;
  if _EditorConfig.EmulatorFileSettings = 0 then
    ShellExecute(Handle,'open',PChar(_EditorConfig.EmulatorPath),PChar(' ' + _ROMData.Filename),'',SW_SHOW)
  else if _EditorConfig.EmulatorFileSettings = 1 then
    ShellExecute(Handle,'open',PChar(_EditorConfig.EmulatorPath),PChar(' ' + ExtractShortPathName(_ROMData.Filename)),'',SW_SHOW)
  else if _EditorConfig.EmulatorFileSettings = 2 then
    ShellExecute(Handle,'open',PChar(_EditorConfig.EmulatorPath),PChar(' "' + _ROMData.Filename + '"'),'',SW_SHOW);
end;

procedure TfrmRockAndRollMain.mnuLaunchAssociatedEmulatorClick(
  Sender: TObject);
begin
  ExecuteEmulator();
end;

procedure TfrmRockAndRollMain.UpdateTitleCaption;
var
  AppTitleBarText : String;
begin
  if Assigned(_ROMData) = True then
  begin
    AppTitleBarText := APPLICATIONTITLE + ' - [' + ExtractFilename(_ROMData.Filename) + ']';

    if _ROMData.Changed = True then
      Caption := AppTitleBarText + ' *'
    else
      Caption := AppTitleBarText;
  end
  else
  begin
    Caption := APPLICATIONTITLE
  end;
end;


procedure TfrmRockAndRollMain.ClearImageIndex;
begin
  mnuMapEditingMode.ImageIndex := -1;
  mnuObjectEditingMode.ImageIndex := -1;
  mnuGridlines.ImageIndex := -1;
end;

procedure TfrmRockAndRollMain.JvDropTargetDragDrop(Sender: TJvDropTarget;
  var Effect: TJvDropEffect; Shift: TShiftState; X, Y: Integer);
var
  Files : TStringList;
begin
  Files := TStringList.Create;
  try
    sender.GetFilenames(Files);
    LoadROM(Files[0],_EditorConfig.FullDataFileName,_EditorConfig.AutoCheck);
  finally
    FreeAndNil(Files);
  end;

end;

procedure TfrmRockAndRollMain.actRoomOrderEditorExecute(
  Sender: TObject);
var
  RoomOrder : TfrmRoomOrder;
begin
  RoomOrder := TfrmRoomOrder.Create(self);
  try
    JvDropTarget.AcceptDrag := False;

    RoomOrder.ROMData := _ROMData;
    RoomOrder.EditorConfig  := _EditorConfig;

    if RoomOrder.ShowModal = mrOk then
    begin
      _ROMData.SaveRoomOrder;
      _ROMData.CurrLevel.Properties['ScreenStartCheck1'].Value := RoomOrder.RoomOrderStart;
      _ROMData.CurrLevel.Properties['ScreenStartCheck2'].Value := RoomOrder.RoomOrderChk1;
      _ROMData.CurrLevel.Properties['ScreenStartCheck3'].Value := RoomOrder.RoomOrderChk2;
      _ROMData.CurrLevel.Properties['ScreenStartChk2Trig'].Value := RoomOrder.Chk1Activate;
      _ROMData.CurrLevel.Properties['ScreenStartChk3Trig'].Value := RoomOrder.Chk2Activate;
      // To-Do
//      _ROMData.Room := _ROMData.CurrLevel.Properties['ScreenStartCheck1'].Value + scrLevel.Position;
      DrawLevelData;
    end
    else
    begin
      _ROMData.Loadroomorder;
    end;

    JvDropTarget.AcceptDrag := True;
    UpdateTitleCaption;
  finally
    FreeAndNil(RoomOrder);
  end;
end;

procedure TfrmRockAndRollMain.actTSAEditorExecute(Sender: TObject);
begin
  if CurTSABlock = -1 then
  begin
    TSA := TfrmTSA.Create(self);
    TfrmTSA(TSA).ROMData := _ROMData;
    TfrmTSA(TSA).EditorConfig := _EditorConfig;
  end;

  TSA.Show;
  DrawTileSelector();
end;

procedure TfrmRockAndRollMain.actCloseROMExecute(Sender: TObject);
begin
  CloseROM(false);
end;

procedure TfrmRockAndRollMain.actScrollEditorExecute(Sender: TObject);
var
  Scroll : TfrmScrollEditor;
  oldlength, start : Integer;
begin
  Scroll := TfrmScrollEditor.Create(self);
  try
    JvDropTarget.AcceptDrag := False;
    Scroll.ROMData := _ROMData;
    Scroll.EditorConfig := _EditorConfig;
    if Scroll.ShowModal = mrOk then
    begin
      oldlength := _ROMData.CurrLevel.RoomAmount;

      if Scroll.ScrollStart <> _ROMData.CurrLevel.ScrollStart then
      begin
        _ROMData.CurrLevel.ScrollStart := Scroll.ScrollStart;
      end;

      if Scroll.ScrollChk1Respawn <> _ROMData.CurrLevel.Properties['ScrollPosChk1'].Value then
      begin
        _ROMData.CurrLevel.Properties['ScrollPosChk1'].Value := Scroll.ScrollChk1Respawn;
        start := _ROMData.ReturnRoomIndex(_ROMData.CurrLevel.ScrollData[Scroll.ScrollChk1Respawn]);
        _ROMData.CurrLevel.Properties['RoomOrderFix1Check'].Value := start;
        _ROMData.CurrLevel.Properties['RoomOrderFix2Check'].Value := start + (_ROMData.CurrLevel.ScrollData[Scroll.ScrollChk1Respawn] and $1f);

      end;

      if Scroll.ScrollChk2Respawn <> _ROMData.CurrLevel.Properties['ScrollPosChk2'].Value then
      begin
        _ROMData.CurrLevel.Properties['ScrollPosChk2'].Value := Scroll.ScrollChk2Respawn;
        start := _ROMData.ReturnRoomIndex(_ROMData.CurrLevel.ScrollData[Scroll.ScrollChk2Respawn]);
        _ROMData.CurrLevel.Properties['RoomOrderFix1Check2'].Value := start;
        _ROMData.CurrLevel.Properties['RoomOrderFix2Check2'].Value := start + (_ROMData.CurrLevel.ScrollData[Scroll.ScrollChk2Respawn] and $1f);
      end;

      _ROMData.SaveScrollData;

      _ROMData.CurrLevel.WorkOutLevelLength;
      // If the length of the level has changed, update the scroll
      // bar so that it does not over-run the new end of the level.
{      if oldlength <> _ROMData.CurrLevel.RoomAmount then
      begin
        SetLevelScrMax;
      end;}

      // If room currently displayed in the editor is a room that
      // is cut off due to scroll changes, then reset the view
      // back to the first room in the level.
{      if scrLevel.Position > _ROMData.CurrLevel.RoomAmount then
      begin
        SetupLevel();
      end;}

    end;
    JvDropTarget.AcceptDrag := True;
    UpdateTitleCaption;
  finally
    FreeAndNil(Scroll);
  end;
end;

procedure TfrmRockAndRollMain.imgScreenMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
var
  TempX, TempY : Integer;
  Screen : Integer;
begin

  // First, we should calculate what room we are actually on.
  Screen := X div 512;


  if _EditingMode = OBJECTEDITINGMODE then
  begin
    if Obj.ObjIndex > -1 then
    begin
      if Obj.ObjType = ENEMYTYPE then
      begin
        if ssLeft in Shift then
        begin
          if (Obj.ObjIndex <= _ROMData.CurrLevel.Enemies.Count -1) then
          begin

            if ssCtrl in Shift then
            begin
              TempX := X div 2;
              TempY := Y div 2;
            end
            else
            begin
              TempX := ((X div 2) div 8) * 8;// and $F8;
              TempY := ((Y div 2) div 8) * 8;// and $F8;
            end;
            if (X >= imgScreen.Width) or (X < 0) then exit;

            if (Y >= imgScreen.Height) or (Y < 0) then exit;

            if _ROMData.CurrLevel.Enemies[Obj.ObjIndex].ScreenX  <> TempX then
            begin
              _ROMData.SetEnemyXY(0,TempX,TempY,Obj.ObjIndex);
  //            MegamanROM.Levels[MegamanROM.CurrentLevel].Enemies[_CurrentObj].X := TempX;
            end;
            if _ROMData.CurrLevel.Enemies[Obj.ObjIndex].Y <> TempY then
            begin
              _ROMData.SetEnemyXY(1,TempX,TempY,Obj.ObjIndex);
            end;

            DrawLevelDataObj(Screen);

          end;
        end;
      end
      else if Obj.ObjType = SPECOBJTYPE then
      begin
        if ssLeft in Shift then
        begin
          if (Obj.ObjIndex <= _ROMData.CurrLevel.SpecObj.Count -1) then
          begin

            if ssCtrl in Shift then
            begin
              TempX := X div 2;
              TempY := Y div 2;
            end
            else
            begin
              TempX := ((X div 2) div 8) * 8;// and $F8;
              TempY := ((Y div 2) div 8) * 8;// and $F8;
            end;

            if (X >= imgScreen.Width) or (X < 0) then exit;
            if (Y >= imgScreen.Height) or (Y < 0) then exit;
            if _ROMData.CurrLevel.SpecObj[Obj.ObjIndex].X1  <> TempX then
            begin
              _ROMData.CurrLevel.SpecObj[Obj.ObjIndex].X1 := TempX;
              _ROMData.CurrLevel.SpecObj[Obj.ObjIndex].X2 := TempX + _ROMData.CurrLevel.SpecObj[Obj.ObjIndex].Width;
              _ROMData.Changed := True;
            end;

            if _ROMData.CurrLevel.SpecObj[Obj.ObjIndex].Y1 <> TempY then
            begin

              _ROMData.CurrLevel.SpecObj[Obj.ObjIndex].Y1 := TempY;
              _ROMData.CurrLevel.SpecObj[Obj.ObjIndex].Y2 := TempY + _ROMData.CurrLevel.SpecObj[Obj.ObjIndex].Height;
              _ROMData.Changed := True;
            end;
          end;
          DrawLevelDataObj(Screen);

        end;

      end
      else if Obj.ObjType = BEAMDOWNTYPE then
      begin
        if ssCtrl in Shift then
        begin
          TempY := Y div 2;
        end
        else
        begin
          TempY := (Y div 2) and $F8;
        end;

        if (Y >= imgScreen.Height) or (Y < 0) then exit;

        if Obj.ObjIndex = 0 then
        begin
          if _ROMData.CurrLevel.Properties['BeamDown1'].Value <> TempY then
            _ROMData.CurrLevel.Properties['BeamDown1'].Value := TempY;
        end
        else if Obj.ObjIndex = 1 then
        begin
          if _ROMData.CurrLevel.Properties['BeamDown2'].Value <> TempY then
            _ROMData.CurrLevel.Properties['BeamDown2'].Value := TempY;
        end
        else if Obj.ObjIndex = 2 then
        begin
          if _ROMData.CurrLevel.Properties['BeamDown3'].Value <> TempY then
            _ROMData.CurrLevel.Properties['BeamDown3'].Value := TempY;
        end;

        DrawLevelDataObj(Screen);

      end;
    end;
    UpdateTitleCaption;
  end
  else if _EditingMode = MAPEDITINGMODE then
  begin
    if ssLeft in Shift  then
    begin
      if ssShift in Shift then
        _ROMData.RoomData[Screen,((x - (Screen * 512)) div 2) div 32,(y div 2) div 32] := _CurTileMid
      else
        _ROMData.RoomData[Screen,((x - (Screen * 512)) div 2) div 32,(y div 2) div 32] := _CurTileLeft;

      DrawLevelData(Screen);
    end
    else if ssRight in Shift then
    begin
      if ssShift in Shift then
        _CurTileMid := _ROMData.RoomData[Screen,((x - (Screen * 512)) div 2) div 32,(y div 2) div 32]
      else
        _CurTileLeft := _ROMData.RoomData[Screen,((x - (Screen * 512)) div 2) div 32,(y div 2) div 32];
    end
    else if ssMiddle in Shift then
    begin
      if ssShift in Shift then
        _CurTileMid := _ROMData.RoomData[Screen,((x - (Screen * 512)) div 2) div 32,(y div 2) div 32]
      else
        _ROMData.RoomData[Screen,((x - (Screen * 512)) div 2) div 32,(y div 2) div 32] := _CurTileMid;

      DrawLevelData(Screen);
    end;
  end;


end;

procedure TfrmRockAndRollMain.imgScreenMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if _EditingMode = OBJECTEDITINGMODE then
  begin
    Obj.ObjIndex := -1;
    UpdateTitleCaption;
  end;
end;

procedure TfrmRockAndRollMain.actKeyboardLayoutExecute(Sender: TObject);
var
  KeyboardLayout : TfrmKeyboardLayout;
begin
  KeyboardLayout := TfrmKeyboardLayout.Create(self);
  try
    JvDropTarget.AcceptDrag := False;
    KeyboardLayout.ShowModal;
    JvDropTarget.AcceptDrag := True;
  finally
    FreeAndNil(KeyboardLayout);
  end;

end;

procedure TfrmRockAndRollMain.mnuVisitRockAndRollHomepageClick(
  Sender: TObject);
begin
  ShellExecute(GetDesktopWindow(), 'open', PChar('http://dan.panicus.org'), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmRockAndRollMain.RedrawScreen;
begin
  _ROMData.RefreshOnScreenTiles(scrTiles.Position);
  DrawLevelData;
  DrawTileSelector();
  if CurTSABlock > -1 then
    TfrmTSA(TSA).DrawPatternTable;
end;

procedure TfrmRockAndRollMain.actAddNewEnemyExecute(Sender: TObject);
begin
{  if _ROMData.AddEnemy = false then
    showmessage('There is not enough space for new enemies. Please delete some' +
     chr(13) + chr(10) + 'from another level to add a new enemy.')
  else
  begin
    if _EditorConfig.AutoObjMode = True then
      actObjectEditingMode.Execute;
    DrawLevelData;
    UpdateTitleCaption;
    DisplayScreenInfo;
  end;}
end;

procedure TfrmRockAndRollMain.mnuExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmRockAndRollMain.actGoToLevelExecute(Sender: TObject);
var
  GoToLevel : TfrmGotoLevel;
begin
  GotoLevel := TfrmGotoLevel.Create(self);
  try
    JvDropTarget.AcceptDrag := False;
    GotoLevel.ROMData := _ROMData;
    GotoLevel.EditorConfig := _EditorConfig;
    if GotoLevel.ShowModal = mrOk then
    begin
      if GotoLevel.Level <> _ROMData.CurrentLevel then
      begin
        _ROMData.CurrentLevel := GotoLevel.Level;
        SetupLevel();
        if CurTSABlock > -1 then
          TfrmTSA(TSA).DrawPatternTable;
      end;

    end;
    JvDropTarget.AcceptDrag := True;
  finally
    FreeAndNil(GotoLevel);
  end;
end;

procedure TfrmRockAndRollMain.actAdvEnemyExecute(Sender: TObject);
var
  AdvEnemy : TfrmAdvancedEnemyInfo;
begin
  AdvEnemy := TfrmAdvancedEnemyInfo.Create(self);
  try
    AdvEnemy.ROMData := _ROMData;
    AdvEnemy.EditorConfig := _EditorConfig;

    JvDropTarget.AcceptDrag := False;
    if AdvEnemy.ShowModal = mrOk then
    begin
      UpdateTitleCaption;
      DisplayScreenInfo;
    end;

    JvDropTarget.AcceptDrag := True;
  finally
    FreeAndNil(AdvEnemy);
  end;
end;

procedure TfrmRockAndRollMain.actDebugROMViewerExecute(Sender: TObject);
var
  DebugROM : TfrmDebugROMViewer;
begin
  DebugROM := TfrmDebugROMViewer.Create(self);
  try
    JvDropTarget.AcceptDrag := False;
    DebugROM.ROMData := _ROMData;
    DebugROM.EditorConfig := _EditorConfig;
    DebugROM.ShowModal;
    JvDropTarget.AcceptDrag := True;
  finally
    FreeAndNil(DebugROM);
  end;
end;

procedure TfrmRockAndRollMain.actLevelPropertiesExecute(Sender: TObject);
var
  LevProperties : TfrmLevelProperties;
begin
  LevProperties := TfrmLevelProperties.Create(self);
  try
    JvDropTarget.AcceptDrag := False;

    LevProperties.ROMData := _ROMData;
    LevProperties.EditorConfig := _EditorConfig;

    if LevProperties.ShowModal = mrOK then
      UpdateTitleCaption;
    JvDropTarget.AcceptDrag := True;
  finally
    FreeAndNil(LevProperties);
  end;
end;

procedure TfrmRockAndRollMain.mnuEnemiesClick(Sender: TObject);
begin
  DrawLevelData;
end;

procedure TfrmRockAndRollMain.actBackupManagerExecute(Sender: TObject);
var
  Backup : TfrmBackupManagement;
begin
  Backup := TfrmBackupManagement.Create(self);
  try
    JvDropTarget.AcceptDrag := False;
    Backup.ShowModal;
    JvDropTarget.AcceptDrag := True;    
  finally
    FreeAndNil(Backup);
  end;
end;

procedure TfrmRockAndRollMain.actAddNewSpecObjExecute(Sender: TObject);
begin
{  if _ROMData.AddSpecObj = false then
    showmessage('There is not enough space for new special objects.' +
     chr(13) + chr(10) + 'Please delete some to add a new special object.')
  else
  begin
    if _EditorConfig.AutoObjMode = True then
      actObjectEditingMode.Execute;
    DrawLevelData;
    UpdateTitleCaption;
  end;}
end;

procedure TfrmRockAndRollMain.actPaletteEditorExecute(Sender: TObject);
var
  PalEd : TfrmPalette;
begin
  PalEd := TfrmPalette.Create(self);

  try
    JvDropTarget.AcceptDrag := False;
    PalEd.ROMData := _ROMData;
    PalEd.EditorConfig := _EditorConfig;
    if PalEd.ShowModal = mrOk then
    begin
      _ROMData.SaveBGPalette;
    end
    else
    begin
      _ROMData.LoadBGPalette;
      self.RedrawScreen;
    end;
    JvDropTarget.AcceptDrag := True;
    UpdateTitleCaption;
  finally
    FreeAndNil(PalEd);
  end;
end;

procedure TfrmRockAndRollMain.actStatisticsExecute(Sender: TObject);
var
  Statistics : TfrmNStatistics;
begin
  Statistics := TfrmNStatistics.Create(self);
  try
    JvDropTarget.AcceptDrag := False;
    Statistics.ROMData := _ROMData;
    Statistics.EditorConfig := _EditorConfig;
    if Statistics.ShowModal = mrOk then
      UpdateTitleCaption;
    JvDropTarget.AcceptDrag := True;
  finally
    FreeAndNil(Statistics);
  end;
end;

procedure TfrmRockAndRollMain.actSoundEffectsEditorExecute(
  Sender: TObject);
var
  SE : TfrmSoundEffectEditor;
begin
  SE := TfrmSoundEffectEditor.Create(self);
  try
    JvDropTarget.AcceptDrag := False;

    SE.ROMData := _ROMData;
    SE.EditorConfig := _EditorConfig;

    SE.ShowModal;
    JvDropTarget.AcceptDrag := True;
    UpdateTitleCaption;
  finally
    FreeAndNil(SE);
  end;
end;

procedure TfrmRockAndRollMain.actPropertiesExecute(Sender: TObject);
var
  Prop : TfrmFileProperties;
begin
  Prop := TfrmFileProperties.Create(self);
  try
    JvDropTarget.AcceptDrag := False;
    Prop.ROMData := _ROMData;
    Prop.ShowModal;
    JvDropTarget.AcceptDrag := True;
    UpdateTitleCaption;
  finally
    FreeAndNil(Prop);
  end;
end;

procedure TfrmRockAndRollMain.actEnableGridlinesExecute(Sender: TObject);
begin
  _EditorConfig.GridlinesOn := not(_EditorConfig.GridlinesOn);
  tlbEnableGridlines.Down := _EditorConfig.GridlinesOn;
  mnuGridlines.Checked := _EditorConfig.GridlinesOn;
  DrawLevelData;
end;

function TfrmRockAndRollMain.AutoCheckROMType(pFilename : String) : String;
var
  DataFiles : TStringList;
  INI : TMemINIHexFile;
  i : Integer;
  Loc : Integer;
  Auto1,Auto2,Auto3,Auto4 : Byte;
  TempROM : TiNESImage;
begin
  result := '';
  DataFiles := TStringList.Create;
  try
    DataFiles.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\data.dat');

    for i := 0 to DataFiles.Count -1 do
    begin
      INI := TMemINIHexFile.Create(ExtractFileDir(Application.ExeName) + '\Data\' + DataFiles[i]);
      try
        Loc := INI.ReadHexValue('AutoCheck','Location');
        Auto1 := INI.ReadHexValue('AutoCheck','Auto1');
        Auto2 := INI.ReadHexValue('AutoCheck','Auto2');
        Auto3 := INI.ReadHexValue('AutoCheck','Auto3');
        Auto4 := INI.ReadHexValue('AutoCheck','Auto4');
        TempROM := TiNESImage.Create(pFilename);
        if TempROM.ROM[Loc] = Auto1 then
          if TempROM.ROM[Loc+1] = Auto2 then
            if TempROM.ROM[Loc+2] = Auto3 then
              if TempROM.ROM[Loc+3] = Auto4 then
              begin
                result := DataFiles[i];
                break;
              end;
      finally
        FreeAndNil(TempROM);
        FreeAndNil(INI);
      end;
    end;
  finally
    FreeAndNil(DataFiles);
  end;

end;

procedure TfrmRockAndRollMain.actSpriteChangeExecute(Sender: TObject);
var
  SprChange : TfrmSpriteChange;
begin
  SprChange := TfrmSpriteChange.Create(self);
  try
    SprChange.ROMData := _ROMData;
    SprChange.EditorConfig := _EditorConfig;
    if SprChange.ShowModal = mrOk then
    begin
      UpdateTitleCaption;
    end;
  finally
    FreeAndNil(SprChange);
  end;
end;

procedure TfrmRockAndRollMain.actEnemyStatisticsExecute(Sender: TObject);
var
  Enemy : TfrmEnemyStatistics;
begin
  Enemy := TfrmEnemyStatistics.Create(self);
  try
    Enemy.ROMData := _ROMData;
    Enemy.EditorConfig := _EditorConfig;
    if Enemy.ShowModal = mrok then
      UpdateTitleCaption;
  finally
    FreeAndNil(Enemy);
  end;
end;

procedure TfrmRockAndRollMain.actPatternTableSettingsExecute(
  Sender: TObject);

var
  Pat : TfrmPatternTableSettings;
begin
  Pat := TfrmPatternTableSettings.Create(self);
  try
    Pat.ROMData := _ROMData;
    Pat.EditorConfig := _EditorConfig;
    Pat.ShowModal;
    UpdateTitleCaption;
    RedrawScreen;
  finally
    FreeAndNil(Pat);
  end;
end;

procedure TfrmRockAndRollMain.actEnemyDebugExecute(Sender: TObject);
var
  Enemy : TfrmEnemyDebug;
begin
  Enemy := TfrmEnemyDebug.Create(self);
  try
    Enemy.ROMData := _ROMData;
    Enemy.EditorConfig := _EditorConfig;
    Enemy.ShowModal;
  finally
    FreeAndNil(Enemy);
  end;
end;

procedure TfrmRockAndRollMain.LoadEmulatorIcon;
var
  Icon : TIcon;
  Buffer: array[0..2048] of char;
  IconHandle: HIcon;
  IconIndex : word;
begin
  if FileExists(_EditorConfig.EmulatorPath) = True then
  begin

    //get the associated icon for this file
    StrCopy(@Buffer, pchar(_EditorConfig.EmulatorPath));
    IconIndex := 0;
    IconHandle := ExtractAssociatedIcon(HInstance, Buffer, IconIndex);

    begin

      //now that we have an icon, add it to the image list.
      Icon := TIcon.Create;
      try
        Icon.Handle := IconHandle;
        mnuLaunchAssociatedEmulator.ImageIndex := ImageList.AddIcon(Icon);
      finally
        FreeAndNil(Icon);
      end;

    end;
  end
  else
  begin
    // Insert the number of the default NES emulator icon here.
    mnuLaunchAssociatedEmulator.ImageIndex := 7;
  end;

end;

procedure TfrmRockAndRollMain.actDistributionExecute(Sender: TObject);
var
  Distrib : TfrmDistribution;
begin
  Distrib := TfrmDistribution.Create(self);
  try
    Distrib.ROMData := _ROMData;
    Distrib.EditorConfig := _EditorConfig;
    if Distrib.ShowModal = mrOk then
      UpdateTitleCaption;

  finally
    FreeAndNil(Distrib);
  end;

end;

procedure TfrmRockAndRollMain.actEnemyIndexEditorExecute(Sender: TObject);
var
  EnemyIndexEd : TfrmEnemyIndexEditor;
begin
  EnemyIndexEd := TfrmEnemyIndexEditor.Create(self);
  try
    EnemyIndexEd.ROMData := _ROMData;
    EnemyIndexEd.EditorConfig := _EditorConfig;
    EnemyIndexEd.ShowModal;
    DrawLevelData;
    UpdateTitleCaption;
  finally
    FreeAndNil(EnemyIndexEd);
  end;
end;

procedure TfrmRockAndRollMain.actGoToLevelStartExecute(Sender: TObject);
begin
  scrboxLevel.HorzScrollBar.Position := _ROMdata.CurrLevel.Properties['ScreenStartCheck1'].Value * 512;
end;

procedure TfrmRockAndRollMain.actDispDataExecute(Sender: TObject);
var
  DataDisp : TfrmDataDisp;
begin
  DataDisp := TfrmDataDisp.Create(self);
  try
    DataDisp.ROMData := _ROMData;
    DataDisp.ShowModal;
  finally
    FreeAndNil(DataDisp);
  end;
end;

procedure TfrmRockAndRollMain.Button1Click(Sender: TObject);
begin
  showmessage(IntToStr(scrboxLevel.HorzScrollBar.Range));
end;

end.
