unit cEnemyStatistics;

interface

uses contnrs;

  type
    TEnemyStatistic = class
    private
      _PWeaponDamage : Byte;
      _CWeaponDamage : Byte;
      _IWeaponDamage : Byte;
      _BWeaponDamage : Byte;
      _FWeaponDamage : Byte;
      _EWeaponDamage : Byte;
      _GWeaponDamage : Byte;
      _PlayerDamage : Byte;
      _Score : Byte;
    public
      property PWeaponDamage : Byte read _PWeaponDamage write _PWeaponDamage;
      property CWeaponDamage : Byte read _CWeaponDamage write _CWeaponDamage;
      property IWeaponDamage : Byte read _IWeaponDamage write _IWeaponDamage;
      property BWeaponDamage : Byte read _BWeaponDamage write _BWeaponDamage;
      property FWeaponDamage : Byte read _FWeaponDamage write _FWeaponDamage;
      property EWeaponDamage : Byte read _EWeaponDamage write _EWeaponDamage;
      property GWeaponDamage : Byte read _GWeaponDamage write _GWeaponDamage;
      property PlayerDamage : Byte read _PlayerDamage write _PlayerDamage;
      property Score : Byte read _Score write _Score;
    end;


  TEnemyStatisticList = class(TObjectList)
  protected
    function GetItem(Index: Integer) : TEnemyStatistic;
    procedure SetItem(Index: Integer; const Value: TEnemyStatistic);
  public
    function Add(AObject: TEnemyStatistic) : Integer;
    property Items[Index: Integer] : TEnemyStatistic read GetItem write SetItem;default;
    function Last : TEnemyStatistic;
  end;

implementation

{ TEnemyStatisticList }

function TEnemyStatisticList.Add(AObject: TEnemyStatistic): Integer;
begin
  Result := inherited Add(AObject);
end;

function TEnemyStatisticList.GetItem(Index: Integer): TEnemyStatistic;
begin
  Result := TEnemyStatistic(inherited Items[Index]);
end;

procedure TEnemyStatisticList.SetItem(Index: Integer; const Value: TEnemyStatistic);
begin
  inherited Items[Index] := Value;
end;

function TEnemyStatisticList.Last : TEnemyStatistic;
begin
  result := TEnemyStatistic(inherited Last);
end;


end.
