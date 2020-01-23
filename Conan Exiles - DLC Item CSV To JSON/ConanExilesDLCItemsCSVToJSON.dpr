program ConanExilesDLCItemsCSVToJSON;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {formWindow},
  fytyConanExilesTypes in 'fytyConanExilesTypes.pas',
  fytyConanExilesTypesFunctions in 'fytyConanExilesTypesFunctions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformWindow, formWindow);
  Application.Run;
end.
