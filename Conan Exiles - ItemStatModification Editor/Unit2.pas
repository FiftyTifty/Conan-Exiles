unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.CheckLst;

type
  TformWindowSelectIncludeExclude = class(TForm)
    formDoFilter: TCheckBox;
    formGroupFilter: TGroupBox;
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    formDoIncludeExclude: TCheckBox;
    Memo2: TMemo;
    formListFilter: TCheckListBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formWindowSelectIncludeExclude: TformWindowSelectIncludeExclude;

implementation

{$R *.dfm}

end.
