unit TablesDirectoryFrm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  DBUnit, LCLType, MainFrm, DB;

type

  { TTablesDirectoryForm }

  TTablesDirectoryForm = class(TForm)
    ColumnsList: TDBLookupListBox;
    ColumnsListLbl: TLabel;
    DBText1: TDBText;
    SearchEdit: TEdit;
    ShortcutLbl: TLabel;
    TableList: TDBLookupListBox;
    TablesListLbl: TLabel;
    procedure ColumnsListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
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
  if (Dataform.FromConnection.Connected = False) and (Dataform.FromMySQL80Connection.Connected = False) then
  begin
    showmessage('Connect to SQL server first!');
    TablesDirectoryForm.Close;
  end;
  if (Dataform.TablesQuery1.Active = False) then
  begin
    LoadDBTables();
  end;
end;

procedure TTablesDirectoryForm.SearchEditChange(Sender: TObject);
begin
    Dataform.TablesQuery1.Locate('name',SearchEdit.text,[loCaseInsensitive, loPartialKey]);
    TableList.KeyValue := DataForm.TablesQuery1.FieldByName('name').asString;
    LoadTableColumns(TableList.Items[TableList.ItemIndex]);
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

procedure TTablesDirectoryForm.TableListClick(Sender: TObject);
begin
  Dataform.TablesQuery1.Locate('name',TableList.Items[TableList.ItemIndex],[]);
  LoadTableColumns(TableList.Items[TableList.ItemIndex]);
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

