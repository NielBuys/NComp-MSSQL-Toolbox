unit MainFrm;

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Grids,
  DBGrids, StdCtrls, Buttons, Menus, ComCtrls, DbCtrls, ExtCtrls, ActnList,
  UtilsUnit, Types, IniFiles, DB, sqldb, BufDataset, laz2_DOM, laz2_XMLRead,
  Base64, PingThreadUnit;

type

  { TMainForm }

  TMainForm = class(TForm)
    AddColumnBtn: TButton;
    AddLinkedColumnBtn: TButton;
    AddPrimaryTableDetailBtn: TButton;
    AddValueBtn: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    FindRecordsBtn: TButton;
    DBGrid1: TDBGrid;
    FindandReplaceRecordsBtn: TButton;
    RecordsFoundMemo: TMemo;
    PrefixEdt: TEdit;
    PrefixLbl: TLabel;
    ReplaceWithEdt: TEdit;
    FindEdt: TEdit;
    FromPort: TEdit;
    FindLbl: TLabel;
    ReplaceWithLbl: TLabel;
    RecordsFoundStrGrid: TStringGrid;
    AddPrimaryDetailHelpBtn: TSpeedButton;
    CompareStopRunBtn: TSpeedButton;
    CancelFindBtn: TSpeedButton;
    BtnCompareRight: TSpeedButton;
    TabSheetFindAndReplace: TTabSheet;
    ToPort: TEdit;
    SQLTypeSelect: TComboBox;
    SpeedButton1: TSpeedButton;
    ToFieldsEdit: TEdit;
    FromFieldsEdit: TEdit;
    FromFieldsLbl: TLabel;
    ToFieldsLbl: TLabel;
    RefreshCSVColumnsBtn: TButton;
    LoadPrimaryColumnsBtn: TButton;
    ClearProjectBtn: TButton;
    ColumnsList: TDBLookupListBox;
    CSVFirstLineCheck: TCheckBox;
    CSVGrid: TDBGrid;
    CSVSearchBtn: TButton;
    CSVSearchCombo: TComboBox;
    CSVSearchEdt: TEdit;
    CSVSearchNextBtn: TButton;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DeleteSelectedRowBtn: TButton;
    ExecuteQueryBtn: TBitBtn;
    ExportSQLBtn: TButton;
    FieldSelectList: TListBox;
    FromDBCombo: TDBLookupComboBox;
    CreateQueriesPopup: TPopupMenu;
    CompareFromGrid: TDBGrid;
    FromRowsCountLabel: TLabel;
    ToTableName: TEdit;
    FromUniqueField: TEdit;
    GenerateInsertsFromAllCSVRecordsMNU: TMenuItem;
    GenerateInsertsfromPrimaryCSVFieldNotFoundMNU: TMenuItem;
    EditMnu: TMenuItem;
    ExportSQLPopup: TPopupMenu;
    GenerateInsertfromResultsetMNU: TMenuItem;
    GenerateQueriesBtn: TButton;
    GenerateUpdatesfromResultsetMNU: TMenuItem;
    GenerateUpdatesfromallCSVrecordsMNU: TMenuItem;
    GenerateUpdatesfromFoundMNU: TMenuItem;
    ImportSaveLogMemoBtn: TButton;
    LoadFromandToDataBtn: TBitBtn;
    CompareToGrid: TDBGrid;
    FromSQLLbl: TLabel;
    FromUniqueFieldLbl: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    ToTableNameLbl: TLabel;
    ToDatabaseLbl: TLabel;
    ToUserNameLbl: TLabel;
    ToPasswordLbl: TLabel;
    ToServerNameLbl: TLabel;
    LoadCSVBtn: TButton;
    LoadTablesBtn: TButton;
    LogMemo: TMemo;
    ToSQLEdit: TMemo;
    OpenProjectBtn: TButton;
    OutputLog: TMemo;
    PageControl1: TPageControl;
    PrimaryColumnEdt: TEdit;
    PrimaryColumnsList: TDBLookupListBox;
    PrimaryTableNameEdt: TEdit;
    ResultsetEditableMnu: TMenuItem;
    FixLinkedValueMenuBtn: TMenuItem;
    CSVGridMenu: TPopupMenu;
    OpenDialog1: TOpenDialog;
    FromPassword: TEdit;
    FromServerName: TEdit;
    FromUserName: TEdit;
    ConnecttoServerBtn: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ProgressBar1: TProgressBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    RowsCountLabel: TLabel;
    SaveDialog1: TSaveDialog;
    About1: TMenuItem;
    SaveProjectBtn: TButton;
    SaveSQLBtn: TButton;
    ScriptGrid: TDBGrid;
    ScriptSQL: TMemo;
    ScriptSQLEdit: TMemo;
    ScriptTableName: TEdit;
    SetupGrid: TStringGrid;
    SQL: TMemo;
    FromSQLEdit: TMemo;
    TabControl1: TTabControl;
    TableList: TDBLookupListBox;
    TabSheetCompareDBs: TTabSheet;
    TabsheetQueriesAndExport: TTabSheet;
    TabSheetImport: TTabSheet;
    TestLinkedTableBtn: TButton;
    ToDatabase: TEdit;
    ToPassword: TEdit;
    ToServerName: TEdit;
    ToUserName: TEdit;
    ValueEdt: TEdit;
    XMLToCSVConvertBtn: TButton;
    procedure AddColumnBtnClick(Sender: TObject);
    procedure AddPrimaryDetailHelpBtnClick(Sender: TObject);
    procedure AddValueBtnClick(Sender: TObject);
    procedure BtnCompareRightClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CancelFindBtnClick(Sender: TObject);
    procedure CompareStopRunBtnClick(Sender: TObject);
    procedure FindandReplaceRecordsBtnClick(Sender: TObject);
    procedure ClearProjectBtnClick(Sender: TObject);
    procedure CSVGridEnter(Sender: TObject);
    procedure CSVSearchBtnClick(Sender: TObject);
    procedure DeleteSelectedRowBtnClick(Sender: TObject);
    procedure FindRecordsBtnClick(Sender: TObject);
    procedure FixLinkedValueMenuBtnClick(Sender: TObject);
    procedure AddLinkedColumnBtnClick(Sender: TObject);
    procedure FromDBComboSelect(Sender: TObject);
    procedure GenerateQueriesBtnClick(Sender: TObject);
    procedure GenerateInsertfromResultsetMNUClick(Sender: TObject);
    procedure GenerateInsertsFromAllCSVRecordsMNUClick(Sender: TObject);
    procedure GenerateInsertsfromPrimaryCSVFieldNotFoundMNUClick(Sender: TObject
      );
    procedure GenerateUpdatesfromallCSVrecordsMNUClick(Sender: TObject);
    procedure GenerateUpdatesfromFoundMNUClick(Sender: TObject);
    procedure GenerateUpdatesfromResultsetMNUClick(Sender: TObject);
    procedure ImportSaveLogMemoBtnClick(Sender: TObject);
    procedure LoadPrimaryColumnsBtnClick(Sender: TObject);
    procedure LoadTablesBtnClick(Sender: TObject);
    procedure AddPrimaryTableDetailBtnClick(Sender: TObject);
    procedure ConnecttoServerBtnClick(Sender: TObject);
    procedure PageControl1Exit(Sender: TObject);
    procedure RefreshCSVColumnsBtnClick(Sender: TObject);
    procedure ScriptGridEnter(Sender: TObject);
    procedure SetupGridDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure TabSheetCompareDBsExit(Sender: TObject);
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
    procedure LoadFromandToDataBtnClick(Sender: TObject);
    procedure ExecuteQueryBtnClick(Sender: TObject);
    procedure LoadCSVBtnClick(Sender: TObject);
    procedure SaveSQLBtnClick(Sender: TObject);
    procedure TestLinkedTableBtnClick(Sender: TObject);
    procedure SetupGridClick(Sender: TObject);
  private
    procedure CloseConnections;
    function GenerateQueryLine(typestr: String): String;
    function getTablePrimaryKey(TableName: String): String;
    function LoadPrimaryTable(): Boolean;
    function OpenTableColumnQuery: Boolean;
    procedure setQueryConnections;
    { Private declarations }
  public
    SetupGridSelectedRow: Integer;
    CSVGridSelectedField: TField;
    SharedSetupGrid: TStringGrid;
    ConnectedVia: String;
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  FieldsString, ValuesString: String;
  RecordGuid: TGUID;
  LastFromDB: Integer;
  StopRunBool: Boolean;
  PreviousScriptsTab: Integer;

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
          SaveDialog1.DefaultExt := '.sql';
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

