unit cEnemy;

interface

uses Contnrs;

type
  TEnemy = class
  private
    _X : SmallInt;
    _Y : SmallInt;
    _ScreenID : Byte;
    _ID : Byte;
    _EnemyCheckPointStatus : Byte;
    procedure SetX(pX :SmallInt);
    procedure SetY(pY : SmallInt);
    procedure SetScreenX(pX : Integer);
    function GetScreenX : Integer;
  public
    property X : SmallInt read _X write SetX;
    property Y : SmallInt read _Y write SetY;
    property ScreenX : Integer read GetScreenX write SetScreenX;
    property ScreenID : Byte read _ScreenID write _ScreenID;
    property ID : Byte read _ID write _ID;
    property CheckPointStatus : Byte read _EnemyCheckPointStatus write _EnemyCheckPointStatus;
  end;

  TEnemyList = class(TObjectList)
  protected
    function GetEnemy(Index: Integer) : TEnemy;
    procedure SetEnemy(Index: Integer; const Value: TEnemy);
  public
    function Add(AObject: TEnemy) : Integer;
    property Items[Index: Integer] : TEnemy read GetEnemy write SetEnemy;default;
    function Last : TEnemy;
  end;

implementation

{ TEnemyList }

function TEnemyList.Add(AObject: TEnemy): Integer;
begin
  Result := inherited Add(AObject);
end;

function TEnemyList.GetEnemy(Index: Integer): TEnemy;
begin
  Result := TEnemy(inherited Items[Index]);
end;

procedure TEnemyList.SetEnemy(Index: Integer; const Value: TEnemy);
begin
  inherited Items[Index] := Value;
end;

function TEnemyList.Last : TEnemy;
begin
  result := TEnemy(inherited Last);
end;

{TEnemy}

procedure TEnemy.SetX(pX :SmallInt);
begin
  if pX > 247 then
    self._X := 247
  else
    self._X := pX;
end;
procedure TEnemy.SetY(pY : SmallInt);
begin


  if pY > 247 then
    self._Y := 247
  else
    self._Y := pY;

end;

procedure TEnemy.SetScreenX(pX : Integer);
begin
    _ScreenID := (pX div 256);
    _X := pX mod 256;
end;

// This function retrieves an X co-ordinate which is
// the number of screens times 256, plus the X co-ordinate.
function TEnemy.GetScreenX : Integer;
begin
  result := (self._ScreenID * 256) + _X;
end;

end.
