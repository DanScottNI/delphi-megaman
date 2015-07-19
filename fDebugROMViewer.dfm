object frmDebugROMViewer: TfrmDebugROMViewer
  Left = 229
  Top = 114
  BorderStyle = bsSingle
  Caption = 'Debug ROM Viewer'
  ClientHeight = 478
  ClientWidth = 775
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
  object lblLevel: TLabel
    Left = 8
    Top = 416
    Width = 29
    Height = 13
    Caption = 'Level:'
  end
  object DrawGrid: TDrawGrid
    Left = 0
    Top = 0
    Width = 775
    Height = 409
    Align = alTop
    ColCount = 35
    DefaultColWidth = 20
    FixedCols = 0
    RowCount = 33
    FixedRows = 0
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    GridLineWidth = 0
    ParentFont = False
    TabOrder = 0
    OnDrawCell = DrawGridDrawCell
    OnSelectCell = DrawGridSelectCell
  end
  object cbLevels: TComboBox
    Left = 56
    Top = 416
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
  end
  object cmdRoomOrder: TButton
    Left = 8
    Top = 448
    Width = 81
    Height = 25
    Caption = 'Room Order'
    TabOrder = 2
    OnClick = cmdRoomOrderClick
  end
  object cmdLevelPointers: TButton
    Left = 96
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Level Pointers'
    TabOrder = 3
    OnClick = cmdLevelPointersClick
  end
  object cmdEnemyPointer: TButton
    Left = 176
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Enemy Pointer'
    TabOrder = 4
    OnClick = cmdEnemyPointerClick
  end
  object cmdActualEnemyData: TButton
    Left = 256
    Top = 448
    Width = 113
    Height = 25
    Caption = 'Actual Enemy Data'
    TabOrder = 5
    OnClick = cmdActualEnemyDataClick
  end
  object cmdPalette: TButton
    Left = 376
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Palette'
    TabOrder = 6
    OnClick = cmdPaletteClick
  end
  object cmdScroll: TButton
    Left = 456
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Scroll Data'
    TabOrder = 7
    OnClick = cmdScrollClick
  end
  object cmdRoomOrderStartOffset: TButton
    Left = 536
    Top = 448
    Width = 137
    Height = 25
    HelpType = htKeyword
    Caption = 'Room Order Start Offset'
    TabOrder = 8
    OnClick = cmdRoomOrderStartOffsetClick
  end
  object cmdSpecObjData: TButton
    Left = 208
    Top = 416
    Width = 89
    Height = 25
    Caption = 'Spec Obj Data'
    TabOrder = 9
    OnClick = cmdSpecObjDataClick
  end
end
