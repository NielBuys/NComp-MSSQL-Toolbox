object DataForm: TDataForm
  OldCreateOrder = False
  Height = 502
  HorizontalOffset = 2685
  VerticalOffset = 157
  Width = 675
  object FromConnection: TMSSQLConnection
    Connected = False
    LoginPrompt = False
    KeepConnection = False
    Params.Strings = (
      'DriverID=MSSQL2005'
    )
    Password = 'h0enderm1s'
    Transaction = FromTransaction
    UserName = 'sa'
    HostName = '192.168.0.108'
    LogEvents = []
    Left = 56
    Top = 40
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
    Left = 512
    Top = 40
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
    Left = 152
    Top = 112
  end
  object ToQuery1: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = ToConnection
    Transaction = ToTransaction
    Params = <>
    Macros = <>
    Left = 512
    Top = 112
  end
  object ToQuerySource1: TDataSource
    DataSet = ToQuery1
    Left = 592
    Top = 112
  end
  object ToQuery2: TSQLQuery
    PacketRecords = -1
    FieldDefs = <>
    Database = ToConnection
    Transaction = ToTransaction
    Params = <>
    Macros = <>
    Left = 512
    Top = 168
  end
  object FromTransaction: TSQLTransaction
    Active = False
    Database = FromConnection
    Left = 152
    Top = 40
  end
  object ToTransaction: TSQLTransaction
    Active = False
    Database = ToConnection
    Left = 592
    Top = 40
  end
  object ScriptQuerySource1: TDataSource
    DataSet = ScriptQuery1
    Left = 456
    Top = 368
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
    Left = 328
    Top = 368
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
    Top = 144
  end
  object CSVSource: TDataSource
    DataSet = CSVDataset
    Left = 400
    Top = 200
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
    Left = 56
    Top = 259
  end
  object TablesSource1: TDataSource
    DataSet = TablesQuery1
    Left = 151
    Top = 256
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
    Left = 64
    Top = 320
  end
  object ColumnsSource1: TDataSource
    DataSet = ColumnsQuery1
    Left = 152
    Top = 320
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
    Left = 64
    Top = 384
  end
  object ColumnsSource2: TDataSource
    DataSet = ColumnsQuery2
    Left = 152
    Top = 384
  end
  object DBQuery1: TSQLQuery
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
      ' SELECT name FROM sys.databases order by name'
    )
    Params = <>
    Macros = <>
    Left = 320
    Top = 283
  end
  object DBSource1: TDataSource
    DataSet = DBQuery1
    Left = 408
    Top = 283
  end
  object ScriptQuerySource0: TDataSource
    DataSet = ScriptQuery0
    Left = 456
    Top = 432
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
    Left = 328
    Top = 432
  end
end
