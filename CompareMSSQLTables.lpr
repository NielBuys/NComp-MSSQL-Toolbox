program CompareMSSQLTables;
{$mode objfpc}{$H+}
{$define UseCThreads}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
    cthreads,
  {$ENDIF}{$ENDIF}
  Forms, Interfaces,
  MainFrm in 'MainFrm.pas' {MainForm},
  DataFrm in 'DataFrm.pas' {DataForm: TDataModule},
  UtilsUnit in 'UtilsUnit.pas',
  AboutFrm in 'AboutFrm.pas' {AboutForm};

{$R *.res}

begin
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TDataForm, DataForm);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
