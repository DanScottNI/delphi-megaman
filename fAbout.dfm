object frmAbout: TfrmAbout
  Left = 352
  Top = 242
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'About Rock And Roll Editor'
  ClientHeight = 275
  ClientWidth = 486
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object lblHomepage: TLabel
    Left = 4
    Top = 245
    Width = 58
    Height = 13
    Cursor = crHandPoint
    Hint = 'http://dan.panicus.org'
    Caption = 'Dan'#39's Space'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = True
    OnClick = lblHomepageClick
    OnMouseEnter = lblHomepageMouseEnter
    OnMouseLeave = lblHomepageMouseLeave
  end
  object cmdOK: TButton
    Left = 406
    Top = 245
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object pgcAbout: TPageControl
    Left = 8
    Top = 8
    Width = 465
    Height = 225
    ActivePage = tshAbout
    Style = tsFlatButtons
    TabOrder = 1
    object tshAbout: TTabSheet
      Caption = 'About'
      object lblDescription: TLabel
        Left = 4
        Top = 4
        Width = 441
        Height = 135
        Caption = 
          'Rock And Roll is a level editor for the NES game, Megaman. '#13#10'It ' +
          'was written by Dan (dan@panicus.org).'#13#10#13#10'This editor was coded u' +
          'sing Visine as a base, so thanks to FX3 '#13#10'for writing such a gre' +
          'at editor.'#13#10#13#10'This program is not in any way associated with Cap' +
          'com, '#13#10'Nintendo, or any other stupid companies. Do not email me ' +
          'for '#13#10'the Mega Man ROM, because it'#39's rude.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
    end
    object tshSpecialThanksGreetings: TTabSheet
      Caption = 'Special Thanks/Greetings'
      ImageIndex = 1
      object lblThanks: TLabel
        Left = 4
        Top = 4
        Width = 154
        Height = 180
        Caption = 
          'Special Thanks To:'#13#10#13#10'- FX3'#13#10'- John'#13#10'- Martin Strand'#13#10'- FuSoYa'#13#10 +
          '- Ultima 4701'#13#10'- Everyone who helped '#13#10'  with Visine'#13#10'- The Fake' +
          ' God'#13#10'- Bill Jackson'#13#10'- Joe Doe'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object lblGreetings: TLabel
        Left = 168
        Top = 4
        Width = 287
        Height = 180
        Caption = 
          'Greetings To (in no particular order):'#13#10#13#10'- Disch               ' +
          '     - JCE3000GT'#13#10'- Weasel                   - Solid T-Bone'#13#10'- D' +
          'ahrkDaiz                - Mogster'#13#10'- redrum                   - ' +
          'Vag'#13#10'- Atma                     - bbitmaster'#13#10'- Muldoon         ' +
          '         - Vagla'#13#10'- Gil-Galad                - Sliver-X'#13#10'- Jathy' +
          's                   - Kaosoft'#13#10'- Chickenlump              - Goog' +
          'ie'#13#10'- Chill Penguin            - zooka'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
    end
    object tshTripnSlipProgInfo: TTabSheet
      Caption = 'Program Information'
      ImageIndex = 2
      object lblComponents: TLabel
        Left = 4
        Top = 4
        Width = 231
        Height = 75
        Caption = 
          'Components used in Rock And Roll:'#13#10#13#10'- Turbopower Abbrevia'#13#10'- Je' +
          'di-VCL v3.0 Beta'#13#10'- Graphics32'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object lblCompiled: TLabel
        Left = 0
        Top = 88
        Width = 280
        Height = 15
        Caption = 'Compiled Under Delphi 7 Personal Edition'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
    end
    object tshBetaTesters: TTabSheet
      Caption = 'Beta Testers'
      ImageIndex = 3
      object Label1: TLabel
        Left = 4
        Top = 4
        Width = 189
        Height = 60
        Caption = 'Thanks to the beta testers:'#13#10#13#10'- Gavin'#13#10'- Dragonsbretheren'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
    end
  end
end
