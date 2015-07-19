unit fPatEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DanHexEdit;

type
  TfrmPatEdit = class(TForm)
    lblOffset: TLabel;
    lblSize: TLabel;
    txtSize: TDanHexEdit;
    cbOffset: TComboBox;
    cmdOK: TButton;
    cmdCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private
    _Offset : Integer;
    _Size : Integer;
    { Private declarations }
  public
    property Offset : Integer read _Offset write _Offset;
    property Size : Integer read _Size write _Size;
    { Public declarations }
  end;

var
  frmPatEdit: TfrmPatEdit;

implementation

{$R *.dfm}

procedure TfrmPatEdit.FormShow(Sender: TObject);
var
  i : Integer;
begin

  cbOffset.Items.Clear;
  cbOffset.Items.BeginUpdate;
  for i := 0 to $FF do
    cbOffset.Items.Add(IntToHex((i * $100) + $10,4));
  cbOffset.ItemIndex := 0;
  cbOffset.Items.EndUpdate;

  cbOffset.ItemIndex := cbOffset.Items.IndexOf(IntToHex(_Offset,4));
  txtSize.Text := IntToHex(_Size,3);

end;

procedure TfrmPatEdit.cmdOKClick(Sender: TObject);
begin
  _offset := StrToInt('$' + cbOffset.Text);
  _size := StrToInt('$' + txtSize.Text);
end;

end.
