object frmPatternTableSettings: TfrmPatternTableSettings
  Left = 248
  Top = 190
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pattern Table Settings'
  ClientHeight = 502
  ClientWidth = 526
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
  object lvwPatternTableSettings: TListView
    Left = 8
    Top = 272
    Width = 209
    Height = 193
    Columns = <
      item
        Caption = 'Offset'
        Width = 100
      end
      item
        Caption = 'Size'
        Width = 75
      end>
    GridLines = True
    HideSelection = False
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = lvwPatternTableSettingsDblClick
  end
  object cmdOK: TButton
    Left = 368
    Top = 472
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 448
    Top = 472
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
    OnClick = cmdCancelClick
  end
  object imgBGTable: TImage32
    Left = 264
    Top = 8
    Width = 256
    Height = 256
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 3
  end
  object imgSpriteTable: TImage32
    Left = 8
    Top = 8
    Width = 256
    Height = 256
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 4
  end
  object cmdAddNew: TButton
    Left = 224
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Add New'
    TabOrder = 5
  end
  object cmdDelete: TButton
    Left = 224
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 6
    OnClick = cmdDeleteClick
  end
  object cmdMoveUp: TButton
    Left = 224
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Move Up'
    TabOrder = 7
    OnClick = cmdMoveUpClick
  end
  object cmdMoveDown: TButton
    Left = 224
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Move Down'
    TabOrder = 8
    OnClick = cmdMoveDownClick
  end
end
