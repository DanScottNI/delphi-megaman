object frmLevelProperties: TfrmLevelProperties
  Left = 440
  Top = 241
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Level Properties'
  ClientHeight = 252
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000000000000680500001600000028000000100000002000
    0000010008000000000040010000000000000000000000000000000000000000
    0000DCEA04007CDAFC00FCFAFC00FC7A0400FCFEFC0000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000FFFFFF000000
    0000000000000000000000000000000000000000020202020000000000000000
    0000020200000000020200000000000000020200000000000002020000000000
    0002020202020202020202000000000300020300000303000003020003000003
    0003030000030300000303000300000300030303030000030303030003000003
    0000030300000000030300000300000004040404040101040404040400000000
    0404040404010104040404040000000004040404040000040404040400000000
    0004040404010104040404000000000000000404040101040404000000000000
    000000000001010000000000000000000000000000000000000000000000FFFF
    FFFFF00FFFFFE007FFFFC003FFFF8001FFFF0000FFFF0000FFFF0000FFFF0000
    FFFF8001FFFF8001FFFF8001FFFFC003FFFFE007FFFFF00FFFFFFE7FFFFF}
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcLevelProperties: TPageControl
    Left = 8
    Top = 8
    Width = 329
    Height = 201
    ActivePage = tshLevelSettings
    TabOrder = 0
    object tshLevelSettings: TTabSheet
      Caption = 'Level Settings'
      object lblTSASettings1: TLabel
        Left = 8
        Top = 40
        Width = 89
        Height = 13
        Caption = 'Solidity Settings 1:'
      end
      object lblTSASettings0: TLabel
        Left = 8
        Top = 16
        Width = 89
        Height = 13
        Caption = 'Solidity Settings 0:'
      end
      object lblTSASettings2: TLabel
        Left = 8
        Top = 64
        Width = 89
        Height = 13
        Caption = 'Solidity Settings 2:'
      end
      object lblTSASettings3: TLabel
        Left = 8
        Top = 88
        Width = 89
        Height = 13
        Caption = 'Solidity Settings 3:'
      end
      object lblMusic: TLabel
        Left = 8
        Top = 112
        Width = 30
        Height = 13
        Caption = 'Music:'
      end
      object lblDoorsFromScreen: TLabel
        Left = 8
        Top = 136
        Width = 87
        Height = 13
        Hint = 'The doors only work when you are on/past this screen'
        Caption = 'First Door Screen:'
        ParentShowHint = False
        ShowHint = True
      end
      object cbMusic: TComboBox
        Left = 128
        Top = 112
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
      object cbTSASettings0: TComboBox
        Left = 128
        Top = 16
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
      end
      object cbTSASettings1: TComboBox
        Left = 128
        Top = 40
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
      end
      object cbTSASettings2: TComboBox
        Left = 128
        Top = 64
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
      end
      object cbTSASettings3: TComboBox
        Left = 128
        Top = 88
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 4
      end
      object txtDoorsWorkFromScreen: TDanHexEdit
        Left = 128
        Top = 136
        Width = 41
        Height = 21
        TabOrder = 5
      end
    end
    object tshBossSettings: TTabSheet
      Caption = 'Boss Settings'
      ImageIndex = 1
      object lblProjectileDamage: TLabel
        Left = 6
        Top = 144
        Width = 90
        Height = 13
        Caption = 'Projectile Damage:'
      end
      object txtProjectileDamage: TDanHexEdit
        Left = 104
        Top = 144
        Width = 50
        Height = 21
        MaxLength = 2
        TabOrder = 0
        Text = '00'
      end
      object grpBossVulnerabilities: TGroupBox
        Left = 4
        Top = 8
        Width = 313
        Height = 129
        Caption = 'Boss Weapon Vulnerabilities:'
        TabOrder = 1
        object lblPBlaster: TLabel
          Left = 8
          Top = 24
          Width = 46
          Height = 13
          Caption = 'P Blaster:'
        end
        object lblBomb: TLabel
          Left = 163
          Top = 24
          Width = 30
          Height = 13
          Caption = 'Bomb:'
        end
        object lblFire: TLabel
          Left = 163
          Top = 48
          Width = 22
          Height = 13
          Caption = 'Fire:'
        end
        object lblElec: TLabel
          Left = 162
          Top = 72
          Width = 23
          Height = 13
          Caption = 'Elec:'
        end
        object lblCutman: TLabel
          Left = 8
          Top = 48
          Width = 21
          Height = 13
          Caption = 'Cut:'
        end
        object lblIce: TLabel
          Left = 8
          Top = 72
          Width = 19
          Height = 13
          Caption = 'Ice:'
        end
        object lblGuts: TLabel
          Left = 8
          Top = 96
          Width = 26
          Height = 13
          Caption = 'Guts:'
        end
        object txtPBlaster: TDanHexEdit
          Left = 95
          Top = 24
          Width = 50
          Height = 21
          MaxLength = 2
          TabOrder = 0
          Text = '00'
        end
        object txtBomb: TDanHexEdit
          Left = 255
          Top = 24
          Width = 50
          Height = 21
          MaxLength = 2
          TabOrder = 1
          Text = '00'
        end
        object txtFire: TDanHexEdit
          Left = 255
          Top = 48
          Width = 50
          Height = 21
          MaxLength = 2
          TabOrder = 2
          Text = '00'
        end
        object txtElec: TDanHexEdit
          Left = 255
          Top = 72
          Width = 50
          Height = 21
          MaxLength = 2
          TabOrder = 3
          Text = '00'
        end
        object txtIce: TDanHexEdit
          Left = 95
          Top = 72
          Width = 50
          Height = 21
          MaxLength = 2
          TabOrder = 4
          Text = '00'
        end
        object txtCut: TDanHexEdit
          Left = 95
          Top = 48
          Width = 50
          Height = 21
          MaxLength = 2
          TabOrder = 5
          Text = '00'
        end
        object txtGuts: TDanHexEdit
          Left = 95
          Top = 96
          Width = 50
          Height = 21
          MaxLength = 2
          TabOrder = 6
          Text = '00'
        end
      end
    end
  end
  object cmdCancel: TButton
    Left = 264
    Top = 216
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object cmdOK: TButton
    Left = 184
    Top = 216
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = cmdOKClick
  end
end
