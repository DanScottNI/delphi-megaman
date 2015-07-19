unit cSound;

interface

uses Contnrs, ROMObj;

type
  TSoundEffect = class
  private
    _Name : String;
    _Offset : Integer;
    _Index : Integer;
    function GetSEIndex() : Byte;
    procedure SetSEIndex(pIndex : Byte);
  public
    property Name : String read _Name write _Name;
    property Offset : Integer read _Offset write _Offset;
    property SEIndex : Byte read GetSEIndex write SetSEIndex;
    property Index : Integer read _Index write _Index;
  end;

  TSoundEffectList = class(TObjectList)
  protected
    function GetSEItem(Index: Integer) : TSoundEffect;
    procedure SetSEItem(Index: Integer; const Value: TSoundEffect);
  public
    function Add(AObject: TSoundEffect) : Integer;
    property Items[Index: Integer] : TSoundEffect read GetSEItem write SetSEItem;default;
    function Last : TSoundEffect;
  end;

implementation

uses uROM;

function TSoundEffectList.Add(AObject: TSoundEffect): Integer;
begin
  Result := inherited Add(AObject);
end;

function TSoundEffectList.GetSEItem(Index: Integer): TSoundEffect;
begin
  Result := TSoundEffect(inherited Items[Index]);
end;

procedure TSoundEffectList.SetSEItem(Index: Integer; const Value: TSoundEffect);
begin
  inherited Items[Index] := Value;
end;

function TSoundEffectList.Last : TSoundEffect;
begin
  result := TSoundEffect(inherited Last);
end;

function TSoundEffect.GetSEIndex() : Byte;
begin
  result := ROM[self._Offset];
end;

procedure TSoundEffect.SetSEIndex(pIndex : Byte);
begin
  ROM[self._Offset] := pIndex;
end;

end.
