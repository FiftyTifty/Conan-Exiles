object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 576
  ClientWidth = 764
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object formConvert: TButton
    Left = 343
    Top = 280
    Width = 75
    Height = 25
    Caption = 'CSV -> JSON'
    TabOrder = 0
    OnClick = formConvertClick
  end
  object formJSON: TMemo
    Left = 424
    Top = 8
    Width = 329
    Height = 563
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
  end
  object formCSV: TMemo
    Left = 8
    Top = 8
    Width = 329
    Height = 563
    ScrollBars = ssBoth
    TabOrder = 2
    WordWrap = False
  end
end
