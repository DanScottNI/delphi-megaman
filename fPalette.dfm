object frmPalette: TfrmPalette
  Left = 333
  Top = 243
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Palette Editor'
  ClientHeight = 343
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000010000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    000000000000000000000000000000000000000000000555011104440EE00555
    011104440EE000000000000000000000022206660DD00000022206660DD00000
    022206660DD000000000000000000FFF09990CCC0BB00FFF09990CCC0BB00FFF
    09990CCC0BB0000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
    FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFFFFFFFFFF}
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl000F: TLabel
    Left = 368
    Top = 9
    Width = 34
    Height = 13
    Caption = '00 - 0F'
  end
  object lbl101F: TLabel
    Left = 368
    Top = 27
    Width = 34
    Height = 13
    Caption = '10 - 1F'
  end
  object lbl202F: TLabel
    Left = 368
    Top = 45
    Width = 34
    Height = 13
    Caption = '20 - 2F'
  end
  object lbl303F: TLabel
    Left = 368
    Top = 63
    Width = 34
    Height = 13
    Caption = '30 - 3F'
  end
  object lblCurrentPalette: TLabel
    Left = 80
    Top = 88
    Width = 159
    Height = 13
    Caption = 'Palette Colour Under Mouse: $00'
  end
  object imgNESColours: TImage32
    Left = 80
    Top = 8
    Width = 286
    Height = 73
    BitmapAlign = baTopLeft
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    TabOrder = 0
    OnMouseDown = imgNESColoursMouseDown
    OnMouseMove = imgNESColoursMouseMove
  end
  object pgcPalette: TPageControl
    Left = 8
    Top = 112
    Width = 433
    Height = 193
    ActivePage = tshCurrentLevel
    TabOrder = 1
    object tshCurrentLevel: TTabSheet
      Caption = 'Current Level'
      object lblBeforeDoors: TLabel
        Left = 8
        Top = 8
        Width = 67
        Height = 13
        Caption = 'Before Doors:'
      end
      object lblAfterDoors: TLabel
        Left = 8
        Top = 88
        Width = 60
        Height = 13
        Caption = 'After Doors:'
      end
      object imgLevelBG1: TImage32
        Left = 8
        Top = 24
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 0
        OnMouseDown = imgLevelBG1MouseDown
      end
      object imgLevelBG2: TImage32
        Left = 112
        Top = 24
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 1
        OnMouseDown = imgLevelBG2MouseDown
      end
      object imgLevelBG3: TImage32
        Left = 216
        Top = 24
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 2
        OnMouseDown = imgLevelBG3MouseDown
      end
      object imgLevelBG4: TImage32
        Left = 320
        Top = 24
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 3
        OnMouseDown = imgLevelBG4MouseDown
      end
      object imgLevelSpr1: TImage32
        Left = 8
        Top = 56
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 4
        OnMouseDown = imgLevelSpr1MouseDown
      end
      object imgLevelSpr2: TImage32
        Left = 112
        Top = 56
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 5
        OnMouseDown = imgLevelSpr2MouseDown
      end
      object imgLevelSpr3: TImage32
        Left = 216
        Top = 56
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 6
        OnMouseDown = imgLevelSpr3MouseDown
      end
      object imgLevelSpr4: TImage32
        Left = 320
        Top = 56
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 7
        OnMouseDown = imgLevelSpr4MouseDown
      end
      object imgLevelBG1After: TImage32
        Left = 8
        Top = 104
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 8
        OnMouseDown = imgLevelBG1AfterMouseDown
      end
      object imgLevelBG2After: TImage32
        Left = 112
        Top = 104
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 9
        OnMouseDown = imgLevelBG2AfterMouseDown
      end
      object imgLevelBG3After: TImage32
        Left = 216
        Top = 104
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 10
        OnMouseDown = imgLevelBG3AfterMouseDown
      end
      object imgLevelBG4After: TImage32
        Left = 320
        Top = 104
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 11
        OnMouseDown = imgLevelBG4AfterMouseDown
      end
      object cmdAfterDoors: TButton
        Left = 240
        Top = 136
        Width = 179
        Height = 25
        Hint = 
          'Clicking this button will match the before doors BG '#13#10'palette wi' +
          'th the after doors BG palette. It copies'#13#10'the before doors BG pa' +
          'lette to the after doors BG palette.'
        Caption = 'Match Before and After Palettes'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        OnClick = cmdAfterDoorsClick
      end
    end
    object tshWeaponColours: TTabSheet
      Caption = 'Weapon Colours'
      ImageIndex = 1
      object lblNormal: TLabel
        Left = 64
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Normal'
      end
      object lblCuts: TLabel
        Left = 64
        Top = 40
        Width = 22
        Height = 13
        Caption = 'Cuts'
      end
      object lblIce: TLabel
        Left = 64
        Top = 72
        Width = 15
        Height = 13
        Caption = 'Ice'
      end
      object lblBomb: TLabel
        Left = 64
        Top = 104
        Width = 26
        Height = 13
        Caption = 'Bomb'
      end
      object lblM: TLabel
        Left = 184
        Top = 72
        Width = 8
        Height = 13
        Caption = 'M'
      end
      object lblGuts: TLabel
        Left = 184
        Top = 40
        Width = 22
        Height = 13
        Caption = 'Guts'
      end
      object lblElec: TLabel
        Left = 184
        Top = 8
        Width = 19
        Height = 13
        Caption = 'Elec'
      end
      object lblFire: TLabel
        Left = 64
        Top = 136
        Width = 18
        Height = 13
        Caption = 'Fire'
      end
      object lblAfterDeath: TLabel
        Left = 184
        Top = 104
        Width = 57
        Height = 13
        Caption = 'After Death'
      end
      object imgWeaponNormal: TImage32
        Left = 8
        Top = 8
        Width = 50
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 0
        OnMouseDown = imgWeaponNormalMouseDown
      end
      object imgWeaponCuts: TImage32
        Left = 8
        Top = 40
        Width = 50
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 1
        OnMouseDown = imgWeaponCutsMouseDown
      end
      object imgWeaponIce: TImage32
        Left = 8
        Top = 72
        Width = 50
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 2
        OnMouseDown = imgWeaponIceMouseDown
      end
      object imgWeaponBomb: TImage32
        Left = 8
        Top = 104
        Width = 50
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 3
        OnMouseDown = imgWeaponBombMouseDown
      end
      object imgWeaponFire: TImage32
        Left = 8
        Top = 136
        Width = 50
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 4
        OnMouseDown = imgWeaponFireMouseDown
      end
      object imgWeaponElec: TImage32
        Left = 128
        Top = 8
        Width = 50
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 5
        OnMouseDown = imgWeaponElecMouseDown
      end
      object imgWeaponGuts: TImage32
        Left = 128
        Top = 40
        Width = 50
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 6
        OnMouseDown = imgWeaponGutsMouseDown
      end
      object imgWeaponM: TImage32
        Left = 128
        Top = 72
        Width = 50
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 7
        OnMouseDown = imgWeaponMMouseDown
      end
      object imgAfterDeath: TImage32
        Left = 128
        Top = 104
        Width = 50
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 8
        OnMouseDown = imgAfterDeathMouseDown
      end
      object cmdMatchMegamanPalettes: TButton
        Left = 264
        Top = 8
        Width = 153
        Height = 25
        Hint = 
          'Clicking this will set the weapon colour, and after death palett' +
          'es of Mega Man'#13#10'to match the one in the current level.'
        Caption = 'Match Megaman Palettes'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnClick = cmdMatchMegamanPalettesClick
      end
    end
    object tshCycles: TTabSheet
      Caption = 'Colour Cycles'
      ImageIndex = 2
      object lblDescription: TLabel
        Left = 8
        Top = 8
        Width = 404
        Height = 26
        Caption = 
          'These colours are cycled in to the two middle colours of the las' +
          't background palette.'#13#10'(Left to right order)'
      end
      object imgCycleColours: TImage32
        Left = 8
        Top = 40
        Width = 75
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 0
      end
    end
  end
  object cmdOK: TButton
    Left = 286
    Top = 312
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 366
    Top = 312
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 3
  end
end
