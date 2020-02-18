unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TDeposito = class(TForm)
    Image1: TImage;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Nom2: TEdit;
    Cont: TEdit;
    Sen: TEdit;
    Label9: TLabel;
    CCor2: TRadioButton;
    CPou2: TRadioButton;
    Dps: TButton;
    Bck2: TButton;
    Label4: TLabel;
    DpVal: TEdit;
    procedure Bck2Click(Sender: TObject);
    procedure Nom2Change(Sender: TObject);
    procedure ContChange(Sender: TObject);
    procedure SenChange(Sender: TObject);
    procedure CCor2Click(Sender: TObject);
    procedure CPou2Click(Sender: TObject);
    procedure DpValChange(Sender: TObject);
    procedure DpsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Deposito: TDeposito;
  Scr, CorSal, PouSal, Ctx: Real;
  Tip, Nm, Cnm, Ncont, CNcont, Ver: String;
  Pass, CPass: Integer;
  Reg: TextFile;

implementation

{$R *.dfm}

procedure TDeposito.Bck2Click(Sender: TObject);
begin
   Close;
end;

procedure TDeposito.Nom2Change(Sender: TObject);
begin
   Nm:= Nom2.Text;
   AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\Cliente.txt');
   Reset(Reg);
   Readln(Reg, Cnm);
   CloseFile(Reg);
end;

procedure TDeposito.ContChange(Sender: TObject);
begin
   Cont.MaxLength:= 6;
   If (Length(Cont.Text) = 4) Then
     Begin
        Cont.Text:= Cont.Text + '-';
        Cont.SelStart:= Length(Cont.Text);
     End;
   Ncont:= Cont.Text;
   AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\Conta.txt');
   Reset(Reg);
   Readln(Reg, CNcont);
   CloseFile(Reg);
end;

procedure TDeposito.SenChange(Sender: TObject);
     Var
       Ref: String;
begin
   If (Sen.Text <> '') Then
     Begin
        Sen.MaxLength:= 8;
        Sen.PasswordChar:= '*';
        Sen.SelStart:= Length(Sen.Text);
        Pass:= StrToInt(Sen.Text);
        AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\Senha.txt');
        Reset(Reg);
        Readln(Reg, Ref);
        CloseFile(Reg);
        CPass:= StrToInt(Ref);
     End;
end;

procedure TDeposito.CCor2Click(Sender: TObject);
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

procedure TDeposito.CPou2Click(Sender: TObject);
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

procedure TDeposito.DpValChange(Sender: TObject);
begin
   If (DpVal.Text <> '') Then
     Scr:= StrToFloat(DpVal.Text);
end;

procedure TDeposito.DpsClick(Sender: TObject);
     Var
       Statu: Boolean;
       Mov: TDateTime;
begin
   Statu:= false;
   If(Statu = false) Then
     Begin
        If (Cnm <> Nm) And (Nom2.Text <> '') Then
          Begin
             Statu:= false;
             ShowMessage('Desculpe, não encontramos registro deste nome. Caso não seja cadastrado, volte ao menu anterior e clique em Cadastro.');
             Nom2.Text:= '';
             Nom2.SetFocus;
          End;
        If (CNcont <> NCont) And (Cont.Text <> '') Then
          Begin
             Statu:= false;
             ShowMessage('Esta conta é inexistente.');
             Cont.Text:= '';
             Cont.SetFocus;
          End;
        If (CPass <> Pass) And (Sen.Text <> '') Then
          Begin
             Statu:= false;
             ShowMessage('Senha incorreta.');
             Sen.Text:= '';
             Sen.SetFocus;
          End;
        If (CCor2.Checked = false) And (CPou2.Checked = False) Then
          Begin
             Statu:= false;
             ShowMessage('Por favor, selecione o tipo de sua conta para que possa ser efetuada a consulta.');
          End;
        If (Nom2.Text = '') Then
          Begin
             Statu:= false;
             ShowMessage('O campo "Nome" está vazio.');
             Nom2.SetFocus;
          End;
        If (Cont.Text = '') Then
          Begin
             Statu:= false;
             ShowMessage('O campo "Número da Conta" está vazio.');
             Cont.SetFocus;
          End;
        If (Sen.Text = '') Then
          Begin
             Statu:= false;
             ShowMessage('O campo "Senha" está vazio.');
             Sen.SetFocus;
          End;
        If (DpVal.Text = '') Then
          Begin
             Statu:= false;
             ShowMessage('Por favor, informe o valor que deseja depositar.');
             DpVal.SetFocus;
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
   AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\DepVal.txt');
   Rewrite(Reg);
   Writeln(Reg, Ver);
   CloseFile(Reg);
   If (CCor2.Checked) Then
     Begin
        CorSal:= CorSal + Scr;
        Ver:= FloatToStr(CorSal);
        AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\CorSal.txt');
        Rewrite(Reg);
        Writeln(Reg, Ver);
        CloseFile(Reg);
     End
     Else If(CPou2.Checked) Then
        Begin
           PouSal:= PouSal + Scr;
           Ver:= FloatToStr(PouSal);
           AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\PouSal.txt');
           Rewrite(Reg);
           Writeln(Reg, Ver);
           CloseFile(Reg);
        End;
     ShowMessage('Valor depositado com sucesso.');
     End;
end;

end.