procedure TMainForm.ExportSQLBtnClick(Sender: TObject);
var
         button: TControl;
         lowerLeft: TPoint;
begin
      if Sender is TControl then
      begin
        button := TControl(Sender);
        lowerLeft := Point(0, button.Height);
        lowerLeft := button.ClientToScreen(lowerLeft);
        ExportSQLPopup.Popup(lowerLeft.X, lowerLeft.Y);
      end;
end;

procedure TMainForm.ConnecttoServerBtnClick(Sender: TObject);
var
          s: String;
      //    PingThread: TPingThread;
begin
      ConnectedVia := 'NULL';
      If ConnecttoServerBtn.Caption = 'Disconnect' then
      begin
      //    PingThread.Terminate;
      //    PingThread.WaitFor;
          CloseConnections();
          ConnecttoServerBtn.Caption := 'Connect';
          Dataform.FromConnection.DatabaseName := '';
          FromDBCombo.Clear;
      end
      else
      begin
          try
            if (SQLTypeSelect.ItemIndex = 0) then
            begin
                 Dataform.FromConnection.Close;
                 Dataform.FromConnection.Params.Clear;
       //     Dataform.FromConnection.Params.Add('DriverID=MSSQL2005');
                 Dataform.FromConnection.UserName := FromUserName.Text;
                 Dataform.FromConnection.Password := FromPassword.Text;
                 Dataform.FromConnection.HostName := FromServerName.Text;
                 Dataform.FromTransaction.DataBase := Dataform.FromConnection;
                 Dataform.ToTransaction.DataBase := Dataform.ToConnection;
                 Dataform.FromConnection.Open;
                 ConnectedVia := 'MSSQL';
                 Dataform.DBQuery1.SQL.Text := 'SELECT name as [Database] FROM sys.databases order by [Database]';
                 Dataform.DBQuery1.SQLConnection := Dataform.FromConnection;
                 Dataform.DBQuery1.Open;
                   // Initialize and start the ping thread
        //         PingThread := TPingThread.Create(Dataform.FromConnection, 300000); // 5-minute interval
        //         PingThread.Start; // Start the thread execution
            end
            else
            begin
               Dataform.FromMySQL80Connection.Close;
               Dataform.FromMySQL80Connection.Params.Clear;
               Dataform.FromMySQL80Connection.UserName := FromUserName.Text;
               Dataform.FromMySQL80Connection.Password := FromPassword.Text;
               Dataform.FromMySQL80Connection.HostName := FromServerName.Text;
               Dataform.FromMySQL80Connection.Port := StrtoInt(FromPort.Text);
               Dataform.FromMySQL80Connection.DatabaseName := 'information_schema';
               Dataform.FromTransaction.DataBase := Dataform.FromMySQL80Connection;
               Dataform.ToTransaction.DataBase := Dataform.ToMySQL80Connection;
               Dataform.FromMySQL80Connection.Open;
               ConnectedVia := 'MySQL';
               Dataform.DBQuery1.SQL.Text := 'SELECT table_schema as `Database` FROM information_schema.tables Group by TABLE_SCHEMA Order by TABLE_SCHEMA';
               Dataform.DBQuery1.SQLConnection := Dataform.FromMySQL80Connection;
               Dataform.DBQuery1.Open;
            end;
            If (LastFromDB < FromDBCombo.Items.Count) and (LastFromDB >= 0) then
            begin
                 FromDBCombo.ItemIndex := LastFromDB;
                 FromDBComboSelect(FromDBCombo);
            end;
            setQueryConnections();
            ConnecttoServerBtn.Caption := 'Disconnect';
          except
          begin
            ShowMessage('Unable to connect to SQL Server!');
            CloseConnections();
          end;
          raise;
          end;
      end;
end;

procedure TMainForm.PageControl1Exit(Sender: TObject);
begin

end;

procedure TMainForm.CloseConnections();
begin
     if (Dataform.FromConnection.Connected) then
     begin
       Dataform.FromConnection.Close;
     end;
     if (Dataform.ToConnection.Connected) then
     begin
       Dataform.ToConnection.Close;
     end;
     if (Dataform.ToMySQL80Connection.Connected) then
     begin
       Dataform.ToMySQL80Connection.Close;
     end;
     if (Dataform.FromMySQL80Connection.Connected) then
     begin
       Dataform.FromMySQL80Connection.Close;
     end;
end;

procedure TMainForm.setQueryConnections();
begin
      if (Dataform.FromConnection.Connected) then
      begin
        DataForm.ScriptQuery0.SQLConnection := Dataform.FromConnection;
        DataForm.ScriptQuery1.SQLConnection := Dataform.FromConnection;
        DataForm.FromQuery1.SQLConnection := Dataform.FromConnection;
        DataForm.TableandColumnsQuery.SQLConnection := Dataform.FromConnection;
        DataForm.TablesQuery1.SQLConnection := Dataform.FromConnection;
        DataForm.ColumnsQuery1.SQLConnection := Dataform.FromConnection;
        DataForm.ColumnsQuery2.SQLConnection := Dataform.FromConnection;
        DataForm.TempQuery1.SQLConnection := Dataform.FromConnection;
        DataForm.ToQuery1.SQLConnection := Dataform.ToConnection;
        DataForm.ToQuery2.SQLConnection := Dataform.ToConnection;
      end
      else
      begin
        DataForm.ScriptQuery0.SQLConnection := Dataform.FromMySQL80Connection;
        DataForm.ScriptQuery1.SQLConnection := Dataform.FromMySQL80Connection;
        DataForm.FromQuery1.SQLConnection := Dataform.FromMySQL80Connection;
        DataForm.TableandColumnsQuery.SQLConnection := Dataform.FromMySQL80Connection;
        DataForm.TablesQuery1.SQLConnection := Dataform.FromMySQL80Connection;
        DataForm.ColumnsQuery1.SQLConnection := Dataform.FromMySQL80Connection;
        DataForm.ColumnsQuery2.SQLConnection := Dataform.FromMySQL80Connection;
        DataForm.TempQuery1.SQLConnection := Dataform.FromMySQL80Connection;
        DataForm.ToQuery1.SQLConnection := Dataform.ToMySQL80Connection;
        DataForm.ToQuery2.SQLConnection := Dataform.ToMySQL80Connection;
      end;
end;

procedure TMainForm.FromDBComboSelect(Sender: TObject);
var
          s: string;
