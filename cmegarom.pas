unit cMegarom;

interface

uses clevel, gr32,ImgList,GR32_Image, dialogs, forms, classes,
  csound, bytelist, offsetlist, cStatistics, cEnemyStatistics, iNESImage;

type
{  TWidthHeight = record
    Width : Integer;
    Height : Integer;
  end;}

  TObjDetect = record
    ObjType : integer;
    ObjIndex : Integer;
  end;

  T16x16Graphic = record
    Pixels : Array [0..63, 0..63] of Byte;
  end;

  TMegamanROM = class
  private
    _Tiles : TBitmap32;
    _PatternTable : Array [0.. 8191] of Byte;
    _CurrentLevel : Integer;
    _DrawTiles : Array [0..255] Of Boolean;
    _MaximumSpecObj : Integer;
    _StartEnemyData : Integer;
    // functions
    function GetChanged(): Boolean;
    function GetEnemyHealth(pIndex : Integer) : Byte;
    function GetROMFilename(): String;
    function GetRoomData(pRoom,pIndex,pIndex1 : Integer): Byte;
    function GetWeaponColour(pIndex : Integer) : Byte;
    function ValidateEnemy(pID : Integer) : Boolean;
    function ValidateSpecObj(pID : Integer) : Boolean;
    // procedures
    procedure DrawLevelTile(pIndex : Integer);
    procedure LoadColonSeparatedFile(pStringList : TStringList;pFilename : String);
    procedure LoadDataFile();
    procedure LoadRoomTiles();
    procedure SetChanged(pChanged: Boolean);
    procedure SetLevel(pLevel : Integer);
    procedure SetRoomData(pRoom,pIndex,pIndex1 : Integer; pData : Byte);
    procedure SetWeaponColour(pIndex : Integer;pByte : Byte);
    procedure SetEnemyHealth(pIndex : Integer;pByte : Byte);
    function GetEnemyUnderMouse(pX,pY : Integer) : Integer;
    function GetSpecObjUnderMouse(pX,pY : Integer) : Integer;
    function GetBeamDownUnderMouse(pX, pY : Integer) : Integer;
    function ReturnColor32NESPal(pElement: Integer): TColor32;
  public
    // variables/objects
    LevelBGOffset : Integer;
    MaximumNumOfEnemies : Integer;
    Levels : TLevelList;
    CurrLevel : TLevel;
    EnemyDescriptions : TStringList;
    SoundEffectList : TStringList;
    TSASettingsList : TstringList;
    SoundEffects : TSoundEffectList;
    RoomOrder : TByteList;
    Properties : T1BytePropertyList;
    Statistics : TStatisticList;
    EnemyStatistics : TEnemyStatisticList;
    Palette : Array [0..7,0..3] of Byte;
    AfterDoorsPalette : Array [0..3,0..3] of Byte;
    WilyBGOffset : Integer;
    DataFile : String;
    NumberOfLevels : Integer;
    // constructor(s)
    constructor Create(pFilename : String;pDataFile : String);
    // destructor
    destructor Destroy;override;
    // functions
    function AddScrollData(pIndex : Integer) : Boolean;
    function AddEnemy(pScreenID : Byte): Boolean;
    function AddSpecObj(pScreenID : Integer) : Boolean;
    function Export8x8Pat(pID: Integer) : T16x16Graphic;
    function IsMegamanROM(): Boolean;
    function DetectObjectUnderMouse(pX, pY : Integer) : TObjDetect;
    function Save: Boolean;
    function SaveAs(pFilename : String): Boolean;
    function ReturnRoomIndex(pScrollByte : Integer): Integer;
    function RetrieveTotalEnemies : Integer;
    function GetSpriteChangeOffset(pSet : Byte;pIndex : Byte) : Integer;
    function GetSpriteSet(pScreenID : Byte): Byte;
    function GetSpriteChangePal(pSet,pIndex : Byte) : Byte;
    // procedures
    procedure DeleteEnemy(pIndex : Integer);
    procedure DeleteSpecObj(pIndex : Integer);
    procedure DeleteScrollData(pIndex : Integer);
    procedure DrawPaletteData(var pBitmap : TBitmap32;pPalData : Pointer;pPalSize : Byte);
    procedure DrawAllScreens (pBitmap : TBitmap32;pSize : Byte);
    procedure DrawScreen(pX,pY : Integer;pScreenNum : Integer;var pBitmap : TBitmap32);
    procedure DrawScreenOffset(var pBitmap : TBitmap32;pOffset : Integer);
    procedure DrawScreenIndex(var pBitmap : TBitmap32;pIndex : Integer);
    procedure DrawScrollData(var pBitmap : TBitmap32; pScrollStart,pScrollChk1, pScrollChk2 : Byte);
    procedure DrawTileSelector(var pBitmap : TBitmap32;pViewTSASettings : Boolean;pIndex : Integer);
    procedure DrawTSAPatternTable(pBitmap : TBitmap32; pPal : Byte);
    procedure DrawTSASettings(pBlockID : Byte;var pBitmap : TBitmap32);
    procedure DumpPatternTable(pFilename : String);
    procedure EditTSA(pTileID,pX,pY,pNewTile : Byte);
    procedure Import8x8Pat(pID: Integer; p16x16: T16x16Graphic);
    procedure IncrementEnemyID(pID : Integer);
    procedure IncrementEnemyIDby10(pID : Integer);
    procedure IncrementSpecObjID(pID : Integer);
    procedure IncrementTileAttributes(pTileID,pX,pY : Byte);
    procedure IncrementTileSolidity(pTileID,pX,pY : Byte);
    procedure LoadBGPalette();
    procedure LoadDefaultPalette;
    procedure LoadEnemyData;
    procedure LoadEnemyDescriptions;
    procedure LoadRoomOrder();
    procedure LoadPaletteFile(pPaletteFile : String);
    procedure LoadPatternTable();
    procedure LoadScrollData();
    procedure LoadSoundEffectList;
    procedure LoadTSASettingsList;
    procedure LoadEnemyStatistics;
    procedure AddPatternTableSettings(pOffset,pSize : Integer);
    procedure SaveEnemyStatistics;
    procedure RefreshOnScreenTiles(pTileSelectorValue : Byte);
    procedure RetrieveRoomOrderList(pStringList : TStringList);
    procedure LoadPatternTableSettings;
    procedure SavePatternTableSettings;
    procedure SaveBGPalette();
    procedure SaveEnemyData;
    procedure SavePatternTable();
    procedure SaveScrollData;
    procedure SaveRoomOrder;
    procedure SetEnemyXY(pXY : Byte; pX : Integer; pY : Integer;pID : Integer);
    procedure LoadSpecObjData();
    procedure SaveSpecObjData();
    procedure SortSpecialObjectData(pLevel : Integer);
    procedure SortEnemyData(pLevel : Integer);
    procedure RestoreDefaultiNESHeader;
    procedure DrawSpriteChangeTiles(pOffset : Integer;var pBitmap : TBitmap32);
    procedure SetSpriteChangeOffset(pSet,pIndex : Byte;pOffset : Integer);
    procedure SetSpriteSet(pSet : Byte;pScreenID : Byte);
    procedure SortEnemyDataByX(pLevel : Integer);
    procedure SetSpriteChangePal(pSet,pIndex,pNewPal : Byte);
    procedure DrawNESColours(var pBitmap : TBitmap32);
    procedure DrawPatternTable(var pBitmap : TBitmap32;pTable : Integer;pPal : Byte);
    procedure UpdateScreen(pBitmap : TBitmap32;pScreenID : Byte);overload;
    procedure UpdateScreen(pBitmap : TBitmap32;pStartIndex, pEndIndex : Integer);overload;
    procedure SetSpecObjX(pX : Integer);
    function  ListPaletteData(pPalData : Pointer;pPalSize : Byte) :string;
    procedure DrawObjData (pBitmap : TBitmap32; pFilter : Byte;
      pSpecObjColour : TColor32; var pBitmap32List : TBitmap32List);overload;
    procedure DrawObjData(pBitmap : TBitmap32;pStart,pEnd : Integer;
      pFilter : Byte;pSpecObjColour : TColor32;var pBitmap32List : TBitmap32List);overload;
    // properties
    property Changed : Boolean read GetChanged write SetChanged;
    property CurrentLevel : Integer read _CurrentLevel write SetLevel;
    property Filename : String read GetROMFilename;
    property RoomData[Screen : Integer;index1 : integer;index2 : Integer] : Byte read GetRoomData write SetRoomData;
    property WeaponColour[index : Integer]: Byte read GetWeaponColour write SetWeaponColour;
    property EnemyHealth[index : Integer]: Byte read GetEnemyHealth write SetEnemyHealth;
    property NESPal[index : Integer]:TColor32 read ReturnColor32NESPal;
  end;

implementation

uses sysutils,MemINIHexFile, cEnemy, cspecobj, cPatternTableSettings, uConsts, uROM;

const
  UNKNOWNENEMY : String = 'N\A';

{ TMegamanROM }

constructor TMegamanROM.Create(pFilename : String;pDataFile : String);
begin
  ROM := TiNESImage.Create(pFilename);
  DataFile := pDataFile;
  LoadDataFile();
  self._CurrentLevel := -1;
  LoadPatternTableSettings;
  LoadEnemyDescriptions;
  LoadTSASettingsList;
  LoadSoundEffectList;
//  SaveScrollData();
  LoadEnemyData();
  LoadEnemyStatistics;

end;

procedure TMegamanROM.LoadEnemyStatistics;
var
  i : Integer;
begin
  if Assigned(EnemyStatistics) then
    FreeAndNil(EnemyStatistics);

  EnemyStatistics := TEnemyStatisticList.Create(true);

  for i := 0 to $3A do
  begin
    EnemyStatistics.Add(TEnemyStatistic.Create);
    EnemyStatistics.Last.PWeaponDamage := ROM[Properties['EnemyPDamage'].Offset + i];
    EnemyStatistics.Last.CWeaponDamage := ROM[Properties['EnemyCDamage'].Offset + i];
    EnemyStatistics.Last.IWeaponDamage := ROM[Properties['EnemyIDamage'].Offset + i];
    EnemyStatistics.Last.BWeaponDamage := ROM[Properties['EnemyBDamage'].Offset + i];
    EnemyStatistics.Last.FWeaponDamage := ROM[Properties['EnemyFDamage'].Offset + i];
    EnemyStatistics.Last.EWeaponDamage := ROM[Properties['EnemyEDamage'].Offset + i];
    EnemyStatistics.Last.GWeaponDamage := ROM[Properties['EnemyGDamage'].Offset + i];
    EnemyStatistics.Last.PlayerDamage := ROM[Properties['EnemyDamage'].Offset + i];
    EnemyStatistics.Last.Score := ROM[Properties['EnemyScore'].Offset + i];
  end;

end;

procedure TMegamanROM.SaveEnemyStatistics;
var
  i : Integer;
begin

  for i := 0 to $3A do
  begin
    EnemyStatistics[i].PWeaponDamage := ROM[Properties['EnemyPDamage'].Offset + i];
    EnemyStatistics[i].CWeaponDamage := ROM[Properties['EnemyCDamage'].Offset + i];
    EnemyStatistics[i].IWeaponDamage := ROM[Properties['EnemyIDamage'].Offset + i];
    EnemyStatistics[i].BWeaponDamage := ROM[Properties['EnemyBDamage'].Offset + i];
    EnemyStatistics[i].FWeaponDamage := ROM[Properties['EnemyFDamage'].Offset + i];
    EnemyStatistics[i].EWeaponDamage := ROM[Properties['EnemyEDamage'].Offset + i];
    EnemyStatistics[i].GWeaponDamage := ROM[Properties['EnemyGDamage'].Offset + i];
    EnemyStatistics[i].PlayerDamage := ROM[Properties['EnemyDamage'].Offset + i];
    EnemyStatistics[i].Score := ROM[Properties['EnemyScore'].Offset + i];
  end;

