unit DataFrm;

interface

uses
  SysUtils, Classes, DB, sqldb, mysql80conn, SdfData, mssqlconn, sqlite3conn;

type

  { TDataForm }

  TDataForm = class(TDataModule)
    ColumnsQuery2: TSQLQuery;
    ColumnsSource2: TDataSource;
    CSVSource: TDataSource;
    ColumnsQuery1: TSQLQuery;
    DBViewsQuery1name: TStringField;
    DBViewsSource1: TDataSource;
    DBViewsQuery1: TSQLQuery;
    TempQuery1: TSQLQuery;
    TableandColumnsSource: TDataSource;
    DBQuery1: TSQLQuery;
    FromMySQL80Connection: TMySQL80Connection;
    TableandColumnsQuery: TSQLQuery;
    ToMySQL80Connection: TMySQL80Connection;
    FromSQLite3Connection: TSQLite3Connection;
    ToSQLite3Connection: TSQLite3Connection;
    ProceduresQuery: TSQLQuery;
    ProceduresSource: TDataSource;
    ScalarFunctionsQuery: TSQLQuery;
    ScalarFunctionsSource: TDataSource;
    TableFunctionsQuery: TSQLQuery;
    TableFunctionsSource: TDataSource;
    ScriptQuery0: TSQLQuery;
    ScriptQuerySource0: TDataSource;
    TablesSource1: TDataSource;
    ScriptQuery1: TSQLQuery;
    ScriptQuerySource1: TDataSource;
    FromConnection: TMSSQLConnection;
    FromTransaction: TSQLTransaction;
    CSVDataset: TSdfDataSet;
    TablesQuery1: TSQLQuery;
    ColumnsSource1: TDataSource;
    DBSource1: TDataSource;
    ToTransaction: TSQLTransaction;
    ToConnection: TMSSQLConnection;
    FromQuery1: TSQLQuery;
    FromQuerySource1: TDataSource;
    ToQuery1: TSQLQuery;
    ToQuerySource1: TDataSource;
    ToQuery2: TSQLQuery;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataForm: TDataForm;

implementation

{$R *.dfm}

{ TDataForm }



end.
