unit MainFrm;

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Grids,
  DBGrids, StdCtrls, Buttons, Menus, ComCtrls, DbCtrls, ExtCtrls, ActnList,
  UtilsUnit, Types, IniFiles, DB, sqldb, BufDataset, laz2_DOM, laz2_XMLRead,
  Base64;

type

  { TMainForm }

  TMainForm = class(TForm)
    AddColumnBtn: TButton;
    AddLinkedColumnBtn: TButton;
    AddPrimaryTableDetailBtn: TButton;
    AddValueBtn: TButton;
    AddPrimaryDetailHelpBtn: TBitBtn;
    BtnCompareRight: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    FromPort: TEdit;
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
    CompareStopRunBtn: TBitBtn;
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
    CloseBtn: TBitBtn;
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
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
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
    procedure Button4Click(Sender: TObject);
    procedure ClearProjectBtnClick(Sender: TObject);
    procedure CommitResultsetBtnClick(Sender: TObject);
    procedure CompareStopRunBtnClick(Sender: TObject);
    procedure CSVGridEnter(Sender: TObject);
    procedure CSVSearchBtnClick(Sender: TObject);
    procedure DeleteSelectedRowBtnClick(Sender: TObject);
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
    procedure RefreshCSVColumnsBtnClick(Sender: TObject);
    procedure ScriptGridEnter(Sender: TObject);
    procedure SetupGridDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
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
    procedure BtnCompareRightClick(Sender: TObject);
    procedure ExecuteQueryBtnClick(Sender: TObject);
    procedure LoadCSVBtnClick(Sender: TObject);
    procedure SaveSQLBtnClick(Sender: TObject);
    procedure TestLinkedTableBtnClick(Sender: TObject);
    procedure SetupGridClick(Sender: TObject);
  private
    function GenerateQueryLine(typestr: String): String;
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

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
        ConfigFilePath :String;
        INI: TINIFile;
begin
      Dataform.FromQuery1.Close;
      Dataform.ToQuery1.Close;
      Dataform.ToQuery2.Close;

      ConfigFilePath := GetAppConfigFile(False);
      INI := TINIFile.Create(ConfigFilePath);
      try
        If FromDBCombo.ItemIndex <> -1 then
          INI.WriteInteger('DB','FromDatabase',FromDBCombo.ItemIndex);
        INI.WriteString('DB','FromUserName',FromUserName.Text);
        INI.WriteString('DB','FromPassword',encrypt(FromPassword.Text));
        INI.WriteString('DB','FromServerName',FromServerName.Text);
        INI.WriteString('DB','FromPort',FromPort.Text);
        If SQLTypeSelect.ItemIndex <> -1 then
          INI.WriteInteger('DB','SQLType',SQLTypeSelect.ItemIndex);
        INI.WriteString('COMPARE','ToTableName',ToTableName.Text);
        INI.WriteString('COMPARE','FromUniqueField',FromUniqueField.Text);
        INI.WriteString('COMPARE','FromSQLEdit',EncodeStringBase64(FromSQLEdit.Text));
        INI.WriteString('COMPARE','ToSQLEdit',EncodeStringBase64(ToSQLEdit.Text));
        INI.WriteString('COMPARE','FromFieldsEdit',FromFieldsEdit.Text);
        INI.WriteString('COMPARE','ToFieldsEdit',ToFieldsEdit.Text);
        INI.WriteString('COMPARE','ToUserName',ToUserName.Text);
        INI.WriteString('COMPARE','ToPassword',encrypt(ToPassword.Text));
        INI.WriteString('COMPARE','ToServerName',ToServerName.Text);
        INI.WriteString('COMPARE','ToDatabase',ToDatabase.Text);
        INI.WriteString('SCRIPTS','SQL' + InttoStr(TabControl1.TabIndex),EncodeStringBase64(ScriptSQLEdit.Text));
        INI.WriteInteger('FORM','PageControl1',Pagecontrol1.TabIndex);
      finally
        INI.Free;
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
begin
      If ConnecttoServerBtn.Caption = 'Disconnect server' then
      begin
          if (SQLTypeSelect.ItemIndex = 0) then
          begin
            Dataform.FromConnection.Close;
          end
          else
          begin
            Dataform.FromMySQL80Connection.Close;
          end;
          Dataform.ToConnection.Close;
          ConnecttoServerBtn.Caption := 'Connect to server';
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
                 Dataform.FromConnection.Open;
                 Dataform.DBQuery1.SQL.Text := 'SELECT name as [Database] FROM sys.databases order by [Database]';
                 Dataform.DBQuery1.SQLConnection := Dataform.FromConnection;
                 Dataform.DBQuery1.Open;
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
               Dataform.FromMySQL80Connection.Open;
               Dataform.DBQuery1.SQL.Text := 'show databases';
               Dataform.DBQuery1.SQLConnection := Dataform.FromMySQL80Connection;
               Dataform.DBQuery1.Open;
            end;
            If (LastFromDB < FromDBCombo.Items.Count) and (LastFromDB >= 0) then
            begin
                 FromDBCombo.ItemIndex := LastFromDB;
                 FromDBComboSelect(FromDBCombo);
            end;
            ConnecttoServerBtn.Caption := 'Disconnect server';
          except
          begin
            ShowMessage('Unable to connect to SQL Server!');
            if (SQLTypeSelect.ItemIndex = 0) then
            begin
              Dataform.FromConnection.Close;
            end
            else
            begin
              Dataform.FromMySQL80Connection.Close;
            end;
          end;
          raise;
          end;
      end;
