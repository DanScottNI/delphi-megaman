unit cPatternTableSettings;

interface

uses contnrs;

type
  TPatternTableSettings = class
  private
    _Offset : Integer;
    _Size : Integer;
  public
    property Offset : Integer read _Offset write _Offset;
    property Size : Integer read _Size write _Size;
  end;

  TPatternTableSettingsList = class(TObjectList)
  protected
    function GetItem(Index: Integer) : TPatternTableSettings;
    procedure SetItem(Index: Integer; const Value: TPatternTableSettings);
  public
    function Add(AObject: TPatternTableSettings) : Integer;
    property Items[Index: Integer] : TPatternTableSettings read GetItem write SetItem;default;
    function Last : TPatternTableSettings;
  end;

implementation

{ TPatternTableSettingsList }

function TPatternTableSettingsList.Add(AObject: TPatternTableSettings): Integer;
begin
  Result := inherited Add(AObject);
end;

function TPatternTableSettingsList.GetItem(Index: Integer): TPatternTableSettings;
begin
  Result := TPatternTableSettings(inherited Items[Index]);
end;

procedure TPatternTableSettingsList.SetItem(Index: Integer; const Value: TPatternTableSettings);
begin
  inherited Items[Index] := Value;
end;

function TPatternTableSettingsList.Last : TPatternTableSettings;
begin
  result := TPatternTableSettings(inherited Last);
end;

end.
