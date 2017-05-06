object AboutForm: TAboutForm
  Left = 716
  Height = 122
  Top = 221
  Width = 369
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 122
  ClientWidth = 369
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Position = poMainFormCenter
  LCLVersion = '1.6.4.0'
  object Label1: TLabel
    Left = 8
    Height = 13
    Top = 102
    Width = 265
    Caption = 'Link to http://www.ncomp.co.za. Click here for support'
    ParentColor = False
    OnClick = Label1Click
  end
  object Label2: TLabel
    Left = 8
    Height = 13
    Top = 8
    Width = 102
    Caption = 'MSSQL Compare Tool'
    ParentColor = False
  end
  object Memo1: TMemo
    Left = 8
    Height = 60
    Top = 27
    Width = 354
    Lines.Strings = (
      'This tool will compare 2 tables one way, during the run it will create '
      'sql scripts of all the changes to all the fields in the selected table. '
      'Both tables should have the same structure during the run.'
      ''
      'Joins can be added to the from query if only certain records should '
      'be compared, as long as the end result only have the current table '
      'fields visible.'
    )
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 287
    Height = 25
    Top = 90
    Width = 75
    Kind = bkClose
    TabOrder = 1
  end
end
