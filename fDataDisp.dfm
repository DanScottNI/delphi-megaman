object frmDataDisp: TfrmDataDisp
  Left = 243
  Top = 114
  BorderStyle = bsSingle
  Caption = 'ROM Data'
  ClientHeight = 439
  ClientWidth = 624
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
  object mmoData: TMemo
    Left = 8
    Top = 8
    Width = 609
    Height = 393
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object cmdOk: TButton
    Left = 544
    Top = 408
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object cmdExport: TButton
    Left = 8
    Top = 408
    Width = 75
    Height = 25
    Caption = '&Export'
    TabOrder = 1
  end
end
