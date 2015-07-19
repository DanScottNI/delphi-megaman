unit fBossSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfrmBossSettings = class(TForm)
    pgcBossSettings: TPageControl;
    tshWeaponDamage: TTabSheet;
    tshOtherSettings: TTabSheet;
    cmdOK: TButton;
    cmdCancel: TButton;
    lblIceman: TLabel;
    lblCutman: TLabel;
    lblFireman: TLabel;
    lblElecman: TLabel;
    lblGutsman: TLabel;
    lblBombman: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBossSettings: TfrmBossSettings;

implementation

{$R *.dfm}

end.
