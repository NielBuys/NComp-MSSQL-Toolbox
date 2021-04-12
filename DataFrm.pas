unit DataFrm;

interface

uses
  SysUtils, Classes, DB, sqldb, SdfData, mssqlconn;

type

  { TDataForm }

  TDataForm = class(TDataModule)
    ColumnsQuery2: TSQLQuery;
    ColumnsSource2: TDataSource;
    CSVSource: TDataSource;
    ColumnsQuery1: TSQLQuery;
    DataSource1: TDataSource;
    DBQuery1: TSQLQuery;
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
