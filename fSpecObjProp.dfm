object frmSpecObjProp: TfrmSpecObjProp
  Left = 268
  Top = 291
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Special Objects Properties'
  ClientHeight = 141
  ClientWidth = 343
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
  object lblSpecialObjects: TLabel
    Left = 8
    Top = 8
    Width = 77
    Height = 13
    Caption = 'Special Objects:'
  end
  object lblScreenNumber: TLabel
    Left = 8
    Top = 80
    Width = 77
    Height = 13
    Caption = 'Screen Number:'
  end
  object lblWidth: TLabel
    Left = 8
    Top = 32
    Width = 32
    Height = 13
    Caption = 'Width:'
  end
  object lblHeight: TLabel
    Left = 8
    Top = 56
    Width = 35
    Height = 13
    Caption = 'Height:'
  end
  object cbSpecialObjects: TComboBox
    Left = 96
    Top = 8
    Width = 241
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = '00 - Pop Block'
    Items.Strings = (
      '00 - Pop Block'
      '01 - Right side of door'
      '02 - G-Block'
      '03 - Left side of door')
  end
  object cbScreens: TComboBox
    Left = 96
    Top = 80
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
  end
  object cmdCancel: TButton
    Left = 260
    Top = 110
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object cmdOK: TButton
    Left = 180
    Top = 110
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
    OnClick = cmdOKClick
  end
  object txtWidth: TDanHexEdit
    Left = 96
    Top = 32
    Width = 57
    Height = 21
    MaxLength = 2
    TabOrder = 4
    Text = '00'
  end
  object txtHeight: TDanHexEdit
    Left = 96
    Top = 56
    Width = 57
    Height = 21
    MaxLength = 2
    TabOrder = 5
    Text = '00'
  end
end
