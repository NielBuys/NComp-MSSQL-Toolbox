unit DBUnit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Dialogs, DB, sqldb, UtilsUnit, StrUtils;

var
  CurrentFromConnection: TSQLConnection;
  CurrentToConnection: TSQLConnection;
  DBConnType: String;

function isDBConnected(): Boolean;
function DBConnectionType(): String;
function LoadDBTables(): Boolean;
function LoadDBViews(): Boolean;
function LoadDBProcedures(): Boolean;
function LoadDBScalarFunctions(): Boolean;
function LoadDBTableFunctions(): Boolean;
function LoadTableColumnsSQLQuery(ColumnsQuery: TSQLQuery; TableName: String): TSQLQuery;
function ConvertFieldtoSQLString(FieldStore: TField): String;
function FixSQLString(stemp: String; IsLikeQuery: Boolean = False): String;

implementation
  uses DataFrm;

function isDBConnected(): Boolean;
begin
     Result := Assigned(CurrentFromConnection) and CurrentFromConnection.Connected;
end;

function DBConnectionType(): String;
begin
     DBConnectionType := IfThen(DBConnType <> '', DBConnType, 'none');
end;

function LoadDBTables(): Boolean;
begin
      LoadDBTables := False;
      If (DBConnectionType = 'mssql') then
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
      else If (DBConnectionType = 'mysql') then
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
      end
      else If (DBConnectionType = 'sqlite') then
      begin
        try
          Dataform.TablesQuery1.Close;
          with Dataform.TablesQuery1.SQL do
          begin
             Clear;
             add('SELECT name FROM sqlite_master');
             add('WHERE type = ''table'' AND name NOT LIKE ''sqlite_%''');
             add('order by name');
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

