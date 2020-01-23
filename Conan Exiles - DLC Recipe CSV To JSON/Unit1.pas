unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Generics.Collections, System.JSON, rest.JSON, Nvv.IO.CSV.Delphi.NvvCSVClasses,
  fytyConanExilesTypes, fytyConanExilesTypesFunctions;

type
  TForm1 = class(TForm)
    formConvert: TButton;
    formJSON: TMemo;
    formCSV: TMemo;
    procedure formConvertClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.formConvertClick(Sender: TObject);
var
  csvReader: TnvvCSVStringReader;
  tstrlistCSV: TStringList;

  cerecipeRecipe: CERecipe;
  listCERecipes: TList<CERecipe>;

  arrayJSON: TJSONArray;
  jsonRecipe: TJSONValue;

  iCounter: integer;
begin

  tstrlistCSV := TStringList.Create;
  tstrlistCSV.AddStrings(formCSV.Lines);
  arrayJSON := TJSONArray.Create;

  csvReader := TnvvCSVStringReader.Create;
  csvReader.HeaderPresent := true;
  csvReader.DataString := tstrlistCSV.Text;
  csvReader.Open;

  while not csvReader.Eof do begin
    //ShowMessage('Looping through csvReader!');
    cerecipeRecipe := CERecipe.Create;
    //ShowMessage('Created recipe!');
    InitializeCERecipe(cerecipeRecipe, csvReader.Fields[0].Value, csvReader.Fields[1].Value);
    //ShowMessage('Initialized recipe!');
    cerecipeRecipe.IsRecipeEnabled := false;
    arrayJSON.Add(TJson.ObjectToJsonObject(cerecipeRecipe));
    csvReader.Next;
  end;

  formJSON.Lines.Text := arrayJSON.Format(4);

  arrayJSON.Free;
  csvReader.Free;
  tstrlistCSV.Free;

end;

end.
