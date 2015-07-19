object frmEnemyIndexEditor: TfrmEnemyIndexEditor
  Left = 192
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Enemy Index Editor'
  ClientHeight = 433
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lvwEnemyIndex: TListView
    Left = 8
    Top = 8
    Width = 361
    Height = 353
    Columns = <
      item
        Caption = 'Index'
      end
      item
        Caption = 'Enemy Name/ID'
        Width = 175
      end
      item
        Caption = 'X'
      end
      item
        Caption = 'Y'
      end>
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object cmdMoveUp: TButton
    Left = 8
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Move Up'
    TabOrder = 1
    OnClick = cmdMoveUpClick
  end
  object cmdMoveDown: TButton
    Left = 88
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Move Down'
    TabOrder = 2
    OnClick = cmdMoveDownClick
  end
  object cmdAutoSort: TButton
    Left = 168
    Top = 368
    Width = 75
    Height = 25
    Hint = 'Sorts the enemy indexes by the X co-ordinate'
    Caption = 'Auto Sort'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = cmdAutoSortClick
  end
  object cmdOk: TButton
    Left = 296
    Top = 400
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 4
  end
  object cmdAutoSortLevel: TButton
    Left = 8
    Top = 400
    Width = 137
    Height = 25
    Caption = 'Auto Sort Entire Level'
    TabOrder = 5
    OnClick = cmdAutoSortLevelClick
  end
end
