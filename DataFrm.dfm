object DataForm: TDataForm
  OldCreateOrder = False
  Height = 628
  HorizontalOffset = 379
  VerticalOffset = 155
  Width = 788
  object FromConnection: TMSSQLConnection
    Connected = False
    LoginPrompt = False
    KeepConnection = True
    Params.Strings = (
      ''
    )
    Password = 'h0enderm1s'
    Transaction = FromTransaction
    UserName = 'sa'
    HostName = 'localhost'
    LogEvents = []
    Left = 368
    Top = 112
  end
  object ToConnection: TMSSQLConnection
    Connected = False
    LoginPrompt = False
    KeepConnection = True
    Params.Strings = (
      ''
    )
    Transaction = ToTransaction
    LogEvents = []
    Left = 368
    Top = 168
  end
  object FromQuery1: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = FromConnection
    Transaction = FromTransaction
    ReadOnly = True
    SQL.Strings = (
      'select * from tblBatch'
    )
    Options = [sqoKeepOpenOnCommit]
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
    ReadOnly = True
    Options = [sqoKeepOpenOnCommit]
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
    Options = [sqoKeepOpenOnCommit]
    Params = <>
    Macros = <>
    Left = 56
    Top = 232
  end
  object FromTransaction: TSQLTransaction
    Active = False
    Database = FromConnection
    Left = 688
    Top = 112
  end
  object ToTransaction: TSQLTransaction
    Active = False
    Database = ToConnection
    Left = 688
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
    ReadOnly = True
    SQL.Strings = (
      'SELECT name FROM sys.Tables order by name'
    )
    Options = [sqoKeepOpenOnCommit]
    Params = <>
    Macros = <>
    Left = 58
    Top = 320
  end
  object TablesSource1: TDataSource
    DataSet = TablesQuery1
    Left = 234
    Top = 320
  end
  object ColumnsQuery1: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = FromConnection
    Transaction = FromTransaction
    ReadOnly = True
    SQL.Strings = (
      'SELECT name FROM sys.columns WHERE object_id = OBJECT_ID(:tablename)'
    )
    Options = [sqoKeepOpenOnCommit]
    Params = <    
      item
        DataType = ftUnknown
        Name = 'tablename'
        ParamType = ptInput
      end>
    Macros = <>
    Left = 58
    Top = 381
  end
  object ColumnsSource1: TDataSource
    DataSet = ColumnsQuery1
    Left = 234
    Top = 381
  end
  object ColumnsQuery2: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = FromConnection
    Transaction = FromTransaction
    ReadOnly = True
    SQL.Strings = (
      'SELECT name FROM sys.columns'
      'WHERE object_id = OBJECT_ID(:tablename)'
      'ORDER BY name'
    )
    Options = [sqoKeepOpenOnCommit]
    Params = <    
      item
        DataType = ftUnknown
        Name = 'tablename'
        ParamType = ptInput
      end>
    Macros = <>
    Left = 58
    Top = 448
  end
  object ColumnsSource2: TDataSource
    DataSet = ColumnsQuery2
    Left = 234
    Top = 445
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
    ReadOnly = True
    SQL.Strings = (
      'SELECT name as [Database] FROM sys.databases order by [Database]'
    )
    Options = [sqoKeepOpenOnCommit]
    Params = <>
    Macros = <>
    Left = 480
    Top = 16
  end
  object DBSource1: TDataSource
    DataSet = DBQuery1
    Left = 568
    Top = 16
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
    KeepConnection = True
    SkipLibraryVersionCheck = False
    Left = 528
    Top = 112
  end
  object ToMySQL80Connection: TMySQL80Connection
    Connected = False
    LoginPrompt = False
    KeepConnection = True
    SkipLibraryVersionCheck = False
    Left = 528
    Top = 168
  end
  object FromSQLite3Connection: TSQLite3Connection
    Connected = False
    LoginPrompt = False
    KeepConnection = True
    Left = 528
    Top = 224
  end
  object ToSQLite3Connection: TSQLite3Connection
    Connected = False
    LoginPrompt = False
    KeepConnection = True
    Left = 528
    Top = 280
  end
  object ProceduresQuery: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = FromConnection
    Transaction = FromTransaction
    ReadOnly = True
    Options = [sqoKeepOpenOnCommit]
    Params = <>
    Macros = <>
    Left = 688
    Top = 224
  end
  object ProceduresSource: TDataSource
    DataSet = ProceduresQuery
    Left = 688
    Top = 280
  end
  object ScalarFunctionsQuery: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = FromConnection
    Transaction = FromTransaction
    ReadOnly = True
    Options = [sqoKeepOpenOnCommit]
    Params = <>
    Macros = <>
    Left = 688
    Top = 336
  end
  object ScalarFunctionsSource: TDataSource
    DataSet = ScalarFunctionsQuery
    Left = 688
    Top = 392
  end
  object TableFunctionsQuery: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = FromConnection
    Transaction = FromTransaction
    ReadOnly = True
    Options = [sqoKeepOpenOnCommit]
    Params = <>
    Macros = <>
    Left = 688
    Top = 448
  end
  object TableFunctionsSource: TDataSource
    DataSet = TableFunctionsQuery
    Left = 688
    Top = 504
  end
  object TableandColumnsQuery: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = FromConnection
    Transaction = FromTransaction
    ReadOnly = True
    Options = [sqoKeepOpenOnCommit]
    Params = <>
    Macros = <>
    Left = 58
    Top = 504
  end
  object TableandColumnsSource: TDataSource
    DataSet = TableandColumnsQuery
    Left = 234
    Top = 504
  end
  object TempQuery1: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = FromConnection
    Transaction = FromTransaction
    Options = [sqoKeepOpenOnCommit]
    Params = <>
    Macros = <>
    Left = 408
    Top = 536
  end
  object DBViewsQuery1: TSQLQuery
    MaxIndexesCount = 4
    FieldDefs = <    
      item
        Name = 'name'
        DataType = ftString
        Precision = -1
        Size = 128
      end>
    Database = FromConnection
    Transaction = FromTransaction
    SQL.Strings = (
      'SELECT name FROM sys.views ORDER BY name'
      ''
    )
    Params = <>
    Macros = <>
    Left = 58
    Top = 563
    object DBViewsQuery1name: TStringField
      FieldKind = fkData
      FieldName = 'name'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
      Size = 128
    end
  end
  object DBViewsSource1: TDataSource
    DataSet = DBViewsQuery1
    Left = 234
    Top = 563
  end
end
