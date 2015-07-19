object frmEnemyDebug: TfrmEnemyDebug
  Left = 401
  Top = 383
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Enemy Debug'
  ClientHeight = 161
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblScan: TLabel
    Left = 8
    Top = 8
    Width = 27
    Height = 13
    Caption = 'Scan:'
  end
  object txtScan: TDanHexEdit
    Left = 48
    Top = 8
    Width = 49
    Height = 21
    MaxLength = 2
    TabOrder = 0
    Text = '00'
  end
  object cmdScan: TButton
    Left = 104
    Top = 8
    Width = 75
    Height = 21
    Caption = '&Scan'
    TabOrder = 1
    OnClick = cmdScanClick
  end
  object cmdOK: TButton
    Left = 296
    Top = 128
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object mmoScan: TMemo
    Left = 8
    Top = 32
    Width = 361
    Height = 89
    Lines.Strings = (
      'mmoScan')
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object cmdScanUnk: TButton
    Left = 184
    Top = 8
    Width = 185
    Height = 21
    Caption = 'Scan For Used Unknown Enemies'
    TabOrder = 4
    OnClick = cmdScanUnkClick
  end
end