begin
          try
            LastFromDB := FromDBCombo.ItemIndex;
            s := FromDBCombo.Items[FromDBCombo.ItemIndex];
            if (Dataform.FromConnection.Connected) then
            begin
              Dataform.FromConnection.Close;
              Dataform.FromConnection.DatabaseName := s;
              Dataform.FromConnection.Open;
            end
            else
            begin
              Dataform.FromMySQL80Connection.Close;
              Dataform.FromMySQL80Connection.DatabaseName := s;
              Dataform.FromMySQL80Connection.Open;
            end;
            Dataform.DBQuery1.Open;
            FromDBCombo.ItemIndex := LastFromDB;
          except
          begin
            ShowMessage('Unable to select DB , make sure the DB exist');
            CloseConnections();
            ConnecttoServerBtn.Caption := 'Connect';
            Dataform.FromConnection.DatabaseName := '';
          end;
          raise;
          end;

end;

procedure TMainForm.RefreshCSVColumnsBtnClick(Sender: TObject);
var
   i:integer;
begin
      FieldSelectList.Clear;
      for i := 0 to Dataform.CSVDataset.Fields.Count - 1 do
      begin
           FieldSelectList.Items.Add(Dataform.CSVDataset.Fields[i].FieldName);
      end;
end;

procedure TMainForm.ScriptGridEnter(Sender: TObject);
begin
     If ResultsetEditableMnu.Checked = true then
     begin
       ScriptGrid.ReadOnly := False;
     end
     else
     begin
       ScriptGrid.ReadOnly := True;
     end;
end;

procedure TMainForm.SetupGridDrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
var
  AGrid : TStringGrid;
begin
   if ARow <> 0 then
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

end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
  showmessage('Use in SQL [@FIELDS] as placeholder for fields. Use these fields if you are not comparing "*" in your SQL.');
end;

procedure TMainForm.TabControl1Change(Sender: TObject);
var
  TabName, PreviousTabName: String;
  TabIndex: Integer;
  ConfigFilePath :String;
  INI: TINIFile;
begin
      ConfigFilePath := GetAppConfigFile(False);
      INI := TINIFile.Create(ConfigFilePath);
      try
        TabIndex := TabControl1.TabIndex;
        TabName := 'SQL' + InttoStr(TabIndex);
        PreviousTabName := 'SQL' + InttoStr(PreviousScriptsTab);
        INI.WriteString('SCRIPTS',PreviousTabName,EncodeStringBase64(ScriptSQLEdit.Text));
        If INI.ReadString('SCRIPTS',TabName,'') <> '' then
        begin
           ScriptSQLEdit.Text := DecodeStringBase64(INI.ReadString('SCRIPTS',TabName,''));
        end
        else
        begin
            ScriptSQLEdit.Text := '';
        end;
        case TabControl1.TabIndex of
             0 :
               begin
                 ScriptGrid.DataSource := Dataform.ScriptQuerySource0;
                 DBNavigator2.Datasource := Dataform.ScriptQuerySource0;
                 RowsCountLabel.Caption := InttoStr(Dataform.ScriptQuery0.RecordCount);

               end;
             1 :
               begin
                 ScriptGrid.DataSource := Dataform.ScriptQuerySource1;
                 DBNavigator2.Datasource := Dataform.ScriptQuerySource1;
                 RowsCountLabel.Caption := InttoStr(Dataform.ScriptQuery1.RecordCount);
               end;
        end;
        PreviousScriptsTab := TabIndex;
      finally
        INI.Free;
      end;
end;

procedure TMainForm.TabSheetCompareDBsExit(Sender: TObject);
begin
      dataform.FromQuery1.close;
      dataform.ToQuery1.close;
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
                                 S := '"' + RemoveCRLF(Item[j2].TextContent) + '"'
                              else
                                S := S + ',"' + RemoveCRLF(Item[j2].TextContent) + '"'
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
           OpenProjectBtn.Hint := OpenDialog1.FileName;
           OpenProjectBtn.ShowHint := True;
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
     SaveDialog1.FileName := OpenProjectBtn.Hint;
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

procedure TMainForm.GenerateQueriesBtnClick(Sender: TObject);
var
         button: TControl;
         lowerLeft: TPoint;
begin
      if Sender is TControl then
      begin
        button := TControl(Sender);
        lowerLeft := Point(0, button.Height);
        lowerLeft := button.ClientToScreen(lowerLeft);
        CreateQueriesPopup.Popup(lowerLeft.X, lowerLeft.Y);
      end;
end;

procedure TMainForm.GenerateInsertfromResultsetMNUClick(Sender: TObject);
var
          I,ProgressI:Integer;
          FieldsString,ValuesString,QueryString:WideString;
          tempQueryString: WideString;
          ScriptQuery: TSQLQuery;
begin
      if (Dataform.FromConnection.Connected = False) and (Dataform.FromMySQL80Connection.Connected = False) then
      begin
        showmessage('Connect to SQL server first!');
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
      case TabControl1.TabIndex of
       0 :
         begin
           ScriptQuery := DataForm.ScriptQuery0;
         end;
       1 :
         begin
           ScriptQuery := DataForm.ScriptQuery1;
         end;
      end;

      ProgressBar1.Max := ScriptQuery.RecordCount;
      ProgressBar1.Position := 0;
      ScriptQuery.First;
      ScriptQuery.DisableControls;
      while not ScriptQuery.EOF do
      begin
           ProgressBar1.StepIt;
           Application.processMessages;
           for I := 0 to ScriptQuery.Fields.Count - 1 do
          begin
            if FieldsString = '' then
            begin
              FieldsString := ScriptQuery.Fields[I].FieldName;
              ValuesString := ConvertFieldtoSQLString(ScriptQuery.Fields[I]);
            end
            else
            begin
              FieldsString := FieldsString + ',' + ScriptQuery.Fields[I].FieldName;
              ValuesString := ValuesString + ',' + ConvertFieldtoSQLString(ScriptQuery.Fields[I]);
            end;
          end;
          QueryString := 'insert into ' + ScriptTableName.Text + ' (' + FieldsString + ') Values (' + ValuesString + ');' + #13#10;
          tempQueryString := tempQueryString + QueryString;
          FieldsString := '';
          ValuesString := '';
          ScriptQuery.Next;
      end;
      ScriptSQL.Lines.Clear;
      ScriptSQL.Lines.Add(tempQueryString);
      ScriptQuery.EnableControls;
      showmessage('Finished');
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
           QueryString := GenerateQueryLine('Insert');
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
                QueryString := GenerateQueryLine('Insert');
                LogMemo.Lines.Add(QueryString);
           end;
           Dataform.CSVDataset.Next;
      end;
      Dataform.CSVDataset.EnableControls;
end;

procedure TMainForm.GenerateUpdatesfromallCSVrecordsMNUClick(Sender: TObject);
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
           QueryString := GenerateQueryLine('Update');
           LogMemo.Lines.Add(QueryString);
           Dataform.CSVDataset.Next;
      end;
      Dataform.CSVDataset.EnableControls;
      Dataform.FromQuery1.Close;
end;

procedure TMainForm.GenerateUpdatesfromFoundMNUClick(Sender: TObject);
var
          QueryString: String;
          PrimaryCSVColumnStr, PrimaryKeyStr, PrimaryTableNameStr, PrimaryColumnStr: String;
          Found: boolean;
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
           If Dataform.FromQuery1.RecordCount = 1 then
           begin
                FieldsString := '';
                ValuesString := '';
                QueryString := GenerateQueryLine('Update');
                LogMemo.Lines.Add(QueryString);
           end;
           Dataform.CSVDataset.Next;
      end;
      Dataform.CSVDataset.EnableControls;
      Dataform.FromQuery1.Close;
