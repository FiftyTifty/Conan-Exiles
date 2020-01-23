unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Generics.Collections, System.JSON, rest.JSON, Nvv.IO.CSV.Delphi.NvvCSVClasses,
  fytyConanExilesTypes, fytyConanExilesTypesFunctions;

type
  TformWindow = class(TForm)
    formCSV: TMemo;
    formConvert: TButton;
    formJSON: TMemo;
    procedure formConvertClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formWindow: TformWindow;

implementation

{$R *.dfm}

procedure TformWindow.formConvertClick(Sender: TObject);
var
  csvReader: TnvvCSVStringReader;
  tstrlistCSV: TStringList;

  ceitemItem: CEItem;
  listCEItems: TList<CEItem>;

  arrayJSON: TJSONArray;
  jsonItem: TJSONValue;

  iCounter: integer;
begin

  tstrlistCSV := TStringList.Create;
  tstrlistCSV.AddStrings(formCSV.Lines);
  arrayJSON := TJSONArray.Create;

  csvReader := TnvvCSVStringReader.Create;
  csvReader.HeaderPresent := true;
  csvReader.DataString := tstrlistCSV.Text;
  csvReader.Open;
  //ShowMessage('CSVReader Created!');

  //listCEItems := TObjectList<CEItem>.Create(True);

  {
  if csvReader.HeaderPresent then
    for iCounter := 0 to csvReader.FieldCount - 1 do
      ShowMessage(csvReader.Fields[iCounter].Name);
  }

  while not csvReader.Eof do begin
    //ShowMessage('Looping through csvReader!');
    ceitemItem := CEItem.Create;
    //ShowMessage('Created item!');
    InitializeCEItem(ceitemItem, csvReader.Fields[0].Value, csvReader.Fields[1].Value, 'No Text For Short Desc', 'No Text For Long Desc');
    //ShowMessage('Initialized item!');
    arrayJSON.Add(TJson.ObjectToJsonObject(ceitemItem));
    csvReader.Next;
    //listCEItems.Add(ceitemItem);
    //ShowMessage('Added item!');
  end;

  //ShowMessage('Added CEItems!');
  //ShowMessage('Created JSON array');
  {
  for iCounter := 0 to listCEItems.Count - 1 do begin
    arrayJSON.Add(TJson.ObjectToJSONString(listCEItems[iCounter]));
  end;
   }
  //ShowMessage('Filled JSON array!');

  formJSON.Lines.Text := arrayJSON.Format(4);

  //listCEItems.Free;
  arrayJSON.Free;
  csvReader.Free;
  tstrlistCSV.Free;
end;

end.