function LoadDBViews(): Boolean;
begin
  LoadDBViews := False;

  if (DBConnectionType = 'mssql') then
  begin
    try
      Dataform.DBViewsQuery1.Close;
      with Dataform.DBViewsQuery1.SQL do
      begin
        Clear;
        Add('SELECT name FROM sys.views ORDER BY name');
      end;
      Dataform.DBViewsQuery1.Open;
      LoadDBViews := True;
    except
      on E: Exception do
      begin
        ShowMessage(E.ClassName + ' ' + E.Message + ' Error loading MSSQL views');
        Exit;
      end;
    end;
  end
  else if (DBConnectionType = 'mysql') then
  begin
    try
      Dataform.DBViewsQuery1.Close;
      with Dataform.DBViewsQuery1.SQL do
      begin
        Clear;
        Add('SELECT TABLE_NAME as name');
        Add('FROM INFORMATION_SCHEMA.VIEWS');
        Add('WHERE TABLE_SCHEMA = ''' + Dataform.FromMySQL80Connection.DatabaseName + '''');
        Add('ORDER BY TABLE_NAME');
      end;
      Dataform.DBViewsQuery1.Open;
      LoadDBViews := True;
    except
      on E: Exception do
      begin
        ShowMessage(E.ClassName + ' ' + E.Message + ' Error loading MySQL views');
        Exit;
      end;
    end;
  end
  else if (DBConnectionType = 'sqlite') then
  begin
    try
      Dataform.DBViewsQuery1.Close;
      with Dataform.DBViewsQuery1.SQL do
      begin
        Clear;
        Add('SELECT name FROM sqlite_master WHERE type = ''view'' ORDER BY name');
      end;
      Dataform.DBViewsQuery1.Open;
      LoadDBViews := True;
    except
      on E: Exception do
      begin
        ShowMessage(E.ClassName + ' ' + E.Message + ' Error loading SQLite views');
        Exit;
      end;
    end;
  end;
end;

{ Shared runner for the "list of object names" queries (procedures / functions).
  Each query returns a single 'name' column so the lookup lists bind uniformly. }
function RunNameListQuery(Q: TSQLQuery; const ASQL, AErrContext: String): Boolean;
begin
  Result := False;
  try
    Q.Close;
    Q.SQL.Text := ASQL;
    Q.Open;
    Result := True;
  except
    on E: Exception do
      ShowMessage(E.ClassName + ' ' + E.Message + ' ' + AErrContext);
  end;
end;

function LoadDBProcedures(): Boolean;
begin
  if (DBConnectionType = 'mssql') then
    Result := RunNameListQuery(Dataform.ProceduresQuery,
      'SELECT name FROM sys.objects WHERE type IN (''P'',''PC'') ORDER BY name',
      'Error loading procedures')
  else if (DBConnectionType = 'mysql') then
    Result := RunNameListQuery(Dataform.ProceduresQuery,
      'SELECT ROUTINE_NAME as name FROM information_schema.routines' +
      ' WHERE routine_type = ''PROCEDURE'' AND routine_schema = ''' +
      Dataform.FromMySQL80Connection.DatabaseName + ''' ORDER BY ROUTINE_NAME',
      'Error loading procedures')
  else if (DBConnectionType = 'sqlite') then
    { SQLite has no stored procedures - return an empty list. }
    Result := RunNameListQuery(Dataform.ProceduresQuery,
      'SELECT name FROM sqlite_master WHERE 1 = 0', 'Error loading procedures')
  else
    Result := False;
end;

function LoadDBScalarFunctions(): Boolean;
begin
  if (DBConnectionType = 'mssql') then
    Result := RunNameListQuery(Dataform.ScalarFunctionsQuery,
      'SELECT name FROM sys.objects WHERE type IN (''FN'',''FS'',''AF'') ORDER BY name',
      'Error loading scalar functions')
  else if (DBConnectionType = 'mysql') then
    { MySQL stored functions are all scalar. }
    Result := RunNameListQuery(Dataform.ScalarFunctionsQuery,
      'SELECT ROUTINE_NAME as name FROM information_schema.routines' +
      ' WHERE routine_type = ''FUNCTION'' AND routine_schema = ''' +
      Dataform.FromMySQL80Connection.DatabaseName + ''' ORDER BY ROUTINE_NAME',
      'Error loading scalar functions')
  else if (DBConnectionType = 'sqlite') then
    { SQLite functions are registered at runtime, not stored in the schema. }
    Result := RunNameListQuery(Dataform.ScalarFunctionsQuery,
      'SELECT name FROM sqlite_master WHERE 1 = 0', 'Error loading scalar functions')
  else
    Result := False;
end;

function LoadDBTableFunctions(): Boolean;
begin
  if (DBConnectionType = 'mssql') then
    Result := RunNameListQuery(Dataform.TableFunctionsQuery,
      'SELECT name FROM sys.objects WHERE type IN (''IF'',''TF'',''FT'') ORDER BY name',
      'Error loading table functions')
  else if (DBConnectionType = 'mysql') then
    { MySQL has no table-valued functions - return an empty list. }
    Result := RunNameListQuery(Dataform.TableFunctionsQuery,
      'SELECT ROUTINE_NAME as name FROM information_schema.routines WHERE 1 = 0',
      'Error loading table functions')
  else if (DBConnectionType = 'sqlite') then
    Result := RunNameListQuery(Dataform.TableFunctionsQuery,
      'SELECT name FROM sqlite_master WHERE 1 = 0', 'Error loading table functions')
  else
    Result := False;
end;

function LoadTableColumnsSQLQuery(ColumnsQuery: TSQLQuery; TableName: String): TSQLQuery;
begin
    try
      ColumnsQuery.Close;
      If (DBConnectionType = 'mssql') then
      begin
        with ColumnsQuery.SQL do
        begin
           Clear;
           add('SELECT name FROM sys.columns');
           add('WHERE object_id = OBJECT_ID(''' + TableName + ''')');
           add('order by name');
        end;
      end
      else If (DBConnectionType = 'mysql') then
      begin
        with ColumnsQuery.SQL do
        begin
           Clear;
           add('SELECT COLUMN_NAME as name');
           add('FROM INFORMATION_SCHEMA.COLUMNS');
           add('WHERE TABLE_NAME = ''' + TableName + '''');
           add('AND TABLE_SCHEMA = ''' + Dataform.FromMySQL80Connection.DatabaseName + '''');
           add('order by COLUMN_NAME')
        end;
      end
      else If (DBConnectionType = 'sqlite') then
      begin
        with ColumnsQuery.SQL do
        begin
           Clear;
           add('SELECT name FROM pragma_table_info(''' + TableName + ''')');
           add('order by name');
        end;
      end;
      ColumnsQuery.Open;
    except
      on E : Exception do
      begin
         ShowMessage(E.ClassName + ' ' + E.Message + ' Error loading columns');
         exit;
      end;
    end;
    LoadTableColumnsSQLQuery := ColumnsQuery;
end;

Function ConvertFieldtoSQLString(FieldStore: TField):String;
var
      temp:String;
begin
        temp := '';
        case TFieldType(Ord(FieldStore.DataType)) of
          ftString, ftGuid, ftWideString, ftMemo, ftFixedChar:
          begin
            if (FieldStore.AsString = '') or (FieldStore.IsNull) or (LowerCase(FieldStore.AsString) = 'null') then
               temp := 'null'  //Put a default string
            else
            begin
                 temp := '''' + trim(FixSQLString(FieldStore.AsString)) + '''';
            end;
          end;

          ftInteger, ftWord, ftSmallint, ftAutoinc, ftLargeint:
          begin
            if FieldStore.AsInteger > 0 then
               temp := IntToStr(FieldStore.AsInteger)
            else
            begin
              if FieldStore.IsNull then
                temp := 'null'
              else
                temp := '0';
            end;
          end;
          ftFloat, ftCurrency, ftBCD, ftFMTBcd:
          begin
//            Showmessage(FloattoStr(FieldStore.AsFloat) + '==' + FloatToLocaleIndependantString(FieldStore.AsFloat));
            if FieldStore.AsFloat <> 0 then
              temp := FloatToLocaleIndependantString(FieldStore.AsFloat)
            else
            begin
              if FieldStore.IsNull then
                temp := 'null'
              else
                temp := '0';
            end;
          end;
          ftBoolean:
          begin
            if not FieldStore.isnull then
            begin
              if FieldStore.Value then
                temp:= '1'
              else
                temp:= '0';
            end
            else
              temp := 'null';
          end;
          ftDate:
          begin
            if (not FieldStore.IsNull) or
               (Length(Trim(FieldStore.AsString)) > 0) then
              temp := '''' + FormatDateTime('yyyy-MM-dd', FieldStore.AsDateTime) + ''''
            else
            begin
              if FieldStore.IsNull then
                temp := 'null'
              else
                temp:= '''1900-01-01'''; //put some valid default date
            end;
          end;
          ftDateTime, ftTimeStamp:
          begin
            if (not FieldStore.IsNull) or
               (Length(Trim(FieldStore.AsString)) > 0) then
              temp := '''' + FormatDateTime('yyyy-MM-dd HH:mm:ss', FieldStore.AsDateTime) + ''''
            else
            begin
              if FieldStore.IsNull then
                temp := 'null'
              else
                temp := '''1900/01/01 00:00:00''';//Put some valid default date and time
            end;
          end;
          ftTime:
          begin
            if (not FieldStore.IsNull) or
               (Length(Trim(FieldStore.AsString)) > 0) then
               temp := '''' + FormatDateTime('HH:mm:ss', FieldStore.AsDateTime) + ''''
            else
            begin
              if FieldStore.IsNull then
                temp := 'null'
              else
                temp := '''00:00:00'''; //Put some valid default time
            end;
          end;
        else
          showmessage('Field not found ' + FieldTypeToString(FieldStore.DataType));
        end;
        ConvertFieldtoSQLString := temp;
end;

//function FixSQLString(stemp: String): String;
//const SpecialChar = ['%', '\',#39];
//var
//  i: integer;
//  Skiploop:Boolean;
//begin
//  result := '';
//  skiploop := false;
//  for i := 1 to length(stemp) do
//  begin
//    if skiploop = true then
//    begin
//      skiploop := false;
//      continue;
//    end;
// //   showmessage(stemp[i]);
//    if not (stemp[i] in SpecialChar) then
//    begin
//      result := result+stemp[i];
//    end
//    else
//    begin
//      if stemp[i] = #39 then
//        result := result+#39+stemp[i]
//      else
//        result := result+'\'+stemp[i];
//    end;
//  end;
//end;

function FixSQLString(stemp: String; IsLikeQuery: Boolean = False): String;
const
  SpecialCharAlways = ['\', #39];  // Always escape backslash and single quote
  SpecialCharLikeMySQL = ['%', '_']; // Escape % and _ in LIKE for MySQL
  SpecialCharLikeMSSQL = ['%', '_', '[', ']', '^', '-']; // Escape % _ [ ] ^ - in LIKE for MSSQL
var
  i, j: Integer;
begin
  SetLength(Result, Length(stemp) * 3); // Allocate enough space
  j := 0;

  for i := 1 to Length(stemp) do
  begin
    Inc(j);
    case stemp[i] of
      #39: // Single quote (')
      begin
        Result[j] := #39;
        Inc(j);
        Result[j] := #39; // Double it for SQL
      end;
      '\': // Backslash (\) (Only MySQL needs escaping)
      begin
        if DBConnectionType = 'mysql' then
        begin
          Result[j] := '\';
          Inc(j);
          Result[j] := '\';
        end
        else
          Result[j] := stemp[i]; // MSSQL does not escape backslash
      end;
      '%', '_': // Escape % and _ only in LIKE queries
      begin
        if IsLikeQuery then
        begin
          if DBConnectionType = 'mysql' then
          begin
            Result[j] := '\'; // MySQL: Escape with backslash
            Inc(j);
          end
          else if DBConnectionType = 'mssql' then
          begin
            Result[j] := '['; // MSSQL: Escape with brackets
            Inc(j);
            Result[j] := stemp[i];
            Inc(j);
            Result[j] := ']';
            Continue;
          end;
        end;
        Result[j] := stemp[i];
      end;
      '[', ']', '^', '-': // Additional MSSQL LIKE wildcard characters
      begin
        if (DBConnectionType = 'mssql') and (IsLikeQuery) then
        begin
          Result[j] := '[';
          Inc(j);
          Result[j] := stemp[i];
          Inc(j);
          Result[j] := ']';
          Continue;
        end;
        Result[j] := stemp[i];
      end;
      else
        Result[j] := stemp[i]; // Normal characters
    end;
  end;

  SetLength(Result, j); // Trim excess
end;

end.