end;

procedure TMainForm.GenerateUpdatesfromResultsetMNUClick(Sender: TObject);
var
          I,ProgressI:Integer;
          FieldsString,KeyColumnName, KeyColumnValue,QueryString:WideString;
          tempQueryString: WideString;
          ScriptQuery: TSQLQuery;
begin
      if (Dataform.FromConnection.Connected = False) and (Dataform.FromMySQL80Connection.Connected = False) then
      begin
        showmessage('Connect to SQL server first!');
        exit;
      end;
      if POS(ScriptTableName.Text,ScriptSQLEdit.Text) = 0 then
      begin
        showmessage('Table name must be present in Query');
        exit;
      end;
      ScriptSQL.Clear;
      FieldsString := '';
      KeyColumnName := getTablePrimaryKey(ScriptTableName.Text);
      KeyColumnValue := '';

      case TabControl1.TabIndex of
       0 :
         begin
           ScriptQuery := DataForm.ScriptQuery0;
         end;
       1 :
         begin
           ScriptQuery := DataForm.ScriptQuery1;
         end;
      end;

      ProgressBar1.Max := ScriptQuery.RecordCount;
      ProgressBar1.Position := 0;
      ScriptQuery.First;
      ScriptQuery.DisableControls;
      while not ScriptQuery.EOF do
      begin
           ProgressBar1.StepIt;
           Application.processMessages;
           for I := 0 to ScriptQuery.Fields.Count - 1 do
           begin
                If ScriptQuery.Fields[I].FieldName <> KeyColumnName then
                begin
                     if FieldsString = '' then
                        FieldsString := ScriptQuery.Fields[I].FieldName + ' = ' +  ConvertFieldtoSQLString(ScriptQuery.Fields[I])
                     else
                         FieldsString := FieldsString + ',' + ScriptQuery.Fields[I].FieldName + ' = ' +  ConvertFieldtoSQLString(ScriptQuery.Fields[I]);
                end
                else
                begin
                     KeyColumnValue := ConvertFieldtoSQLString(ScriptQuery.Fields[I]);
                end;
           end;
           if KeyColumnValue = '' then
           begin
             showmessage('Key Column ' + KeyColumnName + ' not found');
             ScriptQuery.EnableControls;
             exit;
           end;
           QueryString := 'update ' + ScriptTableName.Text + ' set ' + FieldsString + ' where ' + KeyColumnName + ' = ' + KeyColumnValue + ';' + #13#10;
          tempQueryString := tempQueryString + QueryString;
          FieldsString := '';
          ValuesString := '';
          ScriptQuery.Next;
      end;
      ScriptSQL.Lines.Clear;
      ScriptSQL.Lines.Add(tempQueryString);
      ScriptQuery.EnableControls;
      showmessage('Finished');
end;

function TMainForm.GenerateQueryLine(typestr: String): String;
var
          I: integer;
          KeyColumnName, TempValue: String;