end;

procedure TMegamanROM.LoadColonSeparatedFile(pStringList : TStringList;pFilename : String);
var
  ColonFile : TStringList;
  Index : String;
  i, count : Integer;
begin

  for i := 0 to 255 do
    pStringList.Add('$' + IntToHex(i,2) + ' - ' +  UNKNOWNENEMY);

  // Now load in the enemy names from the file 'enemy.dat' in the data directory.
  if FileExists(pFilename) = True then
  begin
    ColonFile := TStringList.Create;
    ColonFile.LoadFromFile(pFilename);

    for i := 0 to ColonFile.Count - 1 do
    begin
      if copy(ColonFile[i],1,2) <> '//' then
      begin
        count := 1;
        Index := '';
        while ((ColonFile[i][count] <> ':') or (count = length(ColonFile[i]))) do
        begin
          Index := Index + ColonFile[i][count];
          inc(Count);
        end;
        inc(Count);
        pStringList[StrToInt('$' + Index)] := '$' + Index + ' - ' + copy(ColonFile[i],Count,Length(ColonFile[i]) - count +1);
      end;

    end;

  end;
  FreeAndNil(ColonFile);

end;

procedure TMegamanROM.LoadSoundEffectList;
begin
  if Assigned(SoundEffectList) = True then
    FreeAndNil(SoundEffectList);

  SoundEffectList := TStringList.Create;
  LoadColonSeparatedFile(SoundEffectList,ExtractFileDir(Application.EXEName) + '\Data\se.dat');
end;

procedure TMegamanROM.LoadEnemyDescriptions;
begin
  if Assigned(EnemyDescriptions) = True then
    FreeAndNil(EnemyDescriptions);

  EnemyDescriptions := TStringList.Create;
  LoadColonSeparatedFile(EnemyDescriptions,ExtractFileDir(Application.EXEName) + '\Data\enemy.dat');
end;

procedure TMegamanROM.LoadTSASettingsList;
begin
  if Assigned(TSASettingsList) = True then
    FreeAndNil(TSASettingsList);

  TSASettingsList := TStringList.Create;
  LoadColonSeparatedFile(TSASettingsList,ExtractFileDir(Application.EXEName) + '\Data\tsaset.dat');
end;

destructor TMegamanROM.Destroy;
begin
  FreeAndNil(ROM);
  FreeAndNil(EnemyDescriptions);
  FreeAndNil(Levels);
  FreeAndNil(SoundEffectList);
  FreeAndNil(SoundEffects);
  FreeAndNil(RoomOrder);
  FreeAndNil(TSASettingsList);
  FreeAndNil(_Tiles);
  FreeAndNil(Properties);
  FreeAndNil(Statistics);
  FreeAndNil(EnemyStatistics);
  inherited;
end;

procedure TMegamanROM.LoadDataFile();
var
  INI : TMemINIHexFile;
  i, amount : Integer;
  CurLevel : TLevel;
  SE : TSoundEffect;
begin

  INI := TMemINIHexFile.Create(DataFile);
  try
    self.NumberOfLevels := INI.ReadInteger('General','NumberOfLevels');
    self.MaximumNumOfEnemies := INI.ReadInteger('General','MaxEnemies', 419);
    self._MaximumSpecObj := INI.ReadHexValue('General','MaxSpecObj');
    self._StartEnemyData := INI.ReadHexValue('General','StartEnemyData');

    self.Properties := T1BytePropertyList.Create(True);
    Properties.Add(T1ByteProperty.Create('WeaponColours',INI.ReadHexValue('General','WeaponColours')));

    Properties.Add(T1ByteProperty.Create('AfterDeath1',INI.ReadHexValue('General','AfterDeath1')));
    Properties.Add(T1ByteProperty.Create('AfterDeath2',INI.ReadHexValue('General','AfterDeath2')));

    // Enemy Information
    Properties.Add(T1ByteProperty.Create('EnemyDamage',INI.ReadHexValue('Enemy','EnemyDamage')));
    Properties.Add(T1ByteProperty.Create('EnemyPDamage',INI.ReadHexValue('Enemy','EnemyPDamage')));
    Properties.Add(T1ByteProperty.Create('EnemyCDamage',INI.ReadHexValue('Enemy','EnemyCDamage')));
    Properties.Add(T1ByteProperty.Create('EnemyIDamage',INI.ReadHexValue('Enemy','EnemyIDamage')));
    Properties.Add(T1ByteProperty.Create('EnemyBDamage',INI.ReadHexValue('Enemy','EnemyBDamage')));
    Properties.Add(T1ByteProperty.Create('EnemyFDamage',INI.ReadHexValue('Enemy','EnemyFDamage')));
    Properties.Add(T1ByteProperty.Create('EnemyEDamage',INI.ReadHexValue('Enemy','EnemyEDamage')));
    Properties.Add(T1ByteProperty.Create('EnemyGDamage',INI.ReadHexValue('Enemy','EnemyGDamage')));
    Properties.Add(T1ByteProperty.Create('EnemyScore',INI.ReadHexValue('Enemy','EnemyScore')));
    Properties.Add(T1ByteProperty.Create('GlobalEnemyHealth',INI.ReadHexValue('Enemy','GlobalEnemyHealth')));

    // Load in the statistics.
    Statistics := TStatisticList.Create(true);
    for i := 0 to INI.ReadInteger('Statistics','Amount',1) - 1 do
    begin
      Statistics.Add(TStatistic.Create(ROM,INI.ReadString('Statistics','Stat' + IntToStr(i) + 'Name'), INI.ReadHexValue('Statistics','Stat' + IntToStr(i) + 'Offset')));
      if INI.ValueExists('Statistics','Stat' + IntToStr(i) + 'Max') then
        Statistics.Last.MaximumValue := INI.ReadHexValue('Statistics','Stat' + IntToStr(i) + 'Max');
      if INI.ValueExists('Statistics','Stat' + IntToStr(i) + 'List') then
        Statistics.Last.List := INI.ReadString('Statistics','Stat' + IntToStr(i) + 'List');
    end;

    if Assigned(Levels) = True then
      FreeAndNil(Levels);

    Levels := TLevelList.Create(True);

    for i := 0 to self.NumberOfLevels - 1 do
    begin
      Levels.Add(TLevel.Create());
      CurLevel := Levels.Last;
      CurLevel.TSAOffset := INI.ReadHexValue('Level' + IntToStr(i),'TSA');
      CurLevel.AttributeOffset := INI.ReadHexValue('Level' + IntToStr(i),'Attribute');
      CurLevel.RoomOrderOffset := INI.ReadHexValue('Level' + IntToStr(i),'RoomOrder');
      CurLevel.RoomPointersOffset := INI.ReadHexValue('Level' + IntToStr(i),'RoomPointers');
      CurLevel.PaletteOffset := INI.ReadHexValue('Level' + IntToStr(i),'Palette');
//      CurLevel.RoomAmount := INI.ReadInteger('Level' + IntToStr(i),'RoomAmount');
      CurLevel.NumberOfTiles := INI.ReadHexValue('Level' + IntToStr(i),'NumberOfTiles');
      CurLevel.Name := INI.ReadString('Level' + IntToStr(i),'Name');
      CurLevel.EnemyPointerOffset := INI.ReadHexValue('Level' + IntToStr(i),'EnemyDataPo');
      CurLevel.StartTSAAt := INI.ReadHexValue('Level' + IntToStr(i),'OffsetTSA');
      CurLevel.ScrollOffset := INI.ReadHexValue('Level' + IntToStr(i),'Scroll');
      CurLevel.ScrollStartOffset := INI.ReadHexValue('Level' + IntToStr(i),'ScrollPos');
