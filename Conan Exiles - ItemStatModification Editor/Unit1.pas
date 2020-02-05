unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.JSON, rest.JSON,
  CommCtrl,
  djson, Vcl.ComCtrls, Vcl.StdCtrls, fytyConanExilesTypes, fytyConanExilesTypesFunctions,
  Form_ConanExiles_ItemStatModification_Entry,
  Unit2;

  //Unit2 Is the filter window

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
    buttonFilter: TButton;
    procedure buttonLoadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CEValueOnKeyPress(
      Sender: TObject; var Key: Char);
    procedure IsFloatClick(
      Sender: TObject);
    procedure formTreeChange(Sender: TObject; Node: TTreeNode);
    procedure IsEnabledClick(
      Sender: TObject);
    procedure buttonApplyClick(Sender: TObject);
    procedure buttonSaveClick(Sender: TObject);
    procedure buttonFilterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  strOperator = 'OperatorID=Add';

var
  formWindow: TformWindow;
  listEntries: TList<TForm_ConanExiles_ItemStatModification_Entry>;
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

procedure SetNodeBold(Node: TTreeNode; bMakeBold: boolean);
var
  TVItem: TTVItem;
begin
  if not Assigned(Node) then
    exit;
  fillchar(TVItem, sizeof(TVItem), 0);
  with TVItem do
  begin
    mask := TVIF_STATE or TVIF_HANDLE;
    hitem := Node.ItemId;
    StateMask := TVIS_BOLD;
    if bMakeBold then
      State := TVIS_BOLD;
    TreeView_SetItem(Node.Handle, TVItem);
  end;
end;


procedure TformWindow.buttonApplyClick(Sender: TObject);
var
  formEntry: TForm_ConanExiles_ItemStatModification_Entry;
  ceismToChange: CEItemStatModification;
  bIsFloat: boolean;
  strStatID, strValue, strOutput, strLastMod: string;
  iNumMods: integer;
begin

  SetNodeBold(formTree.Selected, true);

  ceismToChange := formTree.Selected.Data;
  //ShowMessage(IntToStr(ceismToChange.Modifications.Count));
  ceismToChange.Modifications.Clear;

  for formEntry in listEntries do begin

    if (formEntry.formEnabled.Checked = true) then begin
      //ShowMessage('Entry is enabled!');
      bIsFloat := formEntry.formIsFloat.Checked;

      if bIsFloat then
        strStatID := tstrlistFloatIDs[formEntry.formFloatStats.ItemIndex]
      else
        strStatID := tstrlistIntIDs[formEntry.formIntStats.ItemIndex];

      strValue := formEntry.formValue.Text;

      strOutput := CreateItemStatModificationString(bIsFloat, strStatID, strValue);

      //formResult.Lines.Add(strOutput);
      ceismToChange.Modifications.Add(strOutput);

    end;

  end;

  iNumMods := ceismToChange.Modifications.Count;

  if iNumMods > 0 then begin

    strLastMod := ceismToChange.Modifications[iNumMods - 1];

    SetLength(strLastMod,strLastMod.Length - 1);

    ceismToChange.Modifications[iNumMods - 1] := strLastMod;
    //formResult.Lines.Add(strLastMod);

  end;

  //ShowMessage(IntToStr(ceismToChange.Modifications.Count));


end;

procedure TformWindow.buttonFilterClick(Sender: TObject);
begin

  if formWindowSelectIncludeExclude.Showing then
    formWindowSelectIncludeExclude.Hide
  else
    formWindowSelectIncludeExclude.Show;

end;

procedure TformWindow.buttonLoadClick(Sender: TObject);
var
  iCounter: integer;
  treeEntry: TTreeNode;
  ceismToAdd, ceismToFree: CEItemStatModification;
  djsonEntry, djsonISMod: TDJSON;
