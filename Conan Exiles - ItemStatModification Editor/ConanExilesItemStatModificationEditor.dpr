program ConanExilesItemStatModificationEditor;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {formWindow},
  Form_ConanExiles_ItemStatModification_Entry in '..\Conan Exiles - Delphi Forms\Form_ConanExiles_ItemStatModification_Entry.pas' {Form_ConanExiles_ItemStatModification_Entry: TFrame},
  fytyConanExilesTypes in '..\Conan Exiles - API\fytyConanExilesTypes.pas',
  fytyConanExilesTypesFunctions in '..\Conan Exiles - API\fytyConanExilesTypesFunctions.pas',
  djson in '..\_Library - delphi-json-master\djson.pas',
  Unit2 in 'Unit2.pas' {formWindowSelectIncludeExclude};

{$R *.res}

begin
  //ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformWindow, formWindow);
  Application.CreateForm(TformWindowSelectIncludeExclude, formWindowSelectIncludeExclude);
  Application.Run;
end.
