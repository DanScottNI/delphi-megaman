object frmHex: TfrmHex
  Left = 102
  Top = 173
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Enter a hexadecimal value'
  ClientHeight = 73
  ClientWidth = 239
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblDescription: TLabel
    Left = 8
    Top = 8
    Width = 130
    Height = 13
    Caption = 'Enter a hexadecimal value:'
  end
  object txtHexEntry: TDanHexEdit
    Left = 152
    Top = 8
    Width = 81
    Height = 21
    MaxLength = 2
    TabOrder = 0
    Text = '00'
  end
  object cmdOK: TButton
    Left = 80
    Top = 40
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 160
    Top = 40
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
