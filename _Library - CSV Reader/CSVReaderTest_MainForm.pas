unit CSVReaderTest_MainForm;

{===== HOW TO CREATE TEST APPLICATION =====

- In Delphi IDE create "VCL Forms Application - Delphi"
- Make sure name of the main form is Form1
- In main form code editor replace everything between (not including)
      very first line "unit SomeUnitName" and very last line "end."
  with code from this file between lines
      "CODE STARTS HERE" and "CODE ENDS HERE"
- Add downloaded unit "Nvv.IO.CSV.Delphi.NvvCSVClasses.pas" to the project. For
  simplicity it make sense to save project and place that unit in the project
  folder before adding it.
- Compile and run application }

//CODE STARTS HERE ========================


(*****************************************************
 ***    Copyright (c) 2014 Vladimir Nikitenko      ***
 ***      Code Project Open License (CPOL)         ***
 *** (http://www.codeproject.com/info/cpol10.aspx) ***
 *****************************************************)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, Nvv.IO.CSV.Delphi.NvvCSVClasses;

type
  TForm1 = class(TForm)
  private
    FCurrentCSVReader: TnvvCSVReader;
    FInitialDirectory: string;

    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    checkBox_HeaderPresent: TCheckBox;
    checkBox_FieldCount_AutoDetect: TCheckBox;
    checkBox_UseFieldDblQuoting: TCheckBox;
    checkBox_IgnoreEmptyLines: TCheckBox;
    checkBox_ASCIIonly: TCheckBox;
    checkBox_IgnoreSpecialCharacters: TCheckBox;
    labelFieldCountCaption: TLabel;
    labelReaderState: TLabel;
    textBox_FieldCount: TEdit;
    textBox_FieldSeparatorCharCode: TEdit;
    textBox_QuoteCharCode: TEdit;
    buttonSetIputDefaults: TButton;
    comboBox_SetFileKind: TComboBox;
    label_Encoding: TLabel;
    comboBox_Encoding: TComboBox;
    label_DetectBOM: TLabel;
    comboBox_DetectBOM: TComboBox;
    label_StreamReaderInternBufferSize: TLabel;
    textBox_StreamReaderInternBufferSize: TEdit;
    buttonReadFromFile: TButton;
    buttonReadFromString: TButton;
    buttonClose: TButton;
    buttonClearGrid: TButton;
    textBoxCSVString: TMemo;
    strGrid: TStringGrid;

    procedure FreeCurrentCSVReader;
    procedure ShowStatus;
    procedure SetDefaultInputProperties;
    procedure SetCommonInputProperties(ACSVReader: TnvvCSVReader);
    procedure DoReadFromFile;
    procedure DoReadFromString;
    procedure CloseCSVReader;
    procedure ReadCSVData(ACSVReader: TnvvCSVReader);
    procedure FillGrid;
    procedure ClearGrid;
    procedure SetGridColumnNames;
    procedure ReadDataIntoGrid;

    procedure CreateUI;

    function CreatePanel(AL,AT,AW,AH: Integer;
                         AAnchors: TAnchors): TPanel;
    function CreateCheckBox(AParent: TWinControl;
                            AL,AT,AW: Integer;
                            AText: string;
                            AOnClick: TNotifyEvent): TCheckBox;
    function CreateLabel(AParent: TWinControl;
                         AL,AT: Integer;
                         AText: string;
                         AFontSize: Integer; AFontBold: Boolean): TLabel;
    function CreateEmptyTEdit(AParent: TWinControl;
                              AL,AT,AW: Integer): TEdit;
    function CreateButton(AParent: TWinControl;
                          AL,AT,AW,AH: Integer;
                          AText: string;
                          AOnClick: TNotifyEvent): TButton;
    function CreateEmptyTComboBox(AParent: TWinControl;
                                  AL,AT,AW: Integer): TComboBox;
    function CreateSetFileKindTComboBox(AParent: TWinControl;
                                        AL,AT,AW: Integer): TComboBox;
    function CreateEncodingTComboBox(AParent: TWinControl;
                                     AL,AT,AW: Integer): TComboBox;
    function CreateDetectBOMTComboBox(AParent: TWinControl;
                                      AL,AT,AW: Integer): TComboBox;


    procedure checkBox_HeaderPresentOnClick(Sender: TObject);
    procedure checkBox_FieldCount_AutoDetectOnClick(Sender: TObject);
    procedure checkBox_UseFieldDblQuotingOnClick(Sender: TObject);
    procedure checkBox_IgnoreEmptyLinesOnClick(Sender: TObject);
    procedure checkBox_ASCIIonlyOnClick(Sender: TObject);
    procedure checkBox_IgnoreSpecialCharactersOnClick(Sender: TObject);

    procedure textBox_FieldCountOnExit(Sender: TObject);
    procedure textBox_FieldSeparatorCharCodeOnExit(Sender: TObject);
    procedure textBox_QuoteCharCodeOnExit(Sender: TObject);

    procedure buttonSetIputDefaultsOnClick(Sender: TObject);

    procedure comboBox_SetFileKindOnChange(Sender: TObject);
    procedure buttonReadFromFileOnClick(Sender: TObject);
    procedure buttonReadFromStringOnClick(Sender: TObject);
    procedure buttonCloseOnClick(Sender: TObject);
    procedure buttonClearGridOnClick(Sender: TObject);

    function IntToHexStr(const AIntValue: Integer): string;

    function GetFieldCount_AutoDetect: Boolean;
    procedure SetFieldCount_AutoDetect(const Value: Boolean);
    function GetFieldCount: string;
    procedure SetFieldCount(const Value: string);
    function GetHeaderPresent: Boolean;
    procedure SetHeaderPresent(const Value: Boolean);
    function GetUseFieldDblQuoting: Boolean;
    procedure SetUseFieldDblQuoting(const Value: Boolean);
    function GetIgnoreEmptyLines: Boolean;
    procedure SetIgnoreEmptyLines(const Value: Boolean);
    function GetIgnoreSpecialCharacters: Boolean;
    procedure SetIgnoreSpecialCharacters(const Value: Boolean);
    function GetFieldSeparatorCharCode: string;
    procedure SetFieldSeparatorCharCode(const Value: string);
    function GetQuoteCharCode: string;
    procedure SetQuoteCharCode(const Value: string);
    function GetASCIIonly: Boolean;
    procedure SetASCIIonly(const Value: Boolean);

    property FieldCount_AutoDetect: Boolean
      read GetFieldCount_AutoDetect write SetFieldCount_AutoDetect;
    property FieldCount: string read GetFieldCount write SetFieldCount;
    property HeaderPresent: Boolean
      read GetHeaderPresent write SetHeaderPresent;
    property UseFieldDblQuoting: Boolean
      read GetUseFieldDblQuoting write SetUseFieldDblQuoting;
    property IgnoreEmptyLines: Boolean
      read GetIgnoreEmptyLines write SetIgnoreEmptyLines;
    property IgnoreSpecialCharacters: Boolean
      read GetIgnoreSpecialCharacters write SetIgnoreSpecialCharacters;
    property FieldSeparatorCharCode: string
      read GetFieldSeparatorCharCode write SetFieldSeparatorCharCode;
    property QuoteCharCode: string read GetQuoteCharCode write SetQuoteCharCode;
    property ASCIIonly: Boolean read GetASCIIonly write SetASCIIonly;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


constructor TForm1.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  CreateUI;

  FCurrentCSVReader := TnvvCSVStringReader.Create; // create initial instance
  SetDefaultInputProperties;
  ShowStatus;
  FInitialDirectory := '';
end;

destructor TForm1.Destroy;
begin
  FreeCurrentCSVReader;
  inherited;
end;

procedure TForm1.FreeCurrentCSVReader;
begin
  FCurrentCSVReader.Free;
  FCurrentCSVReader := nil;
end;

procedure TForm1.CreateUI;
begin
  Position := poScreenCenter;
  Width := 790; Height := 775;
  Constraints.MinWidth := 790; Constraints.MinHeight := 700;
  Caption := 'Nvv.IO.CSV.Delphi.NvvCSVClasses test';

  Panel1 := CreatePanel(12, 12, 181, 331, [akLeft,akTop]);
  Panel2 := CreatePanel(199, 12, 186, 331, [akLeft,akTop]);
  Panel3 := CreatePanel(391, 12, 387, 331, [akLeft,akTop,akRight]);
  Panel4 := CreatePanel(12, 348, 766, 34, [akLeft,akTop,akRight]);
  Panel5 := CreatePanel(12, 387, 766, 376, [akLeft,akTop,akRight,akBottom]);

  CreateLabel(Panel1, 30, 5, 'Input Parameters', 10, True);
  checkBox_HeaderPresent :=
    CreateCheckBox(Panel1,22,31,97,'HeaderPresent',checkBox_HeaderPresentOnClick);
  checkBox_FieldCount_AutoDetect :=
    CreateCheckBox(Panel1,22,56,136,'FieldCount_AutoDetect',checkBox_FieldCount_AutoDetectOnClick);
  labelFieldCountCaption := CreateLabel(Panel1, 22, 75, 'FieldCount', 8, False);
  textBox_FieldCount := CreateEmptyTEdit(Panel1, 22,90,100);
  textBox_FieldCount.OnExit := textBox_FieldCountOnExit;
  CreateLabel(Panel1, 22, 116, 'FieldSeparatorCharCode (Hex)', 8, False);
  textBox_FieldSeparatorCharCode := CreateEmptyTEdit(Panel1, 22,131,100);
  textBox_FieldSeparatorCharCode.OnExit := textBox_FieldSeparatorCharCodeOnExit;
  checkBox_UseFieldDblQuoting :=
    CreateCheckBox(Panel1,22,159,104,'UseFieldQuoting',checkBox_UseFieldDblQuotingOnClick);
  CreateLabel(Panel1, 22, 177, 'QuoteCharCode (Hex)', 8, False);
  textBox_QuoteCharCode := CreateEmptyTEdit(Panel1, 22,193,100);
  textBox_QuoteCharCode.OnExit := textBox_QuoteCharCodeOnExit;
  checkBox_IgnoreEmptyLines :=
    CreateCheckBox(Panel1,22,225,104,'IgnoreEmptyLines',checkBox_IgnoreEmptyLinesOnClick);
  checkBox_ASCIIonly :=
    CreateCheckBox(Panel1,22,247,104,'ASCIIonly',checkBox_ASCIIonlyOnClick);
  checkBox_IgnoreSpecialCharacters :=
    CreateCheckBox(Panel1,22,270,142,'IgnoreSpecialCharacters',checkBox_IgnoreSpecialCharactersOnClick);
  buttonSetIputDefaults :=
    CreateButton(Panel1,52,298,75,23,'Set Defaults',buttonSetIputDefaultsOnClick);
  CreateLabel(Panel2, 43, 5, 'Read from file', 10, True);
  CreateLabel(Panel2, 22, 57, 'CSVFileReader specific input', 8, False);
  CreateLabel(Panel2, 4, 75, 'Method SetFile kind', 8, False);
  comboBox_SetFileKind := CreateSetFileKindTComboBox( Panel2, 4, 90, 157);
  label_Encoding := CreateLabel(Panel2, 4, 149, 'Encoding', 8, False);
  comboBox_Encoding := CreateEncodingTComboBox( Panel2, 4, 163, 157);
  label_DetectBOM := CreateLabel(Panel2, 4, 192, 'DetectBOM', 8, False);
  comboBox_DetectBOM := CreateDetectBOMTComboBox( Panel2, 4, 208, 157);
  label_StreamReaderInternBufferSize := CreateLabel(Panel2, 4, 236, 'StreamReader internal buffer (bytes)', 8, False);
  textBox_StreamReaderInternBufferSize := CreateEmptyTEdit(Panel2, 4, 253, 157);
  textBox_StreamReaderInternBufferSize.Text := '1024'; {Default for TSreamReader}
  buttonReadFromFile :=
    CreateButton(Panel2,49,298,89,23,'Select && Open',buttonReadFromFileOnClick);

  CreateLabel(Panel3, 122, 5, 'Read from string', 10, True);
  CreateLabel(Panel3, 100, 24, '(paste CSV string into below box)', 8, False);
  textBoxCSVString := TMemo.Create(Self);
  with textBoxCSVString do
  begin
    Parent := Panel3;
    SetBounds(10,43,362,247);
    Anchors := [akLeft,akTop,akRight,akBottom];
    ScrollBars := ssBoth;
    Lines.Text := '';
  end;

  buttonReadFromString :=
    CreateButton(Panel3,144,298,75,23,'Open',buttonReadFromStringOnClick);

  CreateLabel(Panel4, 19, 10, 'CSVReader Status:', 8, False);
  labelReaderState := CreateLabel(Panel4, 124, 8, 'Inactive', 10, True);
  labelReaderState.Transparent := False;
  buttonClose :=
    CreateButton(Panel4,196,5,75,23,'Close',buttonCloseOnClick);

  CreateLabel(Panel5, 13, 5, 'CSV Source content:', 8, False);
  buttonClearGrid :=
    CreateButton(Panel5,680,2,75,22,'Clear',buttonClearGridOnClick);
  buttonClearGrid.Anchors := [akTop,akRight];
  strGrid := TStringGrid.Create(Self);
  with strGrid do
  begin
    Parent := Panel5;
    SetBounds(10,26,745,338);
    Anchors := [akLeft,akTop,akRight,akBottom];
    Options := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
                goColSizing, goEditing];
  end;
  ClearGrid;
  comboBox_SetFileKindOnChange(comboBox_SetFileKind);
