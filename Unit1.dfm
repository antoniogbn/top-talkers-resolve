object Form1: TForm1
  Left = 480
  Top = 231
  Caption = 'Top Talkers Resolver - v.3'
  ClientHeight = 733
  ClientWidth = 961
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 961
    Height = 113
    Align = alTop
    TabOrder = 0
    object ProgressBar1: TProgressBar
      AlignWithMargins = True
      Left = 4
      Top = 76
      Width = 953
      Height = 33
      Align = alBottom
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 113
    Width = 961
    Height = 435
    Align = alClient
    TabOrder = 1
    object StringGrid1: TStringGrid
      Left = 1
      Top = 1
      Width = 959
      Height = 433
      Hint = 'Paste show ip flow top-talkers output here'
      Align = alClient
      ColCount = 11
      DrawingStyle = gdsGradient
      FixedCols = 0
      RowCount = 60
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      TabOrder = 0
      OnKeyDown = StringGrid1KeyDown
      ColWidths = (
        45
        46
        49
        51
        60
        64
        64
        64
        64
        64
        64)
    end
  end
  object Memo2: TMemo
    Left = 0
    Top = 548
    Width = 961
    Height = 51
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
    Visible = False
  end
  object Memo1: TMemo
    Left = 0
    Top = 599
    Width = 961
    Height = 42
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 3
    Visible = False
  end
  object Panel3: TPanel
    Left = 0
    Top = 641
    Width = 961
    Height = 92
    Align = alBottom
    TabOrder = 4
    object Button2: TButton
      Left = 40
      Top = 27
      Width = 105
      Height = 41
      Caption = 'Clear'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 864
      Top = 19
      Width = 105
      Height = 41
      Caption = 'Resolve'
      TabOrder = 1
      Visible = False
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 424
      Top = 27
      Width = 105
      Height = 41
      Caption = 'CSV'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 232
      Top = 27
      Width = 105
      Height = 41
      Caption = 'Copy'
      TabOrder = 3
      OnClick = Button4Click
    end
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    DefaultExt = 'csv'
    Options = [ofReadOnly, ofHideReadOnly, ofEnableSizing]
    Left = 1128
    Top = 665
  end
end