//      CurLevel.RoomOrderStartOffset := INI.ReadHexValue('Level' + IntToStr(i),'RoomOrderPos');
      CurLevel.WorkOutLevelLength;
      // Start of the properties.
      CurLevel.Properties := T1BytePropertyList.Create(true);
      CurLevel.Properties.Add(T1ByteProperty.Create('EnemyCheckPoint1',INI.ReadHexValue('Level' + IntToStr(i),'CheckPo1')));
      CurLevel.Properties.Add(T1ByteProperty.Create('EnemyCheckPoint2',INI.ReadHexValue('Level' + IntToStr(i),'CheckPo2')));
      CurLevel.Properties.Add(T1ByteProperty.Create('PatternTableData',INI.ReadHexValue('Level' + IntToStr(i),'PatternTableData')));
      CurLevel.Properties.Add(T1ByteProperty.Create('Music',INI.ReadHexValue('Level' + IntToStr(i),'Music')));
      CurLevel.Properties.Add(T1ByteProperty.Create('TSASetting0',INI.ReadHexValue('Level' + IntToStr(i),'TSASetting0Offset')));
      CurLevel.Properties.Add(T1ByteProperty.Create('TSASetting1',INI.ReadHexValue('Level' + IntToStr(i),'TSASetting1Offset')));
      CurLevel.Properties.Add(T1ByteProperty.Create('TSASetting2',INI.ReadHexValue('Level' + IntToStr(i),'TSASetting2Offset')));
      CurLevel.Properties.Add(T1ByteProperty.Create('TSASetting3',INI.ReadHexValue('Level' + IntToStr(i),'TSASetting3Offset')));
      CurLevel.Properties.Add(T1ByteProperty.Create('BeamDown1',INI.ReadHexValue('Level' + IntToStr(i),'BeamDown1Offset')));
      CurLevel.Properties.Add(T1ByteProperty.Create('BeamDown2',INI.ReadHexValue('Level' + IntToStr(i),'BeamDown2Offset')));
      CurLevel.Properties.Add(T1ByteProperty.Create('BeamDown3',INI.ReadHexValue('Level' + IntToStr(i),'BeamDown3Offset')));
      CurLevel.Properties.Add(T1ByteProperty.Create('ScreenStartCheck1',INI.ReadHexValue('Level' + IntToStr(i),'RoomOrderPos')));
      CurLevel.Properties.Add(T1ByteProperty.Create('ScreenStartCheck2',INI.ReadHexValue('Level' + IntToStr(i),'ScreenStartCheck2')));
      CurLevel.Properties.Add(T1ByteProperty.Create('ScreenStartCheck3',INI.ReadHexValue('Level' + IntToStr(i),'ScreenStartCheck3')));
      CurLevel.Properties.Add(T1ByteProperty.Create('ScrollPosChk1',INI.ReadHexValue('Level' + IntToStr(i),'ScrollPosChk1')));
      CurLevel.Properties.Add(T1ByteProperty.Create('ScrollPosChk2',INI.ReadHexValue('Level' + IntToStr(i),'ScrollPosChk2')));
      CurLevel.Properties.Add(T1ByteProperty.Create('DoorsWorkFrom',INI.ReadHexValue('Level' + IntToStr(i),'DoorsFromOffset')));
      CurLevel.Properties.Add(T1ByteProperty.Create('RoomOrderFix1Check',INI.ReadHexValue('Level' + IntToStr(i),'RoomOrderFix1Check')));
      CurLevel.Properties.Add(T1ByteProperty.Create('RoomOrderFix2Check',INI.ReadHexValue('Level' + IntToStr(i),'RoomOrderFix2Check')));
      CurLevel.Properties.Add(T1ByteProperty.Create('ScreenStartChk2Trig',INI.ReadHexValue('Level' + IntToStr(i),'ScreenStartChk2Trig')));
      CurLevel.Properties.Add(T1ByteProperty.Create('ScreenStartChk3Trig',INI.ReadHexValue('Level' + IntToStr(i),'ScreenStartChk3Trig')));
      CurLevel.Properties.Add(T1ByteProperty.Create('RoomOrderFix1Check2',INI.ReadHexValue('Level' + IntToStr(i),'RoomOrderFix1Check2')));
      CurLevel.Properties.Add(T1ByteProperty.Create('RoomOrderFix2Check2',INI.ReadHexValue('Level' + IntToStr(i),'RoomOrderFix2Check2')));
      CurLevel.Properties.Add(T1ByteProperty.Create('SpriteChangePointers',INI.ReadHexValue('Level' + IntToStr(i),'SpriteChangePointers')));
      CurLevel.Properties.Add(T1ByteProperty.Create('SpriteChangeData',INI.ReadHexValue('Level' + IntToStr(i),'SpriteChangeData')));

      if INI.ValueExists('Level' + IntToStr(i),'AfterDoorsPalette') then
        CurLevel.Properties.Add(T1ByteProperty.Create('AfterDoorsPalette',INI.ReadHexValue('Level' + IntToStr(i),'AfterDoorsPalette')));

      if INI.ValueExists('Level' + IntToStr(i),'ColourCycles') then
        CurLevel.Properties.Add(T1ByteProperty.Create('ColourCycles',INI.ReadHexValue('Level' + IntToStr(i),'ColourCycles')));

      // Boss Damage Settings
      CurLevel.Properties.Add(T1ByteProperty.Create('BossPBlaster',INI.ReadHexValue('Level' + IntToStr(i),'BossDamageOffset')));
      CurLevel.Properties.Add(T1ByteProperty.Create('BossCut',1 + INI.ReadHexValue('Level' + IntToStr(i),'BossDamageOffset')));
      CurLevel.Properties.Add(T1ByteProperty.Create('BossIce',2 + INI.ReadHexValue('Level' + IntToStr(i),'BossDamageOffset')));
      CurLevel.Properties.Add(T1ByteProperty.Create('BossBomb',3 + INI.ReadHexValue('Level' + IntToStr(i),'BossDamageOffset')));
      CurLevel.Properties.Add(T1ByteProperty.Create('BossFire',4 + INI.ReadHexValue('Level' + IntToStr(i),'BossDamageOffset')));
      CurLevel.Properties.Add(T1ByteProperty.Create('BossElec',5 + INI.ReadHexValue('Level' + IntToStr(i),'BossDamageOffset')));
      CurLevel.Properties.Add(T1ByteProperty.Create('BossGuts',6 + INI.ReadHexValue('Level' + IntToStr(i),'BossDamageOffset')));

      CurLevel.Properties.Add(T1ByteProperty.Create('ProjectileDamage',INI.ReadHexValue('Level' + IntToStr(i),'ProjectileDamage')));

      CurLevel.SpecObjOffset := INI.ReadHexValue('Level' + IntToStr(i),'SpecObjOffset');

    end;

    if Assigned(SoundEffects) = True then
      FreeAndNil(SoundEffects);

    SoundEffects := TSoundEffectList.Create(True);
    amount := INI.ReadInteger('SoundEffects','Amount');
    for i := 0 to amount -1 do
    begin
      SoundEffects.Add(TSoundEffect.Create());
      SE := SoundEffects.Last;
      SE.Name := INI.ReadString('SoundEffects','SE' + IntToStr(i) + 'Name');
      SE.Offset := INI.ReadHexValue('SoundEffects','SE' + IntToStr(i) + 'Offset');
      SE.Index := i;
    end;

  finally
    FreeAndNil(INI);
  end;

end;

function TMegamanROM.GetWeaponColour(pIndex : Integer) : Byte;
begin
  result := ROM[Properties['WeaponColours'].Offset + pIndex];
end;

procedure TMegamanROM.SetWeaponColour(pIndex : Integer;pByte : Byte);
begin
  ROM[Properties['WeaponColours'].Offset + pIndex] := pByte;
end;

function TMegamanROM.GetEnemyHealth(pIndex : Integer) : Byte;
begin
  result := ROM[self.Properties['EnemyHealth'].Offset + pIndex];
end;

procedure TMegamanROM.SetEnemyHealth(pIndex : Integer;pByte : Byte);
begin
  ROM[self.Properties['EnemyHealth'].Offset + pIndex] := pByte;
end;

function TMegamanROM.Save(): Boolean;
begin
  if (_CurrentLevel > -1) then
  begin
//    SaveRoomData;
    SaveEnemyData;
    SaveScrollData;
    SaveRoomOrder;
    SaveSpecObjData;

  end;
  SavePatternTableSettings;
  result := ROM.Save;

end;

function TMegamanROM.SaveAs(pFilename : String) : Boolean;
begin
  if (_CurrentLevel > -1) then
  begin
//    SaveRoomData;
    SaveEnemyData;
    SaveScrollData;
    SaveRoomOrder;
    SaveSpecObjData;
  end;
  result := ROM.SaveAs(pFilename);
end;

procedure TMegamanROM.LoadPatternTableSettings;
var
  i,x, numentries,res : Integer;
begin


  for i := 0 to Levels.Count -1 do
  begin
    if Assigned(Levels[i].PatternTableSettings) then
      FreeAndNil(Levels[i].PatternTableSettings);
    Levels[i].PatternTableSettings := TPatternTableSettingsList.Create(true);

    numentries := Levels[i].Properties['PatternTableData'].Value;
    for x := 0 to numentries -1 do
    begin
      Levels[i].PatternTableSettings.Add(TPatternTableSettings.Create);
      res := StrToInt('$' + IntToHex((((ROM[Levels[i].Properties['PatternTableData'].Offset + 1 + (x*2)] and $FC) shr 2) or $80),2) + '00');
      res := (res - $8000) + ((ROM[Levels[i].Properties['PatternTableData'].Offset + 1 + (x*2)] and $03) * $4000);
      res := res + $10;
      Levels[i].PatternTableSettings.Last.Offset := res;
      Levels[i].PatternTableSettings.Last.Size := ROM[Levels[i].Properties['PatternTableData'].Offset + 1 + (x*2) + 1] * $100;
    end;
  end;

end;

procedure TMegamanROM.SavePatternTableSettings;
var
  offset : Integer;
  BankNumber : Byte;
  upperbytes : Byte;
  i,x : Integer;
begin
  for i := 0 to Levels.Count -1 do
  begin

    // Write the number of entries
    Levels[i].Properties['PatternTableData'].Value := Levels[i].PatternTableSettings.Count;
    for x := 0 to  Levels[i].PatternTableSettings.Count - 1 do
    begin

      offset :=Levels[i].PatternTableSettings[x].Offset;

      // The bank number.
      BankNumber := offset div $4000;
      upperbytes := (((StrToInt('$' + IntToHex(offset,4)[1] + IntToHex(offset,4)[2]) - $80) shl 2) and $FC);

      ROM[Levels[i].Properties['PatternTableData'].Offset + 1 + (x*2)] := upperbytes + banknumber;
    end;

  end;
end;

procedure TMegamanROM.LoadPatternTable;
var
  i,x,patpos : Integer;
begin
  for i := 0 to high(_PatternTable) do
    _PatternTable[i] := $00;
  patpos := 0;
  for i := 0 to CurrLevel.PatternTableSettings.Count -1 do
  begin
    for x := 0 to CurrLevel.PatternTableSettings[i].Size - 1 do
    begin
      _PatternTable[patpos + x] :=   ROM[CurrLevel.PatternTableSettings[i].Offset+x];
    end;
    patpos := patpos + CurrLevel.PatternTableSettings[i].Size;
  end;
end;

procedure TMegamanROM.SavePatternTable;
var
  i,x,patpos : Integer;
begin
  patpos := 0;
  for i := 0 to CurrLevel.PatternTableSettings.Count -1 do
  begin
    for x := 0 to CurrLevel.PatternTableSettings[i].Size - 1 do
    begin
      ROM[CurrLevel.PatternTableSettings[i].Offset+x] := _PatternTable[patpos + x];
    end;
    patpos := patpos + CurrLevel.PatternTableSettings[i].Size;
  end;

end;

procedure TMegamanROM.DumpPatternTable(pFilename : String);
var
  Mem : TMemoryStream;
begin
  Mem := TMemoryStream.Create;
  try
    Mem.Write(_PatternTable[0],8192);
    Mem.SaveToFile(pFilename);
  finally
    FreeAndNil(Mem);
  end;
end;

procedure TMegamanROM.LoadBGPalette();
var
  i,x : Integer;
begin
  for i := 0 to 7 do
    for x := 0 to 3 do
      Palette[i,x] := ROM[self.Levels[CurrentLevel].PaletteOffset + (i * 4) + x];

  if CurrLevel.Properties.ValueExists('AfterDoorsPalette') = True then
  begin
    for i := 0 to 3 do
      for x := 0 to 3 do
        AfterDoorsPalette[i,x] :=  ROM[CurrLevel.Properties['AfterDoorsPalette'].Offset + (i * 4) + x];
  end;
end;

procedure TMegamanROM.SaveBGPalette();
var
  i,x : Integer;
begin
  for i := 0 to 7 do
    for x := 0 to 3 do
      ROM[self.Levels[CurrentLevel].PaletteOffset + (i * 4) + x] := Palette[i,x];

  if CurrLevel.Properties.ValueExists('AfterDoorsPalette') = True then
  begin
    for i := 0 to 3 do
      for x := 0 to 3 do
        ROM[CurrLevel.Properties['AfterDoorsPalette'].Offset + (i * 4) + x] := AfterDoorsPalette[i,x];
  end;
  
end;

procedure TMegamanROM.SetLevel(pLevel : Integer);
var
  i : Integer;
begin
  if self._CurrentLevel > -1 then
  begin
//    SaveRoomData();
    SaveScrollData();
    SaveRoomOrder;
  end;

  self._CurrentLevel := pLevel;

  CurrLevel := Levels[_CurrentLevel];
  LoadScrollData;
  // Reinitialise DrawTiles
  for i := 0 to 255 do
    _DrawTiles[i] := False;
  LoadRoomOrder();

  if Assigned(_Tiles) = False then
    _Tiles := TBitmap32.Create;

  _Tiles.Width := 256 * 32;
  _Tiles.Height := 32;
  LoadPatternTable();
  LoadBGPalette();
//  LoadEnemyData();
  LoadSpecObjData();
  LoadRoomTiles();

end;

procedure TMegamanROM.LoadRoomTiles();
var
  i : integer;
begin

  for i := 0 to  CurrLevel.NumberOfTiles -1 do
  begin
    DrawLevelTile(i);
  end;

end;

procedure TMegamanROM.LoadRoomOrder();
var
  i : Integer;
begin
  if assigned(RoomOrder) = True then
    FreeAndNil(RoomOrder);

  RoomOrder := TByteList.Create(0);
  RoomOrder.Count := $30;

  for i := 0 to $2F do
    RoomOrder[i] := ROM[Currlevel.RoomOrderOffset + i];
