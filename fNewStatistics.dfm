object frmNStatistics: TfrmNStatistics
  Left = 192
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Statistics Editor'
  ClientHeight = 394
  ClientWidth = 469
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
  object lblStatisticsName: TLabel
    Left = 168
    Top = 8
    Width = 77
    Height = 13
    Caption = 'Statistics Name:'
  end
  object lblValue: TLabel
    Left = 168
    Top = 32
    Width = 30
    Height = 13
    Caption = 'Value:'
  end
  object txtValue: TDanHexEdit
    Left = 208
    Top = 32
    Width = 49
    Height = 21
    MaxLength = 2
    TabOrder = 0
    Text = '00'
  end
  object lstStatistics: TListBox
    Left = 8
    Top = 8
    Width = 153
    Height = 377
    ItemHeight = 13
    TabOrder = 1
    OnClick = lstStatisticsClick
  end
  object cbValue: TComboBox
    Left = 208
    Top = 32
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 2
  end
  object cmdOK: TButton
    Left = 304
    Top = 360
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 384
    Top = 360
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 4
  end
end
