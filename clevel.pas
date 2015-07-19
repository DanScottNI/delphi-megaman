unit cLevel;

interface

uses contnrs, cenemy, sysutils, bytelist, cspecobj, OffsetList, cPatternTableSettings, ROMObj;

type
  TPPUSettings = record
    Offset : Integer;
    Size : Integer;
    PPUOffset : Integer;
  end;

  TLevel = class
  private
    _TSAOffset : Integer;
    _AttributeOffset : Integer;
    _RoomOrder : Integer;
    _RoomPointers : Integer;
    _LevelBGOffset : Integer;
    _PaletteOffset : Integer;
    _RoomAmount : Integer;
    _NumberOfTiles : Integer;
    _Name : String;
    _EnemyPointerOffset : Integer;
    _StartTSA : Integer;
    _ScrollOffset : Integer;
    _ScrollStartOffset : Integer;
    _WilyPPU : Boolean;
    _SpecObjOffset : Integer;
    procedure SetScrollStart(pData : Byte);
//    function GetRoomOrderStart : Byte;
//    procedure SetRoomOrderStart(pData : Byte);
    function GetScrollStart : Byte;
    procedure SetPalette(index1,index2 : Integer;pByte : Byte);
    function GetPalette(index1,index2 : Integer): byte;
    procedure SetCycleColours(index : Integer;pByte : Byte);
    function GetCycleColours(index : Integer): byte;
  public
    Properties : T1BytePropertyList;
    Enemies : TEnemyList;
    PPUSettings : Array of TPPUSettings;
    ScrollData : TByteList;
    SpecObj : TSpecObjList;
    PatternTableSettings : TPatternTableSettingsList;
    destructor Destroy;override;
    procedure WorkOutLevelLength;
    property TSAOffset : Integer read _TSAOffset write _TSAOffset;
    property AttributeOffset : Integer read _AttributeOffset write _AttributeOffset;
    property RoomOrderOffset : Integer read _RoomOrder write _RoomOrder;
    property RoomPointersOffset : Integer read _RoomPointers write _RoomPointers;
    property LevelBGOffset : Integer read _LevelBGOffset write _LevelBGOffset;
    property PaletteOffset : Integer read _PaletteOffset write _PaletteOffset;
    property RoomAmount : Integer read _RoomAmount write _RoomAmount;
    property NumberOfTiles : Integer read _NumberOfTiles write _NumberOfTiles;
    property Name : String read _Name write _Name;
    property EnemyPointerOffset : Integer read _EnemyPointerOffset write _EnemyPointerOffset;
    property StartTSAAt : Integer read _StartTSA write _StartTSA;
    property ScrollOffset : Integer read _ScrollOffset write _ScrollOffset;
//    property RoomOrderStartOffset : Integer read _RoomOrderStartOffset write _RoomOrderStartOffset;
//    property RoomOrderStart : Byte read GetRoomOrderStart write SetRoomOrderStart;
    property ScrollStart : byte read GetScrollStart write SetScrollStart;
    property ScrollStartOffset : Integer read _ScrollStartOffset write _ScrollStartOffset;
    property WilyPPU : Boolean read _WilyPPU write _WilyPPU;
    property SpecObjOffset : Integer read _SpecObjOffset write _SpecObjOffset;
    property PaletteAfter[index1,index2 : Integer] : byte read GetPalette write SetPalette;
    property CycleColours[index : Integer] : byte read GetCycleColours write SetCycleColours;
  end;

  { This is a class that will be used to store the
    levels. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TLevelList = class(TObjectList)
  protected
    _CurrentLevel : Integer;
    function GetCurrentLevel: Integer;
    procedure SetCurrentLevel(const Value: Integer);
    function GetLevelItem(Index: Integer) : TLevel;
    procedure SetLevelItem(Index: Integer; const Value: TLevel);
  public
    function Add(AObject: TLevel) : Integer;
    property Items[Index: Integer] : TLevel read GetLevelItem write SetLevelItem;default;
    function Last : TLevel;
//    property CurrentLevel : Integer read GetCurrentLevel write SetCurrentLevel;
  end;

implementation

{ TLevelList }

uses urom;

function TLevelList.Add(AObject: TLevel): Integer;
begin
  Result := inherited Add(AObject);
end;

function TLevelList.GetCurrentLevel: Integer;
begin
  result := self._CurrentLevel;
end;

function TLevelList.GetLevelItem(Index: Integer): TLevel;
begin
  Result := TLevel(inherited Items[Index]);
end;

procedure TLevelList.SetCurrentLevel(const Value: Integer);
begin
  self._CurrentLevel := Value;
end;

procedure TLevelList.SetLevelItem(Index: Integer; const Value: TLevel);
begin
  inherited Items[Index] := Value;
end;

function TLevelList.Last : TLevel;
begin
  result := TLevel(inherited Last);
end;

{ TLevel }

destructor TLevel.Destroy;
begin
  FreeAndNil(SpecObj);
  FreeAndNil(self.Enemies);
  FreeAndNil(ScrollData);
  FreeAndNil(properties);
  FreeAndNil(patterntablesettings);
  inherited;

end;

procedure TLevel.SetPalette(index1,index2 : Integer;pByte : Byte);
begin
  ROM[Properties['AfterDoorsPalette'].Offset + (index1 * 4) + index2] := pByte;
end;

function TLevel.GetPalette(index1,index2 : Integer): byte;
begin
  result := ROM[Properties['AfterDoorsPalette'].Offset + (index1 * 4) + index2];
end;

procedure TLevel.WorkOutLevelLength;
var
  pos : Integer;
begin
  pos := self._ScrollOffset + ROM[self._ScrollStartOffset];
  _RoomAmount := 0;

  while (ROM[pos] <> $00) do
  begin
    _RoomAmount := _RoomAmount + ((ROM[pos] and $1F) + 1);
    inc(pos);
  end;


end;

procedure TLevel.SetScrollStart(pData : Byte);
begin
  ROM[self._ScrollStartOffset] := pData;
end;

{function TLevel.GetRoomOrderStart : Byte;
begin
  result := ROM[self.RoomOrderStartOffset];
end;

procedure TLevel.SetRoomOrderStart(pData : Byte);
begin
  ROM[RoomOrderStartOffset] := pData;
end;}

function TLevel.GetScrollStart : Byte;
begin
  result := ROM[self.ScrollStartOffset];
end;

procedure TLevel.SetCycleColours(index : Integer;pByte : Byte);
begin
  ROM[Properties['ColourCycles'].Offset + index] := pByte;
end;

function TLevel.GetCycleColours(index : Integer): byte;
begin
  result := ROM[Properties['ColourCycles'].Offset + index];
end;

end.
