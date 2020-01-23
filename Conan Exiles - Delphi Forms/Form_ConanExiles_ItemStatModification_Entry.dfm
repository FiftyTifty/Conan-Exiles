object Form_ConanExiles_ItemStatModification_Entry: TForm_ConanExiles_ItemStatModification_Entry
  Left = 0
  Top = 0
  Width = 342
  Height = 109
  TabOrder = 0
  object formEnabled: TCheckBox
    Left = 3
    Top = 3
    Width = 97
    Height = 17
    Caption = 'Add Entry'
    TabOrder = 0
  end
  object formGroup: TGroupBox
    Left = 3
    Top = 26
    Width = 334
    Height = 79
    Caption = 'Set Entry Data'
    TabOrder = 1
    object formIntStats: TComboBox
      Left = 16
      Top = 48
      Width = 154
      Height = 21
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 0
      Visible = False
      Items.Strings = (
        'Health Max'
        'Health Current'
        'Feat Points Used'
        'Feat Points Total'
        'Level'
        'Stamina Current'
        'Stamina Max'
        'Conscioussness Current'
        'Conscioussness Max'
        'Thrall ID'
        'Thrall Tier'
        'Gender'
        'Att. Health'
        'Att. Stamina'
        'Att. Encumbrance'
        'Att. Strength'
        'Att. Accuracy'
        'Att. Grit'
        'Att. Survival'
        'Att. Agility'
        'Inventory Space')
    end
    object formFloatStats: TComboBox
      Left = 16
      Top = 48
      Width = 185
      Height = 21
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      TabOrder = 1
      Text = 'Thrall Corruption Cleans Potency'
      Visible = False
      Items.Strings = (
        'Thrall Crafting Speed'
        'Thrall Crafting Cost'
        'Thrall Crafting Fuel'
        'Thrall Entertainer Potency'
        'Damage Modifier Melee'
        'Damage Modifier Ranged'
        'Natural Armor'
        'Thrall Corruption Cleans Protency'
        'Thrall Corruption Cleanse Limit'
        'Armor'
        'Encumbrance Weight'
        'Killed XP Modifier'
        'Current Encumbrance'
        'Temperature Modification'
        'Penis Scale Modifier')
    end
    object formValue: TEdit
      Left = 207
      Top = 48
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 2
    end
    object formIsFloat: TCheckBox
      Left = 16
      Top = 25
      Width = 97
      Height = 17
      Caption = 'Is Float Stat'
      TabOrder = 3
    end
  end
end
