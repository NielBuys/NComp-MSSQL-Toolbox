object AboutForm: TAboutForm
  Left = 789
  Height = 227
  Top = 236
  Width = 410
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 227
  ClientWidth = 410
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Position = poMainFormCenter
  LCLVersion = '1.8.2.0'
  object Label1: TLabel
    Left = 8
    Height = 13
    Top = 212
    Width = 308
    Caption = 'Link to http://www.ncomp.co.za. Click here for support'
    ParentColor = False
    OnClick = Label1Click
  end
  object Label2: TLabel
    Left = 8
    Height = 13
    Top = 8
    Width = 130
    Caption = 'NComp MSSQL Toolbox'
    ParentColor = False
  end
  object Memo1: TMemo
    Left = 1
    Height = 173
    Top = 27
    Width = 407
    Lines.Strings = (
      'This tool have 2 functions '
      '1. Comparing 2 tables one way, during the run it will create '
      'sql scripts of all the changes to all the fields in the selected table. '
      'Both tables should have the same structure during the run.'
      ''
      'Joins can be added to the from query if only certain records should '
      'be compared, as long as the end result only have the current table '
      'fields visible.'
      ''
      '2. Exporting SQL insert queries from an select query. Joins and where '
      'parts can be added to query before export.'
      ''
    )
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 333
    Height = 25
    Top = 200
    Width = 75
    DefaultCaption = True
    Kind = bkClose
    ModalResult = 11
    TabOrder = 1
  end
end
