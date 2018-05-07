object DataForm: TDataForm
  OldCreateOrder = False
  Height = 470
  HorizontalOffset = 2636
  VerticalOffset = 315
  Width = 675
  PPI = 96
  object FromConnection: TMSSQLConnection
    Connected = False
    LoginPrompt = False
    DatabaseName = 'WineMS_Global'
    KeepConnection = False
    Params.Strings = (
      'DriverID=MSSQL2005'
    )
    Password = 'h0enderm1s'
    Transaction = FromTransaction
    UserName = 'sa'
    HostName = '192.168.0.108'
    LogEvents = []
    left = 56
    top = 40
  end
  object ToConnection: TMSSQLConnection
    Connected = False
    LoginPrompt = False
    KeepConnection = False
    Params.Strings = (
      'DriverID=MSSQL2005'
    )
    Transaction = ToTransaction
    LogEvents = []
    left = 512
    top = 40
  end
  object FromQuery1: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = FromConnection
    Transaction = FromTransaction
    SQL.Strings = (
      'select * from tblBatch'
    )
    Params = <>
    left = 56
    top = 112
  end
  object FromQuerySource1: TDataSource
    DataSet = FromQuery1
    Enabled = False
    left = 152
    top = 112
  end
  object ToQuery1: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = ToConnection
    Transaction = ToTransaction
    Params = <>
    left = 512
    top = 112
  end
  object ToQuerySource1: TDataSource
    DataSet = ToQuery1
    left = 592
    top = 112
  end
  object ToQuery2: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = ToConnection
    Transaction = ToTransaction
    Params = <>
    left = 512
    top = 168
  end
  object FromTransaction: TSQLTransaction
    Active = False
    Database = FromConnection
    left = 152
    top = 40
  end
  object ToTransaction: TSQLTransaction
    Active = False
    Database = ToConnection
    left = 592
    top = 40
  end
  object ScriptQuerySource1: TDataSource
    DataSet = ScriptQuery1
    Enabled = False
    left = 152
    top = 176
  end
  object ScriptQuery1: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = FromConnection
    Transaction = FromTransaction
    SQL.Strings = (
      'select * from tblBatch'
    )
    Params = <>
    left = 56
    top = 176
  end
  object CSVDataset: TSdfDataSet
    FileMustExist = True
    ReadOnly = False
    FieldDefs = <>
    AllowMultiLine = False
    Delimiter = ','
    FirstLineAsSchema = False
    StripTrailingDelimiters = False
    left = 384
    top = 216
  end
  object CSVSource: TDataSource
    DataSet = CSVDataset
    left = 384
    top = 272
  end
  object TablesQuery1: TSQLQuery
    PacketRecords = -1
    FieldDefs = <    
      item
        Name = 'name'
        DataType = ftString
        Precision = -1
        Size = 512
      end>
    Database = FromConnection
    Transaction = FromTransaction
    SQL.Strings = (
      'SELECT name FROM sys.Tables order by name'
    )
    Params = <>
    left = 56
    top = 259
  end
  object TablesSource1: TDataSource
    DataSet = TablesQuery1
    left = 151
    top = 256
  end
  object ColumnsQuery1: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = FromConnection
    Transaction = FromTransaction
    SQL.Strings = (
      'SELECT name FROM sys.columns WHERE object_id = OBJECT_ID(:tablename)'
    )
    Params = <    
      item
        DataType = ftUnknown
        Name = 'tablename'
        ParamType = ptInput
      end>
    left = 64
    top = 320
  end
  object ColumnsSource1: TDataSource
    DataSet = ColumnsQuery1
    left = 152
    top = 320
  end
  object ColumnsQuery2: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = FromConnection
    Transaction = FromTransaction
    SQL.Strings = (
      'SELECT name FROM sys.columns WHERE object_id = OBJECT_ID(:tablename)'
    )
    Params = <    
      item
        DataType = ftUnknown
        Name = 'tablename'
        ParamType = ptInput
      end>
    left = 64
    top = 384
  end
  object ColumnsSource2: TDataSource
    DataSet = ColumnsQuery2
    left = 152
    top = 384
  end
end