begin
      for I := 0 to SetupGrid.RowCount - 1 do
      begin
           if SetupGrid.Cells[0,I] = 'Column' then
           begin
                if typestr = 'Insert' then
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
                end
                else
                begin
                     if FieldsString = '' then
                       FieldsString := SetupGrid.Cells[2,I] + ' = ' +  ConvertFieldtoSQLString(Dataform.CSVDataset.FieldByName(SetupGrid.Cells[1,I]))
                     else
                       FieldsString := FieldsString + ', ' + SetupGrid.Cells[2,I] + ' = ' + ConvertFieldtoSQLString(Dataform.CSVDataset.FieldByName(SetupGrid.Cells[1,I]));
                end;
           end;
           if SetupGrid.Cells[0,I] = 'Primary' then
           begin
                if typestr = 'Insert' then
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
                end
                else
                begin
                     KeyColumnName := getTablePrimaryKey(SetupGrid.Cells[3,I]);
                     If KeyColumnName = 'Failed' then
                     begin
                          showmessage('Primary Key not found for Primary table ' + SetupGrid.Cells[3,I]);
                          exit;
                     end;
                     TempValue := 'select ' + KeyColumnName + ' from ' + SetupGrid.Cells[3,I] +
                     ' where ' + SetupGrid.Cells[4,I] + ' = ''' + Dataform.CSVDataset.FieldByName(SetupGrid.Cells[1,I]).asString + '''';
                     ValuesString := ' where ' + KeyColumnName + ' = (' + TempValue + ');'
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
                if lowercase(Dataform.CSVDataset.FieldByName(SetupGrid.Cells[1,I]).asString) = 'null'   then
                   TempValue := 'null'
                else
                    TempValue := 'select ' + KeyColumnName + ' from ' + SetupGrid.Cells[3,I] +
                    ' where ' + SetupGrid.Cells[4,I] + ' = ''' + Dataform.CSVDataset.FieldByName(SetupGrid.Cells[1,I]).asString + '''';

                if (typestr = 'Insert') then
                begin
                     if FieldsString = '' then
                     begin
                          FieldsString := SetupGrid.Cells[2,I];
                          if TempValue = 'null' then
                             ValuesString := TempValue
                          else
                             ValuesString := '(' + TempValue + ')';
                     end
                     else
                     begin
                          FieldsString := FieldsString + ',' + SetupGrid.Cells[2,I];
                          if TempValue = 'null' then
                              ValuesString := ValuesString + ',' + TempValue
                          else
                              ValuesString := ValuesString + ',' + '(' + TempValue + ')';
                     end;
                end
                else
                begin
                     if FieldsString = '' then
                     begin
                        if TempValue = 'null' then
                           FieldsString := SetupGrid.Cells[2,I] + ' = ' +  TempValue
                        else
                           FieldsString := SetupGrid.Cells[2,I] + ' = ' +  '(' + TempValue + ')';
                     end
                     else
                     begin
                          if TempValue = 'null' then
                             FieldsString := FieldsString + ', ' + SetupGrid.Cells[2,I] + ' = ' + TempValue
                          else
                             FieldsString := FieldsString + ', ' + SetupGrid.Cells[2,I] + ' = ' + '(' + TempValue + ')';
                     end;
                end;
           end;
           if SetupGrid.Cells[0,I] = 'Value' then
           begin
                if pos('[NUM]',SetupGrid.Cells[1,I]) > 0 then
                begin
                     TempValue := stringReplace(SetupGrid.Cells[1,I],'[NUM]','',[rfReplaceAll, rfIgnoreCase]);
                end
                else
                begin
                     TempValue := '''' + SetupGrid.Cells[1,I] + '''';
                end;
                if typestr = 'Insert' then
                begin
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
                end
                else
                begin
                     if FieldsString = '' then
                       FieldsString := SetupGrid.Cells[2,I] + ' = ' + TempValue
                     else
                       FieldsString := FieldsString + ', ' + SetupGrid.Cells[2,I] + ' = ' + TempValue;
                end;
           end;
      end;
      if typestr = 'Insert' then
      begin
           GenerateQueryLine := 'insert into ' + PrimaryTableNameEdt.Text + ' (' + FieldsString + ') Values (' + ValuesString + ');';
      end
      else
      begin
           GenerateQueryLine := 'update ' + PrimaryTableNameEdt.Text + ' set ' + FieldsString + ValuesString;
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

procedure TMainForm.LoadPrimaryColumnsBtnClick(Sender: TObject);
begin
      if PrimaryTableNameEdt.Text = '' then
      begin
        showmessage('Add primary table name');
        exit;
      end;
      Dataform.ColumnsQuery2.Close;
      Dataform.ColumnsQuery2.ParamByName('tablename').Value := PrimaryTableNameEdt.Text;
      Dataform.ColumnsQuery2.Open;
end;

procedure TMainForm.DeleteSelectedRowBtnClick(Sender: TObject);
begin
      SetupGrid.DeleteRow(SetupGrid.Row);
end;

procedure TMainForm.FindRecordsBtnClick(Sender: TObject);
var
          RecordCountQueryStr: String;
begin
      if (Dataform.FromConnection.Connected = False) and (Dataform.FromMySQL80Connection.Connected = False) then
      begin
        showmessage('Connect database first');
        exit;
      end;
      If (OpenTableColumnQuery() <> true) then
      begin
           exit;
      end;
      ProgressBar1.Max := Dataform.TableandColumnsQuery.RecordCount;
      ProgressBar1.Position := 0;
      Dataform.TableandColumnsQuery.First;
      StopRunBool := false;
      CancelFindBtn.Visible := true;
      Dataform.TableandColumnsQuery.DisableControls;
      RecordsFoundMemo.Lines.Clear;
      RecordsFoundStrGrid.RowCount := 1;
      while not Dataform.TableandColumnsQuery.EOF do
      begin
        If (Dataform.FromConnection.Connected) then
        begin
          RecordCountQueryStr := 'select [' + Dataform.TableandColumnsQuery.FieldByName('column_name').asString +
            '] from [' + Dataform.TableandColumnsQuery.FieldByName('table_name').asString +
            '] where [' + Dataform.TableandColumnsQuery.FieldByName('column_name').asString + '] like ''%' + FixSQLString(trim(FindEdt.Text)) +
            '%'';';
        end
        else
        begin
          RecordCountQueryStr := 'select `' + Dataform.TableandColumnsQuery.FieldByName('column_name').asString +
            '` from ' + Dataform.TableandColumnsQuery.FieldByName('table_name').asString +
            ' where `' + Dataform.TableandColumnsQuery.FieldByName('column_name').asString + '` like ''%' + FixMySQLString(trim(FindEdt.Text)) +
            '%'';';
        end;
        try
          Dataform.TempQuery1.Close;
          Dataform.TempQuery1.SQL.Text := RecordCountQueryStr;
          Dataform.TempQuery1.Open;
        except
          on E : Exception do
          begin
            if ((Dataform.FromConnection.Connected) and (Pos('Error 20018', E.Message) > 0)) then
            begin
              Dataform.TableandColumnsQuery.Next;
              ProgressBar1.StepIt;
              Application.processMessages;
              Continue;
            end;
            RecordsFoundMemo.Lines.Add('Query failed: ' + E.Message);
            RecordsFoundMemo.Lines.Add(RecordCountQueryStr);
            exit;
          end;
        end;
        if (Dataform.tempQuery1.RecordCount > 0) then
        begin
          Dataform.tempQuery1.Last;
          RecordsFoundStrGrid.RowCount := RecordsFoundStrGrid.RowCount + 1;
          RecordsFoundStrGrid.Cells[0,RecordsFoundStrGrid.RowCount - 1] := Dataform.TableandColumnsQuery.FieldByName('table_name').asString;
          RecordsFoundStrGrid.Cells[1,RecordsFoundStrGrid.RowCount - 1] := Dataform.TableandColumnsQuery.FieldByName('column_name').asString;
          RecordsFoundStrGrid.Cells[2,RecordsFoundStrGrid.RowCount - 1] := InttoStr(Dataform.tempQuery1.RecordCount);
          If (Dataform.FromConnection.Connected) then
          begin
            RecordsFoundMemo.Lines.Add('select * from [' + Dataform.TableandColumnsQuery.FieldByName('table_name').asString +
            '] where [' + Dataform.TableandColumnsQuery.FieldByName('column_name').asString + '] like ''%' + FixSQLString(trim(FindEdt.Text)) +
            '%'';');
          end
          else
          begin
            RecordsFoundMemo.Lines.Add('select * from ' + Dataform.TableandColumnsQuery.FieldByName('table_name').asString +
            ' where `' + Dataform.TableandColumnsQuery.FieldByName('column_name').asString + '` like ''%' + FixMySQLString(trim(FindEdt.Text)) +
            '%'';');
          end;
        end;
        Dataform.TableandColumnsQuery.Next;
        ProgressBar1.StepIt;
        if StopRunBool then
        begin
             break;
        end;
        Application.processMessages;
      end;
      CancelFindBtn.Visible := false;
      Dataform.TableandColumnsQuery.EnableControls;
      Dataform.TempQuery1.Close;
      showmessage('Finished');
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

procedure TMainForm.AddPrimaryDetailHelpBtnClick(Sender: TObject);
begin
      showmessage('Each project requires a primary detail record. Usage instructions: First, select the CSV column that will be used to check if the imported record exists. Then, choose the linked table, which should be the same as the primary table. Finally, select the column from the link table that will be used to verify if the record already exists.');
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

procedure TMainForm.Button4Click(Sender: TObject);
var
          SQLString: String;
//          StrList: TStringList;
          startpos, endpos: Integer;
          C: Char;
          isinQuoted: Boolean;
begin
      if copy(ScriptSQLEdit.Text,ScriptSQLEdit.SelStart+1,ScriptSQLEdit.SelLength) = '' then
          SQLString := ScriptSQLEdit.Text
      else
          SQLString := copy(ScriptSQLEdit.Text,ScriptSQLEdit.SelStart+1,ScriptSQLEdit.SelLength);
      startpos := 1;
      endpos := 1;
      isinQuoted := false;
      for C in SQLString do
      begin
        if (C = char(39)) and (isinQuoted = false) then
          isinQuoted := true
        else if (C = char(39)) and (isinQuoted = true) then
          isinQuoted := false;
        if (C = ';') and (isinQuoted = false) then
        begin
          ScriptSQL.Lines.Add(trim(copy(SQLString,startpos,((endpos+1) - startpos))));
          startpos := (endpos+1);
        end;
        inc(endpos);
      end;
//      StrList := TStringList.Create;
//      StrList.Delimiter := ';';
//      StrList.StrictDelimiter := True;
//      StrList.DelimitedText := SQLString;
//      ScriptSQL.Lines.Clear;
//      for i := 0 to StrList.count -1 do
//      begin
//        ScriptSQL.Lines.Add(StrList[i]);
//      end;
//      StrList.Free;
end;

procedure TMainForm.CancelFindBtnClick(Sender: TObject);
begin
  StopRunBool := true;
end;

procedure TMainForm.CompareStopRunBtnClick(Sender: TObject);
begin
      StopRunBool := true;
end;

procedure TMainForm.FindandReplaceRecordsBtnClick(Sender: TObject);
var
          RecordCountQueryStr: String;
begin
      if (Dataform.FromConnection.Connected = False) and (Dataform.FromMySQL80Connection.Connected = False) then
      begin
        showmessage('Connect database first');
        exit;
      end;
      If (OpenTableColumnQuery() <> true) then
      begin
           exit;
      end;
      ProgressBar1.Max := Dataform.TableandColumnsQuery.RecordCount;
      ProgressBar1.Position := 0;
      Dataform.TableandColumnsQuery.First;
      StopRunBool := false;
      CancelFindBtn.Visible := true;
      Dataform.TableandColumnsQuery.DisableControls;
      RecordsFoundMemo.Lines.Clear;
      RecordsFoundStrGrid.RowCount := 1;
      while not Dataform.TableandColumnsQuery.EOF do
      begin
        If (Dataform.FromConnection.Connected) then
        begin
          RecordCountQueryStr := 'select [' + Dataform.TableandColumnsQuery.FieldByName('column_name').asString +
            '] from [' + Dataform.TableandColumnsQuery.FieldByName('table_name').asString +
            '] where [' + Dataform.TableandColumnsQuery.FieldByName('column_name').asString + '] like ''%' + FixSQLString(trim(FindEdt.Text)) +
            '%'';';
        end
        else
        begin
          RecordCountQueryStr := 'select `' + Dataform.TableandColumnsQuery.FieldByName('column_name').asString +
            '` from ' + Dataform.TableandColumnsQuery.FieldByName('table_name').asString +
            ' where `' + Dataform.TableandColumnsQuery.FieldByName('column_name').asString + '` like ''%' + FixMySQLString(trim(FindEdt.Text)) +
            '%'';';
        end;
        try
          Dataform.TempQuery1.Close;
          Dataform.TempQuery1.SQL.Text := RecordCountQueryStr;
          Dataform.TempQuery1.Open;
        except
          on E : Exception do
          begin
            if ((Dataform.FromConnection.Connected) and (Pos('Error 20018', E.Message) > 0)) then
            begin
              Dataform.TableandColumnsQuery.Next;
              ProgressBar1.StepIt;
              Application.processMessages;
              Continue;
            end;
            RecordsFoundMemo.Lines.Add('Query failed: ' + E.Message);
            RecordsFoundMemo.Lines.Add(RecordCountQueryStr);
            exit;
          end;
        end;
        if (Dataform.tempQuery1.RecordCount > 0) then
        begin
          Dataform.tempQuery1.Last;
          RecordsFoundStrGrid.RowCount := RecordsFoundStrGrid.RowCount + 1;
          RecordsFoundStrGrid.Cells[0,RecordsFoundStrGrid.RowCount - 1] := Dataform.TableandColumnsQuery.FieldByName('table_name').asString;
          RecordsFoundStrGrid.Cells[1,RecordsFoundStrGrid.RowCount - 1] := Dataform.TableandColumnsQuery.FieldByName('column_name').asString;
          RecordsFoundStrGrid.Cells[2,RecordsFoundStrGrid.RowCount - 1] := InttoStr(Dataform.tempQuery1.RecordCount);
          If (Dataform.FromConnection.Connected) then
          begin
            RecordsFoundMemo.Lines.Add('update [' + Dataform.TableandColumnsQuery.FieldByName('table_name').asString +
              '] set [' + Dataform.TableandColumnsQuery.FieldByName('column_name').asString + '] = replace([' +
              Dataform.TableandColumnsQuery.FieldByName('column_name').asString + '], ''' + FixSQLString(trim(FindEdt.Text)) + ''', ''' +
              FixSQLString(trim(ReplaceWithEdt.Text)) + ''');');
          end
          else
          begin
            RecordsFoundMemo.Lines.Add('update `' + Dataform.TableandColumnsQuery.FieldByName('table_name').asString +
              '` set `' + Dataform.TableandColumnsQuery.FieldByName('column_name').asString + '` = replace(`' +
              Dataform.TableandColumnsQuery.FieldByName('column_name').asString + '`, ''' + FixMySQLString(trim(FindEdt.Text)) + ''', ''' +
              FixMySQLString(trim(ReplaceWithEdt.Text)) + ''');');
          end;
        end;
        Dataform.TableandColumnsQuery.Next;
        ProgressBar1.StepIt;
        if StopRunBool then
        begin
             break;
        end;
        Application.processMessages;
      end;
      CancelFindBtn.Visible := false;
      Dataform.TableandColumnsQuery.EnableControls;
      Dataform.TempQuery1.Close;
      showmessage('Finished');
end;

function TMainForm.OpenTableColumnQuery(): Boolean;
var
         TableColumnQueryStr: String;
begin
    If (Dataform.FromConnection.Connected) then
    begin
      TableColumnQueryStr := 'select a.TABLE_CATALOG as table_schema, a.TABLE_NAME as table_name, a.COLUMN_NAME as column_name';
      TableColumnQueryStr := TableColumnQueryStr + ' FROM information_schema.columns a';
      TableColumnQueryStr := TableColumnQueryStr + ' LEFT OUTER JOIN INFORMATION_SCHEMA.VIEWS b ON a.TABLE_CATALOG = b.TABLE_CATALOG AND a.TABLE_SCHEMA = b.TABLE_SCHEMA AND a.TABLE_NAME = b.TABLE_NAME';
      TableColumnQueryStr := TableColumnQueryStr + ' where b.TABLE_NAME is null and a.TABLE_CATALOG = ''' + FromDBCombo.Items[FromDBCombo.ItemIndex] + '''';
      TableColumnQueryStr := TableColumnQueryStr + ' and NOT a.DATA_TYPE = ''image''';
      if (PrefixEdt.text <> '') then
        TableColumnQueryStr := TableColumnQueryStr + ' and table_name like ''' + PrefixEdt.text + '%''';
    end
    else
    begin
      TableColumnQueryStr := 'select table_schema, table_name, column_name FROM information_schema.columns';
      TableColumnQueryStr := TableColumnQueryStr + ' where table_schema = ''' + FromDBCombo.Items[FromDBCombo.ItemIndex] + '''';
      if (PrefixEdt.text <> '') then
        TableColumnQueryStr := TableColumnQueryStr + ' and table_name like ''' + PrefixEdt.text + '%''';
    end;
    try
      DataForm.TableandColumnsQuery.close;
      with Dataform.TableandColumnsQuery.SQL do
      begin
        Clear;
        Text := TableColumnQueryStr;
      end;
      Dataform.TableandColumnsQuery.Prepare;
      Dataform.TableandColumnsQuery.Open;
    except
      on E : Exception do
      begin
        RecordsFoundMemo.Lines.Add('Get Tables and Columns failed: ' + E.Message);
        OpenTableColumnQuery := false;
      end;
    end;
    Dataform.TableandColumnsQuery.Last;
    OpenTableColumnQuery := true;