end;

procedure TMainForm.FromDBComboSelect(Sender: TObject);
var
          s: string;
begin
          try
            LastFromDB := FromDBCombo.ItemIndex;
            s := FromDBCombo.Items[FromDBCombo.ItemIndex];
            if (SQLTypeSelect.ItemIndex = 0) then
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
            if (SQLTypeSelect.ItemIndex = 0) then
            begin
              Dataform.FromConnection.Close;
            end
            else
            begin
              Dataform.FromMySQL80Connection.Close;
            end;
            ConnecttoServerBtn.Caption := 'Connect to server';
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
                TempValue := 'select ' + KeyColumnName + ' from ' + SetupGrid.Cells[3,I] +
                ' where ' + SetupGrid.Cells[4,I] + ' = ''' + Dataform.CSVDataset.FieldByName(SetupGrid.Cells[1,I]).asString + '''';

                if typestr = 'Insert' then
                begin
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
                end
                else
                begin
                     if FieldsString = '' then
                       FieldsString := SetupGrid.Cells[2,I] + ' = ' +  '(' + TempValue + ')'
                     else
                       FieldsString := FieldsString + ', ' + SetupGrid.Cells[2,I] + ' = ' + '(' + TempValue + ')';
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
     showmessage('Each project needs an primary detail record. Usage instuctions: Select the CSV Column that will be used to search if the imported record exist. Then choose the linked table the same as the primary table. Next select the link table column that will be used to search if the record exist.');
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
begin
//     showmessage(inttostr(TabControl1.TabIndex));
//     showmessage(Tabcontrol1.Tabs[TabControl1.TabIndex]);
      showmessage(Dataform.FromConnection.DatabaseName);
end;

procedure TMainForm.ClearProjectBtnClick(Sender: TObject);
begin
      if MessageDlg('Are you sure you want to clear the project!',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
           SetupGrid.RowCount := 1;
      end;
end;

procedure TMainForm.CommitResultsetBtnClick(Sender: TObject);
begin

end;

procedure TMainForm.CompareStopRunBtnClick(Sender: TObject);
begin
     StopRunBool := true;
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
        ToDatabase.Text := INI.ReadString('COMPARE','ToDatabase','');
        If INI.ReadString('SCRIPTS','SQL0','') <> '' then
           ScriptSQLEdit.Text := DecodeStringBase64(INI.ReadString('SCRIPTS','SQL0',''));
        Pagecontrol1.TabIndex := INI.ReadInteger('FORM','PageControl1',0);
      finally
        INI.Free;
      end;
end;

procedure TMainForm.LoadFromandToDataBtnClick(Sender: TObject);
var
          ToSQLtext,FromSQLtext:string;
begin
          if Dataform.FromConnection.Connected = False then
          begin
            showmessage('Connect from database first!');
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
            Dataform.ToConnection.Close;
            Dataform.ToConnection.Params.Clear;
            Dataform.ToConnection.DatabaseName :=  ToDatabase.Text;
            Dataform.ToConnection.UserName := ToUserName.Text;
            Dataform.ToConnection.Password := ToPassword.Text;
            Dataform.ToConnection.HostName := ToServerName.Text;
            Dataform.ToConnection.Open;
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

end;

procedure TMainForm.BtnCompareRightClick(Sender: TObject);
var
          I:Integer;
          s,ToSQL,ToFields: String;
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
          Dataform.FromQuery1.EnableControls;
          dataform.ToQuery2.close;
          showmessage('Finished');
end;


procedure TMainForm.ExecuteQueryBtnClick(Sender: TObject);
var
          SQLString: String;
begin
          if (SQLTypeSelect.ItemIndex = 0) then
          begin
            if Dataform.FromConnection.Connected = False then
            begin
              showmessage('Connect database first');
              exit;
            end;
          end
          else
          begin
            if Dataform.FromMySQL80Connection.Connected = False then
            begin
              showmessage('Connect database first');
              exit;
            end;
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
                        if (SQLTypeSelect.ItemIndex = 0) then
                        begin
                          DataForm.ScriptQuery0.SQLConnection := Dataform.FromConnection;
                        end
                        else
                        begin
                          DataForm.ScriptQuery0.SQLConnection := Dataform.FromMySQL80Connection;
                        end;
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
                        else
                        begin
                            Dataform.ScriptQuery0.ExecSQL;
                            showmessage('Query executed');
                        end;
                   end;
                 1 :
                   begin
                        DataForm.ScriptQuery1.close;
                        if (SQLTypeSelect.ItemIndex = 0) then
                        begin
                          DataForm.ScriptQuery1.SQLConnection := Dataform.FromConnection;
                        end
                        else
                        begin
                          DataForm.ScriptQuery1.SQLConnection := Dataform.FromMySQL80Connection;
                        end;
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
                        else
                        begin
                            Dataform.ScriptQuery1.ExecSQL;
                            showmessage('Query executed');
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
