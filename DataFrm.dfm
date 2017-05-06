object DataForm: TDataForm
  OldCreateOrder = False
  Height = 292
  HorizontalOffset = 453
  VerticalOffset = 213
  Width = 675
  object FromConnection: TMSSQLConnection
    Connected = False
    LoginPrompt = False
    KeepConnection = False
    Params.Strings = (
      'DriverID=MSSQL2005'
    )
    Transaction = FromTransaction
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
end
