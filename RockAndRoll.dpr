program RockAndRoll;



uses
  Forms,
  fRockAndRollMain in 'fRockAndRollMain.pas' {frmRockAndRollMain},
  cmegarom in 'cmegarom.pas',
  uROM in 'uROM.pas',
  cconfiguration in 'cconfiguration.pas',
  uglobal in 'uglobal.pas',
  clevel in 'clevel.pas',
  fAbout in 'fAbout.pas' {frmAbout},
  fPreferences in 'fPreferences.pas' {frmPreferences},
  cenemy in 'cenemy.pas',
  fOpenDialog in 'fOpenDialog.pas' {frmOpenDialog},
  fRoomOrderEditor in 'fRoomOrderEditor.pas' {frmRoomOrder},
  fTSAEditor in 'fTSAEditor.pas' {frmTSA},
  fScrollEditor in 'fScrollEditor.pas' {frmScrollEditor},
  fEnemyProperties in 'fEnemyProperties.pas' {frmEnemyScreenChanger},
  csound in 'csound.pas',
  fKeyboardLayouts in 'fKeyboardLayouts.pas' {frmKeyboardLayout},
  fTileEditor in 'fTileEditor.pas' {frm16x16TileEditor},
  fGoToLevel in 'fGoToLevel.pas' {frmGoToLevel},
  fAdvancedEnemyManagement in 'fAdvancedEnemyManagement.pas' {frmAdvancedEnemyInfo},
  fDebugROMViewer in 'fDebugROMViewer.pas' {frmDebugROMViewer},
  fLevelProperties in 'fLevelProperties.pas' {frmLevelProperties},
  cSpecobj in 'cSpecobj.pas',
  ulunarcompress in 'ulunarcompress.pas',
  fBackupManagement in 'fBackupManagement.pas' {frmBackupManagement},
  fSpecObjProp in 'fSpecObjProp.pas' {frmSpecObjProp},
  fPalette in 'fPalette.pas' {frmPalette},
  cStatistics in 'cStatistics.pas',
  fSoundEffectEditor in 'fSoundEffectEditor.pas' {frmSoundEffectEditor},
  fFileProperties in 'fFileProperties.pas' {frmFileProperties},
  fScrKey in 'fScrKey.pas' {frmScrollKey},
  fHexadecimalEntry in 'fHexadecimalEntry.pas' {frmHex},
  fSimpleScrollEdit in 'fSimpleScrollEdit.pas' {frmSimpleScrollEd},
  fRoomOrderKey in 'fRoomOrderKey.pas' {frmRoomOrderKey},
  fSpriteChange in 'fSpriteChange.pas' {frmSpriteChange},
  uresourcestring in 'uresourcestring.pas',
  cEnemyStatistics in 'cEnemyStatistics.pas',
  fEnemyStatistics in 'fEnemyStatistics.pas' {frmEnemyStatistics},
  cPatternTableSettings in 'cPatternTableSettings.pas',
  fPatternTableSettings in 'fPatternTableSettings.pas' {frmPatternTableSettings},
  fEnemyDebug in 'fEnemyDebug.pas' {frmEnemyDebug},
  fDistribution in 'fDistribution.pas' {frmDistribution},
  fNewStatistics in 'fNewStatistics.pas' {frmNStatistics},
  fPatEdit in 'fPatEdit.pas' {frmPatEdit},
  fEnemyIndex in 'fEnemyIndex.pas' {frmEnemyIndexEditor},
  uConsts in 'uConsts.pas',
  fDataDisp in 'fDataDisp.pas' {frmDataDisp},
  fClearData in 'fClearData.pas' {frmClearData},
  fScrollRoomEd in 'fScrollRoomEd.pas' {frmScrollRoomEd};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Rock And Roll ~ The Megaman Editor';
  Application.CreateForm(TfrmRockAndRollMain, frmRockAndRollMain);
  Application.CreateForm(TfrmScrollRoomEd, frmScrollRoomEd);
  Application.Run;
end.
