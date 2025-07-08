object DataForm: TDataForm
  OldCreateOrder = False
  Height = 785
  HorizontalOffset = 552
  VerticalOffset = 143
  Width = 985
  PPI = 120
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
    HostName = '192.168.0.157'
    LogEvents = []
    Left = 460
    Top = 130
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
    Left = 460
    Top = 210
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
    Left = 70
    Top = 140
  end
  object FromQuerySource1: TDataSource
    DataSet = FromQuery1
    Enabled = False
    Left = 220
    Top = 140
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
    Left = 70
    Top = 220
  end
  object ToQuerySource1: TDataSource
    DataSet = ToQuery1
    Left = 220
    Top = 220
  end
  object ToQuery2: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = ToConnection
    Transaction = ToTransaction
    Options = [sqoKeepOpenOnCommit]
    Params = <>
    Macros = <>
    Left = 70
    Top = 290
  end
  object FromTransaction: TSQLTransaction
    Active = False
    Database = FromConnection
    Left = 860
    Top = 130
  end
  object ToTransaction: TSQLTransaction
    Active = False
    Database = ToConnection
    Left = 860
    Top = 210
  end
  object ScriptQuerySource1: TDataSource
    DataSet = ScriptQuery1
    Left = 660
    Top = 516
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
    Left = 500
    Top = 516
  end
  object CSVDataset: TSdfDataSet
    FileMustExist = True
    ReadOnly = False
    FieldDefs = <>
    AllowMultiLine = False
    Delimiter = ','
    FirstLineAsSchema = False
    StripTrailingDelimiters = False
    Left = 500
    Top = 330
  end
  object CSVSource: TDataSource
    DataSet = CSVDataset
    Left = 500
    Top = 400
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
    Left = 90
    Top = 440
  end
  object TablesSource1: TDataSource
    DataSet = TablesQuery1
    Left = 310
    Top = 440
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
    Left = 90
    Top = 516
  end
  object ColumnsSource1: TDataSource
    DataSet = ColumnsQuery1
    Left = 310
    Top = 516
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
    Left = 90
    Top = 600
  end
  object ColumnsSource2: TDataSource
    DataSet = ColumnsQuery2
    Left = 310
    Top = 596
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
    Left = 600
    Top = 20
  end
  object DBSource1: TDataSource
    DataSet = DBQuery1
    Left = 710
    Top = 20
  end
  object ScriptQuerySource0: TDataSource
    DataSet = ScriptQuery0
    Left = 660
    Top = 596
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
    Left = 500
    Top = 596
  end
  object FromMySQL80Connection: TMySQL80Connection
    Connected = False
    LoginPrompt = False
    KeepConnection = True
    SkipLibraryVersionCheck = False
    Left = 660
    Top = 130
  end
  object ToMySQL80Connection: TMySQL80Connection
    Connected = False
    LoginPrompt = False
    KeepConnection = True
    SkipLibraryVersionCheck = False
    Left = 660
    Top = 210
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
    Left = 90
    Top = 670
  end
  object TableandColumnsSource: TDataSource
    DataSet = TableandColumnsQuery
    Left = 310
    Top = 670
  end
  object TempQuery1: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = FromConnection
    Transaction = FromTransaction
    Options = [sqoKeepOpenOnCommit]
    Params = <>
    Macros = <>
    Left = 510
    Top = 670
  end
end
