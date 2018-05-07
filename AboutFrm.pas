unit AboutFrm;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, lclintf;

type

  { TAboutForm }

  TAboutForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.dfm}

procedure TAboutForm.Label1Click(Sender: TObject);
begin
     OpenURL('http://www.ncomp.co.za');
     //If ShellExecute (0, '', pchar('http://www.ncomp.co.za'), '', '', SW_NORMAL) <= 32 then
     // showmessage('The Link Failed to open');
end;


end.