begin

  buttonApply.Enabled := false;
  buttonApply.Visible := false;

  buttonSave.Enabled := false;
  buttonSave.Visible := false;

  djsonDataTable := TdJSON.Parse(formWindow.formSource.Lines.Text);

  //ShowMessage('Starting loop!');

  if listCEItemStatModification.Count > 0 then begin

    for ceismToFree in listCEItemStatModification do begin
      ceismToFree.Free;
    end;

    listCEItemStatModification.Clear;

  end;

  //ShowMessage('Cleared pre-existing modifications!');

  for djsonEntry in djsonDataTable do begin

    //ShowMessage('Iteration number: '+ iCounter.ToString);

    ceismToAdd := CEItemStatModification.Create;
    ceismToAdd.Modifications := TStringList.Create;

    //ShowMessage('Created CEItemStatModification!');

    for djsonISMod in djsonEntry['Modifications'] do begin
      //ShowMessage(djsonISMod.AsString);
      ceismToAdd.Modifications.Add(djsonISMod.AsString);
    end;

    //ShowMessage('Added modifications to string array');

    ceismToAdd.RowName := djsonEntry['RowName'].AsString;
    //ShowMessage('Added RowName to entry! '+ ceismToAdd.RowName);

    listCEItemStatModification.Add(ceismToAdd);
    //ShowMessage('Added ItemStatModification to master list! ' + ceismToAdd.RowName);
    //ShowMessage(IntToStr(iCounter));

    treeEntry := formTree.Items.AddChildObject(nil, djsonEntry['RowName'].AsString, listCEItemStatModification.Items[iCounter]);
    //ShowMessage('Added tree node!');
    if tstrlistItemIDs.IndexOf(treeEntry.Text) >= 0 then
      treeEntry.Text := treeEntry.Text + ' - ' + tstrlistItemNames[(tstrlistItemIDs.IndexOf(treeEntry.Text))];
    //else
    //ShowMessage(treeEntry.text);

    Unit2.formWindowSelectIncludeExclude.formListFilter.Items.Append(treeEntry.Text);

    Inc(iCounter);

    buttonFilter.Enabled := true;
    buttonFilter.Visible := true;
    buttonSave.Enabled := true;
    buttonSave.Visible := true;

  end;

  //ShowMessage('Finished loop');

end;

procedure TformWindow.buttonSaveClick(Sender: TObject);
var
  ceismToConvert: CEItemStatModification;
  jsonCEISMConverted: TJSONObject;
  arrayjsonOutput: TJSONArray;
begin

  arrayjsonOutput := TJSONArray.Create;
  try

    for ceismToConvert in listCEItemStatModification do begin

      jsonCEISMConverted := TJSONObject.Create;
      ConvertCEISMToJSON(ceismToConvert, jsonCEISMConverted);
      arrayjsonOutput.Add(jsonCEISMConverted);

    end;

    //ShowMessage('Converted all to JSON!');
    formResult.Lines.Text := arrayjsonOutput.Format(4);
    //ShowMessage('Wrote to memo!');

    //jsonCEISMConverted.Free;
  finally
    //Memory leak! Freeing jsonCEISMConverted throws exception for some reason
    //for jsonCEISMConverted in arrayjsonOutput do
    //  jsonCEISMConverted.Free;
    arrayjsonOutput.Free;
    ShowMessage('Wrote JSON to formResult!');
  end;

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

  listEntries := TList<TForm_ConanExiles_ItemStatModification_Entry>.Create;
  listEntries.Add(Form_ConanExiles_ItemStatModification_Entry0);
  listEntries.Add(Form_ConanExiles_ItemStatModification_Entry1);
  listEntries.Add(Form_ConanExiles_ItemStatModification_Entry2);
  listEntries.Add(Form_ConanExiles_ItemStatModification_Entry3);
  listEntries.Add(Form_ConanExiles_ItemStatModification_Entry4);
  listEntries.Add(Form_ConanExiles_ItemStatModification_Entry5);
  listEntries.Add(Form_ConanExiles_ItemStatModification_Entry6);


end;

procedure ResetAllEntries;
var
  iCounter: integer;
  formEntry: TForm_ConanExiles_ItemStatModification_Entry;
begin

  for iCounter := 0 to listEntries.Count - 1 do begin
    formEntry := listEntries[iCounter];

    formEntry.formEnabled.Checked := false;
    formEntry.formGroup.Visible := false;
    formEntry.formIntStats.ItemIndex := 0;
    formEntry.formFloatStats.ItemIndex := 0;
    formEntry.formValue.Text := '';
  end;

end;

procedure TformWindow.formTreeChange(Sender: TObject; Node: TTreeNode);
var
  ceismFromNode: CEItemStatModification;
  iCounter, iNumModifications: integer;
  tstrlistParsedModification: TStringList;
  formEntry: TForm_ConanExiles_ItemStatModification_Entry;
