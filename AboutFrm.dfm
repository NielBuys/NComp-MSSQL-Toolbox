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
  LCLVersion = '2.2.6.0'
  object Label1: TLabel
    Left = 0
    Height = 14
    Top = 283
    Width = 297
    Caption = 'Link to http://www.ncomp.co.za. Click here for support'
    ParentColor = False
    OnClick = Label1Click
  end
  object Label2: TLabel
    Left = 0
    Height = 14
    Top = 8
    Width = 143
    Caption = 'NComp MSSQL Toolbox'
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 1
    Height = 237
    Top = 27
    Width = 407
    Lines.Strings = (
      'This tool have 3 functions:'
      ''
      '1. Basic MSSQL IDE. The result set can also be exported as inserts or updates.'
      ''
      '2. Compare 2 tables one way, during the run it will create sql scripts of all the changes to all the fields in the selected table. Both tables should have the same structure during the run. Insert and Update query''s are created during the run and can be saved for later execution.'
      ''
      'Joins can be added to the from query if only certain records should be compared, as long as the end result only have the current table fields visible.'
      ''
      '3. Import help utilities.'
    )
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 333
    Height = 25
    Top = 272
    Width = 75
    DefaultCaption = True
    Kind = bkClose
    ModalResult = 11
    TabOrder = 1
  end
end