//    RoomOrder[i] := ROM[CurrLevel.RoomOrderOffset + ROM[CurrLevel.RoomOrderStartOffset] + i];

end;

procedure TMegamanROM.DrawLevelTile(pIndex : Integer);
var
  i,x : Integer;
  TilePal : Array [0..1,0..1] Of Byte;
  Pal : Pointer;
begin
  if Assigned(_Tiles) = False then
    exit;

  TilePal[0,0] := (ROM[CurrLevel.AttributeOffset  +pIndex]) and 3;
  tilepal[0,1] := (ROM[CurrLevel.AttributeOffset + pIndex] shr 2) and 3;
  tilepal[1,0] := (ROM[CurrLevel.AttributeOffset + pIndex] shr 4) and 3;
  tilepal[1,1] := (ROM[CurrLevel.AttributeOffset + pIndex] shr 6) and 3;

  for i := 0 to 1 do
    for x := 0 to 1 do
    begin
{      if (Room > CurrLevel.Properties['DoorsWorkFrom'].Value) and (CurrLevel.Properties.ValueExists('AfterDoorsPalette') = true) then
        pal := @AfterDoorsPalette[TilePal[x,i],0]
      else}
        pal := @palette[TilePal[x,i],0];

      ROM.DrawNESTile(@_PatternTable[((ROM[CurrLevel.TSAOffset + (pIndex*4) + ((i*2)+x)] and $3F) * $40)+$1000],_Tiles ,(i*16) + pIndex*32,(x*16) + 0,Pal);
      ROM.DrawNESTile(@_PatternTable[((ROM[CurrLevel.TSAOffset + (pIndex*4) + ((i*2)+x)] and $3F) * $40)+$10 + $1000],_Tiles ,(i*16) + pIndex*32,(x*16) + 8,Pal);
      ROM.DrawNESTile(@_PatternTable[((ROM[CurrLevel.TSAOffset + (pIndex*4) + ((i*2)+x)] and $3F) * $40)+$20 + $1000],_Tiles ,(i*16) + (pIndex*32) + 8,(x*16) + 0,Pal);
      ROM.DrawNESTile(@_PatternTable[((ROM[CurrLevel.TSAOffset + (pIndex*4) + ((i*2)+x)] and $3F) * $40)+$30 + $1000],_Tiles ,(i*16) + (pIndex*32) + 8,(x*16) + 8,Pal);
    end;


end;

procedure TMegamanROM.UpdateScreen(pBitmap : TBitmap32;pScreenID : Byte);
var
  i : Integer;
begin
  for i := 0 to $2F do
  begin
    if pScreenID = self.roomOrder[i] then
    begin
      DrawScreen(i  *256,0,i,pBitmap);
      if (i >0) and (i <$2F) then pBitmap.Line(i *256,0,i*256,256, clBlack32);
    end;
  end;
end;

procedure TMegamanROM.UpdateScreen(pBitmap : TBitmap32;pStartIndex, pEndIndex : Integer);
var
  i : Integer;
begin

  for i := pStartIndex to pEndIndex do
  begin
    DrawScreen( i  *256,0, i,pBitmap);
    if (i >0) and (i < $2F) then pBitmap.Line(i *256,0,i*256,256, clBlack32 );
  end;

end;

procedure TMegamanROM.DrawObjData(pBitmap : TBitmap32;pStart,pEnd : Integer; pFilter : Byte;pSpecObjColour : TColor32;var pBitmap32List : TBitmap32List);
var
  i,ScreenX,ObjScreen  : Integer;
  enemyindex : Array [0..$2F] of Byte;
  NumbersBMP : TBitmap32;
begin
  for i := 0 to high(EnemyIndex) do
    EnemyIndex[i]:= 0;

  if pFilter > 0 then
  begin
    if FileExists(ExtractFileDir(Application.ExeName) + '\Data\numbers.bmp') =  true then
    begin
      NumbersBMP := TBitmap32.Create;
      try
        NumbersBMP.Width := 136;
        NumbersBMP.Height := 8;
        NumbersBMP.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\numbers.bmp');
        if pFilter AND 1 = 1 then
        begin
          if Assigned(CurrLevel.Enemies) = True then
          begin

            // Draw the enemy data
            for i := 0 to CurrLevel.Enemies.Count - 1 do
            begin
                if (CurrLevel.Enemies[i].ScreenID >= pStart) and (CurrLevel.Enemies[i].ScreenID <= pEnd) then
                begin
                  if CurrLevel.Enemies[i].CheckPointStatus = 1 then
                    pBitmap.FillRect( CurrLevel.Enemies[i].ScreenX,CurrLevel.Enemies[i].Y,CurrLevel.Enemies[i].ScreenX+16,CurrLevel.Enemies[i].Y + 16, clred32)
                  else if CurrLevel.Enemies[i].CheckPointStatus = 2 then
                    pBitmap.FillRect( CurrLevel.Enemies[i].ScreenX,CurrLevel.Enemies[i].Y,CurrLevel.Enemies[i].ScreenX+16,CurrLevel.Enemies[i].Y + 16, clYellow32)
                  else if CurrLevel.Enemies[i].CheckPointStatus = 3 then
                    pBitmap.FillRect( CurrLevel.Enemies[i].ScreenX,CurrLevel.Enemies[i].Y,CurrLevel.Enemies[i].ScreenX+16,CurrLevel.Enemies[i].Y + 16, clLime32)
                  else
                    pBitmap.FillRect( CurrLevel.Enemies[i].ScreenX,CurrLevel.Enemies[i].Y,CurrLevel.Enemies[i].ScreenX+16,CurrLevel.Enemies[i].Y + 16, clBlack32);

                  pBitmap.Draw(bounds(CurrLevel.Enemies[i].ScreenX,CurrLevel.Enemies[i].Y,8,8),bounds(StrToInt('$' + IntToHex(CurrLevel.Enemies[i].ID,2)[1]) * 8,0,8,8),NumbersBMP);                  pBitmap.Draw(bounds(CurrLevel.Enemies[i].ScreenX+8,CurrLevel.Enemies[i].Y,8,8),bounds(StrToInt('$' + IntToHex(CurrLevel.Enemies[i].ID,2)[2]) * 8,0,8,8),NumbersBMP);
                  pBitmap.Draw(bounds(CurrLevel.Enemies[i].ScreenX+8,CurrLevel.Enemies[i].Y+8,8,8),bounds(StrToInt('$' + IntToHex(enemyindex[CurrLevel.Enemies[i].ScreenID],1)[1]) * 8,0,8,8),NumbersBMP);
                  inc(enemyindex[CurrLevel.Enemies[i].ScreenID]);
                end;
            end;
          end;
        end;
        if pFilter AND 2 = 2 then
        begin
          // Draw the special object data.
          if Assigned(CurrLevel.SpecObj) = True then
          begin
            for i := 0 to CurrLevel.SpecObj.Count -1 do
            begin
              ObjScreen := CurrLevel.SpecObj[i].X1 div 256;

              if (ObjScreen >= pStart) and (ObjScreen <= pEnd) then
              begin
                pBitmap.FrameRectS(CurrLevel.SpecObj[i].X1,CurrLevel.SpecObj[i].Y1,CurrLevel.SpecObj[i].X2,CurrLevel.SpecObj[i].Y2, pSpecObjColour);
                pBitmap.Draw(bounds(CurrLevel.SpecObj[i].X1,CurrLevel.SpecObj[i].Y1,8,8),bounds(StrToInt('$' + IntToHex(CurrLevel.SpecObj[i].ID,2)[1]) * 8,0,8,8),NumbersBMP);
                pBitmap.Draw(bounds(CurrLevel.SpecObj[i].X1+8,CurrLevel.SpecObj[i].Y1,8,8),bounds(StrToInt('$' + IntToHex(CurrLevel.SpecObj[i].ID,2)[2]) * 8,0,8,8),NumbersBMP);
              end;
            end;
          end;
        end;

        // We don't need to worry about trying to filter these out,
        // as they are only three objects, I can't see how optimizing these
        // will make the program much faster.
        if pFilter AND 4 = 4 then
        begin
          ScreenX := CurrLevel.Properties['ScreenStartCheck1'].Value * 256;
          pBitmap.Draw(ScreenX + 128,CurrLevel.Properties['BeamDown1'].Value,pBitmap32List.Bitmap[1]);

          ScreenX := CurrLevel.Properties['ScreenStartCheck2'].Value * 256;
          pBitmap.Draw(ScreenX + 128,CurrLevel.Properties['BeamDown2'].Value,pBitmap32List.Bitmap[1]);

          ScreenX := CurrLevel.Properties['ScreenStartCheck3'].Value * 256;
          pBitmap.Draw(ScreenX + 128,CurrLevel.Properties['BeamDown3'].Value,pBitmap32List.Bitmap[1]);
        end;
      finally
        FreeAndNil(NumbersBMP);
      end;
    end;
  end;

end;

procedure TMegamanROM.DrawObjData (pBitmap : TBitmap32; pFilter : Byte;
  pSpecObjColour : TColor32; var pBitmap32List : TBitmap32List);
var
  i,ScreenX,ObjScreen : Integer;
  enemyindex : Array [0..$2F] of Byte;
  NumbersBMP : TBitmap32;
