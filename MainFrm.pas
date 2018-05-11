unit MainFrm;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, Menus, ComCtrls, DbCtrls,
  UtilsUnit, Registry, Types, IniFiles, DB, sqldb, BufDataset, laz2_DOM,
  laz2_XMLRead;

type

  { TMainForm }

  TMainForm = class(TForm)
    BtnCompareRight: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    AddColumnBtn: TButton;
    AddValueBtn: TButton;
    ImportSaveLogMemoBtn: TButton;
    CreateInsertPopup: TPopupMenu;
    GenerateInsertsFromAllCSVRecordsMNU: TMenuItem;
    GenerateInsertsfromPrimaryCSVFieldNotFoundMNU: TMenuItem;
    XMLToCSVConvertBtn: TButton;
    ValueEdt: TEdit;
    GenerateInsertBtn: TButton;
    CSVSearchNextBtn: TButton;
    CSVSearchBtn: TButton;
    CSVSearchCombo: TComboBox;
    CSVSearchEdt: TEdit;
    FixLinkedValueMenuBtn: TMenuItem;
    OpenProjectBtn: TButton;
    CSVGridMenu: TPopupMenu;
    SaveProjectBtn: TButton;
    DeleteSelectedRowBtn: TButton;
    TestLinkedTableBtn: TButton;
    DBNavigator1: TDBNavigator;
    Label15: TLabel;
    LogMemo: TMemo;
    PrimaryColumnsList: TDBLookupListBox;
    Label13: TLabel;
    Label14: TLabel;
    AddLinkedColumnBtn: TButton;
    FieldSelectList: TListBox;
    PrimaryColumnEdt: TEdit;
    PrimaryTableNameEdt: TEdit;
    LoadTablesBtn: TButton;
    AddPrimaryTableDetailBtn: TButton;
    TableList: TDBLookupListBox;
    ColumnsList: TDBLookupListBox;
    CSVFirstLineCheck: TCheckBox;
    LoadCSVBtn: TButton;
    FromRowsCountLabel: TLabel;
    OpenDialog1: TOpenDialog;
    SaveSQLBtn: TButton;
    ExportSQLBtn: TButton;
    CloseBtn: TBitBtn;
    FromDatabase: TEdit;
    FromPassword: TEdit;
    FromServerName: TEdit;
    FromUserName: TEdit;
    ConnecttoServerBtn: TBitBtn;
    ScriptGrid: TDBGrid;
    Label1: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ExecuteQueryBtn: TBitBtn;
    ProgressBar1: TProgressBar;
    ScriptTableName: TEdit;
    Label16: TLabel;
    RowsCountLabel: TLabel;
    FromTable: TEdit;
    FromUniqueField: TEdit;
    JvBitBtn1: TBitBtn;
    FromGrid: TDBGrid;
    JvDBGrid2: TDBGrid;
    Label10: TLabel;
    Label11: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    OutputLog: TMemo;
    PageControl1: TPageControl;
    SQL: TMemo;
    ScriptSQL: TMemo;
    SQLEdit: TMemo;
    ScriptSQLEdit: TMemo;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ToDatabase: TEdit;
    ToPassword: TEdit;
    SaveDialog1: TSaveDialog;
    About1: TMenuItem;
    ToServerName: TEdit;
    ToUserName: TEdit;
    SetupGrid: TStringGrid;
    CSVGrid: TDBGrid;
    procedure AddColumnBtnClick(Sender: TObject);
    procedure AddValueBtnClick(Sender: TObject);
    procedure CSVSearchBtnClick(Sender: TObject);
    procedure DeleteSelectedRowBtnClick(Sender: TObject);
    procedure FixLinkedValueMenuBtnClick(Sender: TObject);
    procedure AddLinkedColumnBtnClick(Sender: TObject);
    procedure GenerateInsertBtnClick(Sender: TObject);
    procedure GenerateInsertsFromAllCSVRecordsMNUClick(Sender: TObject);
    procedure GenerateInsertsfromPrimaryCSVFieldNotFoundMNUClick(Sender: TObject
      );
    procedure ImportSaveLogMemoBtnClick(Sender: TObject);
    procedure LoadTablesBtnClick(Sender: TObject);
    procedure AddPrimaryTableDetailBtnClick(Sender: TObject);
    procedure ConnecttoServerBtnClick(Sender: TObject);
    procedure SetupGridDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure XMLToCSVConvertBtnClick(Sender: TObject);
    procedure OpenProjectBtnClick(Sender: TObject);
    procedure SaveProjectBtnClick(Sender: TObject);
    procedure CSVSearchNextBtnClick(Sender: TObject);
    procedure TableListClick(Sender: TObject);
    procedure ExportSQLBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure JvBitBtn1Click(Sender: TObject);
    procedure BtnCompareRightClick(Sender: TObject);
    procedure ExecuteQueryBtnClick(Sender: TObject);
    procedure LoadCSVBtnClick(Sender: TObject);
    procedure SaveSQLBtnClick(Sender: TObject);
    procedure TestLinkedTableBtnClick(Sender: TObject);
    procedure SetupGridClick(Sender: TObject);
  private
    procedure GenerateInsertLine();
    function getTablePrimaryKey(TableName: String): String;
    function LoadPrimaryTable(): Boolean;
    { Private declarations }
  public
    SetupGridSelectedRow: Integer;
    CSVGridSelectedField: TField;
    SharedSetupGrid: TStringGrid;
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  FieldsString, ValuesString: String;
  RecordGuid: TGUID;

implementation
      uses datafrm, AboutFrm, FixLinkedValuesFrm;

{$R *.lfm}

