object formWindow: TformWindow
  Left = 0
  Top = 0
  Caption = 'formWindow'
  ClientHeight = 730
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object formSource: TMemo
    Left = 8
    Top = 8
    Width = 369
    Height = 353
    TabOrder = 0
  end
  object formResult: TMemo
    Left = 8
    Top = 367
    Width = 369
    Height = 355
    TabOrder = 1
  end
  object formButton: TButton
    Left = 383
    Top = 352
    Width = 90
    Height = 25
    Caption = 'Convert To Epic'
    TabOrder = 2
    OnClick = formButtonClick
  end
end
