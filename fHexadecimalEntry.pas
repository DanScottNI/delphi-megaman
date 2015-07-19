unit fHexadecimalEntry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DanHexEdit,cMegaROM, cConfiguration;

type
  TfrmHex = class(TForm)
    lblDescription: TLabel;
    txtHexEntry: TDanHexEdit;
    cmdOK: TButton;
    cmdCancel: TButton;
    procedure cmdOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    _Caption, _Description, _InitValue : String;
    _MaxLength, _ReturnValue : Integer;
    { Private declarations }
  public
    property Caption : String read _Caption write _Caption;
    property Description : String read _Description write _Description;
    property InitValue : String read _InitValue write _InitValue;
    property MaxLength : Integer read _MaxLength write _MaxLength;
    property ReturnValue : Integer read _ReturnValue write _ReturnValue;
    { Public declarations }
  end;

var
  frmHex: TfrmHex;

implementation

{$R *.dfm}

procedure TfrmHex.cmdOKClick(Sender: TObject);
begin
  ReturnValue := StrToInt('$' + txtHexEntry.Text);
end;

procedure TfrmHex.FormShow(Sender: TObject);
begin
  Caption := _Caption;
  lblDescription.Caption := _Description;
  txtHexEntry.MaxLength := _MaxLength;
  txtHexEntry.Text := _InitValue;
end;

procedure TfrmHex.FormCreate(Sender: TObject);
begin
  _Caption := 'Enter a hexadecimal value';
  _Description := 'Enter a hexadecimal value:';
  _InitValue := '00';
  _MaxLength := 2;
end;

end.
