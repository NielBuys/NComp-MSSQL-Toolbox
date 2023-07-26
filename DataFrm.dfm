object DataForm: TDataForm
  OldCreateOrder = False
  Height = 628
  HorizontalOffset = 1110
  VerticalOffset = 152
  Width = 760
  object FromConnection: TMSSQLConnection
    Connected = False
    LoginPrompt = False
    KeepConnection = False
    Params.Strings = (
      ''
    )
    Password = 'h0enderm1s'
    Transaction = FromTransaction
    UserName = 'sa'
    HostName = '192.168.0.157'
    LogEvents = []
    Left = 56
    Top = 40
  end
  object ToConnection: TMSSQLConnection
    Connected = False
    LoginPrompt = False
    KeepConnection = False
    Params.Strings = (
      ''
    )
    Transaction = ToTransaction
    LogEvents = []
    Left = 384
    Top = 168
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
    Macros = <>
    Left = 56
    Top = 112
  end
  object FromQuerySource1: TDataSource
    DataSet = FromQuery1
    Enabled = False
    Left = 176
    Top = 112
  end
  object ToQuery1: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = ToConnection
    Transaction = ToTransaction
    Params = <>
    Macros = <>
    Left = 56
    Top = 176
  end
  object ToQuerySource1: TDataSource
    DataSet = ToQuery1
    Left = 176
    Top = 176
  end
  object ToQuery2: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = ToConnection
    Transaction = ToTransaction
    Params = <>
    Macros = <>
    Left = 56
    Top = 232
  end
  object FromTransaction: TSQLTransaction
    Active = False
    Database = FromConnection
    Left = 376
    Top = 40
  end
  object ToTransaction: TSQLTransaction
    Active = False
    Database = ToConnection
    Left = 656
    Top = 168
  end
  object ScriptQuerySource1: TDataSource
    DataSet = ScriptQuery1
    Left = 528
    Top = 413
  end
  object ScriptQuery1: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = FromConnection
    Transaction = FromTransaction
    SQL.Strings = (
      'select * from tblBatch'
    )
    Options = [sqoKeepOpenOnCommit, sqoAutoApplyUpdates, sqoAutoCommit]
    Params = <>
    Macros = <>
    Left = 400
    Top = 413
  end
  object CSVDataset: TSdfDataSet
    FileMustExist = True
    ReadOnly = False
    FieldDefs = <>
    AllowMultiLine = False
    Delimiter = ','
    FirstLineAsSchema = False
    StripTrailingDelimiters = False
    Left = 400
    Top = 264
  end
  object CSVSource: TDataSource
    DataSet = CSVDataset
    Left = 400
    Top = 320
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
    Macros = <>
    Left = 72
    Top = 352
  end
  object TablesSource1: TDataSource
    DataSet = TablesQuery1
    Left = 248
    Top = 352
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
    Macros = <>
    Left = 72
    Top = 413
  end
  object ColumnsSource1: TDataSource
    DataSet = ColumnsQuery1
    Left = 248
    Top = 413
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
    Macros = <>
    Left = 72
    Top = 480
  end
  object ColumnsSource2: TDataSource
    DataSet = ColumnsQuery2
    Left = 248
    Top = 477
  end
  object DBQuery1: TSQLQuery
    PacketRecords = -1
    MaxIndexesCount = 4
    FieldDefs = <    
      item
        Name = 'Database'
        Attributes = [faReadonly]
        DataType = ftString
        Precision = -1
        Size = 128
      end>
    Database = FromConnection
    Transaction = FromTransaction
    SQL.Strings = (
      'SELECT name as [Database] FROM sys.databases order by [Database]'
    )
    Params = <>
    Macros = <>
    Left = 336
    Top = 112
  end
  object DBSource1: TDataSource
    DataSet = DBQuery1
    Left = 424
    Top = 112
  end
  object ScriptQuerySource0: TDataSource
    DataSet = ScriptQuery0
    Left = 528
    Top = 477
  end
  object ScriptQuery0: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = FromConnection
    Transaction = FromTransaction
    SQL.Strings = (
      'select * from tblBatch'
    )
    Options = [sqoKeepOpenOnCommit, sqoAutoApplyUpdates, sqoAutoCommit]
    Params = <>
    Macros = <>
    Left = 400
    Top = 477
  end
  object FromMySQL80Connection: TMySQL80Connection
    Connected = False
    LoginPrompt = False
    KeepConnection = False
    SkipLibraryVersionCheck = False
    Left = 216
    Top = 40
  end
  object ToMySQL80Connection: TMySQL80Connection
    Connected = False
    LoginPrompt = False
    KeepConnection = False
    SkipLibraryVersionCheck = False
    Left = 520
    Top = 168
  end
  object TableandColumnsQuery: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = FromConnection
    Transaction = FromTransaction
    ReadOnly = True
    Params = <>
    Macros = <>
    Left = 72
    Top = 536
  end
  object TableandColumnsSource: TDataSource
    DataSet = TableandColumnsQuery
    Left = 248
    Top = 536
  end
  object TempQuery1: TSQLQuery
    FieldDefs = <>
    Database = FromConnection
    Transaction = FromTransaction
    Params = <>
    Macros = <>
    Left = 408
    Top = 536
  end
end