end;{CreateUI}

function TForm1.CreatePanel(AL,AT,AW,AH: Integer;
                            AAnchors: TAnchors): TPanel;
begin
  Result := TPanel.Create(Self);
  with Result do
  begin
    Parent := Self;
    BevelInner := bvNone; BevelOuter := bvRaised; BevelWidth := 1;
    BorderStyle := bsNone;
    SetBounds(AL,AT,AW,AH);
    Anchors := AAnchors;
  end;
end;

function TForm1.CreateCheckBox(AParent: TWinControl;
                               AL,AT,AW: Integer;
                               AText: string;
                               AOnClick: TNotifyEvent): TCheckBox;
begin
  Result := TCheckBox.Create(Self);
  with Result do
  begin
    Parent := AParent;
    SetBounds(AL,AT,AW,Height);
    Caption := AText;
    OnClick := AOnClick;
  end;
end;

function TForm1.CreateLabel(AParent: TWinControl; AL, AT: Integer;
  AText: string; AFontSize: Integer; AFontBold: Boolean): TLabel;
begin
  Result := TLabel.Create(Self);
  with Result do
  begin
    Parent := AParent;
    SetBounds(AL,AT,Width,Height);
    Caption := AText;
    Font.Size := AFontSize;
    if (AFontBold) then
      Font.Style := Font.Style + [fsBold]
    else
      Font.Style := Font.Style - [fsBold];
  end;
