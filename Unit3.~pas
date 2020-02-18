unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  TSaque = class(TForm)
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Nom1: TEdit;
    Cont1: TEdit;
    Label4: TLabel;
    Val1: TEdit;
    Label5: TLabel;
    Sen1: TEdit;
    CCor: TRadioButton;
    CPou: TRadioButton;
    Saq: TButton;
    Bck1: TButton;
    Image1: TImage;
    procedure Bck1Click(Sender: TObject);
    procedure SaqClick(Sender: TObject);
    procedure Nom1Change(Sender: TObject);
    procedure Cont1Change(Sender: TObject);
    procedure Sen1Change(Sender: TObject);
    procedure CCorClick(Sender: TObject);
    procedure CPouClick(Sender: TObject);
    procedure Val1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Saque: TSaque;
  Scr, CorSal, PouSal, Ctx: Real;
  Tip, Nm, Cnm, Ncont, CNcont, Ver: String;
  Pass, CPass: Integer;
  Reg: TextFile;

implementation

{$R *.dfm}

procedure TSaque.Bck1Click(Sender: TObject);
begin
   Close;
end;

procedure TSaque.SaqClick(Sender: TObject);
     Var
       Statu: Boolean;
       Mov: TDateTime;
begin
   Statu:= false;
   If(Statu = false) Then
     Begin
        If (Cnm <> Nm) And (Nom1.Text <> '') Then
          Begin
             Statu:= false;
             ShowMessage('Desculpe, não encontramos registro deste nome. Caso não seja cadastrado, volte ao menu anterior e clique em Cadastro.');
             Nom1.Text:= '';
             Nom1.SetFocus;
          End;
        If (CNcont <> NCont) And (Cont1.Text <> '') Then
          Begin
             Statu:= false;
             ShowMessage('Esta conta é inexistente.');
             Cont1.Text:= '';
             Cont1.SetFocus;
          End;
        If (CPass <> Pass) And (Sen1.Text <> '') Then
          Begin
             Statu:= false;
             ShowMessage('Senha incorreta.');
             Sen1.Text:= '';
             Sen1.SetFocus;
          End;
        If (CCor.Checked = false) And (CPou.Checked = False) Then
          Begin
             Statu:= false;
             ShowMessage('Por favor, selecione o tipo de sua conta para que possa ser efetuada a consulta.');
          End;
        If (Nom1.Text = '') Then
          Begin
             Statu:= false;
             ShowMessage('O campo "Nome" está vazio.');
             Nom1.SetFocus;
          End;
        If (Cont1.Text = '') Then
          Begin
             Statu:= false;
             ShowMessage('O campo "Número da Conta" está vazio.');
             Cont1.SetFocus;
          End;
        If (Sen1.Text = '') Then
          Begin
             Statu:= false;
             ShowMessage('O campo "Senha" está vazio.');
             Sen1.SetFocus;
          End;
        If (Val1.Text = '') Then
          Begin
             Statu:= false;
             ShowMessage('Por favor, informe o valor que deseja sacar.');
             Val1.SetFocus;
          End
        Else
          Begin
             Statu:= true;
          End;
     End;
   If (Statu = true) Then
   Begin
   Mov:= Now;
   Ver:= DateToStr(Mov);
   AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\DataMov.txt');
   Rewrite(Reg);
   Writeln(Reg, Ver);
   CloseFile(Reg);
   Ver:= FormatFloat('R$ #,##0.00', Scr);
   AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\SaqVal.txt');
   Rewrite(Reg);
   Writeln(Reg, Ver);
   CloseFile(Reg);
   If (CCor.Checked) Then
     Begin
        CorSal:= CorSal - Scr;
        If (CorSal < Scr) Then
          Begin
             ShowMessage('Saldo insuficiente. Selecione outra conta ou considere as nossas opções de crédito ou empréstimo.');
             Val1.Text:= '';
             Val1.SetFocus;
          End;
        Ver:= FloatToStr(CorSal);
        AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\CorSal.txt');
        Rewrite(Reg);
        Writeln(Reg, Ver);
        CloseFile(Reg);
     End
     Else If(CPou.Checked) Then
        Begin
           PouSal:= PouSal - Scr;
           If (PouSal < Scr) Then
             Begin
                ShowMessage('Saldo insuficiente. Selecione outra conta ou considere as nossas opções de crédito ou empréstimo.');
                Val1.Text:= '';
                Val1.SetFocus;
             End;
           Ver:= FloatToStr(PouSal);
           AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\PouSal.txt');
           Rewrite(Reg);
           Writeln(Reg, Ver);
           CloseFile(Reg);
        End;
     ShowMessage('Saque Realizado com sucesso. Retire seu dinheiro.');
     End;
