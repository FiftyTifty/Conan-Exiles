unit Form_ConanExiles_EquipmentTemplate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TCE_EquipmentTemplateEntry = class(TFrame)
    formItemID: TListBox;
    formDelete: TButton;
    formItemName: TListBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
