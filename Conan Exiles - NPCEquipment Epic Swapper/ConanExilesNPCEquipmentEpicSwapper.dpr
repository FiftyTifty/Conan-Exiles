program ConanExilesNPCEquipmentEpicSwapper;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {formWindow},
  djson in '..\..\_Library - delphi-json-master\djson.pas',
  fytyConanExilesTypes in '..\Conan Exiles - API\fytyConanExilesTypes.pas',
  fytyConanExilesTypesFunctions in '..\Conan Exiles - API\fytyConanExilesTypesFunctions.pas',
  Form_ConanExiles_ItemStatModification_Entry in '..\Conan Exiles - Delphi Forms\Form_ConanExiles_ItemStatModification_Entry.pas' {Form_ConanExiles_ItemStatModification_Entry: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformWindow, formWindow);
  Application.Run;
end.
