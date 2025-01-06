object AboutForm: TAboutForm
  Left = 2515
  Height = 302
  Top = 256
  Width = 410
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 302
  ClientWidth = 410
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Position = poMainFormCenter
  LCLVersion = '3.6.0.0'
  object Label1: TLabel
    Left = 0
    Height = 16
    Top = 283
    Width = 291
    Caption = 'Link to https://www.ncomp.co.za. Click here for support'
    ParentColor = False
    OnClick = Label1Click
  end
  object Label2: TLabel
    Left = 0
    Height = 16
    Top = 8
    Width = 111
    Caption = 'NComp SQL Toolbox'
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 0
    Height = 245
    Top = 27
    Width = 407
    Lines.Strings = (
      'This tool offers four key functions:'
      ''
      '1. SQL IDE: A basic yet powerful integrated development environment for both Microsoft SQL Server (MSSQL) and MySQL. The tool allows you to run queries, view result sets, and export them as SQL inserts or updates for easy reuse.'
      ''
      '2. Table Comparison: Compare two tables in one direction, generating SQL scripts to reflect changes across all fields in the selected table. The tables must have identical structures. During the comparison, the tool creates INSERT and UPDATE queries, which can be saved for future execution. Additionally, you can join other tables in the query to limit comparisons to specific records, provided that only fields from the current table are in the final result set.'
      ''
      '3. Import Utilities: A suite of helper tools to assist with importing data efficiently.'
      ''
      '4. Find & Replace: Search for or find-and-replace text across tables and columns, streamlining updates and modifications to your data.'
    )
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 333
    Height = 25
    Top = 274
    Width = 75
    DefaultCaption = True
    Kind = bkClose
    ModalResult = 11
    TabOrder = 1
  end
end
