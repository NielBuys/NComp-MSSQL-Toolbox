unit PingThreadUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, Forms;

type
  TPingThread = class(TThread)
  private
    FConnection: TSQLConnection;
    FPingInterval: Integer; // Ping interval in milliseconds
  protected
    procedure Execute; override;
  public
    constructor Create(AConnection: TSQLConnection; APingInterval: Integer);
  end;

implementation

constructor TPingThread.Create(AConnection: TSQLConnection; APingInterval: Integer);
begin
  inherited Create(True); // Create suspended
  if Assigned(AConnection) then
    FConnection := AConnection
  else
    raise Exception.Create('Invalid SQL Connection');
  FPingInterval := APingInterval;
  FreeOnTerminate := True; // Free thread automatically when it finishes
end;

procedure TPingThread.Execute;
begin
  while not Terminated do
  begin
    try
      if Assigned(FConnection) then
      begin
        // Perform a lightweight query to keep the connection alive
        FConnection.ExecuteDirect('SELECT 1');
      end
      else
        raise Exception.Create('SQL Connection is not assigned');
    except
      on E: Exception do
      begin
        // Handle the exception, e.g., log error or try reconnecting
        // LogError(E.Message); // Implement logging if needed
      end;
    end;

    // Sleep for the defined ping interval
    Sleep(FPingInterval);
  end;
end;

end.
