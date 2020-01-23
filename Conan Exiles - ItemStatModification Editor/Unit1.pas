unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  djson, Vcl.ComCtrls, Vcl.StdCtrls, fytyConanExilesTypes, fytyConanExilesTypesFunctions, Form_ConanExiles_ItemStatModification_Entry;

type
  TformWindow = class(TForm)
    formTree: TTreeView;
    formGroupEdit: TGroupBox;
    formGroupSource: TGroupBox;
    formGroupResult: TGroupBox;
    buttonLoad: TButton;
    buttonSave: TButton;
    Form_ConanExiles_ItemStatModification_Entry0: TForm_ConanExiles_ItemStatModification_Entry;
    Form_ConanExiles_ItemStatModification_Entry1: TForm_ConanExiles_ItemStatModification_Entry;
    Form_ConanExiles_ItemStatModification_Entry2: TForm_ConanExiles_ItemStatModification_Entry;
    Form_ConanExiles_ItemStatModification_Entry3: TForm_ConanExiles_ItemStatModification_Entry;
    Form_ConanExiles_ItemStatModification_Entry4: TForm_ConanExiles_ItemStatModification_Entry;
    Form_ConanExiles_ItemStatModification_Entry5: TForm_ConanExiles_ItemStatModification_Entry;
    Form_ConanExiles_ItemStatModification_Entry6: TForm_ConanExiles_ItemStatModification_Entry;
    formSource: TMemo;
    formResult: TMemo;
    buttonApply: TButton;
    procedure buttonLoadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CEValueOnKeyPress(
      Sender: TObject; var Key: Char);
    procedure IsFloatClick(
      Sender: TObject);
    procedure formTreeChange(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  strOperator = 'OperatorID=Add';

var
  formWindow: TformWindow;
  tstrlistFloatIDs, tstrlistFloatNames, tstrlistIntIDs, tstrlistIntNames,
  tstrlistItemIDs, tstrlistItemNames: TStringList;
  djsonDataTable: TDJSON;
  listCEItemStatModification: TList<CEItemStatModification>;

implementation

{$R *.dfm}

procedure SplitString(Str: string; Delimiter: Char; tstringsOutput: TStrings) ;
begin
   tstringsOutput.Clear;
   tstringsOutput.Delimiter       := Delimiter;
   tstringsOutput.StrictDelimiter := True; // Requires D2006 or newer.
   tstringsOutput.DelimitedText   := Str;
end;

procedure TformWindow.buttonLoadClick(Sender: TObject);
var
  iCounter, iNumModifications, iCounterModifications,
  iAddedIndex: integer;
  treeEntry: TTreeNode;
  ceismToAdd: CEItemStatModification;
  djsonEntry, djsonISMod: TDJSON;
begin

  djsonDataTable := TdJSON.Parse(formWindow.formSource.Lines.Text);

  iCounter := 0;

  ShowMessage('Starting loop!');

  if listCEItemStatModification.Count > 0 then
    listCEItemStatModification.Clear;

  for djsonEntry in djsonDataTable do begin

    //ShowMessage('Iteration number: '+ iCounter.ToString);

    ceismToAdd := CEItemStatModification.Create;
    ceismToAdd.Modifications := TStringList.Create;

    //ShowMessage('Created CEItemStatModification!');

    for djsonISMod in djsonEntry['Modifications'] do
      ceismToAdd.Modifications.Add(djsonISMod.AsString);


    //ShowMessage('Added modifications to string array');

    ceismToAdd.RowName := djsonEntry['RowName'].AsString;
    //ShowMessage('Added RowName to entry! '+ ceismToAdd.RowName);

    listCEItemStatModification.Add(ceismToAdd);
    //ShowMessage('Added ItemStatModification to master list! ' + listCEItemStatModification[0].RowName);

    formTree.Items.AddChildObject(nil, djsonEntry['RowName'].AsString, listCEItemStatModification.Items[iCounter]);
    //ShowMessage('Added tree node!');

    Inc(iCounter);

  end;

  ShowMessage('Finished loop');

end;

procedure TformWindow.FormCreate(Sender: TObject);
var
  strCurrentDir: string;
begin

  strCurrentDir := IncludeTrailingPathDelimiter(GetCurrentDir);

  tstrlistFloatIDs := TStringList.Create;
  tstrlistFloatNames := TStringList.Create;

  tstrlistIntIDs := TStringList.Create;
  tstrlistIntNames := TStringList.Create;

  tstrlistItemIDs := TStringList.Create;
  tstrlistItemNames := TStringList.Create;

  tstrlistFloatIDs.LoadFromFile(strCurrentDir + '_FloatIDs.txt');
  tstrlistFloatNames.LoadFromFile(strCurrentDir + '_FloatNames.txt');

  tstrlistIntIDs.LoadFromFile(strCurrentDir + '_IntIDs.txt');
  tstrlistIntNames.LoadFromFile(strCurrentDir + '_IntNames.txt');

  tstrlistItemIDs.LoadFromFile(strCurrentDir + '_AllItemIDs.txt');
  tstrlistItemNames.LoadFromFile(strCurrentDir + '_AllItemNames.txt');

  listCEItemStatModification := TList<CEItemStatModification>.Create;

end;


procedure TformWindow.formTreeChange(Sender: TObject; Node: TTreeNode);
var
  ceismFromNode: ptrCEItemStatModification;
  iNumControls, iCounter, iNumEntries, iNumModifications,
  iCounterModifications: integer;
  controlEntry: TComponent;
  formEntry: TForm_ConanExiles_ItemStatModification_Entry;
begin


  ShowMessage('Loading TTreeNode');
  ceismFromNode := formTree.Selected.Data;
  ShowMessage(ceismFromNode.RowName);

  ShowMessage('Getting number of Item Stat Modifications!');
  iNumModifications := ceismFromNode.Modifications.Count;

  if iNumModifications > 7 then begin
    ShowMessage('There are more than seven entries for the Item Stat Modification! Aborting loading the modification!');
    exit;
  end;

  ShowMessage('There are less than 8 modifications!');
  iCounter := 0;
  iCounterModifications := 0;
  iNumControls := formGroupEdit.ControlCount;

  ShowMessage('Now iterating through the form entries!');
  for iCounter := 0 to iNumControls - 1 do begin
    ShowMessage('Looping through every entry!');

    controlEntry := formGroupEdit.Controls[iCounter];

    if controlEntry is TForm_ConanExiles_ItemStatModification_Entry then begin

      formEntry := TForm_ConanExiles_ItemStatModification_Entry(controlEntry);

      InitializeForm_ItemStatModificationEntry(formEntry, ceismFromNode.Modifications, tstrlistFloatIDs);

    end;

  end;

end;

procedure TformWindow.IsFloatClick(
  Sender: TObject);
var
  formCheckBox: TCheckBox;
  formEntry: TForm_ConanExiles_ItemStatModification_Entry;
begin

  formCheckBox := sender as TCheckBox;
  formEntry := formCheckbox.Owner as TForm_ConanExiles_ItemStatModification_Entry;

  if formCheckBox.Checked then begin

    formEntry.formIntStats.Visible := false;
    formEntry.formFloatStats.Visible := true;

  end
  else begin

    formEntry.formIntStats.Visible := true;
    formEntry.formFloatStats.Visible := false;

  end;

end;

procedure TformWindow.CEValueOnKeyPress(
  Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', Char(VK_OEM_PERIOD), Char(VK_BACK), Char(VK_DELETE)])
  then Key := #0;
end;

end.