begin
  for i := 0 to high(EnemyIndex) do
    EnemyIndex[i]:= 0;

  if pFilter > 0 then
  begin
    if FileExists(ExtractFileDir(Application.ExeName) + '\Data\numbers.bmp') =  true then
    begin
      NumbersBMP := TBitmap32.Create;

      try
        NumbersBMP.Width := 136;
        NumbersBMP.Height := 8;
        NumbersBMP.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\numbers.bmp');
        if pFilter AND 1 = 1 then
        begin
          if Assigned(CurrLevel.Enemies) = True then
          begin

            // Draw the enemy data
            for i := 0 to CurrLevel.Enemies.Count - 1 do
            begin
              // Draw only enemies with an enemy ID of less than or equal to $2F
              if CurrLevel.Enemies[i].ScreenID <= $2F then
              begin
                if CurrLevel.Enemies[i].CheckPointStatus = 1 then
                  pBitmap.FillRect( CurrLevel.Enemies[i].ScreenX,CurrLevel.Enemies[i].Y,CurrLevel.Enemies[i].ScreenX+16,CurrLevel.Enemies[i].Y + 16, clGreen32)
                else if CurrLevel.Enemies[i].CheckPointStatus = 2 then
                  pBitmap.FillRect( CurrLevel.Enemies[i].ScreenX,CurrLevel.Enemies[i].Y,CurrLevel.Enemies[i].ScreenX+16,CurrLevel.Enemies[i].Y + 16, clYellow32)
                else if CurrLevel.Enemies[i].CheckPointStatus = 3 then
                  pBitmap.FillRect( CurrLevel.Enemies[i].ScreenX,CurrLevel.Enemies[i].Y,CurrLevel.Enemies[i].ScreenX+16,CurrLevel.Enemies[i].Y + 16, clBlue32)
                else
                  pBitmap.FillRect( CurrLevel.Enemies[i].ScreenX,CurrLevel.Enemies[i].Y,CurrLevel.Enemies[i].ScreenX+16,CurrLevel.Enemies[i].Y + 16, clBlack32);

                pBitmap.Draw(bounds(CurrLevel.Enemies[i].ScreenX,CurrLevel.Enemies[i].Y,8,8),bounds(StrToInt('$' + IntToHex(CurrLevel.Enemies[i].ID,2)[1]) * 8,0,8,8),NumbersBMP);
                pBitmap.Draw(bounds(CurrLevel.Enemies[i].ScreenX+8,CurrLevel.Enemies[i].Y,8,8),bounds(StrToInt('$' + IntToHex(CurrLevel.Enemies[i].ID,2)[2]) * 8,0,8,8),NumbersBMP);
                pBitmap.Draw(bounds(CurrLevel.Enemies[i].ScreenX+8,CurrLevel.Enemies[i].Y+8,8,8),bounds(StrToInt('$' + IntToHex(enemyindex[CurrLevel.Enemies[i].ScreenID],1)[1]) * 8,0,8,8),NumbersBMP);
                inc(enemyindex[CurrLevel.Enemies[i].ScreenID]);
              end;
            end;
          end;
        end;
        if pFilter AND 2 = 2 then
        begin
          // Draw the special object data.
          if Assigned(CurrLevel.SpecObj) = True then
          begin
            for i := 0 to CurrLevel.SpecObj.Count -1 do
            begin
              ObjScreen := CurrLevel.SpecObj[i].X1 div 256;

              pBitmap.FrameRectS(CurrLevel.SpecObj[i].X1,CurrLevel.SpecObj[i].Y1,CurrLevel.SpecObj[i].X2,CurrLevel.SpecObj[i].Y2, pSpecObjColour);
              pBitmap.Draw(bounds(CurrLevel.SpecObj[i].X1,CurrLevel.SpecObj[i].Y1,8,8),bounds(StrToInt('$' + IntToHex(CurrLevel.SpecObj[i].ID,2)[1]) * 8,0,8,8),NumbersBMP);
              pBitmap.Draw(bounds(CurrLevel.SpecObj[i].X1+8,CurrLevel.SpecObj[i].Y1,8,8),bounds(StrToInt('$' + IntToHex(CurrLevel.SpecObj[i].ID,2)[2]) * 8,0,8,8),NumbersBMP);
            end;
          end;
        end;
        if pFilter AND 4 = 4 then
        begin
          ScreenX := CurrLevel.Properties['ScreenStartCheck1'].Value * 256;
          pBitmap.Draw(ScreenX + 128,CurrLevel.Properties['BeamDown1'].Value,pBitmap32List.Bitmap[1]);

          ScreenX := CurrLevel.Properties['ScreenStartCheck2'].Value * 256;
          pBitmap.Draw(ScreenX + 128,CurrLevel.Properties['BeamDown2'].Value,pBitmap32List.Bitmap[1]);

          ScreenX := CurrLevel.Properties['ScreenStartCheck3'].Value * 256;
          pBitmap.Draw(ScreenX + 128,CurrLevel.Properties['BeamDown3'].Value,pBitmap32List.Bitmap[1]);
        end;
      finally
        FreeAndNil(NumbersBMP);
      end;
    end;
  end;
end;

procedure TMegamanROM.DrawAllScreens (pBitmap : TBitmap32;pSize : Byte);
var
  i: Integer;
begin
  for i := 0 to $2F do
  begin
    if self.RoomOrder[i] <> $FF then DrawScreen(i  *256,0,i,pBitmap);
    if (i >0) and (i <pSize -1) then pBitmap.Line(i *256,0,i*256,256, clBlack32 );
  end;
end;


procedure TmegamanROM.DrawTSAPatternTable(pBitmap : TBitmap32; pPal : Byte);
var
  i,x : Integer;
  pal : Pointer;
begin

{  if (Room > CurrLevel.Properties['DoorsWorkFrom'].Value) and (CurrLevel.Properties.ValueExists('AfterDoorsPalette') = true) then
    pal := @AfterDoorsPalette[pPal,0]
  else}
    pal := @Palette[pPal,0];

  for x := 0 to 7 do
    for i := 0 to 31 do
      ROM.DrawNESTile(@_PatternTable[$1000 + (x*32 + i) * 16],pBitmap,(i div 2) *8,(x*16)+(i mod 2) *8,Pal);
end;

procedure TMegamanROM.DrawPatternTable(var pBitmap : TBitmap32;pTable : Integer;pPal : Byte);
var
  i,x : Integer;
begin
  for i := 0 to 15 do
    for x := 0 to 15 do
      ROM.DrawNESTile(@_PatternTable[pTable + (i*16 + x) * 16],pBitmap,x*8,i*8,@Palette[pPal,0]);
end;

procedure TMegamanROM.DrawScreen(pX,pY : Integer;pScreenNum : Integer;var pBitmap : TBitmap32);
var
  i,x,RoomOffset : Integer;
begin
  RoomOffset := ROM.PointerToOffset(CurrLevel.RoomPointersOffset +  (RoomOrder[pScreenNum] * 2));
  for i := 0 to 7 do
    for x := 0 to 7 do
    begin
      pBitmap.Draw( bounds(pX + (i*32),pY + (x*32),32,32),bounds((ROM[RoomOffset + (i * 8) + x]) * 32,0,32,32),_Tiles);
    end;
end;


procedure TMegamanROM.DrawScreenOffset(var pBitmap : TBitmap32;pOffset : Integer);
var
  i,x : Integer;
begin
  for i := 0 to 7 do
    for x := 0 to 7 do
    begin
      pBitmap.Draw(bounds(i*32,x*32,32,32),bounds(ROM[pOffset + (i*8) + x] * 32,0,32,32),_Tiles);
    end;

end;

procedure TMegamanROM.DrawScreenIndex(var pBitmap : TBitmap32;pIndex : Integer);
var
  i,x, RoomOffset : Integer;
begin
  RoomOffset := ROM.PointerToOffset(CurrLevel.RoomPointersOffset +  (RoomOrder[pIndex] * 2));
  for i := 0 to 7 do
    for x := 0 to 7 do
    begin
      if _DrawTiles[ROM[RoomOffset + (i*8) + x]] = False then
      begin

        DrawLevelTile(ROM[RoomOffset + (i*8) + x]);
        _DrawTiles[ROM[RoomOffset + (i*8) + x]] := True;

      end;
      pBitmap.Draw(bounds(i*32,x*32,32,32),bounds(ROM[RoomOffset + (i*8) + x] * 32,0,32,32),_Tiles);

    end;

end;

function TMegamanROM.GetRoomData(pRoom,pIndex,pIndex1 : Integer): Byte;
var
  RoomOffset : Integer;
begin
//  result := _RoomData[pIndex,pIndex1];
  RoomOffset := ROM.PointerToOffset(Levels[CurrentLevel].RoomPointersOffset +  (RoomOrder[pRoom] * 2));

  result := ROM[RoomOffset + (pIndex * 8) + pIndex1];
end;

procedure TMegamanROM.SetRoomData(pRoom,pIndex,pIndex1 : Integer; pData : Byte);
var
  RoomOffset : Integer;
begin
//  _RoomData[pIndex,pIndex1] := pData;
  RoomOffset := ROM.PointerToOffset(CurrLevel.RoomPointersOffset +  (RoomOrder[pRoom] * 2));
  ROM[RoomOffset + (pIndex * 8) + pIndex1] := pData;
end;

procedure TMegamanROM.DrawTileSelector(var pBitmap : TBitmap32;pViewTSASettings : Boolean;pIndex : Integer);
var
  i : Integer;
begin
  if Assigned(_Tiles) = False then
    exit;
  for i := 0 to 7 do
  begin
    if _DrawTiles[i + pIndex] = False then
    begin
      DrawLevelTile(pIndex + i);
      _DrawTiles[pindex + i] := True;
    end;
    pBitmap.Draw(bounds(0,i * 32,32,32),bounds((pindex+i) * 32,0,32,32),_tiles);
  end;
end;

procedure TMegamanROM.DrawTSASettings(pBlockID : Byte;var pBitmap : TBitmap32);
var
  i : Integer;
  TempNum : TBitmap32;
  Solidity : Byte;
begin

  TempNum := TBitmap32.Create;
  try
    TempNum.Width := 136;
    TempNum.Height := 8;
    TempNum.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\numbers.bmp');
    TempNum.MasterAlpha := 200;
    TempNum.DrawMode := dmBlend;
    for i := 0 to 7 do
    begin
      Solidity := (ROM[CurrLevel.TSAOffset + ((pBlockID + i) * 4)] and $C0) shr 6;
      pBitmap.Draw(bounds(0,i * 32,8,8),bounds(StrToInt('$' + IntToHex(Solidity,1)[1]) * 8,0,8,8),TempNum);
      Solidity := (ROM[CurrLevel.TSAOffset + ((pBlockID + i) * 4) +1] and $C0) shr 6;
      pBitmap.Draw(bounds(0,(i * 32) + 16,8,8),bounds(StrToInt('$' + IntToHex(Solidity,1)[1]) * 8,0,8,8),TempNum);
      Solidity := (ROM[CurrLevel.TSAOffset + ((pBlockID + i) * 4) + 2] and $C0) shr 6;
      pBitmap.Draw(bounds(16,(i * 32),8,8),bounds(StrToInt('$' + IntToHex(Solidity,1)[1]) * 8,0,8,8),TempNum);
      Solidity := (ROM[CurrLevel.TSAOffset + ((pBlockID + i) * 4) + 3] and $C0) shr 6;
      pBitmap.Draw(bounds(16,(i * 32) + 16,8,8),bounds(StrToInt('$' + IntToHex(Solidity,1)[1]) * 8,0,8,8),TempNum);
    end;
  finally
    FreeAndNil(TempNum);
  end;

end;

procedure TMegamanROM.RefreshOnScreenTiles(pTileSelectorValue : Byte);
var
  i : integer;
begin

  // Reset all the tiles back to the false drawing state.
  for i := 0 to high(_DrawTiles) do
    _DrawTiles[i] := false;

  LoadRoomTiles();

  // Now scroll through the blocks displayed in the tile selector
  for i := pTileSelectorValue to pTileSelectorValue + 5 do
    if _DrawTiles[i] = false then
    begin
      DrawLevelTile(i);
      _DrawTiles[i] := True;
    end;

end;

procedure TMegamanROM.LoadPaletteFile(pPaletteFile : String);
begin
  ROM.LoadPaletteFile(pPaletteFile);
end;

procedure TMegamanROM.LoadDefaultPalette;
begin
  ROM.LoadDefaultPalette;
end;

procedure TMegamanROM.LoadSpecObjData();
var
  i,ObjScreenID : Integer;
  SpecObj : TSpecObj;
begin
  if Assigned(CurrLevel.SpecObj) = True then
    FreeAndNil(CurrLevel.SpecObj);
  CurrLevel.SpecObj := TSpecObjList.Create(True);
  for i := 0 to ROM[CurrLevel.SpecObjOffset] - 1 do
  begin
    CurrLevel.SpecObj.Add(TSpecObj.Create);
    SpecObj := CurrLevel.SpecObj.Last;
    SpecObj.ID := ROM[CurrLevel.SpecObjOffset + 1 + (i * 6)];
    ObjScreenID := ROM[CurrLevel.SpecObjOffset + 1 + (i * 6) + 1];

    SpecObj.X1 := ROM[CurrLevel.SpecObjOffset + 1 + (i * 6) + 2] + (ObjScreenID * 256);
    SpecObj.Y1 := ROM[CurrLevel.SpecObjOffset + 1 + (i * 6) + 3];
    SpecObj.X2 := ROM[CurrLevel.SpecObjOffset + 1 + (i * 6) + 4] + (ObjScreenID * 256);
    SpecObj.Y2 := ROM[CurrLevel.SpecObjOffset + 1 + (i * 6) + 5];

    if SpecObj.X2 < SpecObj.X1 then
      SpecObj.X2 := SpecObj.X2 + $100;
    if SpecObj.Y2 < SpecObj.Y1 then
      SpecObj.Y2 := SpecObj.Y2 + $100;

    specobj.width := SpecObj.X2 - SpecObj.X1;
    specobj.height := SpecObj.Y2 - SpecObj.Y1;

  end;

