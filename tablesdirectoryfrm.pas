unit TablesDirectoryFrm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  ComCtrls, DBUnit, LCLType, MainFrm, DB;

type

  { TTablesDirectoryForm }

  TTablesDirectoryForm = class(TForm)
    ColumnsList: TDBLookupListBox;
    ColumnsListLbl: TLabel;
    DBViewsList: TDBLookupListBox;
    DBText1: TDBText;
    PageControl1: TPageControl;
    ProceduresList: TDBLookupListBox;
    ProcLbl: TLabel;
    ScalarFunctionsList: TDBLookupListBox;
    ScalarFuncLbl: TLabel;
    SearchProcEdit: TEdit;
    SearchScalarEdit: TEdit;
    SearchTableFuncEdit: TEdit;
    SearchViewsEdit: TEdit;
    ShortcutLbl: TLabel;
    ShortcutLbl2: TLabel;
    TableFunctionsList: TDBLookupListBox;
    TableFuncLbl: TLabel;
    TabSheetRoutines: TTabSheet;
    TabSheetTables: TTabSheet;
    ViewsListLbl: TLabel;
    SearchEdit: TEdit;
    TableList: TDBLookupListBox;
    TablesListLbl: TLabel;
    procedure ColumnsListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBViewsListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure RoutineListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SearchEditChange(Sender: TObject);
    procedure SearchProcEditChange(Sender: TObject);
    procedure SearchScalarEditChange(Sender: TObject);
    procedure SearchTableFuncEditChange(Sender: TObject);
    procedure SearchViewsEditChange(Sender: TObject);
    procedure TableListClick(Sender: TObject);
    procedure TableListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure AddTextToMainFormScriptSQLEdit(const TextToAdd: string);

  public
    TargetEdit: TMemo;

  end;

var
  TablesDirectoryForm: TTablesDirectoryForm;

implementation
  uses DataFrm;

{$R *.lfm}

{ TTablesDirectoryForm }

procedure TTablesDirectoryForm.FormShow(Sender: TObject);
begin
  SearchEdit.setFocus;
  if (isDBConnected = False) then
  begin
    showmessage('Connect to SQL server first!');
    TablesDirectoryForm.Close;
    Exit;
  end;
  if (Dataform.TablesQuery1.Active = False) then
  begin
    LoadDBTables();
  end;
  if (Dataform.DBViewsQuery1.Active = False) then
  begin
    LoadDBViews();
  end;
  if (Dataform.ScalarFunctionsQuery.Active = False) then
  begin
    LoadDBScalarFunctions();
  end;
  if (Dataform.TableFunctionsQuery.Active = False) then
  begin
    LoadDBTableFunctions();
  end;
  if (Dataform.ProceduresQuery.Active = False) then
  begin
    LoadDBProcedures();
  end;
end;

procedure TTablesDirectoryForm.SearchEditChange(Sender: TObject);
begin
    Dataform.TablesQuery1.Locate('name',Variant(SearchEdit.text),[loCaseInsensitive, loPartialKey]);
    TableList.KeyValue := DataForm.TablesQuery1.FieldByName('name').asString;
    Dataform.ColumnsQuery1 := LoadTableColumnsSQLQuery(Dataform.ColumnsQuery1, TableList.Items[TableList.ItemIndex]);
end;

procedure TTablesDirectoryForm.SearchViewsEditChange(Sender: TObject);
begin
  Dataform.DBViewsQuery1.Locate('name',Variant(SearchViewsEdit.text),[loCaseInsensitive, loPartialKey]);
  DBViewsList.KeyValue := DataForm.DBViewsQuery1.FieldByName('name').asString;
end;

procedure TTablesDirectoryForm.SearchScalarEditChange(Sender: TObject);
begin
  Dataform.ScalarFunctionsQuery.Locate('name',Variant(SearchScalarEdit.text),[loCaseInsensitive, loPartialKey]);
  ScalarFunctionsList.KeyValue := DataForm.ScalarFunctionsQuery.FieldByName('name').asString;
end;

procedure TTablesDirectoryForm.SearchTableFuncEditChange(Sender: TObject);
begin
  Dataform.TableFunctionsQuery.Locate('name',Variant(SearchTableFuncEdit.text),[loCaseInsensitive, loPartialKey]);
  TableFunctionsList.KeyValue := DataForm.TableFunctionsQuery.FieldByName('name').asString;
end;

procedure TTablesDirectoryForm.SearchProcEditChange(Sender: TObject);
begin
  Dataform.ProceduresQuery.Locate('name',Variant(SearchProcEdit.text),[loCaseInsensitive, loPartialKey]);
  ProceduresList.KeyValue := DataForm.ProceduresQuery.FieldByName('name').asString;
end;

procedure TTablesDirectoryForm.ColumnsListKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_A) and (ssCtrl in Shift) then
  begin
    AddTextToMainFormScriptSQLEdit(ColumnsList.Items[ColumnsList.ItemIndex]);
    Key := 0;
  end;
end;

procedure TTablesDirectoryForm.DBViewsListKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_A) and (ssCtrl in Shift) then
  begin
    AddTextToMainFormScriptSQLEdit(DBViewsList.Items[DBViewsList.ItemIndex]);
    Key := 0;
  end;
end;

{ Shared Ctrl+A handler for the scalar-function, table-function and
  procedure lists - adds the selected name to the query editor. }
procedure TTablesDirectoryForm.RoutineListKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  LB: TDBLookupListBox;
begin
  if (Key = VK_A) and (ssCtrl in Shift) and (Sender is TDBLookupListBox) then
  begin
    LB := TDBLookupListBox(Sender);
    if LB.ItemIndex >= 0 then
      AddTextToMainFormScriptSQLEdit(LB.Items[LB.ItemIndex]);
    Key := 0;
  end;
end;

procedure TTablesDirectoryForm.TableListClick(Sender: TObject);
begin
  Dataform.TablesQuery1.Locate('name',Variant(TableList.Items[TableList.ItemIndex]),[]);
  Dataform.ColumnsQuery1 := LoadTableColumnsSQLQuery(Dataform.ColumnsQuery1, TableList.Items[TableList.ItemIndex]);
end;

procedure TTablesDirectoryForm.TableListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_A) and (ssCtrl in Shift) then
  begin
    AddTextToMainFormScriptSQLEdit(TableList.Items[TableList.ItemIndex]);
    Key := 0;
  end;
end;

procedure TTablesDirectoryForm.AddTextToMainFormScriptSQLEdit(const TextToAdd: string);
var
  MainForm: TMainForm;
  CursorPos: Integer;
begin
  // Assuming the modal form was called from MainForm
  MainForm := TMainForm(Owner); // Ensure the Owner is set to the main form

  if Assigned(MainForm) then
  begin
    with TargetEdit do
    begin
      CursorPos := SelStart; // Get the current cursor position
      Text := Copy(Text, 1, CursorPos) + TextToAdd + Copy(Text, CursorPos + 1, MaxInt);
      SelStart := CursorPos + Length(TextToAdd); // Move the cursor after the inserted text
    end;
  end;
end;

end.
