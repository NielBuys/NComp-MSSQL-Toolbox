unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, Menus, ComCtrls, UtilsUnit,
  Registry, Types;

type

  { TMainForm }

  TMainForm = class(TForm)
    BtnCompareRight: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    FromRowsCountLabel: TLabel;
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
    ToDatabase: TEdit;
    ToPassword: TEdit;
    SaveDialog1: TSaveDialog;
    About1: TMenuItem;
    ToServerName: TEdit;
    ToUserName: TEdit;
    procedure ConnecttoServerBtnClick(Sender: TObject);
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
    procedure SaveSQLBtnClick(Sender: TObject);

  private
    function countrows(): Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
      uses datafrm, AboutFrm;

{$R *.lfm}

procedure TMainForm.About1Click(Sender: TObject);
begin
        Application.CreateForm(TAboutForm, AboutForm);
        AboutForm.showmodal;
        AboutForm.Free;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
            if Savedialog1.Execute then
            begin
              SQL.Lines.SaveToFile(SaveDialog1.FileName);
            end;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
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
begin
            Dataform.FromQuery1.Close;
            Dataform.ToQuery1.Close;
            Dataform.ToQuery2.Close;

            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'FromDatabase', rdString, FromDatabase.Text);
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'FromUserName', rdString, FromUserName.Text);
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'FromPassword', rdString, encrypt(FromPassword.Text));
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'FromServerName', rdString, FromServerName.Text);
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'FromTable', rdString, FromTable.Text);
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'FromUniqueField', rdString, FromUniqueField.Text);
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'ToDatabase', rdString, ToDatabase.Text);
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'ToUserName', rdString, ToUserName.Text);
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'ToPassword', rdString, encrypt(ToPassword.Text));
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'ToServerName', rdString, ToServerName.Text);
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'SQLEdit', rdString, SQLEdit.Text);

            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'ScriptSQLEdit', rdString, ScriptSQLEdit.Text);
            SetRegistryData(HKEY_CURRENT_USER,
            '\Software\CompareMSSQLTables\',
            'ScriptTableName', rdString, ScriptTableName.Text);

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
      ScriptSQL.Clear;
      FieldsString := '';
      ValuesString := '';
      ProgressBar1.Max := Dataform.FromQuery1.RecordCount;
      ProgressBar1.Position := 0;
      Dataform.FromQuery1.First;
      Dataform.FromQuery1.DisableControls;
      while not Dataform.FromQuery1.EOF do
      begin
           ProgressBar1.StepIt;
           Application.processMessages;
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
          QueryString := 'insert into ' + FromTable.Text + ' (' + FieldsString + ') Values (' + ValuesString + ');' + #13#10;
          tempQueryString := tempQueryString + QueryString;
          FieldsString := '';
          ValuesString := '';
          Dataform.FromQuery1.Next;
      end;
      ScriptSQL.Lines.Clear;
      ScriptSQL.Lines.Add(tempQueryString);
      Dataform.FromQuery1.EnableControls;
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


procedure TMainForm.FormCreate(Sender: TObject);
begin
            try
              FromDatabase.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','FromDatabase');
            except
              FromDatabase.Text := '';
            end;
            try
              FromUserName.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','FromUserName');
            except
              FromUserName.Text := '';
            end;
            try
              FromPassword.Text := Decrypt(GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','FromPassword'));
            except
              FromPassword.Text := '';
            end;
            try
              FromServerName.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','FromServerName');
            except
              FromServerName.Text := '';
            end;
            try
              FromTable.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','FromTable');
            except
              FromTable.Text := '';
            end;
            try
              FromUniqueField.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','FromUniqueField');
            except
              FromUniqueField.Text := '';
            end;
            try
              ToDatabase.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','ToDatabase');
            except
              ToDatabase.Text := '';
            end;
            try
              ToUserName.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','ToUserName');
            except
              ToUserName.Text := '';
            end;
            try
              ToPassword.Text := Decrypt(GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','ToPassword'));
            except
              ToPassword.Text := '';
            end;
            try
              ToServerName.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','ToServerName');
            except
              ToServerName.Text := '';
            end;
            try
              SQLEdit.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','SQLEdit');
            except
              SQLEdit.Text := '';
            end;

            try
              ScriptSQLEdit.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','ScriptSQLEdit');
            except
              ScriptSQLEdit.Text := '';
            end;

            try
              ScriptTableName.Text := GetRegistryData(HKEY_CURRENT_USER,'\Software\CompareMSSQLTables\','ScriptTableName');
            except
              ScriptTableName.Text := '';
            end;
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
            FromRowsCountLabel.Caption := inttostr(countrows());
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
            showmessage('Connect from database first');
            exit;
          end;
          if POS(ScriptTableName.Text,ScriptSQLEdit.Text) = 0 then
          begin
            showmessage('Table name must be present in Query');
            exit;
          end;
          try
            DataForm.FromQuery1.close;
            with Dataform.FromQuery1.SQL do
            begin
              Clear;
              Text := ScriptSQLEdit.Text;
            end;
            Dataform.FromQuery1.Open;
            RowsCountLabel.Caption := inttostr(countrows());
          except
          begin
            ShowMessage('Unable Execute query');
          end;
          raise;
          end;
end;

procedure TMainForm.SaveSQLBtnClick(Sender: TObject);
begin
          if Savedialog1.Execute then
          begin
            ScriptSQL.Lines.SaveToFile(SaveDialog1.FileName);
          end;
end;

function TMainForm.countrows(): Integer;
var
          I: Integer;
begin
      I := 0;
      Dataform.FromQuery1.First;
      Dataform.FromQuery1.DisableControls;
      while not Dataform.FromQuery1.EOF do
      begin
           Inc(I);
           Dataform.FromQuery1.Next;
      end;
      Dataform.FromQuery1.EnableControls;
      Dataform.FromQuery1.First;
      countrows := I;
end;

end.