end;

procedure TMegamanROM.SaveSpecObjData();
var
  i,ObjScreenID : Integer;
begin
  if Assigned(CurrLevel.SpecObj) = False then
    exit;

  SortSpecialObjectData(self._CurrentLevel);

  // Update the count of special objects.
  ROM[CurrLevel.SpecObjOffset] := CurrLevel.SpecObj.Count;
  // If there is special objects in this level, then
  // save those to the _ROM.
  if CurrLevel.SpecObj.Count > 0 then
  begin
    for i := 0 to CurrLevel.SpecObj.Count - 1 do
    begin
      ObjScreenID := CurrLevel.SpecObj[i].X1 div 256;
      ROM[CurrLevel.SpecObjOffset + 1 + (i * 6)] := CurrLevel.SpecObj[i].ID;
      ROM[CurrLevel.SpecObjOffset + 1 + (i * 6) + 1] := ObjScreenID;
      ROM[CurrLevel.SpecObjOffset + 1 + (i * 6) + 2] := CurrLevel.SpecObj[i].X1 and $FF;
      ROM[CurrLevel.SpecObjOffset + 1 + (i * 6) + 3] := CurrLevel.SpecObj[i].Y1 and $FF;
      ROM[CurrLevel.SpecObjOffset + 1 + (i * 6) + 4] := CurrLevel.SpecObj[i].X2 and $FF;
      ROM[CurrLevel.SpecObjOffset + 1 + (i * 6) + 5] := CurrLevel.SpecObj[i].Y2 and $FF;
    end;
  end;
  // Save the terminator marker.
  // Not needed?
//  _ROM[CurrLevel.SpecObjOffset + (CurrLevel.SpecObj.Count * 6) + 1] := $FF;

end;

procedure TMegamanROM.LoadEnemyData;
var
  Pos, i : Integer;
//  enemyamounts : Integer;
  Enemy : TEnemy;
begin
//  enemyamounts := 0;
  for i := 0 to Levels.Count -1 do
  begin
    if Assigned(Levels[i].Enemies) = True then
      FreeAndNil(Levels[i].Enemies);

    Pos := ROM.PointerToOffset(Levels[i].EnemyPointerOffset,$18010);
    Levels[i].Enemies := TEnemyList.Create(True);
    while(ROM[pos] < $FF) do
    begin
      Levels[i].Enemies.Add(Tenemy.Create);
      Enemy := Levels[i].Enemies.Last;
      Enemy.ScreenID := ROM[pos];
      Enemy.X := ROM[pos +1];
      Enemy.Y := ROM[pos +2];
      Enemy.ID := ROM[pos +3];
      Enemy.CheckPointStatus := 0;
      pos := pos + 4;
    end;
    if (Levels[i].Properties['EnemyCheckPoint1'].Value) < Levels[i].Enemies.Count then
      Levels[i].Enemies[Levels[i].Properties['EnemyCheckPoint1'].Value ].CheckPointStatus :=
        Levels[i].Enemies[Levels[i].Properties['EnemyCheckPoint1'].Value ].CheckPointStatus + 1;

    if (Levels[i].Properties['EnemyCheckPoint2'].Value) < Levels[i].Enemies.Count then
      Levels[i].Enemies[Levels[i].Properties['EnemyCheckPoint2'].Value].CheckPointStatus :=
        Levels[i].Enemies[Levels[i].Properties['EnemyCheckPoint2'].Value].CheckPointStatus + 2;
//    enemyamounts := enemyamounts + Levels[i].Enemies.Count;
  end;
//  showmessage(IntToStr(enemyamounts));
end;

