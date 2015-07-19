object frmEnemyStatistics: TfrmEnemyStatistics
  Left = 458
  Top = 316
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Enemy Statistics'
  ClientHeight = 343
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblGlobalEnemyHealth: TLabel
    Left = 8
    Top = 32
    Width = 102
    Height = 13
    Caption = 'Global Enemy Health:'
  end
  object lblEnemy: TLabel
    Left = 8
    Top = 8
    Width = 36
    Height = 13
    Caption = 'Enemy:'
  end
  object cbEnemy: TComboBox
    Left = 120
    Top = 8
    Width = 201
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 0
    OnChange = cbEnemyChange
  end
  object txtGlobalHealth: TDanHexEdit
    Left = 120
    Top = 32
    Width = 50
    Height = 21
    MaxLength = 2
    TabOrder = 1
    Text = '00'
  end
  object grpIndividualEnemy: TGroupBox
    Left = 8
    Top = 56
    Width = 313
    Height = 249
    Caption = 'Enemy Statistics:'
    TabOrder = 2
    object lblPWeaponDamage: TLabel
      Left = 8
      Top = 24
      Width = 95
      Height = 13
      Caption = 'P Weapon Damage:'
    end
    object lblCWeaponDamage: TLabel
      Left = 8
      Top = 48
      Width = 96
      Height = 13
      Caption = 'C Weapon Damage:'
    end
    object lblIWeaponDamage: TLabel
      Left = 8
      Top = 72
      Width = 93
      Height = 13
      Caption = 'I Weapon Damage:'
    end
    object lblBWeaponDamage: TLabel
      Left = 8
      Top = 96
      Width = 95
      Height = 13
      Caption = 'B Weapon Damage:'
    end
    object lblFWeaponDamage: TLabel
      Left = 8
      Top = 120
      Width = 95
      Height = 13
      Caption = 'F Weapon Damage:'
    end
    object lblEWeaponDamage: TLabel
      Left = 8
      Top = 144
      Width = 95
      Height = 13
      Caption = 'E Weapon Damage:'
    end
    object lblGWeaponDamage: TLabel
      Left = 8
      Top = 168
      Width = 96
      Height = 13
      Caption = 'G Weapon Damage:'
    end
    object lblPlayerDamage: TLabel
      Left = 8
      Top = 192
      Width = 76
      Height = 13
      Caption = 'Player Damage:'
    end
    object lblScore: TLabel
      Left = 8
      Top = 216
      Width = 31
      Height = 13
      Caption = 'Score:'
    end
    object txtPWeaponDamage: TDanHexEdit
      Left = 112
      Top = 24
      Width = 50
      Height = 21
      MaxLength = 2
      TabOrder = 0
      Text = '00'
    end
    object txtCWeaponDamage: TDanHexEdit
      Left = 112
      Top = 48
      Width = 50
      Height = 21
      MaxLength = 2
      TabOrder = 1
      Text = '00'
    end
    object txtIWeaponDamage: TDanHexEdit
      Left = 112
      Top = 72
      Width = 50
      Height = 21
      MaxLength = 2
      TabOrder = 2
      Text = '00'
    end
    object txtBWeaponDamage: TDanHexEdit
      Left = 112
      Top = 96
      Width = 50
      Height = 21
      MaxLength = 2
      TabOrder = 3
      Text = '00'
    end
    object txtFWeaponDamage: TDanHexEdit
      Left = 112
      Top = 120
      Width = 50
      Height = 21
      MaxLength = 2
      TabOrder = 4
      Text = '00'
    end
    object txtEWeaponDamage: TDanHexEdit
      Left = 112
      Top = 144
      Width = 50
      Height = 21
      MaxLength = 2
      TabOrder = 5
      Text = '00'
    end
    object txtGWeaponDamage: TDanHexEdit
      Left = 112
      Top = 168
      Width = 50
      Height = 21
      MaxLength = 2
      TabOrder = 6
      Text = '00'
    end
    object txtPlayerDamage: TDanHexEdit
      Left = 112
      Top = 192
      Width = 50
      Height = 21
      MaxLength = 2
      TabOrder = 7
      Text = '00'
    end
    object txtScore: TDanHexEdit
      Left = 112
      Top = 216
      Width = 50
      Height = 21
      MaxLength = 2
      TabOrder = 8
      Text = '00'
    end
  end
  object cmdOK: TButton
    Left = 168
    Top = 312
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 248
    Top = 312
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 4
    OnClick = cmdCancelClick
  end
end
