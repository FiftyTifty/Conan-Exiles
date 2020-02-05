object formWindow: TformWindow
  Left = 0
  Top = 0
  Caption = 'Conan Exiles - ItemStatModification Editor'
  ClientHeight = 968
  ClientWidth = 1212
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object formGroupEdit: TGroupBox
    AlignWithMargins = True
    Left = 827
    Top = 8
    Width = 366
    Height = 952
    Caption = 'Edit Selected Records'
    TabOrder = 0
    inline Form_ConanExiles_ItemStatModification_Entry0: TForm_ConanExiles_ItemStatModification_Entry
      Left = 3
      Top = 23
      Width = 342
      Height = 109
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitTop = 23
      inherited formEnabled: TCheckBox
        OnClick = IsEnabledClick
      end
      inherited formGroup: TGroupBox
        Visible = False
        inherited formIntStats: TComboBox
          ItemIndex = 0
          Text = 'Health Max'
          Visible = True
        end
        inherited formFloatStats: TComboBox
          ItemIndex = 0
          Text = 'Thrall Crafting Speed'
        end
        inherited formValue: TEdit
          NumbersOnly = False
          OnKeyPress = CEValueOnKeyPress
        end
        inherited formIsFloat: TCheckBox
          OnClick = IsFloatClick
        end
      end
    end
    inline Form_ConanExiles_ItemStatModification_Entry1: TForm_ConanExiles_ItemStatModification_Entry
      Left = 3
      Top = 138
      Width = 342
      Height = 109
      TabOrder = 1
      ExplicitLeft = 3
      ExplicitTop = 138
      inherited formEnabled: TCheckBox
        OnClick = IsEnabledClick
      end
      inherited formGroup: TGroupBox
        Left = -3
        Visible = False
        ExplicitLeft = -3
        inherited formIntStats: TComboBox
          ItemIndex = 0
          Text = 'Health Max'
          Visible = True
        end
        inherited formFloatStats: TComboBox
          ItemIndex = 0
          Text = 'Thrall Crafting Speed'
        end
        inherited formValue: TEdit
          NumbersOnly = False
          OnKeyPress = CEValueOnKeyPress
        end
        inherited formIsFloat: TCheckBox
          OnClick = IsFloatClick
        end
      end
    end
    inline Form_ConanExiles_ItemStatModification_Entry2: TForm_ConanExiles_ItemStatModification_Entry
      Left = 0
      Top = 253
      Width = 342
      Height = 109
      TabOrder = 2
      ExplicitTop = 253
      inherited formEnabled: TCheckBox
        OnClick = IsEnabledClick
      end
      inherited formGroup: TGroupBox
        Visible = False
        inherited formIntStats: TComboBox
          ItemIndex = 0
          Text = 'Health Max'
          Visible = True
        end
        inherited formFloatStats: TComboBox
          ItemIndex = 0
          Text = 'Thrall Crafting Speed'
        end
        inherited formValue: TEdit
          Left = 151
          Top = 360
          NumbersOnly = False
          OnKeyPress = CEValueOnKeyPress
          ExplicitLeft = 151
          ExplicitTop = 360
        end
        inherited formIsFloat: TCheckBox
          OnClick = IsFloatClick
        end
      end
    end
    inline Form_ConanExiles_ItemStatModification_Entry3: TForm_ConanExiles_ItemStatModification_Entry
      Left = 3
      Top = 368
      Width = 342
      Height = 109
      TabOrder = 3
      ExplicitLeft = 3
      ExplicitTop = 368
      inherited formEnabled: TCheckBox
        OnClick = IsEnabledClick
      end
      inherited formGroup: TGroupBox
        Visible = False
        inherited formIntStats: TComboBox
          ItemIndex = 0
          Text = 'Health Max'
          Visible = True
        end
        inherited formFloatStats: TComboBox
          ItemIndex = 0
          Text = 'Thrall Crafting Speed'
        end
        inherited formValue: TEdit
          NumbersOnly = False
          OnKeyPress = CEValueOnKeyPress
        end
        inherited formIsFloat: TCheckBox
          OnClick = IsFloatClick
        end
      end
    end
    inline Form_ConanExiles_ItemStatModification_Entry4: TForm_ConanExiles_ItemStatModification_Entry
      Left = 0
      Top = 483
      Width = 342
      Height = 109
      TabOrder = 4
      ExplicitTop = 483
      inherited formEnabled: TCheckBox
        Top = 0
        OnClick = IsEnabledClick
        ExplicitTop = 0
      end
      inherited formGroup: TGroupBox
        Visible = False
        inherited formIntStats: TComboBox
          ItemIndex = 0
          Text = 'Health Max'
          Visible = True
        end
        inherited formFloatStats: TComboBox
          ItemIndex = 0
          Text = 'Thrall Crafting Speed'
        end
        inherited formValue: TEdit
          NumbersOnly = False
          OnKeyPress = CEValueOnKeyPress
        end
        inherited formIsFloat: TCheckBox
          OnClick = IsFloatClick
        end
      end
    end
    inline Form_ConanExiles_ItemStatModification_Entry5: TForm_ConanExiles_ItemStatModification_Entry
      Left = 3
      Top = 598
      Width = 342
      Height = 109
      Enabled = False
      TabOrder = 5
      ExplicitLeft = 3
      ExplicitTop = 598
      inherited formEnabled: TCheckBox
        OnClick = IsEnabledClick
      end
      inherited formGroup: TGroupBox
        Visible = False
        inherited formIntStats: TComboBox
          ItemIndex = 0
          Text = 'Health Max'
          Visible = True
        end
        inherited formFloatStats: TComboBox
          ItemIndex = 0
          Text = 'Thrall Crafting Speed'
        end
        inherited formValue: TEdit
          NumbersOnly = False
          OnKeyPress = CEValueOnKeyPress
        end
        inherited formIsFloat: TCheckBox
          OnClick = IsFloatClick
        end
      end
    end
    inline Form_ConanExiles_ItemStatModification_Entry6: TForm_ConanExiles_ItemStatModification_Entry
      Left = 3
      Top = 713
      Width = 342
      Height = 109
      TabOrder = 6
      ExplicitLeft = 3
      ExplicitTop = 713
      inherited formEnabled: TCheckBox
        OnClick = IsEnabledClick
      end
      inherited formGroup: TGroupBox
        Visible = False
        inherited formIntStats: TComboBox
          ItemIndex = 0
          Text = 'Health Max'
          Visible = True
        end
        inherited formFloatStats: TComboBox
          ItemIndex = 0
          Text = 'Thrall Crafting Speed'
        end
        inherited formValue: TEdit
          NumbersOnly = False
          OnKeyPress = CEValueOnKeyPress
        end
        inherited formIsFloat: TCheckBox
          OnClick = IsFloatClick
        end
      end
    end
  end
  object formTree: TTreeView
    AlignWithMargins = True
    Left = 372
    Top = 24
    Width = 449
    Height = 936
    HideSelection = False
    Indent = 19
    TabOrder = 1
    OnChange = formTreeChange
  end
  object formGroupSource: TGroupBox
    Left = 8
    Top = 8
    Width = 345
    Height = 440
    Caption = 'JSON Source'
    TabOrder = 2
    object formSource: TMemo
      Left = 3
      Top = 16
      Width = 339
      Height = 421
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object formGroupResult: TGroupBox
    Left = 8
    Top = 520
    Width = 345
    Height = 440
    Caption = 'JSON Result'
    TabOrder = 3
    object formResult: TMemo
      Left = 3
      Top = 16
      Width = 339
      Height = 421
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object buttonLoad: TButton
    Left = 8
    Top = 473
    Width = 75
    Height = 25
    Caption = 'Load Source'
    TabOrder = 4
    OnClick = buttonLoadClick
  end
  object buttonSave: TButton
    Left = 278
    Top = 473
    Width = 75
    Height = 25
    Caption = 'Save'
    Enabled = False
    TabOrder = 5
    Visible = False
    OnClick = buttonSaveClick
  end
  object buttonApply: TButton
    Left = 1094
    Top = 880
    Width = 75
    Height = 25
    Caption = 'Apply'
    Enabled = False
    TabOrder = 6
    OnClick = buttonApplyClick
  end
  object buttonFilter: TButton
    Left = 144
    Top = 473
    Width = 75
    Height = 25
    Caption = 'Filter...'
    Enabled = False
    TabOrder = 7
    Visible = False
    OnClick = buttonFilterClick
  end
end
