unit TablesDirectoryFrm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  DBUnit, LCLType, MainFrm;

type

  { TTablesDirectoryForm }

  TTablesDirectoryForm = class(TForm)
    ColumnsList: TDBLookupListBox;
    ColumnsListLbl: TLabel;
    ShortcutLbl: TLabel;
    TablesListLbl: TLabel;
    TableList: TDBLookupListBox;
    procedure ColumnsListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
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

{$R *.lfm}

{ TTablesDirectoryForm }

procedure TTablesDirectoryForm.FormShow(Sender: TObject);
begin
  LoadDBTables();
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