end;

procedure TSaque.Nom1Change(Sender: TObject);
begin
   Nm:= Nom1.Text;
   AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\Cliente.txt');
   Reset(Reg);
   Readln(Reg, Cnm);
   CloseFile(Reg);
end;

procedure TSaque.Cont1Change(Sender: TObject);
begin
   Cont1.MaxLength:= 6;
   If (Length(Cont1.Text) = 4) Then
     Begin
        Cont1.Text:= Cont1.Text + '-';
        Cont1.SelStart:= Length(Cont1.Text);
     End;
   Ncont:= Cont1.Text;
   AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\Conta.txt');
   Reset(Reg);
   Readln(Reg, CNcont);
   CloseFile(Reg);
end;

procedure TSaque.Sen1Change(Sender: TObject);
     Var
       Ref: String;
begin
   If (Sen1.Text <> '') Then
     Begin
        Sen1.MaxLength:= 8;
        Sen1.PasswordChar:= '*';
        Sen1.SelStart:= Length(Sen1.Text);
        Pass:= StrToInt(Sen1.Text);
        AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\Senha.txt');
        Reset(Reg);
        Readln(Reg, Ref);
        CloseFile(Reg);
        CPass:= StrToInt(Ref);
     End;
end;

procedure TSaque.CCorClick(Sender: TObject);
     Var
       Qm, Qa: Integer;
       Vl1: String;
       DatA, DatE: TDateTime;
       Ma, Aa, Da, Me, Ae, De: Word;
begin
   Ctx:= 0;
   Qa:= 0;
   Qm:= 0;
   DatA:= Now;
   DecodeDate(DatA, Aa, Ma, Da);
   AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\DataCreat.txt');
   Reset(Reg);
   Readln(Reg, Vl1);
   CloseFile(Reg);
   DatE:= StrToDate(Vl1);
   DecodeDate(DatA, Ae, Me, De);
   AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\CorSal.txt');
   Reset(Reg);
   Readln(Reg, Vl1);
   CloseFile(Reg);
   If(Ma{(DatA)} > Me{(DatE)}) And (Aa{(DatA)} > Ae{(DatE)}) Then
     Begin
        While (Ma{(DatA)} > Me{(DatE)}) And (Aa{(DatA)} > Ae{(DatE)}) Do
           Begin
              Qa:= Aa - Ae;
              If (Qa > 1) Then
                Qm:= (Ma - Me) + (Qa * 12)
                Else
                  Qm:= Ma - Me;
           End;
        CorSal:= StrToFloat(Vl1);
        Ctx:= Qm * ((CorSal * 2) / 100);
        CorSal:= CorSal - Ctx;
        Vl1:= FloatToStr(CorSal);
        AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\CorSal.txt');
        Rewrite(Reg);
        Writeln(Reg, Vl1);
        CloseFile(Reg);
     End;
   CorSal:= StrToFloat(Vl1);
end;

procedure TSaque.CPouClick(Sender: TObject);
     Var
       Qm, Qa: Integer;
       Vl2: String;
       DatA, DatE: TDateTime;
       Ma, Aa, Da, Me, Ae, De: Word;
begin
   Ctx:= 0;
   Qa:= 0;
   Qm:= 0;
   DatA:= Now;
   DecodeDate(DatA, Aa, Ma, Da);
   AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\DataCreat.txt');
   Reset(Reg);
   Readln(Reg, Vl2);
   CloseFile(Reg);
   DatE:= StrToDate(Vl2);
   DecodeDate(DatA, Ae, Me, De);
   AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\PouSal.txt');
   Reset(Reg);
   Readln(Reg, Vl2);
   CloseFile(Reg);
   If(Ma{(DatA)} > Me{(DatE)}) And (Aa{(DatA)} > Ae{(DatE)}) Then
     Begin
        While (Ma{(DatA)} > Me{(DatE)}) And (Aa{(DatA)} > Ae{(DatE)}) Do
           Begin
              Qa:= Aa - Ae;
              If (Qa > 1) Then
                Qm:= (Ma - Me) + (Qa * 12)
                Else
                  Qm:= Ma - Me;
           End;
        PouSal:= StrToFloat(Vl2);
        Ctx:= Qm * ((CorSal * 0.5) / 100);
        PouSal:= CorSal + Ctx;
        Vl2:= FloatToStr(PouSal);
        AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\PouSal.txt');
        Rewrite(Reg);
        Writeln(Reg, Vl2);
        CloseFile(Reg);
     End;
     PouSal:= StrToFloat(Vl2);
end;

procedure TSaque.Val1Change(Sender: TObject);
begin
   If (Val1.Text <> '') Then
     Scr:= StrToFloat(Val1.Text);
end;

end.
