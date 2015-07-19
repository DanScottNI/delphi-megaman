unit cSpecobj;

interface

uses contnrs;

type
  TSpecObj = class(TObject)
  private
    _ID : Byte;
    _X1 : SmallInt;
    _Y1 : SmallInt;
    _X2 : SmallInt;
    _Y2 : SmallInt;
    _Width : SmallInt;
    _Height : SmallInt;

  public
    property ID : Byte read _ID write _ID;
    property X1 : SmallInt read _X1 write _X1;
    property Y1 : SmallInt read _Y1 write _Y1;
    property X2 : SmallInt read _X2 write _X2;
    property Y2 : SmallInt read _Y2 write _Y2;
    property Width : SmallInt read _width write _width;
    property Height : SmallInt read _Height write _height;
  end;

  TSpecObjList = class(TObjectList)
  protected
    function GetSpecObj(Index: Integer) : TSpecObj;
    procedure SetSpecObj(Index: Integer; const Value: TSpecObj);
  public
    function Add(AObject: TSpecObj) : Integer;
    property Items[Index: Integer] : TSpecObj read GetSpecObj write SetSpecObj;default;
    function Last : TSpecObj;
  end;

implementation

{ TEnemyList }

function TSpecObjList.Add(AObject: TSpecObj): Integer;
begin
  Result := inherited Add(AObject);
end;

function TSpecObjList.GetSpecObj(Index: Integer): TSpecObj;
begin
  Result := TSpecObj(inherited Items[Index]);
end;

procedure TSpecObjList.SetSpecObj(Index: Integer; const Value: TSpecObj);
begin
  inherited Items[Index] := Value;
end;

function TSpecObjList.Last : TSpecObj;
begin
  result := TSpecObj(inherited Last);
end;

end.
