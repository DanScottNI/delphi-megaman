object frmSimpleScrollEd: TfrmSimpleScrollEd
  Left = 306
  Top = 211
  BorderStyle = bsSingle
  Caption = 'Scroll Byte Editor'
  ClientHeight = 183
  ClientWidth = 269
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
  object lblScreens: TLabel
    Left = 152
    Top = 16
    Width = 42
    Height = 13
    Caption = 'Screens:'
  end
  object rdgScrollSettings: TRadioGroup
    Left = 8
    Top = 8
    Width = 137
    Height = 137
    Caption = 'Scroll Settings'
    ItemIndex = 0
    Items.Strings = (
      'Up'
      'Down'
      'Right'
      'Boss/End'
      'Nothing')
    TabOrder = 0
  end
  object cmdOK: TButton
    Left = 112
    Top = 152
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 192
    Top = 152
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object txtScreens: TSpinEdit
    Left = 200
    Top = 16
    Width = 49
    Height = 22
    MaxLength = 2
    MaxValue = 32
    MinValue = 1
    TabOrder = 3
    Value = 1
  end
end
