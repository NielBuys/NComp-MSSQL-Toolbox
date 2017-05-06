unit DataFrm;

interface

uses
  SysUtils, Classes, DB, sqldb, mssqlconn;

type

  { TDataForm }

  TDataForm = class(TDataModule)
    FromConnection: TMSSQLConnection;
    FromTransaction: TSQLTransaction;
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

end.