procedure TMainForm.About1Click(Sender: TObject);
begin
        Application.CreateForm(TAboutForm, AboutForm);
        AboutForm.showmodal;
        AboutForm.Free;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
          SaveDialog1.FilterIndex := 1;
          SaveDialog1.DefaultExt := '.txt';
          if Savedialog1.Execute then
          begin
              SQL.Lines.SaveToFile(SaveDialog1.FileName);
          end;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
          SaveDialog1.FilterIndex := 1;
          SaveDialog1.DefaultExt := '.txt';
          if Savedialog1.Execute then
          begin
              Outputlog.Lines.SaveToFile(SaveDialog1.FileName);
          end;
end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
      if MessageDlg('Are you sure you want to Run this it cannot be undone!',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        Dataform.ToTransaction.Commit;
        Dataform.ToTransaction.StartTransaction;
        try
          Dataform.ToQuery2.SQL.Clear;
          Dataform.ToQuery2.SQL.Add(SQL.Lines.Text);
          Dataform.ToQuery2.ExecSQL;
          Dataform.ToQuery2.SQL.Clear;
          Dataform.ToTransaction.Commit;
          showmessage('Finished');
        finally
          if DataForm.ToTransaction.Active then
          begin
            Dataform.ToTransaction.Rollback;
            showmessage('Something went wrong all changes were dropped!');
          end
          else
          begin
            Dataform.ToTransaction.StartTransaction;
          end;
        end;
      end;

end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
        ConfigFilePath :String;
        INI: TINIFile;
begin
      Dataform.FromQuery1.Close;
      Dataform.ToQuery1.Close;
      Dataform.ToQuery2.Close;

      ConfigFilePath := GetAppConfigFile(False);
      INI := TINIFile.Create(ConfigFilePath + 'DB.ini');
      try
        INI.WriteString('DB','FromDatabase',FromDatabase.Text);
        INI.WriteString('DB','FromUserName',FromUserName.Text);
        INI.WriteString('DB','FromPassword',encrypt(FromPassword.Text));
        INI.WriteString('DB','FromServerName',FromServerName.Text);
      finally
        INI.Free;
      end;

//
//            SetRegistryData(HKEY_CURRENT_USER,
//            '\Software\CompareMSSQLTables\',
//            'FromDatabase', rdString, FromDatabase.Text);
//            SetRegistryData(HKEY_CURRENT_USER,
//            '\Software\CompareMSSQLTables\',
//            'FromUserName', rdString, FromUserName.Text);
//            SetRegistryData(HKEY_CURRENT_USER,
//            '\Software\CompareMSSQLTables\',
//            'FromPassword', rdString, encrypt(FromPassword.Text));
//            SetRegistryData(HKEY_CURRENT_USER,
//            '\Software\CompareMSSQLTables\',
//            'FromServerName', rdString, FromServerName.Text);
//            SetRegistryData(HKEY_CURRENT_USER,
//            '\Software\CompareMSSQLTables\',
//            'FromTable', rdString, FromTable.Text);
//            SetRegistryData(HKEY_CURRENT_USER,
//            '\Software\CompareMSSQLTables\',
//            'FromUniqueField', rdString, FromUniqueField.Text);
//            SetRegistryData(HKEY_CURRENT_USER,
//            '\Software\CompareMSSQLTables\',
//            'ToDatabase', rdString, ToDatabase.Text);
//            SetRegistryData(HKEY_CURRENT_USER,
//            '\Software\CompareMSSQLTables\',
//            'ToUserName', rdString, ToUserName.Text);
//            SetRegistryData(HKEY_CURRENT_USER,
//            '\Software\CompareMSSQLTables\',
//            'ToPassword', rdString, encrypt(ToPassword.Text));
//            SetRegistryData(HKEY_CURRENT_USER,
//            '\Software\CompareMSSQLTables\',
//            'ToServerName', rdString, ToServerName.Text);
//            SetRegistryData(HKEY_CURRENT_USER,
//            '\Software\CompareMSSQLTables\',
//            'SQLEdit', rdString, SQLEdit.Text);
//
//            SetRegistryData(HKEY_CURRENT_USER,
//            '\Software\CompareMSSQLTables\',
//            'ScriptSQLEdit', rdString, ScriptSQLEdit.Text);
//            SetRegistryData(HKEY_CURRENT_USER,
//            '\Software\CompareMSSQLTables\',
//            'ScriptTableName', rdString, ScriptTableName.Text);

end;

procedure TMainForm.ExportSQLBtnClick(Sender: TObject);
var
          I,ProgressI:Integer;
          FieldsString,ValuesString,QueryString:WideString;
          tempQueryString: WideString;
begin
      if Dataform.FromConnection.Connected = False then
      begin
        showmessage('Connect to SQL server first');
        exit;
      end;
      if POS(ScriptTableName.Text,ScriptSQLEdit.Text) = 0 then
      begin
        showmessage('Table name must be present in Query');
        exit;
      end;
      ScriptSQL.Clear;
      FieldsString := '';
      ValuesString := '';
      ProgressBar1.Max := Dataform.ScriptQuery1.RecordCount;
      ProgressBar1.Position := 0;
      Dataform.ScriptQuery1.First;
      Dataform.ScriptQuery1.DisableControls;
      while not Dataform.ScriptQuery1.EOF do
      begin
           ProgressBar1.StepIt;
           Application.processMessages;
           for I := 0 to Dataform.ScriptQuery1.Fields.Count - 1 do
          begin
            if FieldsString = '' then
            begin
              FieldsString := DataForm.ScriptQuery1.Fields[I].FieldName;
              ValuesString := ConvertFieldtoSQLString(DataForm.ScriptQuery1.Fields[I]);
            end
            else
            begin
              FieldsString := FieldsString + ',' + DataForm.ScriptQuery1.Fields[I].FieldName;
              ValuesString := ValuesString + ',' + ConvertFieldtoSQLString(DataForm.ScriptQuery1.Fields[I]);
            end;
          end;
          QueryString := 'insert into ' + ScriptTableName.Text + ' (' + FieldsString + ') Values (' + ValuesString + ');' + #13#10;
          tempQueryString := tempQueryString + QueryString;
          FieldsString := '';
          ValuesString := '';
          Dataform.ScriptQuery1.Next;
      end;
      ScriptSQL.Lines.Clear;
      ScriptSQL.Lines.Add(tempQueryString);
      Dataform.ScriptQuery1.EnableControls;
      showmessage('Finished');
end;

procedure TMainForm.ConnecttoServerBtnClick(Sender: TObject);
begin
      If ConnecttoServerBtn.Caption = 'Disconnect server' then
      begin
           Dataform.FromConnection.Close;
           ConnecttoServerBtn.Caption := 'Connect to server';
      end
      else
      begin
          try
            Dataform.FromConnection.Close;
            Dataform.FromConnection.Params.Clear;
       //     Dataform.FromConnection.Params.Add('DriverID=MSSQL');

            Dataform.FromConnection.DatabaseName := FromDatabase.Text;
            Dataform.FromConnection.UserName := FromUserName.Text;
            Dataform.FromConnection.Password := FromPassword.Text;
            Dataform.FromConnection.HostName := FromServerName.Text;
            Dataform.FromConnection.Open;
            ConnecttoServerBtn.Caption := 'Disconnect server';
          except
          begin
            ShowMessage('Unable to connect to MSSQL From Server, make sure the Database exist');
            Dataform.FromConnection.Close;
          end;
          raise;
          end;
      end;
end;

procedure TMainForm.SetupGridDrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
var
  AGrid : TStringGrid;
begin
   AGrid:=TStringGrid(Sender);

   if gdFixed in aState then //if is fixed use the clBtnFace color
      AGrid.Canvas.Brush.Color := clBtnFace
   else
   if gdSelected in aState then //if is selected use the clAqua color
   begin
      AGrid.Canvas.Brush.Color := clAqua;
      AGrid.Canvas.Font.Color := clBlack;
   end
   else
   begin
      AGrid.Canvas.Brush.Color := clWindow;
      AGrid.Canvas.Font.Color := clWindowText;
   end;

   AGrid.Canvas.FillRect(aRect);
   AGrid.Canvas.TextOut(aRect.Left + 2, aRect.Top + 2, AGrid.Cells[ACol, ARow]);
end;

procedure TMainForm.XMLToCSVConvertBtnClick(Sender: TObject);
var
  Doc: TXMLDocument;
  Child, Child2: TDOMNode;
  j, j2: Integer;
  TempField: TField;
  Col: TColumn;
  S: String;
begin
          OpenDialog1.FilterIndex := 3;
          Opendialog1.DefaultExt := '.csv';
          if Opendialog1.Execute then
          begin
            try
              ReadXMLFile(Doc, OpenDialog1.filename);
              LogMemo.Lines.Clear;
              // using FirstChild and NextSibling properties
              Child := Doc.DocumentElement.FirstChild;
              while Assigned(Child) do
              begin
     //           LogMemo.Lines.Add(Child.NodeName);
                // using ChildNodes method
                S := '';
                with Child.FirstChild do
                begin
                    with ChildNodes do
                    begin
                         for j2 := 0 to (Count - 1) do
                         begin
                              If S = '' then
                                 S := '"' + Item[j2].NodeName + '"'
                              else
                                S := S + ',"' + Item[j2].NodeName + '"'
                         end;
                    end;
                end;
                LogMemo.Lines.Add(S);

                with Child.ChildNodes do
                try
                  for j := 0 to (Count - 1) do
                  begin
//                    LogMemo.Lines.Add(Item[j].NodeName);
                    with Item[j].ChildNodes do
                    begin
                         S := '';
                         for j2 := 0 to (Count - 1) do
                         begin
                              If S = '' then
                                 S := '"' + Item[j2].TextContent + '"'
                              else
                                S := S + ',"' + Item[j2].TextContent + '"'
//                                LogMemo.Lines.Add(Item[j2].NodeName + ': ' + Item[j2].TextContent);
                         end;
                         LogMemo.Lines.Add(S);
                    end;
                  end;
                finally
                  Free;
                end;
                Child := Child.NextSibling;
              end;
            finally
              Doc.Free;
            end;

          end;
end;

procedure TMainForm.OpenProjectBtnClick(Sender: TObject);
begin
      if Dataform.FromConnection.Connected = False then
      begin
        showmessage('Connect to SQL server first');
        exit;
      end;
      OpenDialog1.FilterIndex := 2;
      OpenDialog1.DefaultExt := '.csv';
      if Opendialog1.Execute then
      begin
           SetupGrid.LoadFromCSVFile(OpenDialog1.FileName);
           if LoadPrimaryTable = false then
           begin
             showmessage('No primary row found.');
           end;
      end;
end;

function TMainForm.LoadPrimaryTable(): Boolean;
var
          I: Integer;
          Found: Boolean;
begin
      Found := false;
      for I := 0 to SetupGrid.RowCount - 1 do
      begin
           If SetupGrid.Cells[0,I] = 'Primary' then
           begin
             PrimaryTableNameEdt.Text := SetupGrid.Cells[3,I];
             PrimaryColumnEdt.Text := SetupGrid.Cells[4,I];
             Dataform.ColumnsQuery2.Close;
             Dataform.ColumnsQuery2.ParamByName('tablename').Value := PrimaryTableNameEdt.Text;
             Dataform.ColumnsQuery2.Open;
             Found := true;
           end;
      end;
      LoadPrimaryTable := Found;
end;

procedure TMainForm.SaveProjectBtnClick(Sender: TObject);
begin
     SaveDialog1.FilterIndex := 2;
     SaveDialog1.DefaultExt := '.csv';
     if Savedialog1.Execute then
     begin
          SetupGrid.SaveToCSVFile(SaveDialog1.FileName);
     end;
end;

procedure TMainForm.SetupGridClick(Sender: TObject);
begin
     SetupGridSelectedRow := SetupGrid.Row;
end;

procedure TMainForm.TableListClick(Sender: TObject);
begin
      Dataform.ColumnsQuery1.Close;
      Dataform.ColumnsQuery1.ParamByName('tablename').Value := TableList.Items[TableList.ItemIndex];
      Dataform.ColumnsQuery1.Open;
end;

procedure TMainForm.LoadTablesBtnClick(Sender: TObject);
begin
      Dataform.TablesQuery1.Open;
end;

procedure TMainForm.AddLinkedColumnBtnClick(Sender: TObject);
begin
      if FieldSelectList.ItemIndex = -1 then
      begin
        showmessage('Select CSV column');
        exit;
      end;
      if PrimaryColumnsList.ItemIndex = -1 then
      begin
        showmessage('Select Primary column');
        exit;
      end;
      if TableList.ItemIndex = -1 then
      begin
        showmessage('Select Link Table');
        exit;
      end;
      if ColumnsList.ItemIndex = -1 then
      begin
        showmessage('Select Link Table Column');
        exit;
      end;
      SetupGrid.RowCount := SetupGrid.RowCount + 1;
      SetupGrid.Cells[0,SetupGrid.RowCount - 1] := 'Linked';
      SetupGrid.Cells[1,SetupGrid.RowCount - 1] := FieldSelectList.Items[FieldSelectList.ItemIndex];
      SetupGrid.Cells[2,SetupGrid.RowCount - 1] := PrimaryColumnsList.Items[PrimaryColumnsList.ItemIndex];
      SetupGrid.Cells[3,SetupGrid.RowCount - 1] := TableList.Items[TableList.ItemIndex];
      SetupGrid.Cells[4,SetupGrid.RowCount - 1] := ColumnsList.Items[ColumnsList.ItemIndex];
end;

procedure TMainForm.GenerateInsertBtnClick(Sender: TObject);
var
         button: TControl;
         lowerLeft: TPoint;
begin
      if Sender is TControl then
      begin
        button := TControl(Sender);
        lowerLeft := Point(0, button.Height);
        lowerLeft := button.ClientToScreen(lowerLeft);
        CreateInsertPopup.Popup(lowerLeft.X, lowerLeft.Y);
      end;
end;

procedure TMainForm.GenerateInsertsFromAllCSVRecordsMNUClick(Sender: TObject);
var
          QueryString: String;
          I: integer;
begin
      if Dataform.FromConnection.Connected = False then
      begin
        showmessage('Connect from database first');
        exit;
      end;
      if Dataform.CSVDataSet.Active = False then
      begin
        showmessage('Load CSV File First first');
        exit;
      end;
      Dataform.CSVDataset.First;
      Dataform.CSVDataset.DisableControls;
      ProgressBar1.Max := Dataform.CSVDataset.RecordCount;
      ProgressBar1.Position := 0;
      LogMemo.Clear;
      while not Dataform.CSVDataset.EOF do
      begin
           ProgressBar1.StepIt;
           Application.processMessages;
           FieldsString := '';
           ValuesString := '';
           GenerateInsertLine();
           QueryString := 'insert into ' + PrimaryTableNameEdt.Text + ' (' + FieldsString + ') Values (' + ValuesString + ');';
           LogMemo.Lines.Add(QueryString);
           Dataform.CSVDataset.Next;
      end;
      Dataform.CSVDataset.EnableControls;
      Dataform.FromQuery1.Close;
end;

procedure TMainForm.GenerateInsertsfromPrimaryCSVFieldNotFoundMNUClick(
  Sender: TObject);
var
          Found: boolean;
          PrimaryCSVColumnStr, PrimaryKeyStr, PrimaryTableNameStr, PrimaryColumnStr: String;
          I: Integer;
          QueryString: String;
begin
      if Dataform.FromConnection.Connected = False then
      begin
        showmessage('Connect from database first');
        exit;
      end;
      if Dataform.CSVDataSet.Active = False then
      begin
        showmessage('Load CSV File First first');
        exit;
      end;
      Found := false;
      for I := 0 to SetupGrid.RowCount - 1 do
      begin
           If SetupGrid.Cells[0,I] = 'Primary' then
           begin
             PrimaryCSVColumnStr := SetupGrid.Cells[1,I];
             PrimaryKeyStr := SetupGrid.Cells[2,I];
             PrimaryTableNameStr := SetupGrid.Cells[3,I];
             PrimaryColumnStr := SetupGrid.Cells[4,I];
             Found := true;
           end;
      end;
      If Found = false then
      begin
        showmessage('Primary setup entry not found');
        exit;
      end;
      Dataform.CSVDataset.First;
      Dataform.CSVDataset.DisableControls;
      ProgressBar1.Max := Dataform.CSVDataset.RecordCount;
      ProgressBar1.Position := 0;
      LogMemo.Clear;
      while not Dataform.CSVDataset.EOF do
      begin
           ProgressBar1.StepIt;
           Application.processMessages;
           Dataform.FromQuery1.Close;
           with Dataform.FromQuery1.SQL do
           begin
             Clear;
             Add('select ' + PrimaryColumnStr + ' from ' + PrimaryTableNameStr);
             Add('where ' + PrimaryColumnStr + ' = ''' + FixSQLString(Dataform.CSVDataset.FieldByName(PrimaryCSVColumnStr).asString) + '''');
           end;
           try
           Dataform.FromQuery1.Open;
           except
                 on E : Exception do
                 begin
                    ShowMessage(E.ClassName + ' ' + E.Message + ' Error in Test');
                    exit;
                 end;
           end;
           If Dataform.FromQuery1.RecordCount = 0 then
           begin
                FieldsString := '';
                ValuesString := '';
                GenerateInsertLine();
                QueryString := 'insert into ' + PrimaryTableNameEdt.Text + ' (' + FieldsString + ') Values (' + ValuesString + ');';
                LogMemo.Lines.Add(QueryString);
           end;
           Dataform.CSVDataset.Next;
      end;
      Dataform.CSVDataset.EnableControls;
end;

procedure TMainForm.GenerateInsertLine();
var
          I: integer;
          KeyColumnName, TempValue: String;
begin
      for I := 0 to SetupGrid.RowCount - 1 do
      begin
           if SetupGrid.Cells[0,I] = 'Column' then
           begin
                if FieldsString = '' then
                begin
                     FieldsString := SetupGrid.Cells[2,I];
                     ValuesString := ConvertFieldtoSQLString(Dataform.CSVDataset.FieldByName(SetupGrid.Cells[1,I]));
                end
                else
                begin
                     FieldsString := FieldsString + ',' + SetupGrid.Cells[2,I];
                     ValuesString := ValuesString + ',' + ConvertFieldtoSQLString(Dataform.CSVDataset.FieldByName(SetupGrid.Cells[1,I]));
                end;
           end;
           if SetupGrid.Cells[0,I] = 'Primary' then
           begin
                CreateGUID(RecordGuid);
                if FieldsString = '' then
                begin
                     FieldsString := SetupGrid.Cells[2,I];
                     ValuesString := '''' + GuidtoString(RecordGuid) + '''';
                end
                else
                begin
                     FieldsString := FieldsString + ',' + SetupGrid.Cells[2,I];
                     ValuesString := ValuesString + ',' + '''' + GuidtoString(RecordGuid) + '''';
                end;
           end;
           if SetupGrid.Cells[0,I] = 'Linked' then
           begin
                KeyColumnName := getTablePrimaryKey(SetupGrid.Cells[3,I]);
                If KeyColumnName = 'Failed' then
                begin
                  showmessage('Primary Key not found for linked table ' + SetupGrid.Cells[3,I]);
                  exit;
                end;
                TempValue := 'select ' + KeyColumnName + ' from ' + SetupGrid.Cells[3,I] +
                ' where ' + SetupGrid.Cells[4,I] + ' = ''' + Dataform.CSVDataset.FieldByName(SetupGrid.Cells[1,I]).asString + '''';

                if FieldsString = '' then
                begin
                     FieldsString := SetupGrid.Cells[2,I];
                     ValuesString := '(' + TempValue + ')';
                end
                else
                begin
                     FieldsString := FieldsString + ',' + SetupGrid.Cells[2,I];
                     ValuesString := ValuesString + ',' + '(' + TempValue + ')';
                end;
           end;
           if SetupGrid.Cells[0,I] = 'Value' then
           begin
                if pos('()',SetupGrid.Cells[1,I]) > 0 then
                begin
                     TempValue := SetupGrid.Cells[1,I];
                end
                else
                begin
                     TempValue := '''' + SetupGrid.Cells[1,I] + '''';
                end;
                if FieldsString = '' then
                begin
                     FieldsString := SetupGrid.Cells[2,I];
                     ValuesString := TempValue;
                end
                else
                begin
                     FieldsString := FieldsString + ',' + SetupGrid.Cells[2,I];
                     ValuesString := ValuesString + ',' + TempValue;
                end;
           end;
      end;
end;

procedure TMainForm.ImportSaveLogMemoBtnClick(Sender: TObject);
begin
          SaveDialog1.FilterIndex := 2;
          SaveDialog1.DefaultExt := '.csv';
          if Savedialog1.Execute then
          begin
              LogMemo.Lines.SaveToFile(SaveDialog1.FileName);
          end;
end;

procedure TMainForm.DeleteSelectedRowBtnClick(Sender: TObject);
begin
      SetupGrid.DeleteRow(SetupGrid.Row);
end;

procedure TMainForm.CSVSearchBtnClick(Sender: TObject);
begin
      if CSVSearchCombo.ItemIndex = -1 then
      begin
        showmessage('Select search column');
        exit;
      end;
      if Dataform.CSVDataSet.Active = False then
      begin
           showmessage('Load CSV File First first');
           exit;
      end;
      Dataform.CSVDataset.First;
      Dataform.CSVDataset.DisableControls;
      while not Dataform.CSVDataset.EOF do
      begin
           if pos(lowercase(CSVSearchEdt.Text),lowercase(Dataform.CSVDataSet.FieldByName(CSVSearchCombo.Items[CSVSearchCombo.ItemIndex]).asString)) > 0 then
           begin
             Dataform.CSVDataset.EnableControls;
             exit;
           end;
           Dataform.CSVDataset.Next;
      end;
      Dataform.CSVDataset.EnableControls;
end;

procedure TMainForm.AddColumnBtnClick(Sender: TObject);
begin
      if FieldSelectList.ItemIndex = -1 then
      begin
        showmessage('Select CSV column');
        exit;
      end;
      if PrimaryColumnsList.ItemIndex = -1 then
      begin
        showmessage('Select Primary column');
        exit;
      end;
      SetupGrid.RowCount := SetupGrid.RowCount + 1;
      SetupGrid.Cells[0,SetupGrid.RowCount - 1] := 'Column';
      SetupGrid.Cells[1,SetupGrid.RowCount - 1] := FieldSelectList.Items[FieldSelectList.ItemIndex];
      SetupGrid.Cells[2,SetupGrid.RowCount - 1] := PrimaryColumnsList.Items[PrimaryColumnsList.ItemIndex];
end;

procedure TMainForm.AddValueBtnClick(Sender: TObject);
begin
      if PrimaryColumnsList.ItemIndex = -1 then
      begin
        showmessage('Select Primary column');
        exit;
      end;
      SetupGrid.RowCount := SetupGrid.RowCount + 1;
      SetupGrid.Cells[0,SetupGrid.RowCount - 1] := 'Value';
      SetupGrid.Cells[1,SetupGrid.RowCount - 1] := ValueEdt.Text;
      SetupGrid.Cells[2,SetupGrid.RowCount - 1] := PrimaryColumnsList.Items[PrimaryColumnsList.ItemIndex];
end;

procedure TMainForm.CSVSearchNextBtnClick(Sender: TObject);
begin
     if CSVSearchCombo.ItemIndex = -1 then
     begin
       showmessage('Select search column');
       exit;
     end;
     if Dataform.CSVDataSet.Active = False then
     begin
          showmessage('Load CSV File First first');
          exit;
     end;
     Dataform.CSVDataset.Next;
     Dataform.CSVDataset.DisableControls;
     while not Dataform.CSVDataset.EOF do
     begin
          if pos(lowercase(CSVSearchEdt.Text),lowercase(Dataform.CSVDataSet.FieldByName(CSVSearchCombo.Items[CSVSearchCombo.ItemIndex]).asString)) > 0 then
          begin
            Dataform.CSVDataset.EnableControls;
            exit;
          end;
          Dataform.CSVDataset.Next;
     end;
     Dataform.CSVDataset.EnableControls;
end;


procedure TMainForm.FixLinkedValueMenuBtnClick(Sender: TObject);
begin
      if Dataform.CSVDataSet.Active = False then
      begin
           showmessage('Load CSV File First first');
           exit;
      end;
      CSVGridSelectedField := CSVGrid.SelectedField;
      SharedSetupGrid := SetupGrid;
      Application.CreateForm(TFixLinkedValuesForm, FixLinkedValuesForm);
      FixLinkedValuesForm.showmodal;
      FixLinkedValuesForm.Free;
end;

procedure TMainForm.AddPrimaryTableDetailBtnClick(Sender: TObject);
begin
      if FieldSelectList.ItemIndex = -1 then
      begin
        showmessage('Select CSV column');
        exit;
      end;
      if TableList.ItemIndex = -1 then
      begin
        showmessage('Select Link Table');
        exit;
      end;
      if ColumnsList.ItemIndex = -1 then
      begin
        showmessage('Select Link Table Column');
        exit;
      end;
      SetupGrid.RowCount := SetupGrid.RowCount + 1;
      SetupGrid.Cells[0,SetupGrid.RowCount - 1] := 'Primary';
      SetupGrid.Cells[1,SetupGrid.RowCount - 1] := FieldSelectList.Items[FieldSelectList.ItemIndex];
      SetupGrid.Cells[2,SetupGrid.RowCount - 1] := getTablePrimaryKey(TableList.Items[TableList.ItemIndex]);
      SetupGrid.Cells[3,SetupGrid.RowCount - 1] := TableList.Items[TableList.ItemIndex];
      SetupGrid.Cells[4,SetupGrid.RowCount - 1] := ColumnsList.Items[ColumnsList.ItemIndex];
      PrimaryTableNameEdt.Text := TableList.Items[TableList.ItemIndex];
      PrimaryColumnEdt.Text := ColumnsList.Items[ColumnsList.ItemIndex];
      Dataform.ColumnsQuery2.Close;
      Dataform.ColumnsQuery2.ParamByName('tablename').Value := PrimaryTableNameEdt.Text;
      Dataform.ColumnsQuery2.Open;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
        ConfigFilePath :String;
        INI: TINIFile;
begin
      ConfigFilePath := GetAppConfigFile(False);
      INI := TINIFile.Create(ConfigFilePath + 'DB.ini');
      try
        FromDatabase.Text := INI.ReadString('DB','FromDatabase','');
        FromUserName.Text := INI.ReadString('DB','FromUserName','');
        FromPassword.Text := Decrypt(INI.ReadString('DB','FromPassword',''));
        FromServerName.Text := INI.ReadString('DB','FromServerName','');
      finally
        INI.Free;
      end;


      //try
      //        FromDatabase.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','FromDatabase');
      //      except
      //        FromDatabase.Text := '';
      //      end;
      //      try
      //        FromUserName.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','FromUserName');
      //      except
      //        FromUserName.Text := '';
      //      end;
      //      try
      //        FromPassword.Text := Decrypt(GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','FromPassword'));
      //      except
      //        FromPassword.Text := '';
      //      end;
      //      try
      //        FromServerName.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','FromServerName');
      //      except
      //        FromServerName.Text := '';
      //      end;
      //      try
      //        FromTable.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','FromTable');
      //      except
      //        FromTable.Text := '';
      //      end;
      //      try
      //        FromUniqueField.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','FromUniqueField');
      //      except
      //        FromUniqueField.Text := '';
      //      end;
      //      try
      //        ToDatabase.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','ToDatabase');
      //      except
      //        ToDatabase.Text := '';
      //      end;
      //      try
      //        ToUserName.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','ToUserName');
      //      except
      //        ToUserName.Text := '';
      //      end;
      //      try
      //        ToPassword.Text := Decrypt(GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','ToPassword'));
      //      except
      //        ToPassword.Text := '';
      //      end;
      //      try
      //        ToServerName.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','ToServerName');
      //      except
      //        ToServerName.Text := '';
      //      end;
      //      try
      //        SQLEdit.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','SQLEdit');
      //      except
      //        SQLEdit.Text := '';
      //      end;
      //
      //      try
      //        ScriptSQLEdit.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','ScriptSQLEdit');
      //      except
      //        ScriptSQLEdit.Text := '';
      //      end;
      //
      //      try
      //        ScriptTableName.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','ScriptTableName');
      //      except
      //        ScriptTableName.Text := '';
      //      end;
end;

procedure TMainForm.JvBitBtn1Click(Sender: TObject);
begin
          if Dataform.FromConnection.Connected = False then
          begin
            showmessage('Connect from database first');
            exit;
          end;
          if POS(FromTable.Text,SQLEdit.Text) = 0 then
          begin
            showmessage('Table name must be present in Query');
            exit;
          end;
          try
            DataForm.FromQuery1.close;
            with Dataform.FromQuery1.SQL do
            begin
              Clear;
              Text := SQLEdit.Text;
            end;
            Dataform.FromQuery1.Open;
          except
          begin
            ShowMessage('Unable to connect to MSSQL From Server, make sure the Database exist');
          end;
          raise;
          end;
          try
            Dataform.ToConnection.Close;
            Dataform.ToConnection.Params.Clear;
            Dataform.ToConnection.DatabaseName :=  ToDatabase.Text;
            Dataform.ToConnection.UserName := ToUserName.Text;
            Dataform.ToConnection.Password := ToPassword.Text;
            Dataform.ToConnection.HostName := ToServerName.Text;
            Dataform.ToConnection.Open;
            DataForm.ToQuery1.close;
            with Dataform.ToQuery1.SQL do
            begin
              Clear;
              Text := SQLEdit.Text;
            end;
            Dataform.ToQuery1.Open;
            FromRowsCountLabel.Caption := InttoStr(DataForm.FromQuery1.RecordCount);
          except
          begin
            ShowMessage('Unable to connect to MSSQL To Server, make sure the Database exist');
            Dataform.ToConnection.Close;
          end;
          raise;
          end;

end;

procedure TMainForm.BtnCompareRightClick(Sender: TObject);
var
          I:Integer;
          s: String;
          RecordChanged: Boolean;
          FieldsString,ValuesString,QueryString:WideString;
begin
          if Dataform.ToConnection.Connected = False then
          begin
            showmessage('Connect to SQL server first');
            exit;
          end;
          Outputlog.Clear;
          SQL.Clear;
          FieldsString := '';
          ValuesString := '';
          OutputLog.Lines.Clear;
          ProgressBar1.Max := Dataform.FromQuery1.RecordCount;
          ProgressBar1.Position := 0;
          Dataform.FromQuery1.First;
          Dataform.FromQuery1.DisableControls;
          while not Dataform.FromQuery1.EOF do
          begin
            ProgressBar1.StepIt;
            Application.processMessages;
            DataForm.ToQuery2.close;
            with Dataform.ToQuery2.SQL do
            begin
              Clear;
              Add('select * from ' + FromTable.Text);
              Add('where ' + FROMUniquefield.Text + ' = ' + ConvertFieldtoSQLString(Dataform.FromQuery1.FieldByName(FromUniquefield.Text)));
            end;
            Dataform.ToQuery2.Open;
            Dataform.ToQuery2.Prepare;
            if Dataform.ToQuery2.RecordCount = 0 then
            begin
              OutputLog.Lines.Add('Insert ' + Dataform.FromQuery1.FieldByName(FromUniquefield.Text).asString);
              for I := 0 to Dataform.FromQuery1.Fields.Count - 1 do
              begin
                if FieldsString = '' then
                begin
                  FieldsString := DataForm.FromQuery1.Fields[I].FieldName;
                  ValuesString := ConvertFieldtoSQLString(DataForm.FromQuery1.Fields[I]);
                end
                else
                begin
                  FieldsString := FieldsString + ',' + DataForm.FromQuery1.Fields[I].FieldName;
                  ValuesString := ValuesString + ',' + ConvertFieldtoSQLString(DataForm.FromQuery1.Fields[I]);
                end;
              end;
              QueryString := 'insert into ' + FromTable.Text + ' (' + FieldsString + ') Values (' + ValuesString + ');';
              SQL.Lines.Add(QueryString);
              FieldsString := '';
              ValuesString := '';
            end
            else
            begin
              s := 'Update ' + Dataform.FromQuery1.FieldByName(FromUniquefield.Text).asString;
              RecordChanged := False;
              for I := 0 to Dataform.FromQuery1.Fields.Count - 1 do
              begin
                if Dataform.ToQuery2.Fields[I].Value <> Dataform.FromQuery1.Fields[I].Value then
                begin
//                  showmessage(InttoStr(I));
                  RecordChanged := True;
                  if FieldsString = '' then
                    FieldsString := DataForm.FromQuery1.Fields[I].FieldName + ' = ' +  ConvertFieldtoSQLString(DataForm.FromQuery1.Fields[I])
                  else
                    FieldsString := FieldsString + ',' + DataForm.FromQuery1.Fields[I].FieldName + ' = ' +  ConvertFieldtoSQLString(DataForm.FromQuery1.Fields[I]);
                end;
              end;
              if RecordChanged = true then
              begin
                QueryString := 'update ' + FromTable.Text + ' set ' + FieldsString + ' where ' + FromUniqueField.Text + ' = ' + ConvertFieldtoSQLString(Dataform.FromQuery1.FieldByName(FromUniquefield.Text)) + ';';
                SQL.Lines.Add(QueryString);
                FieldsString := '';
                OutputLog.Lines.Add(s);
              end;
            end;
            Dataform.FromQuery1.Next;
          end;
          Dataform.FromQuery1.EnableControls;
          dataform.ToQuery2.close;
          showmessage('Finished');
end;


procedure TMainForm.ExecuteQueryBtnClick(Sender: TObject);
begin
          if Dataform.FromConnection.Connected = False then
          begin
            showmessage('Connect database first');
            exit;
          end;
          try
            DataForm.ScriptQuery1.close;
            with Dataform.ScriptQuery1.SQL do
            begin
              Clear;
              Text := ScriptSQLEdit.Text;
            end;
            Dataform.ScriptQuery1.Open;
            RowsCountLabel.Caption := InttoStr(Dataform.ScriptQuery1.RecordCount);
          except
                on E : Exception do
                begin
                     ShowMessage(E.ClassName + ' ' + E.Message + ' Error executing query');
                end;
          end;
end;

procedure TMainForm.LoadCSVBtnClick(Sender: TObject);
var
          i: Integer;
begin
          OpenDialog1.FilterIndex := 2;
          Opendialog1.DefaultExt := '.csv';
          if Opendialog1.Execute then
          begin
            Dataform.CSVDataset.Close;
            If CSVFirstLineCheck.Checked then
            begin
                 Dataform.CSVDataset.FirstLineAsSchema := true;
            end
            else
            begin
                 Dataform.CSVDataset.FirstLineAsSchema := false;
            end;
            Dataform.CSVDataset.FileName := OpenDialog1.filename;
            Dataform.CSVDataset.Open;
            CSVGrid.DataSource := Dataform.CSVSource;
            for i := 0 to Dataform.CSVDataset.Fields.Count - 1 do
            begin
                 FieldSelectList.Items.Add(Dataform.CSVDataset.Fields[i].FieldName);
            end;
            CSVSearchCombo.Items := FieldSelectList.Items;
          end;
end;

procedure TMainForm.SaveSQLBtnClick(Sender: TObject);
begin
          SaveDialog1.FilterIndex := 1;
          SaveDialog1.DefaultExt := '.txt';
          if Savedialog1.Execute then
          begin
            ScriptSQL.Lines.SaveToFile(SaveDialog1.FileName);
          end;
end;

procedure TMainForm.TestLinkedTableBtnClick(Sender: TObject);
begin
          if Dataform.FromConnection.Connected = False then
          begin
            showmessage('Connect from database first');
            exit;
          end;
          if Dataform.CSVDataSet.Active = False then
          begin
            showmessage('Load CSV File First first');
            exit;
          end;
          if (SetupGrid.Cells[0,SetupGridSelectedRow] <> 'Linked') and (SetupGrid.Cells[0,SetupGridSelectedRow] <> 'Primary') then
          begin
            showmessage('Select Linked Row');
            exit;
          end;
          Dataform.CSVDataset.First;
          Dataform.CSVDataset.DisableControls;
          ProgressBar1.Max := Dataform.CSVDataset.RecordCount;
          ProgressBar1.Position := 0;
          LogMemo.Clear;
          while not Dataform.CSVDataset.EOF do
          begin
               ProgressBar1.StepIt;
               Application.processMessages;
               Dataform.FromQuery1.Close;
               with Dataform.FromQuery1.SQL do
               begin
                 Clear;
                 Add('select ' + SetupGrid.Cells[4,SetupGridSelectedRow] + ' from ' + SetupGrid.Cells[3,SetupGridSelectedRow]);
                 Add('where ' + SetupGrid.Cells[4,SetupGridSelectedRow] + ' = ''' + FixSQLString(Dataform.CSVDataset.FieldByName(SetupGrid.Cells[1,SetupGridSelectedRow]).asString) + '''');
               end;
               try
               Dataform.FromQuery1.Open;
               except
                     on E : Exception do
                     begin
                        ShowMessage(E.ClassName + ' ' + E.Message + ' Error in Test');
                        exit;
                     end;
               end;
               If Dataform.FromQuery1.RecordCount = 0 then
               begin
                    LogMemo.Lines.Add('"' + Dataform.CSVDataset.FieldByName(SetupGrid.Cells[1,SetupGridSelectedRow]).asString + '","Not Found"');
               end
               else
               begin
                 if Dataform.FromQuery1.RecordCount > 1 then
                 begin
                    LogMemo.Lines.Add('"' + Dataform.CSVDataset.FieldByName(SetupGrid.Cells[1,SetupGridSelectedRow]).asString + '","Multiple Found"');
                 end;
               end;
               Dataform.CSVDataset.Next;
          end;
          Dataform.CSVDataset.EnableControls;
          if LogMemo.Lines.Count = 0 then
          begin
               LogMemo.Lines.Add('Finished: No problems found');
          end
          else
          begin
               LogMemo.Lines.Add('Finished: Problems found');
          end;
end;

function TMainForm.getTablePrimaryKey(TableName: String): String;
var
         Query1: TSQLQuery;
         KeyColumnName: String;

begin
      Query1 := TSQLQuery.Create(MainForm);
      Query1.Database := Dataform.FromConnection;
      with Query1.SQL do
      begin
           Clear;
           Add('SELECT COLUMN_NAME');
           Add('FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE');
           Add('WHERE OBJECTPROPERTY(OBJECT_ID(CONSTRAINT_SCHEMA + ''.'' + QUOTENAME(CONSTRAINT_NAME)), ''IsPrimaryKey'') = 1');
           Add('AND TABLE_NAME = ''' + TableName + '''');
      end;
      Query1.Open;
      If Query1.RecordCount > 0 then
      begin
           KeyColumnName := Query1.FieldbyName('COLUMN_NAME').AsString;
      end
      else
      begin
           KeyColumnName := 'Failed';
      end;
      getTablePrimaryKey := KeyColumnName;
end;

end.
