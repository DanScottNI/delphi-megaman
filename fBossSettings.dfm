object frmBossSettings: TfrmBossSettings
  Left = 229
  Top = 110
  BorderStyle = bsSingle
  Caption = 'Boss Settings'
  ClientHeight = 224
  ClientWidth = 390
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pgcBossSettings: TPageControl
    Left = 8
    Top = 8
    Width = 377
    Height = 177
    ActivePage = tshWeaponDamage
    TabOrder = 0
    object tshWeaponDamage: TTabSheet
      Caption = 'Weapon Damage'
      object lblIceman: TLabel
        Left = 8
        Top = 80
        Width = 39
        Height = 13
        Caption = 'Iceman:'
      end
      object lblCutman: TLabel
        Left = 8
        Top = 8
        Width = 41
        Height = 13
        Caption = 'Cutman:'
      end
      object lblFireman: TLabel
        Left = 8
        Top = 104
        Width = 42
        Height = 13
        Caption = 'Fireman:'
      end
      object lblElecman: TLabel
        Left = 8
        Top = 128
        Width = 43
        Height = 13
        Caption = 'Elecman:'
      end
      object lblGutsman: TLabel
        Left = 8
        Top = 56
        Width = 46
        Height = 13
        Caption = 'Gutsman:'
      end
      object lblBombman: TLabel
        Left = 8
        Top = 32
        Width = 50
        Height = 13
        Caption = 'Bombman:'
      end
    end
    object tshOtherSettings: TTabSheet
      Caption = 'Other Settings'
      ImageIndex = 1
    end
  end
  object cmdOK: TButton
    Left = 232
    Top = 192
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object cmdCancel: TButton
    Left = 312
    Top = 192
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