begin


  //ShowMessage('Loading TTreeNode');

  ResetAllEntries();
  ceismFromNode := Node.Data;
  //ShowMessage(ceismFromNode.RowName);

  //ShowMessage('Getting number of Item Stat Modifications!');
  iNumModifications := ceismFromNode.Modifications.Count;

  if iNumModifications > 7 then begin
    ShowMessage('There are more than 7 modifications! Aborting loading!');
    exit;
  end;

  //ShowMessage('There are less than 8 modifications!');
  tstrlistParsedModification := TStringList.Create;

  //ShowMessage('Now iterating through ' + IntToStr(iNumModifications) + ' form entries!');
  for iCounter := 0 to iNumModifications - 1 do begin
    //ShowMessage('Looping through every entry!');

    formEntry := listEntries[iCounter];
    //ShowMessage(ceismFromNode.Modifications[iCounter]);

    ParseItemStatModificationString(ceismFromNode.Modifications[iCounter], tstrlistParsedModification);

    formEntry.formEnabled.Checked := true;

    formEntry.Visible := true;
    formEntry.formGroup.Enabled := true;
    formEntry.formGroup.Visible := true;

    //ShowMessage(tstrlistParsedModification[0]);
    //ShowMessage(tstrlistParsedModification[1]);
    //ShowMessage(tstrlistParsedModification[2]);

    if tstrlistParsedModification[0] = 'True' then begin

      formEntry.formFloatStats.Visible := true;
      formEntry.formFloatStats.Enabled := true;

      formEntry.formIsFloat.Checked := true;

      formEntry.formIntStats.Visible := false;
      formEntry.formIntStats.Enabled := false;

      formEntry.formFloatStats.ItemIndex := tstrlistFloatIDs.IndexOf(tstrlistParsedModification[1]);
      formEntry.formValue.Text := tstrlistParsedModification[2];

    end
    else begin

      formEntry.formFloatStats.Visible := false;
      formEntry.formFloatStats.Enabled := false;

      formEntry.formIsFloat.Checked := false;

      formEntry.formIntStats.Visible := true;
      formEntry.formIntStats.Enabled := true;

      formEntry.formIntStats.ItemIndex := tstrlistIntIDs.IndexOf(tstrlistParsedModification[1]);
      formEntry.formValue.Text := tstrlistParsedModification[2];

    end;

    tstrlistParsedModification.Delete(2);
    tstrlistParsedModification.Delete(1);
    tstrlistParsedModification.Delete(0);

  end;

  tstrlistParsedModification.Free;
  //ShowMessage('Finished looping through every entry!');

  buttonApply.Enabled := true;
  buttonApply.Visible := true;

end;

procedure TFormWindow.IsEnabledClick(
  Sender: TObject);
var
  formCheckBox: TCheckBox;
  formEntry: TForm_ConanExiles_ItemStatModification_Entry;
begin

  formCheckBox := sender as TCheckBox;
  formEntry := formCheckbox.Owner as TForm_ConanExiles_ItemStatModification_Entry;

  if formCheckBox.Checked then
    formEntry.formGroup.Visible := true
  else
    formEntry.formGroup.Visible := false;

end;

procedure IsFloatToggle(formEntry: TForm_ConanExiles_ItemStatModification_Entry; bIsFloat: boolean);
begin

  if bIsFloat = true then begin
    formEntry.formIsFloat.Checked := true;
    formEntry.formIntStats.Visible := false;
    formEntry.formFloatStats.Visible := true;

  end
  else begin
    formEntry.formIsFloat.Checked := false;
    formEntry.formIntStats.Visible := true;
    formEntry.formFloatStats.Visible := false;

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

    formEntry.formIntStats.Enabled := false;
    formEntry.formIntStats.Visible := false;

    formEntry.formFloatStats.Visible := true;
    formEntry.formFloatStats.Enabled := true;

  end
  else begin

    formEntry.formIntStats.Enabled := true;
    formEntry.formIntStats.Visible := true;

    formEntry.formFloatStats.Enabled := false;
    formEntry.formFloatStats.Visible := false;

  end;

end;

procedure TformWindow.CEValueOnKeyPress(
  Sender: TObject; var Key: Char);
var
  formEdit: TEdit;
begin
  //We only want to allow numbers, a single period, and a single minus as a prefix
  //Everything else is an invalid character, so we'll just intercept each keypress
  //So if they ain't what we want, we just straight up ignore it

  formEdit := Sender as TEdit;

  if not (Key in ['0'..'9', '.', '-', Char(VK_BACK), Char(VK_DELETE)]) then
    Key := #0;

  if (Key = '.') and (Pos('.', formEdit.Text) > 0) then
    Key := #0;

  if (Key = '-') and (Pos('-', formEdit.Text) > 0) then
    Key := #0
  else if (Key = '-') and (Pos('-', formEdit.Text) = 0) then begin
    Key := #0;
    formEdit.Text := '-' + formEdit.Text;
  end;

end;

end.
