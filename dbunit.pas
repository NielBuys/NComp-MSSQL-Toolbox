unit DBUnit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Dialogs;

function LoadDBTables(): Boolean;
function LoadTableColumns(TableName: String): Boolean;

implementation
  uses DataFrm;

function LoadDBTables(): Boolean;
begin
      LoadDBTables := False;
      If (Dataform.FromConnection.Connected) then
      begin
        try
          Dataform.TablesQuery1.Close;
          with Dataform.TablesQuery1.SQL do
          begin
             Clear;
             add('SELECT name FROM sys.Tables order by name');
          end;
          Dataform.TablesQuery1.Open;
          LoadDBTables := True;
        except
          on E : Exception do
          begin
             ShowMessage(E.ClassName + ' ' + E.Message + ' Error loading tables');
             exit;
          end;
        end;
      end
      else If (Dataform.FromMySQL80Connection.Connected) then
      begin
        try
          Dataform.TablesQuery1.Close;
          with Dataform.TablesQuery1.SQL do
          begin
             Clear;
             add('SELECT TABLE_NAME as name');
             add('FROM INFORMATION_SCHEMA.TABLES');
             add('WHERE TABLE_SCHEMA = ''' + Dataform.FromMySQL80Connection.DatabaseName + '''');
             add('order by TABLE_NAME')
          end;
          Dataform.TablesQuery1.Open;
          LoadDBTables := True;
        except
          on E : Exception do
          begin
             ShowMessage(E.ClassName + ' ' + E.Message + ' Error loading tables');
             exit;
          end;
        end;
      end;
end;

function LoadTableColumns(TableName: String): Boolean;
begin
      LoadTableColumns := False;
      If (Dataform.FromConnection.Connected) then
      begin
        try
          Dataform.ColumnsQuery1.Close;
          with Dataform.ColumnsQuery1.SQL do
          begin
             Clear;
             add('SELECT name FROM sys.columns');
             add('WHERE object_id = OBJECT_ID(''' + TableName + ''')');
             add('order by name');
          end;
          Dataform.ColumnsQuery1.Open;
          LoadTableColumns := True;
        except
          on E : Exception do
          begin
             ShowMessage(E.ClassName + ' ' + E.Message + ' Error loading columns');
             exit;
          end;
        end;
      end
      else If (Dataform.FromMySQL80Connection.Connected) then
      begin
        try
          Dataform.ColumnsQuery1.Close;
          with Dataform.ColumnsQuery1.SQL do
          begin
             Clear;
             add('SELECT COLUMN_NAME as name');
             add('FROM INFORMATION_SCHEMA.COLUMNS');
             add('WHERE TABLE_NAME = ''' + TableName + '''');
             add('AND TABLE_SCHEMA = ''' + Dataform.FromMySQL80Connection.DatabaseName + '''');
             add('order by COLUMN_NAME')
          end;
          Dataform.ColumnsQuery1.Open;
          LoadTableColumns := True;
        except
          on E : Exception do
          begin
             ShowMessage(E.ClassName + ' ' + E.Message + ' Error loading columns');
             exit;
          end;
        end;
      end;
end;

end.

