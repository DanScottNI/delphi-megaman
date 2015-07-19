object frmSoundEffectEditor: TfrmSoundEffectEditor
  Left = 373
  Top = 184
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sound Effect/Music Track Editor'
  ClientHeight = 343
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object vleSoundEffects: TValueListEditor
    Left = 8
    Top = 8
    Width = 401
    Height = 300
    TabOrder = 0
    TitleCaptions.Strings = (
      'Sound Effect'
      'Value'
      '')
    ColWidths = (
      150
      245)
  end
  object cmdOK: TButton
    Left = 256
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
    Left = 336
    Top = 312
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