end;

function TForm1.CreateEmptyTEdit(AParent: TWinControl; AL, AT, AW: Integer): TEdit;
begin
  Result := TEdit.Create(Self);
  with Result do
  begin
    Parent := AParent;
    SetBounds(AL,AT,AW,Height);
    Text := '';
  end;
end;

function TForm1.CreateEmptyTComboBox(AParent: TWinControl; AL, AT, AW: Integer): TComboBox;
begin
  Result := TComboBox.Create(Self);
  with Result do
  begin
    Parent := AParent;
    Style := csDropDownList;
    SetBounds(AL,AT,AW,Height);
  end;
end;

function TForm1.CreateSetFileKindTComboBox(
                  AParent: TWinControl; AL, AT, AW: Integer): TComboBox;
begin
  Result := CreateEmptyTComboBox(AParent, AL, AT, AW);
  Result.Items.Add('File only');
  Result.Items.Add('File, BOM');
  Result.Items.Add('File, Encoding, BOM, Buffsize');
  Result.OnChange := comboBox_SetFileKindOnChange;
  Result.ItemIndex := 0; {'File only' - default}
end;

procedure TForm1.comboBox_SetFileKindOnChange(Sender: TObject);
var
  lBool: Boolean;
begin
  lBool := (comboBox_SetFileKind.ItemIndex = 1)or(comboBox_SetFileKind.ItemIndex = 2);
  label_DetectBOM.Enabled := lBool;
  comboBox_DetectBOM.Enabled := lBool;

  lBool := (comboBox_SetFileKind.ItemIndex = 2);
  label_Encoding.Enabled := lBool;
  comboBox_Encoding.Enabled := lBool;
  label_StreamReaderInternBufferSize.Enabled := lBool;
  textBox_StreamReaderInternBufferSize.Enabled := lBool;
