object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 666
  ClientWidth = 891
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object formTabs: TPageControl
    Left = 0
    Top = 0
    Width = 891
    Height = 666
    ActivePage = formRecipesTab
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1037
    object formSourceTab: TTabSheet
      Caption = 'Source'
      ExplicitWidth = 1029
    end
    object formRecipesTab: TTabSheet
      Caption = 'Recipes'
      ImageIndex = 1
      ExplicitWidth = 1029
      object buttonLoadJSON: TButton
        Left = 16
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Load Source'
        TabOrder = 0
      end
      object formGroup: TGroupBox
        AlignWithMargins = True
        Left = 16
        Top = 34
        Width = 849
        Height = 601
        TabOrder = 1
        DesignSize = (
          849
          601)
        object labelRowName: TLabel
          AlignWithMargins = True
          Left = 378
          Top = 12
          Width = 51
          Height = 13
          Anchors = []
          Caption = 'Row Name'
        end
        object labelRecipeName: TLabel
          AlignWithMargins = True
          Left = 519
          Top = 12
          Width = 51
          Height = 13
          Anchors = []
          Caption = 'Row Name'
        end
        object labelShortDesc: TLabel
          AlignWithMargins = True
          Left = 378
          Top = 61
          Width = 53
          Height = 13
          Anchors = []
          Caption = 'Description'
        end
        object labelRecipeType: TLabel
          AlignWithMargins = True
          Left = 378
          Top = 107
          Width = 59
          Height = 13
          Anchors = []
          Caption = 'Recipe Type'
        end
        object labelTimeToCraft: TLabel
          AlignWithMargins = True
          Left = 519
          Top = 107
          Width = 65
          Height = 13
          Anchors = []
          Caption = 'Time To Craft'
        end
        object labelTier: TLabel
          AlignWithMargins = True
          Left = 599
          Top = 107
          Width = 18
          Height = 13
          Anchors = []
          Caption = 'Tier'
        end
        object labelCraftXP: TLabel
          AlignWithMargins = True
          Left = 679
          Top = 107
          Width = 54
          Height = 13
          Anchors = []
          Caption = 'Crafting XP'
        end
        object labelCraftingStations: TLabel
          AlignWithMargins = True
          Left = 378
          Top = 155
          Width = 76
          Height = 13
          Anchors = []
          Caption = 'Crafting Station'
        end
        object labelIcon: TLabel
          AlignWithMargins = True
          Left = 599
          Top = 155
          Width = 46
          Height = 13
          Anchors = []
          Caption = 'Icon Path'
        end
        object Label1: TLabel
          AlignWithMargins = True
          Left = 378
          Top = 201
          Width = 140
          Height = 13
          Anchors = []
          Caption = 'Destroy Station On Complete'
        end
        object formRecipeType: TComboBox
          AlignWithMargins = True
          Left = 378
          Top = 126
          Width = 134
          Height = 21
          Anchors = []
          DropDownCount = 12
          TabOrder = 0
          Items.Strings = (
            'Armor'
            'Building Item'
            'Category Count'
            'Consumable'
            'Crafting Stations'
            'Decoration'
            'Material'
            'pet Item'
            'Tools'
            'Utility'
            'Warpaints'
            'Weapon')
        end
        object formRowName: TEdit
          AlignWithMargins = True
          Left = 378
          Top = 31
          Width = 135
          Height = 21
          Anchors = []
          AutoSelect = False
          AutoSize = False
          NumbersOnly = True
          TabOrder = 1
        end
        object formShortDesc: TEdit
          AlignWithMargins = True
          Left = 378
          Top = 80
          Width = 460
          Height = 21
          Anchors = []
          AutoSelect = False
          AutoSize = False
          TabOrder = 2
        end
        object formRecipeName: TEdit
          AlignWithMargins = True
          Left = 519
          Top = 31
          Width = 319
          Height = 21
          Anchors = []
          AutoSelect = False
          AutoSize = False
          TabOrder = 3
        end
        object formTimeToCraft: TEdit
          AlignWithMargins = True
          Left = 519
          Top = 126
          Width = 74
          Height = 21
          Anchors = []
          AutoSelect = False
          AutoSize = False
          NumbersOnly = True
          TabOrder = 4
        end
        object TreeView2: TTreeView
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 369
          Height = 590
          Anchors = [akTop]
          Indent = 19
          TabOrder = 5
          Items.NodeData = {
            030C000000280000000000000000000000FFFFFFFFFFFFFFFF00000000000000
            00000000000105410072006D006F007200380000000000000000000000FFFFFF
            FFFFFFFFFF000000000000000000000000010D4200750069006C00640069006E
            00670020004900740065006D003A0000000000000000000000FFFFFFFFFFFFFF
            FF000000000000000000000000010E430061007400650067006F007200790020
            0043006F0075006E007400320000000000000000000000FFFFFFFFFFFFFFFF00
            0000000000000000000000010A43006F006E00730075006D00610062006C0065
            00400000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
            0001114300720061006600740069006E0067002000530074006100740069006F
            006E007300320000000000000000000000FFFFFFFFFFFFFFFF00000000000000
            0000000000010A4400650063006F0072006100740069006F006E002E00000000
            00000000000000FFFFFFFFFFFFFFFF00000000000000000000000001084D0061
            00740065007200690061006C002E0000000000000000000000FFFFFFFFFFFFFF
            FF000000000000000000000000010850006500740020004900740065006D0028
            0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
            0554006F006F006C0073002C0000000000000000000000FFFFFFFFFFFFFFFF00
            000000000000000000000001075500740069006C006900740079003000000000
            00000000000000FFFFFFFFFFFFFFFF0000000000000000000000000109570061
            0072007000610069006E00740073002A0000000000000000000000FFFFFFFFFF
            FFFFFF000000000000000000000000010657006500610070006F006E00}
        end
        object formTier: TEdit
          AlignWithMargins = True
          Left = 599
          Top = 126
          Width = 74
          Height = 21
          Anchors = []
          AutoSelect = False
          AutoSize = False
          NumbersOnly = True
          TabOrder = 6
        end
        object formCraftXP: TEdit
          AlignWithMargins = True
          Left = 679
          Top = 126
          Width = 74
          Height = 21
          Anchors = []
          AutoSelect = False
          AutoSize = False
          NumbersOnly = True
          TabOrder = 7
        end
        object formCraftingStation: TComboBox
          AlignWithMargins = True
          Left = 378
          Top = 174
          Width = 215
          Height = 21
          Anchors = []
          DropDownCount = 30
          TabOrder = 8
          Items.Strings = (
            'All Armorer Benches'
            'Armorers Bench'
            'Improved Armorers Bench'
            'Blacksmiths Bench'
            'Improved Blacksmiths Bench'
            'Carpenters Bench'
            'Improved Carpenters Bench'
            'Firebowl Cauldron'
            'Improved Firebowl Cauldron'
            'Artisans Work Table'
            'Torturer'#39's Work Table'
            'Dismantling Bench'
            'Furance'
            'Improved Furnace'
            'Improved Furnace (Kiln)'
            'Tannery'
            'Improved Tannery'
            'Campfire'
            'Large Campfire'
            'Bonfire'
            'Stove'
            'Improved Stove'
            'Grinder'
            'Dryer'
            'Fluid Press'
            'Fermentation Barrel'
            'Fish Trap'
            'Improved Fish Trap'
            'Shellfish Trap'
            'Improved Shellfish Trap'
            'Beehive'
            'Improved Beehive'
            'Compost Heap'
            'Crude Planter'
            'Planter'
            'Improved Planter')
        end
        object formIcon: TEdit
          AlignWithMargins = True
          Left = 599
          Top = 174
          Width = 240
          Height = 21
          Anchors = []
          AutoSelect = False
          AutoSize = False
          NumbersOnly = True
          TabOrder = 9
        end
      end
    end
    object formResultTab: TTabSheet
      Caption = 'Result'
      ImageIndex = 2
      ExplicitWidth = 1029
    end
  end
  object CheckBox1: TCheckBox
    Left = 398
    Top = 278
    Width = 97
    Height = 17
    TabOrder = 1
  end
end
