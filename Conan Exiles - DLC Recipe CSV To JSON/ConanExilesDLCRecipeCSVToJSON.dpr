program ConanExilesDLCRecipeCSVToJSON;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  fytyConanExilesTypes in '..\Conan Exiles - DLC Item CSV To JSON\fytyConanExilesTypes.pas',
  fytyConanExilesTypesFunctions in '..\Conan Exiles - DLC Item CSV To JSON\fytyConanExilesTypesFunctions.pas',
  Nvv.IO.CSV.Delphi.NvvCSVClasses in '..\Conan Exiles - DLC Item CSV To JSON\Nvv.IO.CSV.Delphi.NvvCSVClasses.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