end;

function TForm1.CreateEncodingTComboBox(
                  AParent: TWinControl; AL, AT, AW: Integer): TComboBox;
begin
  Result := CreateEmptyTComboBox(AParent, AL, AT, AW);
  Result.Items.Add('Default');            {0}
  Result.Items.Add('Unicode');            {1}
  Result.Items.Add('BigEndianUnicode');   {2}
  Result.Items.Add('UTF8');               {3}
  Result.Items.Add('UTF7');               {4}
  Result.Items.Add('ASCII');              {5}
  Result.ItemIndex := 0; {Default Encoding - default}
end;

function TForm1.CreateDetectBOMTComboBox(
                  AParent: TWinControl; AL, AT, AW: Integer): TComboBox;
begin
  Result := CreateEmptyTComboBox(AParent, AL, AT, AW);
  Result.Items.Add('False');
  Result.Items.Add('True');
  Result.ItemIndex := 0; {False - default}
end;

function TForm1.CreateButton(AParent: TWinControl; AL, AT, AW, AH: Integer;
                             AText: string; AOnClick: TNotifyEvent): TButton;
begin
  Result := TButton.Create(Self);
  with Result do
  begin
    Parent := AParent;
    SetBounds(AL,AT,AW,AH);
    Caption := AText;
    OnClick := AOnClick;
  end;
