unit Unit1;
  
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, Buttons, DateUtils;

type
  THall = class(TForm)
    Shape1: TShape;
    Temp: TLabel;
    Dat: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Cst: TButton;
    Sq: TButton;
    Dept: TButton;
    Cdst: TButton;
    Image1: TImage;
    A: TImage;
    BitBtn1: TBitBtn;
    procedure CstClick(Sender: TObject);
    procedure SqClick(Sender: TObject);
    procedure DeptClick(Sender: TObject);
    procedure CdstClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    //procedure ShowModalCst(Sender: TOBject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Hall: THall;

implementation

Uses
  Unit2, Unit3, Unit4, Unit5;

{$R *.dfm}

procedure THall.CstClick(Sender: TObject);
begin
   Cosc.ShowModal;
end;

{procedure THall.CstClick(Sender: TOBject);
   Var
     Csmos: TCosc;

begin
   Csmos:= Cosc.Create(nil);
      try
        Cosc.ShowModal;
      finally
         Cosc.Free;
      end;
end;}

procedure THall.SqClick(Sender: TObject);
begin
   Saque.ShowModal;
end;

procedure THall.DeptClick(Sender: TObject);
begin
   Deposito.ShowModal;
end;

procedure THall.CdstClick(Sender: TObject);
begin
   Cadastro.ShowModal;
end;

procedure THall.BitBtn1Click(Sender: TObject);
begin
   Application.Terminate;
end;

procedure THall.FormCreate(Sender: TObject);
     Var
       Hj{, tmp}: TDateTime;
       //tmpi, s, rs, m, rm, h, rh: Integer;
begin
   Hj:= Now;
   //tmp:= Now;
   Dat.Caption:= DateToStr(Hj);
   {FormatDateTime(rs, TDateTime(seconds));
   For s:= rs To 60 Do
     Begin}
   Temp.Caption:= TimeToStr(Hj);
end;

end.
