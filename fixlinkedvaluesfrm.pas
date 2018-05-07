unit FixLinkedValuesFrm;

{$mode delphi}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  StdCtrls, DBGrids, db;

type

  { TFixLinkedValuesForm }

  TFixLinkedValuesForm = class(TForm)
    SearchBtn: TButton;
    SearchEdt: TEdit;
    ReplaceAllValuesBtn: TButton;
    SaveNewValueBtn: TButton;
    CloseBtn: TBitBtn;
    DBGrid1: TDBGrid;
    WrongValueEdt: TEdit;
    LinkedColumnEdt: TEdit;
    LinkedTableEdt: TEdit;
    procedure FormShow(Sender: TObject);
    procedure ReplaceAllValuesBtnClick(Sender: TObject);
    procedure SaveNewValueBtnClick(Sender: TObject);
    procedure SearchBtnClick(Sender: TObject);
  private

  public

  end;

var
  FixLinkedValuesForm: TFixLinkedValuesForm;

implementation
              uses MainFrm, datafrm;

{$R *.lfm}

{ TFixLinkedValuesForm }

procedure TFixLinkedValuesForm.FormShow(Sender: TObject);
var
  I: integer;
  Found: boolean;
begin
     Found := false;
     for I := 0 to MainForm.SharedSetupGrid.RowCount - 1 do
     begin
          If MainForm.SharedSetupGrid.Cells[1,I] = MainForm.CSVGridSelectedField.FieldName then
          begin
            LinkedTableEdt.Text := MainForm.SharedSetupGrid.Cells[3,I];
            LinkedColumnEdt.Text := MainForm.SharedSetupGrid.Cells[4,I];
            WrongValueEdt.Text := MainForm.CSVGridSelectedField.Text;
            Dataform.FromQuery1.Close;
            with Dataform.FromQuery1.SQL do
            begin
                 Clear;
                 Add('select ' + MainForm.SharedSetupGrid.Cells[4,I] + ' from ' + MainForm.SharedSetupGrid.Cells[3,I]);
                 Add('order by ' + MainForm.SharedSetupGrid.Cells[4,I]);
            end;
            try
               Dataform.FromQuery1.Open;
            except
                  on E : Exception do
                  begin
                       ShowMessage(E.ClassName + ' ' + E.Message + ' Error in getting link table rows');
                       exit;
                  end;
            end;
            Found := true;
          end;
     end;
end;

procedure TFixLinkedValuesForm.ReplaceAllValuesBtnClick(Sender: TObject);
begin
     if MessageDlg('Question', 'Do you want to replace all wrong values in column?', mtConfirmation,
        [mbYes, mbNo],0) = mrYes
     then
     begin
       Dataform.CSVDataset.First;
       Dataform.CSVDataset.DisableControls;
       while not Dataform.CSVDataset.EOF do
       begin
            if Dataform.CSVDataSet.FieldByName(MainForm.CSVGridSelectedField.FieldName).asString = WrongValueEdt.Text then
            begin
              Dataform.CSVDataSet.Edit;
              Dataform.CSVDataSet.FieldByName(MainForm.CSVGridSelectedField.FieldName).asString := Dataform.FromQuery1.FieldByName(LinkedColumnEdt.Text).asString;
              Dataform.CSVDataSet.Post;
            end;
            Dataform.CSVDataset.Next;
       end;
       Dataform.CSVDataset.EnableControls;
       Close;
     end;
end;

procedure TFixLinkedValuesForm.SaveNewValueBtnClick(Sender: TObject);
begin
     Dataform.CSVDataSet.Edit;
     Dataform.CSVDataSet.FieldByName(MainForm.CSVGridSelectedField.FieldName).asString := Dataform.FromQuery1.FieldByName(LinkedColumnEdt.Text).asString;
     Dataform.CSVDataSet.Post;
     Close;
end;

procedure TFixLinkedValuesForm.SearchBtnClick(Sender: TObject);
begin
     //or using [loCaseInsensitive,loPartialKey] options
     Dataform.FromQuery1.Locate(LinkedColumnEdt.Text, SearchEdt.Text, [loCaseInsensitive,loPartialKey]);
end;

end.

