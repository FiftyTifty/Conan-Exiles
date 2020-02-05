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
    procedure FormShow(Sender: TObject);
    procedure formDoFilterClick(Sender: TObject);
    procedure formDoIncludeExcludeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  strFilterTrue = 'Filtering output';
  strFilterFalse = 'Not filtering outpt';
  strIncludeTrue = 'Only including ticked entries';
  strIncludeFalse = 'Only excluding ticked entries';

var
  formWindowSelectIncludeExclude: TformWindowSelectIncludeExclude;

implementation

{$R *.dfm}

procedure TformWindowSelectIncludeExclude.formDoFilterClick(Sender: TObject);
begin

  if formDoFilter.Checked then
    formDoFilter.Caption := strFilterTrue
  else
    formDoFilter.Caption := strFilterFalse;

end;

procedure TformWindowSelectIncludeExclude.formDoIncludeExcludeClick(
  Sender: TObject);
begin
  if formDoIncludeExclude.Checked then
    formDoIncludeExclude.Caption := strIncludeTrue
  else
    formDoIncludeExclude.Caption := strIncludeFalse;
end;

procedure TformWindowSelectIncludeExclude.FormShow(Sender: TObject);
begin
  formListFilter.MultiSelect := true;
end;

end.