{procedure TMegamanROM.SaveEnemyData;
var
  x,i : Integer;
  Enemy : TEnemy;
  Offset : Integer;
begin
  Offset := _StartEnemyData;
{  for i := 0 to self._MaximumNumOfEnemies - 1 do
  begin
    ROM[offset + (i * 4)] := $FF;
    ROM[offset + (i * 4) + 1] := $FF;
    ROM[offset + (i * 4) + 2] := $FF;
    ROM[offset + (i * 4) + 3] := $FF;
  end;

  for i := 0 to Levels.Count -1 do
  begin
    if Assigned(Levels[i].Enemies) = True then
    begin
      SortEnemyData(i);
      _ROM.StorePointerOffset(Offset,Levels[i].EnemyPointerOffset);

//      Offset := _ROM.ReturnPointerOffset(Levels[i].EnemyPointerOffset,$18010);
      if Levels[i].Enemies.Count > 0 then
      begin

        for x := 0 to Levels[i].Enemies.Count - 1 do
        begin
          Enemy := Levels[i].Enemies[x];
          ROM[Offset + (x * 4)] := Enemy.ScreenID;
          ROM[Offset + (x * 4) + 1] := Enemy.X;
          ROM[Offset + (x * 4) + 2] := Enemy.Y;
          ROM[Offset + (x * 4) + 3] := Enemy.ID;
        end;
      end;
    end;
    Offset := Offset + Levels[i].Enemies.Count * 4;
    // Save the $FF marker.
    ROM[Offset] := $FF;
    inc(Offset);
  end;
end;}

procedure TMegamanROM.SaveEnemyData;
var
  x,i,z : Integer;
  Enemy : TEnemy;
  Offset : Integer;
begin

  Offset := _StartEnemyData;

  for i := 0 to Levels.Count -1 do
  begin
    if Assigned(Levels[i].Enemies) = True then
    begin
//      SortEnemyData(i);
      ROM.StorePointerOffset(Offset,Levels[i].EnemyPointerOffset);

//      Offset := ROM.ReturnPointerOffset(Levels[i].EnemyPointerOffset,$18010);
      if Levels[i].Enemies.Count > 0 then
      begin

        for z := 0 to $2f do
        begin

          for x := 0 to Levels[i].Enemies.Count - 1 do
          begin

            Enemy := Levels[i].Enemies[x];
            if Enemy.ScreenID = z then
            begin
              ROM[Offset + (x * 4)] := Enemy.ScreenID;
              ROM[Offset + (x * 4) + 1] := Enemy.X;
              ROM[Offset + (x * 4) + 2] := Enemy.Y;
              ROM[Offset + (x * 4) + 3] := Enemy.ID;
            end;
          end;

        end;



      end;
    end;
    Offset := Offset + Levels[i].Enemies.Count * 4;
    // Save the $FF marker.
    ROM[Offset] := $FF;
    inc(Offset);
  end;

end;

function TMegamanROM.GetROMFilename(): String;
begin
  result := ROM.Filename;
end;

procedure TMegamanROM.SetChanged(pChanged: Boolean);
begin
  ROM.Changed := pChanged;
end;

function TMegamanROM.GetChanged(): Boolean;
begin
  result := ROM.Changed;
end;

procedure TMegamanROM.RetrieveRoomOrderList(pStringList : TStringList);
var
  i : Integer;
begin
  for i := 0 to RoomOrder.count -1 do
    pStringList.Add('Room ' + IntToHex(RoomOrder[i],2) + ' -  ($' + IntToHex(ROM.PointerToOffset(Levels[CurrentLevel].RoomPointersOffset +  (RoomOrder[i] * 2)),2) + ')');

end;

function TMegamanROM.GetSpecObjUnderMouse(pX,pY : Integer) : Integer;
var
  i, RealX, ObjScreenID : Integer;
begin

  result := -1;
  if Assigned(CurrLevel.SpecObj) = False then exit;

  if CurrLevel.SpecObj.Count = 0 then exit;

  for i := 0 to CurrLevel.SpecObj.Count -1 do
  begin
    ObjScreenID := CurrLevel.SpecObj[i].X1 div 256;
    if pX div 256 = ObjScreenID then
    begin
      RealX := pX mod 256;

      if (RealX >= CurrLevel.SpecObj[i].X1) and (RealX <= CurrLevel.SpecObj[i].X2) then
      begin
        if (pY >= CurrLevel.SpecObj[i].Y1) and (pY <= CurrLevel.SpecObj[i].Y2) then
        begin
          result := i;
          break;
        end;
      end;


    end;
  end;

end;

function TMegamanROM.GetEnemyUnderMouse(pX,pY : Integer) : Integer;
var
  i : Integer;
begin
  result := -1;
  // Validation checks.
  if Assigned(CurrLevel.Enemies) = False then exit;

  if CurrLevel.Enemies.Count = 0 then exit;

  for i := 0 to CurrLevel.Enemies.Count -1 do
  begin
    if (pX >= CurrLevel.Enemies[i].ScreenX) and (pX <= CurrLevel.Enemies[i].ScreenX + 16) then
      if (pY >= CurrLevel.Enemies[i].Y) and (pY <= CurrLevel.Enemies[i].Y + 16) then
      begin
        result := i;
        break;
      end;

  end;
end;

procedure TMegamanROM.SetEnemyXY(pXY : Byte; pX : Integer; pY : Integer;pID : Integer);
begin

  if ValidateEnemy(pID) = False then exit;

  if pXY = 0 then
  begin
    CurrLevel.Enemies[pID].ScreenX := pX;
  end
  else
  begin
    CurrLevel.Enemies[pID].Y := pY;
  end;
  ROM.Changed := True;
end;

procedure TMegamanROM.IncrementSpecObjID(pID : Integer);
begin

  if ValidateSpecObj(pID) = False then exit;
  if CurrLevel.SpecObj[pID].ID = 3 then
    CurrLevel.SpecObj[pID].ID := 0
  else
    CurrLevel.SpecObj[pID].ID := CurrLevel.SpecObj[pID].ID + 1;

  ROM.Changed := True;

end;

procedure TMegamanROM.IncrementEnemyID(pID : Integer);
begin

  if ValidateEnemy(pID) = False then exit;

  CurrLevel.Enemies[pID].ID := CurrLevel.Enemies[pID].ID + 1;

  ROM.Changed := True;

end;

procedure TMegamanROM.IncrementEnemyIDby10(pID : Integer);
begin

  if ValidateEnemy(pID) = False then exit;

  CurrLevel.Enemies[pID].ID := CurrLevel.Enemies[pID].ID + $10;

  ROM.Changed := True;

end;

function TMegamanROM.ValidateEnemy(pID : Integer) : Boolean;
begin
  result := False;

  if Assigned(CurrLevel.Enemies) = False then exit;
  if CurrLevel.Enemies.Count = 0 then exit;
  if (pID = -1) then exit;
  if (pID > CurrLevel.Enemies.Count -1) then exit;

  result := True;
end;

function TMegamanROM.ValidateSpecObj(pID : Integer) : Boolean;
begin
  result := False;

  if Assigned(CurrLevel.SpecObj) = False then exit;
  if CurrLevel.SpecObj.Count = 0 then exit;
  if (pID = -1) then exit;
  if (pID > CurrLevel.SpecObj.Count -1) then exit;

  result := True;
end;

procedure TMegamanROM.EditTSA(pTileID,pX,pY,pNewTile : Byte);
var
  TempSolidity : Byte;
  TileOffset : Integer;
begin
  TileOffset := Levels[CurrentLevel].TSAOffset  + (pTileID * 4) + (pX * 2) + pY;
  TempSolidity := ROM[TileOffset] and $C0;
  ROM[TileOffset] := pNewTile + TempSolidity;
  DrawLevelTile(pTileID);
end;

procedure TMegamanROM.IncrementTileAttributes(pTileID,pX,pY : Byte);
var
  TilePal : Array [0..1,0..1] Of Byte;
begin
  TilePal[0,0] := (ROM[Levels[CurrentLevel].AttributeOffset  +pTileID]) and 3;
  tilepal[1,0] := (ROM[Levels[CurrentLevel].AttributeOffset + pTileID] shr 2) and 3;
  tilepal[0,1] := (ROM[Levels[CurrentLevel].AttributeOffset + pTileID] shr 4) and 3;
  tilepal[1,1] := (ROM[Levels[CurrentLevel].AttributeOffset + pTileID] shr 6) and 3;

  if tilepal[pX,pY] = 3 then
    tilepal[pX,pY] := 0
  else
    inc(tilepal[pX,pY]);


  ROM[Levels[CurrentLevel].AttributeOffset + pTileID] := ((TilePal[0,0] and 3)) + ((TilePal[1,0] and 3) shl 2) +
    ((TilePal[0,1] and 3) shl 4) + ((TilePal[1,1] and 3) shl 6);
  DrawLevelTile(pTileID);
end;

procedure TMegamanROM.IncrementTileSolidity(pTileID,pX,pY : Byte);
var
  TempSolidity : Byte;
  TempTile : Byte;
  TileOffset : Integer;
begin
  TileOffset := Levels[CurrentLevel].TSAOffset  + (pTileID * 4) + (pX * 2) + pY;
  TempSolidity := (ROM[TileOffset] and $C0) shr 6;
  TempTile := ROM[TileOffset] and $3F;

  if TempSolidity = 3 then
    TempSolidity := 0
  else
    inc(TempSolidity);

  ROM[TileOffset] := TempTile + (TempSolidity shl 6);
end;

function TMegamanROM.Export8x8Pat(pID: Integer) : T16x16Graphic;
var
  i,c,x,y : Integer;
  curBit, curBit2 : Char;
  TempBin1,TempBin2, TempBin3 : String;
  Tile1 : Array [0..15] of Byte;
  p8x8 : T16x16Graphic;
begin
  for i := 0 to 1 do
  begin
    for c := 0 to 1 do
    begin
      For y := 0 To 15 do
        Tile1[y] := self._PatternTable[(pID * 64) + (i * 32) + (c *16) +y];

      for y := 0 to 7 do
      begin
        TempBin1 := ROM.ByteToBin(Tile1[y]);
        TempBin2 := ROM.ByteToBin(Tile1[y + 8]);
        for x := 0  to 7 do
        begin
          CurBit := TempBin1[x + 1];
          CurBit2 := TempBin2[x + 1];
          TempBin3 := CurBit + CurBit2;

          if TempBin3 = '00' Then
            p8x8.Pixels[y + (c *8),x + (i *8)] := 0
          else if TempBin3 = '10' Then
            p8x8.Pixels[y + (c *8),x + (i *8)] := 1
          else if TempBin3 = '01' Then
            p8x8.Pixels[y + (c *8),x + (i *8)] := 2
          else if TempBin3 = '11' Then
            p8x8.Pixels[y + (c *8),x + (i *8)] := 3;
        end;
      end; // end of y

    end; // end of c
  end; // end of i

  result := p8x8;
end;


procedure TMegamanROM.Import8x8Pat(pID: Integer; p16x16: T16x16Graphic);
var
  c,i,x,y : Integer;
  TempBin1, TempBin2 : String;
begin
  for c := 0 to 1 do
  begin
    for i := 0 to 1 do
    begin
      for y := 0 to 7 do
      begin
        for x := 0  to 7 do
        begin
          TempBin1 := IntToStr(p16x16.Pixels[y + (c*8),x + (i*8)] and 1) + TempBin1;
          TempBin2 := IntToStr(p16x16.Pixels[y + (c*8),x + (i*8)] shr 1) + TempBin2;
        end;

        self._PatternTable[(pID * 64) + (i * 32) + (c *16) +y] := ROM.BinToByte(TempBin1);
        self._PatternTable[(pID * 64) + (i * 32) + (c *16) +y + 8] := ROM.BinToByte(TempBin2);
    //    showmessage(TempBin2);
      end;//end of y
    end; // end of i
  end; // end of c

end;

function TMegamanROM.ReturnColor32NESPal(pElement: Integer): TColor32;
begin
  result := ROM.NESPal[pElement];
end;

procedure TMegamanROM.DrawScrollData(var pBitmap : TBitmap32; pScrollStart, pScrollChk1, pScrollChk2 : Byte);
var
  pos, roomamount, direction,x,y,i, size : Integer;
  Scr1Drew, Scr2Drew : Boolean;
//  WidthHeight : TWidthHeight;
begin
  pos := pScrollStart;
  x := 100;
  y := 210;
  size := 10;
  Scr1Drew := False;
  Scr2Drew := False;
//  WidthHeight := WorkOutSizeOfScrollGraphic(pos);


  while (CurrLevel.ScrollData[pos] <> $00) and (pos < CurrLevel.ScrollData.Count) do
  begin
    if CurrLevel.ScrollData[pos] = $FF then break;
    RoomAmount := (CurrLevel.ScrollData[pos] and $1F) + 1;
    direction := (CurrLevel.ScrollData[pos] and $E0);

    for i := 0 to RoomAmount -1 do
    begin

      pBitmap.FillRect(x,y,x+size,y+size,clFuchsia32);
      pBitmap.FrameRectS(x,y,x+size,y+size,clWhite32);

      if (direction and $20 = $20) and (i = RoomAmount -1) then
      begin
        pBitmap.FillRect(x,y,x+size,y+size,clBlue32);
        pBitmap.FrameRectS(x,y,x+size,y+size,clWhite32);
      end;
      if (pos = pScrollChk1) and (Scr1Drew = false) then
      begin
        pBitmap.FillRect(x,y,x+size,y+size,clGreen32);
        pBitmap.FrameRectS(x,y,x+size,y+size,clWhite32);
        Scr1Drew := True;
      end;
      if (pos = pScrollChk2) and (Scr2Drew = false) then
      begin
        pBitmap.FillRect(x,y,x+size,y+size,clYellow32);
        pBitmap.FrameRectS(x,y,x+size,y+size,clWhite32);
        Scr2Drew := True;
      end;

      inc(x,size);

    end;

    if (direction and $80 = $80) then
    begin

      dec(y,size);
      dec(x,size);
    end
    else if (direction and $40 = $40) then
    begin
      inc(y,size);
      dec(x,size);
    end;
    inc(pos);

  end;
  pBitmap.FillRect(x,y,x+size,y+size,clRed32);
  pBitmap.FrameRectS(x,y,x+size,y+size,clWhite32);

//  pBitmap.SaveToFile(ExtractFileDir(Application.Exename) + '\' + Currlevel.Name + '.bmp'); 

//  showmessage('Height: ' + IntToStr(Widthheight.Height) + ' Width: ' + IntToStr(Widthheight.Width));
end;

procedure TMegamanROM.LoadScrollData();
var
  pos,i : Integer;
begin
  if Assigned(CurrLevel.ScrollData) = True then
    FreeAndNil(CurrLevel.ScrollData);

  CurrLevel.ScrollData := TByteList.Create($2f);

  pos := CurrLevel.ScrollOffset;

  for i := 0 to $2e do
    CurrLevel.ScrollData[i] := ROM[pos + i];
  CurrLevel.WorkOutLevelLength;
end;

procedure TMegamanROM.SaveScrollData();
var
  i : Integer;
begin
  for i := 0 to CurrLevel.ScrollData.Count - 1 do
    ROM[CurrLevel.ScrollOffset + i] := CurrLevel.ScrollData[i];
  CurrLevel.WorkOutLevelLength;

end;

procedure TMegamanROM.SaveRoomOrder;
var
  i : Integer;
begin
  for i := 0 to self.RoomOrder.Count - 1 do
    ROM[i + CurrLevel.RoomOrderOffset] := RoomOrder[i];
end;

function TMegamanROM.AddEnemy(pScreenID : Byte): Boolean;
var
  Enemy : TEnemy;
begin
  result := True;
  if RetrieveTotalEnemies() >= MaximumNumOfEnemies then
  begin
    result := false;
    exit;
  end;

  CurrLevel.Enemies.Add(TEnemy.Create);
  Enemy := CurrLevel.Enemies.Last;
  Enemy.ScreenID := pScreenID;
  ROM.Changed := True;
end;

function TMegamanROM.RetrieveTotalEnemies : Integer;
var
  i, enemyamount : Integer;
begin
  enemyamount := 0;
  for i := 0 to Levels.Count -1 do
    enemyamount := enemyamount + Levels[i].Enemies.Count;
  result := enemyamount;
end;

procedure TMegamanROM.DeleteEnemy(pIndex : Integer);
begin
  CurrLevel.Enemies.Delete(pIndex);
  ROM.Changed := True;
end;

function TMegamanROM.AddSpecObj(pScreenID : Integer): Boolean;
var
  i : Integer;
  SpecObj : TSpecObj;
begin
  result := True;

  if CurrLevel.SpecObj.Count = _MaximumSpecObj then
  begin
    result := False;
    exit;
  end;

  CurrLevel.SpecObj.Add(TSpecObj.Create);
  SpecObj := CurrLevel.SpecObj.Last;
  SpecObj.X1 := pScreenID * 256;
  // Make the default ID a G-Block
  SpecObj.ID := $2;
  // Set the width and height
  SpecObj.Width := $20;
  SpecObj.Height := $20;
  SpecObj.X2 := SpecObj.X1 + SpecObj.Width;
  SpecObj.Y2 := SpecObj.Y1 + SpecObj.Width;

  ROM.Changed := True;
  if CurrLevel.SpecObj.Count > 1 then
  begin
    // Needs updated to sort special objects by screen. In descending order.
    for i := CurrLevel.SpecObj.Count -1 downto 1 do
    begin
      if CurrLevel.SpecObj[i].X1 < CurrLevel.SpecObj[i - 1].X1 then
        CurrLevel.SpecObj.Exchange(i,i-1);
    end;
  end;
end;

function TMegamanROM.ListPaletteData(pPalData : Pointer;pPalSize : Byte):string;
var
  temp : ^byte;
  i : Integer;
  Res : String;
begin

  temp := pPalData;

  Res := '';

  for i := 0 to pPalSize - 1 do
  begin
    Res := Res + '$' + IntToHex(temp^,2) + ' ';
    inc(temp);
  end;

  result := Trim(Res);

end;

procedure TMegamanROM.DrawPaletteData(var pBitmap : TBitmap32;pPalData : Pointer;pPalSize : Byte);
var
  temp : ^byte;
  i : Integer;
begin
  if pBitmap.Width < pPalSize * 25 then exit;

  temp := pPalData;

  for i := 0 to pPalSize - 1 do
  begin
    pBitmap.FillRect(i*25,0,(i * 25)+25,25, ROM.NESPal[temp^]);
    inc(temp);
  end;

end;

procedure TMegamanROM.DeleteSpecObj(pIndex : Integer);
begin
  CurrLevel.SpecObj.Delete(pIndex);
  ROM.Changed := True;
end;

procedure TMegamanROM.DeleteScrollData(pIndex : Integer);
begin
  CurrLevel.ScrollData.Delete(pIndex);
end;

function TMegamanROM.GetBeamDownUnderMouse(pX, pY : Integer) : Integer;
var
  RoomID : Integer;
begin
  result := -1;

  RoomID := pX div 256;
  // Check that we are on a beam down screen. (Avoid all the pointless
  // checking if we are)
  if (RoomID <> CurrLevel.Properties['ScreenStartCheck1'].Value) and (RoomID <> CurrLevel.Properties['ScreenStartCheck2'].Value) and (RoomID <> CurrLevel.Properties['ScreenStartCheck3'].Value) then
    exit;

  if (pX mod 256 >= 128) and (pX mod 256 <= 144) then
  begin
    // Now scan through all the checkpoints for this level.
    if RoomID = CurrLevel.Properties['ScreenStartCheck1'].Value then
    begin
      if (pY >= CurrLevel.Properties['BeamDown1'].Value) and (pY <= CurrLevel.Properties['BeamDown1'].Value + 16) then
        result := 0;
    end
    else if RoomID = CurrLevel.Properties['ScreenStartCheck2'].Value then
    begin
      if (pY >= CurrLevel.Properties['BeamDown2'].Value) and (pY <= CurrLevel.Properties['BeamDown2'].Value + 16) then
        result := 1;
    end
    else if RoomID = CurrLevel.Properties['ScreenStartCheck3'].Value then
    begin
      if (pY >= CurrLevel.Properties['BeamDown3'].Value) and (pY <= CurrLevel.Properties['BeamDown3'].Value + 16) then
        result := 2;
    end;
  end;
end;

function TMegamanROM.AddScrollData(pIndex : Integer) : Boolean;
var
  i,x,pos,othersize : Integer;
begin
  result := false;
  for i := 0 to Levels.Count - 1 do
  begin
    if i <> _CurrentLevel then
    begin
      if Levels[i].ScrollOffset = CurrLevel.ScrollOffset then
      begin
        // $2F
        pos := Levels[i].ScrollOffset + ROM[Levels[i].ScrollStartOffset];
        othersize := 0;
        while (ROM[pos] <> $00) do
        begin
          inc(othersize);
          inc(pos);
        end;
        inc(othersize);

        if CurrLevel.ScrollData.Count + othersize < $2F then
        begin
          CurrLevel.ScrollData.Count := CurrLevel.ScrollData.Count + 1;
          if pIndex > -1 then
          begin
            for x := CurrLevel.ScrollData.Count - 2 downto pIndex do
            begin
              CurrLevel.ScrollData[x + 1] := CurrLevel.ScrollData[x];
            end;
            CurrLevel.ScrollData[pIndex] := 00;
          end;

          result := true;
        end
        else
        begin
          result := false;
        end;
        break;
      end;
    end;
  end;

end;

procedure TMegamanROM.SortEnemyDataByX(pLevel : Integer);
var
  unsorted : boolean;
  i : integer;
begin
   repeat
     unsorted := true;
     for i := 0 to Levels[pLevel].Enemies.Count -2 do
     begin
       if (Levels[pLevel].Enemies[i].X > Levels[pLevel].Enemies[i + 1].X)
        and (Levels[pLevel].Enemies[i].ScreenID = Levels[pLevel].Enemies[i+1].ScreenID) then
       begin

         Levels[pLevel].Enemies.Exchange(i,i+1);
         unsorted := false;
       end;
     end;
   until unsorted;

end;

procedure TMegamanROM.SortEnemyData(pLevel : Integer);
var
  unsorted : boolean;
  i : integer;
begin
   repeat
     unsorted := true;
     for i := 0 to Levels[pLevel].Enemies.Count -2 do
     begin
       if Levels[pLevel].Enemies[i].ScreenID > Levels[pLevel].Enemies[i + 1].ScreenID then
       begin

         Levels[pLevel].Enemies.Exchange(i,i+1);
         unsorted := false;
       end;
     end;
   until unsorted;

end;

procedure TMegamanROM.SortSpecialObjectData(pLevel : Integer);
var
  unsorted : boolean;
  i : integer;
begin
   repeat
     unsorted := true;
     for i := 0 to Levels[pLevel].SpecObj.Count -2 do
     begin
       if Levels[pLevel].SpecObj[i].X1 > Levels[pLevel].SpecObj[i + 1].X1 then
       begin

         Levels[pLevel].SpecObj.Exchange(i,i+1);
         unsorted := false;
       end;
     end;
   until unsorted;

end;

function TMegamanROM.IsMegamanROM(): Boolean;
var
  Mapper,PRG,CHR : Integer;
  INI : TMemINIHexFile;
begin
  INI := TMemINIHexFile.Create(self.Datafile);
  try
    Mapper := INI.ReadInteger('Mapper','MapperNum',2);
    PRG := INI.ReadInteger('Mapper','PRGSize',8);
    CHR := INI.ReadInteger('Mapper','CHRSize',0);
    result := true;
    if ROM.ValidImage = False then
      result := false
    else if Mapper <> ROM.MapperNumber then
      result := false
    else if PRG <> ROM.PRGCount then
      result := false
    else if CHR <> ROM.CHRCount then
      result := false;
  finally
    freeandNil(INI);
  end;
end;

procedure TMegamanROM.RestoreDefaultiNESHeader;
var
  Mapper,PRG,CHR,Vertical : Integer;
  INI : TMemINIHexFile;
begin
  INI := TMemINIHexFile.Create(self.Datafile);
  try
    Mapper := INI.ReadInteger('Mapper','MapperNum',2);
    PRG := INI.ReadInteger('Mapper','PRGSize',8);
    CHR := INI.ReadInteger('Mapper','CHRSize',0);
    Vertical := INI.ReadInteger('Mapper','Vertical',1);
    ROM[0] := $4E;
    ROM[1] := $45;
    ROM[2] := $53;
    ROM[3] := $1A;
    ROM[4] := PRG;
    ROM[5] := CHR;
    ROM[6] := ((Mapper and $0F) Shl 4) + Vertical;
    ROM[7] := (Mapper and $F0);
    ROM[8] := $00;
    ROM[9] := $00;
    ROM[10] := $00;
    ROM[11] := $00;
    ROM[12] := $00;
    ROM[13] := $00;
    ROM[14] := $00;
    ROM[15] := $00;
  finally
    freeandNil(INI);
  end;

end;

function TMegamanROM.ReturnRoomIndex(pScrollByte : Integer): Integer;
var
  i : Integer;
  size : Integer;
begin

  if pScrollByte < CurrLevel.ScrollStart then
  begin
    result := -1;
    exit;
  end;
  // Returns the room order number of the specified scroll byte.
  size := 0;

//  for i := CurrLevel.ScrollStart to  pScrollByte -1 do
  for i := 0 to  pScrollByte -1 do
  begin
    Size := Size + ((CurrLevel.ScrollData[i] and $1F) +1);
  end;
  result := size;
end;

procedure TMegamanROM.DrawSpriteChangeTiles(pOffset : Integer;var pBitmap : TBitmap32);
var
  i : Integer;
begin
  for i := 0 to 15 do
    ROM.DrawNESTile(@ROM.RawROM[pOffset + (i * $10)],pBitmap,i*8,0,@Palette[4,0]);
end;

function TMegamanROM.GetSpriteChangeOffset(pSet : Byte;pIndex : Byte) : Integer;
var
  offset,res : Integer;
begin
  result := $0;
  if pIndex > 4 then exit;

//  offset :=CurrLevel.Properties['SpriteChangeData').Offset + ROM.RawROM[CurrLevel.Properties['SpriteChangePointers').Offset + self._Room];
  offset :=CurrLevel.Properties['SpriteChangeData'].Offset + pSet;
  res := StrToInt('$' + IntToHex((((ROM[Offset + pIndex] and $FC) shr 2) or $80),2) + '00');
  res := (res - $8000) + ((ROM[Offset + pIndex] and $03) * $4000);
  result := res + $10;

end;

function TMegamanROM.GetSpriteSet (pScreenID : Byte): Byte;
begin
  result := ROM[CurrLevel.Properties['SpriteChangePointers'].Offset + pScreenID];
end;

procedure TMegamanROM.SetSpriteSet(pSet : Byte; pScreenID : Byte);
begin
  ROM[CurrLevel.Properties['SpriteChangePointers'].Offset + pScreenID] := pSet;
end;

procedure TMegamanROM.SetSpriteChangeOffset(pSet,pIndex : Byte;pOffset : Integer);
var
  offset : Integer;
  BankNumber : Byte;
  upperbytes : Byte;
begin
  if pIndex > 4 then exit;

  if pOffset > $FFFF then
    exit;

  offset :=CurrLevel.Properties['SpriteChangeData'].Offset + pSet;
  // The bank number.
  BankNumber := pOffset div $4000;
  upperbytes := (((StrToInt('$' + IntToHex(pOffset,4)[1] + IntToHex(pOffset,4)[2]) - $80) shl 2) and $FC);

  ROM[offset + pIndex] := upperbytes + banknumber;

end;

function TMegamanROM.GetSpriteChangePal(pSet,pIndex : Byte) : Byte;
var
  offset : Integer;
begin
  offset :=CurrLevel.Properties['SpriteChangeData'].Offset + pSet;

  result := ROM[offset + pIndex + 5];
end;

procedure TMegamanROM.SetSpriteChangePal(pSet,pIndex,pNewPal : Byte);
var
  offset : Integer;
begin
  offset :=CurrLevel.Properties['SpriteChangeData'].Offset + pSet;

  ROM[offset + pIndex + 5] := pNewPal;

end;

procedure TMegamanROM.DrawNESColours(var pBitmap : TBitmap32);
begin
  ROM.DrawNESColours(pBitmap);
end;

procedure TMegamanROM.AddPatternTableSettings(pOffset,pSize : Integer);
begin
  CurrLevel.PatternTableSettings.Add(TPatternTableSettings.Create);
  CurrLevel.PatternTableSettings.Last.Offset := pOffset;
  CurrLevel.PatternTableSettings.Last.Size := pSize;
end;

function TMegamanROM.DetectObjectUnderMouse(pX, pY : Integer) : TObjDetect;
var
  Obj : TObjDetect;
begin
    Obj.ObjType := NONETYPE;
    Obj.ObjIndex := GetEnemyUnderMouse(pX,pY);
    if Obj.ObjIndex > -1 then
      Obj.ObjType := ENEMYTYPE;
    if Obj.ObjIndex = -1 then
    begin
      Obj.ObjIndex := GetSpecObjUnderMouse(pX, pY);
      if Obj.ObjIndex > -1 then
        Obj.ObjType := SPECOBJTYPE;
      if Obj.ObjIndex = -1 then
      begin
        Obj.ObjIndex := GetBeamDownUnderMouse(pX, pY);
          if Obj.ObjIndex > -1 then
            Obj.ObjType := BEAMDOWNTYPE;
      end;
    end;

    result := Obj;
end;

procedure TMegamanROM.SetSpecObjX(pX : Integer);
begin

end;

end.