end;


function TForm1.IntToHexStr(const AIntValue: Integer): string;
begin
  Result := Format( '$%.4x',[AIntValue]);
end;

function TForm1.GetFieldCount_AutoDetect: Boolean;
begin
  Result := FCurrentCSVReader.FieldCount_AutoDetect;
end;

procedure TForm1.SetFieldCount_AutoDetect(const Value: Boolean);
begin
  try
      if (FCurrentCSVReader.FieldCount_AutoDetect <> Value) then
        FCurrentCSVReader.FieldCount_AutoDetect := Value
  finally
    checkBox_FieldCount_AutoDetect.Checked := FieldCount_AutoDetect;
    textBox_FieldCount.Enabled := not FieldCount_AutoDetect;
    labelFieldCountCaption.Enabled := not FieldCount_AutoDetect;
  end;
end;

procedure TForm1.checkBox_FieldCount_AutoDetectOnClick(Sender: TObject);
begin
  FieldCount_AutoDetect := checkBox_FieldCount_AutoDetect.Checked;
end;

function TForm1.GetFieldCount: string;
begin
  Result := IntToStr(FCurrentCSVReader.FieldCount);
end;

procedure TForm1.SetFieldCount(const Value: string);
var
  lIntValue: Integer;
begin
  lIntValue := 0;
  try
    try
      lIntValue := StrToInt(Value);
    except
      MessageDlg('''' + Value + ''' is not valid integer value', mtError,[mbOK],0);
      textBox_FieldCount.SetFocus;
      Abort;
    end;
    if (FCurrentCSVReader.FieldCount <> lIntValue) then
        FCurrentCSVReader.FieldCount := lIntValue;
  finally
    textBox_FieldCount.Text := FieldCount;
  end;
end;

procedure TForm1.textBox_FieldCountOnExit(Sender: TObject);
begin
  FieldCount := textBox_FieldCount.Text;
end;

function TForm1.GetHeaderPresent: Boolean;
begin
  Result := FCurrentCSVReader.HeaderPresent;
end;

procedure TForm1.SetHeaderPresent(const Value: Boolean);
begin
  try
    if (FCurrentCSVReader.HeaderPresent <> Value) then
        FCurrentCSVReader.HeaderPresent := Value;
  finally
    checkBox_HeaderPresent.Checked := HeaderPresent;
  end;
end;

procedure TForm1.checkBox_HeaderPresentOnClick(Sender: TObject);
begin
  HeaderPresent := checkBox_HeaderPresent.Checked;
end;

function TForm1.GetUseFieldDblQuoting: Boolean;
begin
  Result := FCurrentCSVReader.UseFieldQuoting;
end;

procedure TForm1.SetUseFieldDblQuoting(const Value: Boolean);
begin
  try
    if (FCurrentCSVReader.UseFieldQuoting <> Value) then
        FCurrentCSVReader.UseFieldQuoting := Value;
  finally
    checkBox_UseFieldDblQuoting.Checked := UseFieldDblQuoting;
  end;
end;

procedure TForm1.checkBox_UseFieldDblQuotingOnClick(Sender: TObject);
begin
  UseFieldDblQuoting := checkBox_UseFieldDblQuoting.Checked;
end;

function TForm1.GetIgnoreEmptyLines: Boolean;
begin
  Result := FCurrentCSVReader.IgnoreEmptyLines;
end;

procedure TForm1.SetIgnoreEmptyLines(const Value: Boolean);
begin
  try
    if (FCurrentCSVReader.IgnoreEmptyLines <> Value) then
        FCurrentCSVReader.IgnoreEmptyLines := Value;
  finally
    checkBox_IgnoreEmptyLines.Checked := IgnoreEmptyLines;
  end;
end;

procedure TForm1.checkBox_IgnoreEmptyLinesOnClick(Sender: TObject);
begin
  IgnoreEmptyLines := checkBox_IgnoreEmptyLines.Checked;
end;

function TForm1.GetIgnoreSpecialCharacters: Boolean;
begin
  Result := FCurrentCSVReader.IgnoreSpecialCharacters;
end;

procedure TForm1.SetIgnoreSpecialCharacters(const Value: Boolean);
begin
  try
    if (FCurrentCSVReader.IgnoreSpecialCharacters <> Value) then
        FCurrentCSVReader.IgnoreSpecialCharacters := Value;
  finally
    checkBox_IgnoreSpecialCharacters.Checked := IgnoreSpecialCharacters;
  end;
end;

procedure TForm1.checkBox_IgnoreSpecialCharactersOnClick(Sender: TObject);
begin
  IgnoreSpecialCharacters := checkBox_IgnoreSpecialCharacters.Checked;
end;

function TForm1.GetFieldSeparatorCharCode: string;
begin
  Result := IntToHexStr(FCurrentCSVReader.FieldSeparatorCharCode);
end;

procedure TForm1.SetFieldSeparatorCharCode(const Value: string);
var
  lIntValue: Integer;
begin
  lIntValue := 0;
  try
    try
      lIntValue := StrToInt(Value);
    except
      MessageDlg('''' + Value + ''' is not valid integer value', mtError,[mbOK],0);
      textBox_FieldSeparatorCharCode.SetFocus;
      Abort;
    end;
    if (FCurrentCSVReader.FieldSeparatorCharCode <> lIntValue) then
      FCurrentCSVReader.FieldSeparatorCharCode := lIntValue;
  finally
    textBox_FieldSeparatorCharCode.Text := FieldSeparatorCharCode;
  end;
end;

procedure TForm1.textBox_FieldSeparatorCharCodeOnExit(Sender: TObject);
begin
  FieldSeparatorCharCode := textBox_FieldSeparatorCharCode.Text;
end;

function TForm1.GetQuoteCharCode: string;
begin
  Result := IntToHexStr(FCurrentCSVReader.QuoteCharCode);
end;

procedure TForm1.SetQuoteCharCode(const Value: string);
var
  lIntValue: Integer;
begin
  lIntValue := 0;
  try
    try
      lIntValue := StrToInt(Value);
    except
      MessageDlg('''' + Value + ''' is not valid integer value', mtError,[mbOK],0);
      textBox_QuoteCharCode.SetFocus;
      Abort;
    end;
    if (FCurrentCSVReader.QuoteCharCode <> lIntValue) then
      FCurrentCSVReader.QuoteCharCode := lIntValue;
  finally
    textBox_QuoteCharCode.Text := QuoteCharCode;
  end;
end;

procedure TForm1.textBox_QuoteCharCodeOnExit(Sender: TObject);
begin
  QuoteCharCode := textBox_QuoteCharCode.Text;
end;

function TForm1.GetASCIIonly: Boolean;
begin
  Result := FCurrentCSVReader.ASCIIonly;
end;

procedure TForm1.SetASCIIonly(const Value: Boolean);
begin
  try
    if (FCurrentCSVReader.ASCIIonly <> Value) then
      FCurrentCSVReader.ASCIIonly := Value;
  finally
    checkBox_ASCIIonly.Checked := ASCIIonly;
  end;
end;

procedure TForm1.checkBox_ASCIIonlyOnClick(Sender: TObject);
begin
  ASCIIonly := checkBox_ASCIIonly.Checked;
end;

procedure TForm1.ShowStatus;
begin
  if (FCurrentCSVReader.Active) then
  begin
    labelReaderState.Color := clRed;
    labelReaderState.Font.Color := clWhite;
    labelReaderState.Caption := 'Active';
  end
  else
  begin
    labelReaderState.Color := clLime;
    labelReaderState.Font.Color := clBlack;
    labelReaderState.Caption := 'Inactive';
  end;
end;

procedure TForm1.SetDefaultInputProperties;
var
  lTmpReader: TnvvCSVStringReader;
begin
  lTmpReader := TnvvCSVStringReader.Create;
  try
    FieldCount_AutoDetect := lTmpReader.FieldCount_AutoDetect;
    FieldCount := IntToStr(lTmpReader.FieldCount);
    HeaderPresent := lTmpReader.HeaderPresent;
    UseFieldDblQuoting := lTmpReader.UseFieldQuoting;
    IgnoreEmptyLines := lTmpReader.IgnoreEmptyLines;
    IgnoreSpecialCharacters := lTmpReader.IgnoreSpecialCharacters;
    FieldSeparatorCharCode := IntToHexStr(lTmpReader.FieldSeparatorCharCode);
    QuoteCharCode := IntToHexStr(lTmpReader.QuoteCharCode);
    ASCIIonly := lTmpReader.ASCIIonly;
  finally
    lTmpReader.Free;
  end;
end;

procedure TForm1.buttonSetIputDefaultsOnClick(Sender: TObject);
begin
  SetDefaultInputProperties;
end;

procedure TForm1.SetCommonInputProperties(ACSVReader: TnvvCSVReader);
begin
  ACSVReader.FieldCount_AutoDetect := FieldCount_AutoDetect;
  if (FieldCount_AutoDetect) then
    ACSVReader.FieldCount := 0
  else
    ACSVReader.FieldCount := StrToInt(FieldCount);
  ACSVReader.HeaderPresent := HeaderPresent;
  ACSVReader.IgnoreEmptyLines := IgnoreEmptyLines;
  ACSVReader.UseFieldQuoting := UseFieldDblQuoting;
  ACSVReader.IgnoreSpecialCharacters := IgnoreSpecialCharacters;
  ACSVReader.FieldSeparatorCharCode := StrToInt(FieldSeparatorCharCode);
  ACSVReader.QuoteCharCode := StrToInt(QuoteCharCode);
  ACSVReader.ASCIIonly := ASCIIonly;
end;

procedure TForm1.DoReadFromFile;
var
  lNewCSVReader: TnvvCSVFileReader;
  lOpenFileDialog: TOpenDialog;
  lCSVFileFullSpec: string;
  lEncoding: TEncoding;
  lDetectBOM: Boolean;
begin
  lCSVFileFullSpec := '';
  lOpenFileDialog := TOpenDialog.Create(Self);
  try
    lOpenFileDialog.InitialDir := FInitialDirectory;
    lOpenFileDialog.DefaultExt := '';
    lOpenFileDialog.Filter := '';
    lOpenFileDialog.Options := [ofHideReadOnly, ofPathMustExist, ofFileMustExist];

    if (lOpenFileDialog.Execute) then
    begin
      lCSVFileFullSpec := lOpenFileDialog.FileName;
      FInitialDirectory := ExtractFilePath(lOpenFileDialog.FileName);
    end;
  finally
    lOpenFileDialog.Free;
  end;

  if (lCSVFileFullSpec <> '') then
  begin
    lNewCSVReader := TnvvCSVFileReader.Create;
    if (comboBox_SetFileKind.ItemIndex = 1) then
    begin
      lDetectBOM := (comboBox_DetectBOM.ItemIndex = 1);
      lNewCSVReader.SetFile(lCSVFileFullSpec, lDetectBOM);
    end
    else if (comboBox_SetFileKind.ItemIndex = 2) then
    begin
      case comboBox_Encoding.ItemIndex of
        1: lEncoding := TEncoding.Unicode;
        2: lEncoding := TEncoding.BigEndianUnicode;
        3: lEncoding := TEncoding.UTF8;
        4: lEncoding := TEncoding.UTF7;
        5: lEncoding := TEncoding.ASCII;
      else
        lEncoding := TEncoding.Default;
      end;
      lDetectBOM := (comboBox_DetectBOM.ItemIndex = 1);
      lNewCSVReader.SetFile(lCSVFileFullSpec, lEncoding, lDetectBOM,
                            StrToInt(textBox_StreamReaderInternBufferSize.Text));


    end
    else
      lNewCSVReader.SetFile(lCSVFileFullSpec);

    ReadCSVData(lNewCSVReader);
  end;
end;{DoReadFromFile}

procedure TForm1.buttonReadFromFileOnClick(Sender: TObject);
begin
  DoReadFromFile;
end;

procedure TForm1.DoReadFromString;
var
  lNewCSVReader: TnvvCSVStringReader;
begin
  lNewCSVReader := TnvvCSVStringReader.Create;
  lNewCSVReader.DataString := textBoxCSVString.Text;

  ReadCSVData(lNewCSVReader);
end;

procedure TForm1.buttonReadFromStringOnClick(Sender: TObject);
begin
  DoReadFromString;
end;

procedure TForm1.CloseCSVReader;
begin
  try
    FCurrentCSVReader.Close;
  finally
    ShowStatus;
  end;
end;

procedure TForm1.buttonCloseOnClick(Sender: TObject);
begin
  CloseCSVReader;
end;

procedure TForm1.ReadCSVData(ACSVReader: TnvvCSVReader);
var
  lOriginalCursor: TCursor;
begin
  lOriginalCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  try
    SetCommonInputProperties(ACSVReader); //copy property values from current reader
    CloseCSVReader;                       // previous one
    FreeCurrentCSVReader;                 // previous one
    FCurrentCSVReader := ACSVReader;      // new one
    ClearGrid;
    FCurrentCSVReader.Open;               // new one
    FillGrid;
  finally
    Screen.Cursor := lOriginalCursor;
    ShowStatus;
  end;
end;

procedure TForm1.FillGrid;
begin
  ClearGrid;
  SetGridColumnNames;
  ReadDataIntoGrid;
end;

procedure TForm1.ClearGrid;
begin
  strGrid.FixedCols := 0; //Grid always has no fixed columns
  strGrid.ColCount := 1;
  strGrid.RowCount := 2;
  strGrid.FixedRows := 1; //Grid always has 1 fixed row (for field names if any)
  strGrid.Cells[0,0] := '';
  strGrid.Cells[0,1] := '';
  strGrid.DefaultColWidth := 128;
end;

procedure TForm1.buttonClearGridOnClick(Sender: TObject);
begin
  ClearGrid;
end;

procedure TForm1.SetGridColumnNames;
var
  i: Integer;
begin
  strGrid.ColCount := FCurrentCSVReader.FieldCount;
  for i:=0 to FCurrentCSVReader.FieldCount-1 do
    strGrid.Cells[i,0] := FCurrentCSVReader.Fields[i].Name;
end;

procedure TForm1.ReadDataIntoGrid;
var
  lCurrRowIndx, lRequiredRowCount, j: Integer;
begin
  lCurrRowIndx := strGrid.FixedRows - 1;
  while (not FCurrentCSVReader.Eof) do
  begin
    inc(lCurrRowIndx);
    lRequiredRowCount := lCurrRowIndx + 1;
    if (strGrid.RowCount < lRequiredRowCount) then
      strGrid.RowCount := lRequiredRowCount;
    for j:=0 to FCurrentCSVReader.FieldCount-1 do
      strGrid.Cells[j,lCurrRowIndx] := FCurrentCSVReader.Fields[j].Value;
    FCurrentCSVReader.Next;
  end;
end;

//CODE ENDS HERE ============================
end.

