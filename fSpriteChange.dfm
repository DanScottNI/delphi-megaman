object frmSpriteChange: TfrmSpriteChange
  Left = 387
  Top = 272
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sprite Change Data'
  ClientHeight = 335
  ClientWidth = 367
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
  object lbl80: TLabel
    Left = 8
    Top = 40
    Width = 22
    Height = 13
    Caption = '$80:'
  end
  object lbl90: TLabel
    Left = 8
    Top = 64
    Width = 22
    Height = 13
    Caption = '$90:'
  end
  object lblA0: TLabel
    Left = 8
    Top = 88
    Width = 23
    Height = 13
    Caption = '$A0:'
  end
  object lblBO: TLabel
    Left = 8
    Top = 112
    Width = 22
    Height = 13
    Caption = '$B0:'
  end
  object lblC0: TLabel
    Left = 8
    Top = 136
    Width = 23
    Height = 13
    Caption = '$C0:'
  end
  object lblSpritePalette3: TLabel
    Left = 8
    Top = 272
    Width = 78
    Height = 13
    Caption = 'Sprite Palette 3:'
  end
  object lblSpritePalette4: TLabel
    Left = 184
    Top = 272
    Width = 78
    Height = 13
    Caption = 'Sprite Palette 4:'
  end
  object lblSpriteChangeSet: TLabel
    Left = 8
    Top = 8
    Width = 91
    Height = 13
    Caption = 'Sprite Change Set:'
  end
  object lbl000F: TLabel
    Left = 301
    Top = 169
    Width = 34
    Height = 13
    Caption = '00 - 0F'
  end
  object lbl101F: TLabel
    Left = 301
    Top = 187
    Width = 34
    Height = 13
    Caption = '10 - 1F'
  end
  object lbl202F: TLabel
    Left = 301
    Top = 205
    Width = 34
    Height = 13
    Caption = '20 - 2F'
  end
  object lbl303F: TLabel
    Left = 301
    Top = 223
    Width = 34
    Height = 13
    Caption = '30 - 3F'
  end
  object lblCurrentPalette: TLabel
    Left = 8
    Top = 248
    Width = 159
    Height = 13
    Caption = 'Palette Colour Under Mouse: $00'
  end
  object lblRoom: TLabel
    Left = 192
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Room:'
  end
  object imgSprPal3: TImage32
    Left = 96
    Top = 272
    Width = 75
    Height = 25
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    ParentShowHint = False
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    ShowHint = True
    TabOrder = 0
    OnMouseUp = imgSprPal3MouseUp
  end
  object imgSprPal4: TImage32
    Left = 272
    Top = 272
    Width = 75
    Height = 25
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    ParentShowHint = False
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    ShowHint = True
    TabOrder = 1
    OnMouseUp = imgSprPal4MouseUp
  end
  object cmdOK: TButton
    Left = 208
    Top = 304
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 288
    Top = 304
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object img80: TImage32
    Left = 104
    Top = 40
    Width = 256
    Height = 16
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 4
  end
  object img90: TImage32
    Left = 104
    Top = 56
    Width = 256
    Height = 16
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 5
  end
  object imgA0: TImage32
    Left = 104
    Top = 72
    Width = 256
    Height = 16
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 6
  end
  object imgB0: TImage32
    Left = 104
    Top = 88
    Width = 256
    Height = 16
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 7
  end
  object imgC0: TImage32
    Left = 104
    Top = 104
    Width = 256
    Height = 16
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 8
  end
  object cb80: TComboBox
    Left = 40
    Top = 40
    Width = 60
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 9
    OnChange = cb80Change
  end
  object cb90: TComboBox
    Left = 40
    Top = 64
    Width = 60
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 10
    OnChange = cb80Change
  end
  object cbA0: TComboBox
    Left = 40
    Top = 88
    Width = 60
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 11
    OnChange = cb80Change
  end
  object cbB0: TComboBox
    Left = 40
    Top = 112
    Width = 60
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 12
    OnChange = cb80Change
  end
  object cbC0: TComboBox
    Left = 40
    Top = 136
    Width = 60
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 13
    OnChange = cb80Change
  end
  object txtSpriteChangeSet: TSpinEdit
    Left = 104
    Top = 8
    Width = 81
    Height = 22
    MaxValue = 8
    MinValue = 0
    TabOrder = 14
    Value = 0
    OnChange = txtSpriteChangeSetChange
  end
  object imgNESColours: TImage32
    Left = 8
    Top = 168
    Width = 286
    Height = 73
    Bitmap.ResamplerClassName = 'TNearestResampler'
    BitmapAlign = baTopLeft
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    TabOrder = 15
    OnMouseDown = imgNESColoursMouseDown
    OnMouseMove = imgNESColoursMouseMove
  end
  object cbRoom: TComboBox
    Left = 232
    Top = 8
    Width = 97
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 16
  end
end