end;

procedure TMainForm.ClearProjectBtnClick(Sender: TObject);
begin
      if MessageDlg('Are you sure you want to clear the project!',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
           SetupGrid.RowCount := 1;
      end;
end;

procedure TMainForm.CSVGridEnter(Sender: TObject);
begin
      If ResultsetEditableMnu.Checked = true then
      begin
        CSVGrid.ReadOnly := False;
      end
      else
      begin
        CSVGrid.ReadOnly := True;
      end;
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
      If TableList.Items[TableList.ItemIndex] <> PrimaryTableNameEdt.Text then
      begin
        showmessage('Link Table Must be the same as Primary table');
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
      INI := TINIFile.Create(ConfigFilePath);
      try
        LastFromDB := INI.ReadInteger('DB','FromDatabase',-1);
        FromUserName.Text := INI.ReadString('DB','FromUserName','');
        FromPassword.Text := Decrypt(INI.ReadString('DB','FromPassword',''));
        FromServerName.Text := INI.ReadString('DB','FromServerName','');
        FromPort.Text := INI.ReadString('DB','FromPort','');
        SQLTypeSelect.ItemIndex := INI.ReadInteger('DB','SQLType',0);
        ToTableName.Text := INI.ReadString('COMPARE','ToTableName','');
        FromUniqueField.Text := INI.ReadString('COMPARE','FromUniqueField','');
        FromSQLEdit.Text := DecodeStringBase64(INI.ReadString('COMPARE','FromSQLEdit',''));
        ToSQLEdit.Text := DecodeStringBase64(INI.ReadString('COMPARE','ToSQLEdit',''));
        FromFieldsEdit.Text := INI.ReadString('COMPARE','FromFieldsEdit','');
        ToFieldsEdit.Text := INI.ReadString('COMPARE','ToFieldsEdit','');
        ToUserName.Text := INI.ReadString('COMPARE','ToUserName','');
        ToPassword.Text := Decrypt(INI.ReadString('COMPARE','ToPassword',''));
        ToServerName.Text := INI.ReadString('COMPARE','ToServerName','');
        ToPort.Text := INI.ReadString('COMPARE','ToPort','');
        ToDatabase.Text := INI.ReadString('COMPARE','ToDatabase','');
        FindEdt.Text := INI.ReadString('FINDANDREPLACE','Find','');
        ReplaceWithEdt.Text := INI.ReadString('FINDANDREPLACE','ReplaceWith','');
        PrefixEdt.Text := INI.ReadString('FINDANDREPLACE','Prefix','');
        If INI.ReadString('SCRIPTS','SQL0','') <> '' then
           ScriptSQLEdit.Text := DecodeStringBase64(INI.ReadString('SCRIPTS','SQL0',''));
        Pagecontrol1.TabIndex := INI.ReadInteger('FORM','PageControl1',0);
      finally
        INI.Free;
      end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
        ConfigFilePath :String;
        INI: TINIFile;
begin
      CloseConnections();

      ConfigFilePath := GetAppConfigFile(False);
      INI := TINIFile.Create(ConfigFilePath);
      try
        INI.WriteString('DB','FromUserName',FromUserName.Text);
        INI.WriteString('DB','FromPassword',encrypt(FromPassword.Text));
        INI.WriteString('DB','FromServerName',FromServerName.Text);
        INI.WriteString('DB','FromPort',FromPort.Text);
        If SQLTypeSelect.ItemIndex <> -1 then
          INI.WriteInteger('DB','SQLType',SQLTypeSelect.ItemIndex);
        If LastFromDB <> -1 then
          INI.WriteInteger('DB','FromDatabase',LastFromDB);
        INI.WriteString('COMPARE','ToTableName',ToTableName.Text);
        INI.WriteString('COMPARE','FromUniqueField',FromUniqueField.Text);
        INI.WriteString('COMPARE','FromSQLEdit',EncodeStringBase64(FromSQLEdit.Text));
        INI.WriteString('COMPARE','ToSQLEdit',EncodeStringBase64(ToSQLEdit.Text));
        INI.WriteString('COMPARE','FromFieldsEdit',FromFieldsEdit.Text);
        INI.WriteString('COMPARE','ToFieldsEdit',ToFieldsEdit.Text);
        INI.WriteString('COMPARE','ToUserName',ToUserName.Text);
        INI.WriteString('COMPARE','ToPassword',encrypt(ToPassword.Text));
        INI.WriteString('COMPARE','ToServerName',ToServerName.Text);
        INI.WriteString('COMPARE','ToPort',ToPort.Text);
        INI.WriteString('COMPARE','ToDatabase',ToDatabase.Text);
        INI.WriteString('FINDANDREPLACE','Find',FindEdt.Text);
        INI.WriteString('FINDANDREPLACE','ReplaceWith',ReplaceWithEdt.Text);
        INI.WriteString('FINDANDREPLACE','Prefix',PrefixEdt.Text);
        INI.WriteString('SCRIPTS','SQL' + InttoStr(TabControl1.TabIndex),EncodeStringBase64(ScriptSQLEdit.Text));
        INI.WriteInteger('FORM','PageControl1',Pagecontrol1.TabIndex);
      finally
        INI.Free;
      end;

end;

procedure TMainForm.LoadFromandToDataBtnClick(Sender: TObject);
var
          ToSQLtext,FromSQLtext:string;
begin
          if (Dataform.FromConnection.Connected = False) and (Dataform.FromMySQL80Connection.Connected = False) then
          begin
            showmessage('Connect database first!');
            exit;
          end;
          FromSQLtext := FromSQLEdit.Text;
          if  FromFieldsEdit.Text <> '' then
          begin
               FromSQLtext := StringReplace(FromSQLtext,'[@FIELDS]', FromFieldsEdit.Text , [rfReplaceAll, rfIgnoreCase]);
          end;
          If (ToSQLEdit.Text <> '') then
            ToSQLtext := ToSQLEdit.Text
          else
            ToSQLtext := FromSQLtext;
          if  ToFieldsEdit.Text <> '' then
          begin
               ToSQLtext := StringReplace(ToSQLtext,'[@FIELDS]', ToFieldsEdit.Text , [rfReplaceAll, rfIgnoreCase]);
          end
          else if FromFieldsEdit.Text <> '' then
          begin
               ToSQLtext := StringReplace(ToSQLtext,'[@FIELDS]', FromFieldsEdit.Text , [rfReplaceAll, rfIgnoreCase]);
          end;
          if (POS(ToTableName.Text,ToSQLtext) = 0) then
          begin
            showmessage('Table name must be present in To Query!');
            exit;
          end;
          try
            DataForm.FromQuery1.close;
            Dataform.FromQuery1.SQL.Text := FromSQLtext;
            Dataform.FromQuery1.Open;
          except
          begin
            ShowMessage('Unable to run query on From Server');
          end;
          raise;
          end;
          try
            If (Dataform.FromConnection.Connected) then
            begin
              Dataform.ToConnection.Close;
              Dataform.ToConnection.Params.Clear;
              Dataform.ToConnection.DatabaseName :=  ToDatabase.Text;
              Dataform.ToConnection.UserName := ToUserName.Text;
              Dataform.ToConnection.Password := ToPassword.Text;
              Dataform.ToConnection.HostName := ToServerName.Text;
              Dataform.ToConnection.Open;
            end
            else
            begin
              Dataform.ToMySQL80Connection.Close;
              Dataform.ToMySQL80Connection.Params.Clear;
              Dataform.ToMySQL80Connection.UserName := ToUserName.Text;
              Dataform.ToMySQL80Connection.Password := ToPassword.Text;
              Dataform.ToMySQL80Connection.HostName := ToServerName.Text;
              Dataform.ToMySQL80Connection.Port := StrtoInt(ToPort.Text);
              Dataform.ToMySQL80Connection.DatabaseName := ToDatabase.Text;
              Dataform.ToMySQL80Connection.Open;
            end;
            DataForm.ToQuery1.close;
            Dataform.ToQuery1.SQL.Text := ToSQLtext;
            Dataform.ToQuery1.Open;
            FromRowsCountLabel.Caption := InttoStr(DataForm.FromQuery1.RecordCount);
          except
          begin
            ShowMessage('Unable to run query on To Server');
            Dataform.ToConnection.Close;
          end;
          raise;
          end;
          if (Dataform.ToQuery1.FieldCount <> Dataform.FromQuery1.FieldCount) then
          begin
            ShowMessage('From and To column count do not match');
          end;
end;

procedure TMainForm.BtnCompareRightClick(Sender: TObject);
var
          I:Integer;
          s,ToSQL,ToFields: String;
          RecordChanged: Boolean;
          FieldsString,ValuesString,QueryString:String;
begin
          if (Dataform.ToConnection.Connected = False) and (Dataform.ToMySQL80Connection.Connected = False) then
          begin
            showmessage('Connect to SQL server first');
            exit;
          end;
          if (Dataform.ToQuery1.FieldCount <> Dataform.FromQuery1.FieldCount) then
          begin
            ShowMessage('From and To column count do not match');
            exit;
          end;
          Outputlog.Clear;
          SQL.Clear;
          FieldsString := '';
          ValuesString := '';

          If ToFieldsEdit.Text <> '' then
          begin
            ToFields := ToFieldsEdit.Text;
          end
          else if FromFieldsEdit.Text <> '' then
          begin
            ToFields := FromFieldsEdit.Text;
          end
          else
          begin
            ToFields := '*';
          end;

          OutputLog.Lines.Clear;
          ProgressBar1.Max := Dataform.FromQuery1.RecordCount;
          ProgressBar1.Position := 0;
          StopRunBool := false;
          CompareStopRunBtn.Visible := true;
          Dataform.FromQuery1.First;
          Dataform.FromQuery1.DisableControls;
          while not Dataform.FromQuery1.EOF do
          begin
            ProgressBar1.StepIt;
            if StopRunBool then
            begin
              break;
            end;
            Application.processMessages;

            ToSQL := 'select ' + ToFields + ' from ' + ToTableName.Text;
            ToSQL := ToSQL + ' where ' + FROMUniquefield.Text + ' = ' + ConvertFieldtoSQLString(Dataform.FromQuery1.FieldByName(FromUniquefield.Text));

            DataForm.ToQuery2.close;
            Dataform.ToQuery2.SQL.Text := ToSQL;
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
              QueryString := 'insert into ' + ToTableName.Text + ' (' + FieldsString + ') Values (' + ValuesString + ');';
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
                if ConvertFieldtoSQLString(Dataform.ToQuery2.Fields[I]) <> ConvertFieldtoSQLString(Dataform.FromQuery1.Fields[I]) then
                begin
                  RecordChanged := True;
                  if FieldsString = '' then
                    FieldsString := DataForm.FromQuery1.Fields[I].FieldName + ' = ' +  ConvertFieldtoSQLString(DataForm.FromQuery1.Fields[I])
                  else
                    FieldsString := FieldsString + ',' + DataForm.FromQuery1.Fields[I].FieldName + ' = ' +  ConvertFieldtoSQLString(DataForm.FromQuery1.Fields[I]);
                end;
              end;
              if RecordChanged = true then
              begin
                QueryString := 'update ' + ToTableName.Text + ' set ' + FieldsString + ' where ' + FromUniqueField.Text + ' = ' + ConvertFieldtoSQLString(Dataform.FromQuery1.FieldByName(FromUniquefield.Text)) + ';';
                SQL.Lines.Add(QueryString);
                FieldsString := '';
                OutputLog.Lines.Add(s);
              end;
            end;
            Dataform.FromQuery1.Next;
          end;
          CompareStopRunBtn.Visible := false;
          Dataform.FromQuery1.First;
          Dataform.FromQuery1.EnableControls;
          dataform.ToQuery2.close;
          showmessage('Finished');
end;


procedure TMainForm.ExecuteQueryBtnClick(Sender: TObject);
var
          SQLString, ResultString: String;
begin
          if (Dataform.FromConnection.Connected = False) and (Dataform.FromMySQL80Connection.Connected = False) then
          begin
            showmessage('Connect database first');
            exit;
          end;

          try
            if copy(ScriptSQLEdit.Text,ScriptSQLEdit.SelStart+1,ScriptSQLEdit.SelLength) = '' then
                SQLString := ScriptSQLEdit.Text
            else
                SQLString := copy(ScriptSQLEdit.Text,ScriptSQLEdit.SelStart+1,ScriptSQLEdit.SelLength);
            case TabControl1.TabIndex of
                 0 :
                   begin
                        DataForm.ScriptQuery0.close;
                        ScriptGrid.DataSource := Dataform.ScriptQuerySource0;
                        DBNavigator2.Datasource := Dataform.ScriptQuerySource0;
                        with Dataform.ScriptQuery0.SQL do
                        begin
                          Clear;
                          Text := SQLString;
                        end;
                        Dataform.ScriptQuery0.Prepare;
                        If (Dataform.ScriptQuery0.StatementType = stSelect) then
                        begin
                           Dataform.ScriptQuery0.Open;
                           RowsCountLabel.Caption := InttoStr(Dataform.ScriptQuery0.RecordCount);
                        end
                        else If (Dataform.ScriptQuery1.StatementType = stUnknown) or (Dataform.ScriptQuery1.StatementType = stDDL) then
                        begin
                           Dataform.ScriptQuery1.Transaction.Active := false;
                           Dataform.ScriptQuery1.ExecSQL;
                           Dataform.ScriptQuery1.Transaction.Active := true;
                           showmessage('Command Execution finished');
                        end
                        else
                        begin
                            Dataform.ScriptQuery0.ExecSQL;
                            ResultString := 'Query executed: ' + InttoStr(Dataform.ScriptQuery0.RowsAffected) + ' Record affected';
                            ScriptSQL.Lines.Add(ResultString);
                            showmessage(ResultString);
                        end;
                   end;
                 1 :
                   begin
                        DataForm.ScriptQuery1.close;
                        ScriptGrid.DataSource := Dataform.ScriptQuerySource1;
                        DBNavigator2.Datasource := Dataform.ScriptQuerySource1;
                        with Dataform.ScriptQuery1.SQL do
                        begin
                          Clear;
                          Text := SQLString;
                        end;
                        Dataform.ScriptQuery1.Prepare;
                        If (Dataform.ScriptQuery1.StatementType = stSelect) then
                        begin
                           Dataform.ScriptQuery1.Open;
                           RowsCountLabel.Caption := InttoStr(Dataform.ScriptQuery1.RecordCount);
                        end
                        else If (Dataform.ScriptQuery1.StatementType = stUnknown) or (Dataform.ScriptQuery1.StatementType = stDDL) then
                        begin
                           Dataform.ScriptQuery1.Transaction.Active := false;
                           Dataform.ScriptQuery1.ExecSQL;
                           Dataform.ScriptQuery1.Transaction.Active := true;
                           showmessage('Command Execution finished');
                        end
                        else
                        begin
                            Dataform.ScriptQuery1.ExecSQL;
                            ResultString := 'Query executed: ' + InttoStr(Dataform.ScriptQuery1.RowsAffected) + ' Record affected';
                            ScriptSQL.Lines.Add(ResultString);
                            showmessage(ResultString);
                        end;
                   end;
            end;

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
            LoadCSVBtn.Hint := OpenDialog1.filename;
            LoadCSVBtn.ShowHint := True;
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
          if (Dataform.FromConnection.Connected = False) and (Dataform.FromMySQL80Connection.Connected = False) then
          begin
            showmessage('Connect from database first!');
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
               if (Dataform.CSVDataset.FieldByName(SetupGrid.Cells[1,SetupGridSelectedRow]).asString = 'NULL') then
               begin
                 Dataform.CSVDataset.Next;
                 continue;
               end;
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
      if (Dataform.FromConnection.Connected) then
      begin
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
      end
      else
      begin
        Query1.Database := Dataform.FromMySQL80Connection;
        with Query1.SQL do
        begin
             Clear;
             Add('SHOW KEYS FROM ' + TableName + ' WHERE Key_name = ''PRIMARY''');
        end;
        Query1.Open;
      end;
      If Query1.RecordCount > 0 then
      begin
           KeyColumnName := Query1.FieldbyName('Column_name').AsString;
      end
      else
      begin
           KeyColumnName := 'Failed';
      end;
      getTablePrimaryKey := KeyColumnName;
end;

end.
