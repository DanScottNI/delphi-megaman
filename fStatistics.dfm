object frmStatistics: TfrmStatistics
  Left = 470
  Top = 251
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Statistics'
  ClientHeight = 341
  ClientWidth = 316
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
    000000000000FFFFFFF00FFFFF00FF000000FF000FF00FF0000000000FF000FF
    FF0000FFFF0000000FF000000FF0FF000FF0FF000FF00FFFFF000FFFFF000000
    0000000000000FFFFF0000FFF000FF000FF000FFF000FF000FF000FFF000FF00
    0FF000FFF000FF000FF000FFF000FF000FF00FFFF0000FFFFF0000FFF0000081
    FFFF0000FFFF1F38FFFF81C0FFFFC0C1FFFF3838FFFF0000FFFF8381FFFF81C3
    FFFF00C3FFFF18C3FFFF18C3FFFF18C3FFFF1883FFFF0083FFFF81C3FFFF}
  OldCreateOrder = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object vleStatistics: TValueListEditor
    Left = 8
    Top = 8
    Width = 306
    Height = 300
    TabOrder = 0
  end
  object cmdOK: TButton
    Left = 160
    Top = 312
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 240
    Top = 312
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
