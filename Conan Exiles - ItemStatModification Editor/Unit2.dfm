object formWindowSelectIncludeExclude: TformWindowSelectIncludeExclude
  Left = 0
  Top = 0
  Caption = 'Include/Exclude In Export'
  ClientHeight = 968
  ClientWidth = 664
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object formGroupFilter: TGroupBox
    Left = 8
    Top = 8
    Width = 225
    Height = 129
    TabOrder = 0
    object formDoFilter: TCheckBox
      Left = 16
      Top = 16
      Width = 193
      Height = 17
      Caption = 'Not Currently Filtering Output'
      TabOrder = 0
      OnClick = formDoFilterClick
    end
    object Memo1: TMemo
      Left = 16
      Top = 39
      Width = 193
      Height = 74
      Enabled = False
      Lines.Strings = (
        'When ticked, the JSON output will be '
        'filtered accordingly.'
        ''
        'When unticked, the JSON will output '
        'everything as it normally would.')
      ParentColor = True
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 167
    Width = 225
    Height = 146
    TabOrder = 1
    object formDoIncludeExclude: TCheckBox
      Left = 16
      Top = 16
      Width = 193
      Height = 17
      Caption = 'Only Including Ticked ItemStatMods'
      TabOrder = 0
      OnClick = formDoIncludeExcludeClick
    end
    object Memo2: TMemo
      Left = 16
      Top = 39
      Width = 193
      Height = 90
      Enabled = False
      Lines.Strings = (
        'When ticked, ticked items in the list '
        'will be excluded from the JSON '
        'output.'
        ''
        'When unticked, only ticked items will '
        'be in the JSON output.')
      ParentColor = True
      TabOrder = 1
    end
  end
  object formListFilter: TCheckListBox
    Left = 248
    Top = 8
    Width = 408
    Height = 952
    ItemHeight = 13
    TabOrder = 2
  end
end
