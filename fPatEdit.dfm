object frmPatEdit: TfrmPatEdit
  Left = 192
  Top = 110
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pattern Table Settings Edit'
  ClientHeight = 94
  ClientWidth = 249
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
  object lblOffset: TLabel
    Left = 8
    Top = 8
    Width = 35
    Height = 13
    Caption = 'Offset:'
  end
  object lblSize: TLabel
    Left = 8
    Top = 32
    Width = 23
    Height = 13
    Caption = 'Size:'
  end
  object txtSize: TDanHexEdit
    Left = 53
    Top = 32
    Width = 49
    Height = 21
    MaxLength = 4
    TabOrder = 0
    Text = '0000'
  end
  object cbOffset: TComboBox
    Left = 53
    Top = 8
    Width = 60
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
  end
  object cmdOK: TButton
    Left = 88
    Top = 64
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 168
    Top = 64
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 3
  end
end
