unit Form_ConanExiles_ItemStatModification_Entry;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm_ConanExiles_ItemStatModification_Entry = class(TFrame)
    formEnabled: TCheckBox;
    formGroup: TGroupBox;
    formIntStats: TComboBox;
    formFloatStats: TComboBox;
    formIsFloat: TCheckBox;
    formValue: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
