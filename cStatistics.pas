unit cStatistics;

interface

uses OffsetList, contnrs, SysUtils, iNESImage;

type
  TStatistic = class(T1ByteProperty)
  protected
    _MaximumValue : Byte;
    _List : String;
    function GetValue : Byte;override;
    procedure SetValue(pByte : Byte);override;
  public
    constructor Create(pROM : TiNESImage;pName : String;pOffset : Integer);
    property MaximumValue : Byte read _MaximumValue write _MaximumValue;
    property List : String read _List write _List;
  end;

  TStatisticList = class(TObjectList)
  private
    function Get1BytePropertyItem(Index: Integer) : TStatistic;
    procedure Set1BytePropertyItem(Index: Integer; const Value: TStatistic);
  public
    function Add(AT1ByteProperty : TStatistic) : Integer;
    property Items[Index: Integer] : TStatistic read Get1BytePropertyItem write Set1BytePropertyItem;default;
    function Last : TStatistic;
    function Find(pName : String) : TStatistic;
  end;

implementation

function TStatisticList.Get1BytePropertyItem(Index: Integer) : TStatistic;
begin
  Result := TStatistic(inherited Items[Index]);
end;

procedure TStatisticList.Set1BytePropertyItem(Index: Integer; const Value: TStatistic);
begin
  inherited Items[Index] := Value;
end;

function TStatisticList.Add(AT1ByteProperty : TStatistic) : Integer;
//var
//  TempByteProp : T1ByteProperty;
begin
{  TempByteProp := T1ByteProperty.Create(_iNESImage,pName,pOffset);

  result := inherited add(TempByteProp);
  TempByteProp := nil;}
  result := inherited add(AT1ByteProperty);

end;

function TStatisticList.Last : TStatistic;
begin
  result := TStatistic(inherited Last);
end;

function TStatisticList.Find(pName : String) : TStatistic;
var
  i : Integer;
begin
  result := nil;

  for i := 0 to self.Count -1 do
  begin
    if AnsiLowerCase(Items[i].Name) = AnsiLowerCase(pName) then
    begin
      result := Items[i];
      exit;
    end;
  end;

end;

{ TStatistic }

constructor TStatistic.Create(pROM : TiNESImage;pName : String;pOffset : Integer);
begin
  inherited Create(pName,pOffset);
  self._MaximumValue := $FF;
end;

function TStatistic.GetValue : Byte;
begin
  result := ROM[_Offset];
end;

procedure TStatistic.SetValue(pByte : Byte);
begin
  if pByte <= self._MaximumValue then
    ROM[_Offset] := pByte
  else
    ROM[_Offset] := self._MaximumValue;
end;

end.
