unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls;

type
  TCosc = class(TForm)
    Nom: TEdit;
    Cont: TEdit;
    Sen: TEdit;
    Stat: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    ContM: TLabel;
    Sal: TLabel;
    Ql: TLabel;
    CCor1: TRadioButton;
    CPou1: TRadioButton;
    ConsC: TButton;
    Image1: TImage;
    Bck: TButton;
    Image2: TImage;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    MovDat: TLabel;
    lbl: TLabel;
    Label7: TLabel;
    UDep: TLabel;
    USaq: TLabel;
    procedure BckClick(Sender: TObject);
    procedure NomChange(Sender: TObject);
    procedure ConsCClick(Sender: TObject);
    procedure ContChange(Sender: TObject);
    procedure SenChange(Sender: TObject);
    procedure CCor1Click(Sender: TObject);
    procedure CPou1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cosc: TCosc;
  Scr, CorSal, PouSal, Ctx: Real;
  Tip, Nm, Cnm, Ncont, CNcont, Ver: String;
  Pass, CPass: Integer;
  Reg: TextFile;

implementation

{$R *.dfm}

procedure TCosc.BckClick(Sender: TObject);
begin
   Close;
end;

procedure TCosc.NomChange(Sender: TObject);
     {Var
       Ref: String;}
begin
   Nm:= Nom.Text;
   AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\Cliente.txt');
   Reset(Reg);
   Readln(Reg, Cnm);
   //Cnm:= Ref;
   CloseFile(Reg);
end;

procedure TCosc.ConsCClick(Sender: TObject);
     Var
       Statu: Boolean;
begin
   Statu:= false;
   If(Statu = false) Then
     Begin
        If (Cnm <> Nm) And (Nom.Text <> '') Then
          Begin
             Statu:= false;
             ShowMessage('Desculpe, não encontramos registro deste nome. Caso não seja cadastrado, volte ao menu anterior e clique em Cadastro.');
             Nom.Text:= '';
             Nom.SetFocus;
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
        If (CCor1.Checked = false) And (CPou1.Checked = False) Then
          Begin
             Statu:= false;
             ShowMessage('Por favor, selecione o tipo de sua conta para que possa ser efetuada a consulta.');
          End;
        If (Nom.Text = '') Then
          Begin
             Statu:= false;
             ShowMessage('O campo "Nome" está vazio.');
             Nom.SetFocus;
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
          End
        Else
          Begin
             Statu:= true;
          End;
        End;
   Stat.Visible:= true;
   ContM.Caption:= Ncont;
   AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\DataMov.txt');
   Reset(Reg);
   Readln(Reg, Ver);
   CloseFile(Reg);
   If (Ver = '') Then
     MovDat.Caption:= 'Não há registro.'
     Else
       MovDat.Caption:= Ver;
   AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\DepVal.txt');
   Reset(Reg);
   Readln(Reg, Ver);
   CloseFile(Reg);
   If (Ver = '') Then
     UDep.Caption:= 'R$ 0,00'
     Else
       UDep.Caption:= Ver;
   AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\SaqVal.txt');
   Reset(Reg);
   Readln(Reg, Ver);
   CloseFile(Reg);
   If (Ver = '') Then
     USaq.Caption:= 'R$ 0,00'
     Else
       USaq.Caption:= Ver;
   If(CCor1.Checked) Then
     Begin
        Sal.Caption:= FormatFloat('R$ #,##0.00', CorSal);
     End
     Else If(CPou1.Checked) Then
         Begin
            Sal.Caption:= FormatFloat('R$ #,##0.00', PouSal);
         End;
end;

procedure TCosc.ContChange(Sender: TObject);
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
   //Cnm:= Ref;
   CloseFile(Reg);
end;

procedure TCosc.SenChange(Sender: TObject);
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

procedure TCosc.CCor1Click(Sender: TObject);
     Var
       Qm, Qa: Integer;
       Val1: String;
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
   Readln(Reg, Val1);
   CloseFile(Reg);
   DatE:= StrToDate(Val1);
   DecodeDate(DatA, Ae, Me, De);
   AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\CorSal.txt');
   Reset(Reg);
   Readln(Reg, Val1);
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
        CorSal:= StrToFloat(Val1);
        Ctx:= Qm * ((CorSal * 2) / 100);
        CorSal:= CorSal - Ctx;
        Val1:= FloatToStr(CorSal);
        AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\CorSal.txt');
        Rewrite(Reg);
        Writeln(Reg, Val1);
        CloseFile(Reg);
     End;
     CorSal:= StrToFloat(Val1);
end;

procedure TCosc.CPou1Click(Sender: TObject);
     Var
       Qm, Qa: Integer;
       Val2: String;
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
   Readln(Reg, Val2);
   CloseFile(Reg);
   DatE:= StrToDate(Val2);
   DecodeDate(DatA, Ae, Me, De);
   AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\PouSal.txt');
   Reset(Reg);
   Readln(Reg, Val2);
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
        PouSal:= StrToFloat(Val2);
        Ctx:= Qm * ((CorSal * 0.5) / 100);
        PouSal:= CorSal + Ctx;
        Val2:= FloatToStr(PouSal);
        AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\PouSal.txt');
        Rewrite(Reg);
        Writeln(Reg, Val2);
        CloseFile(Reg);
     End;
     PouSal:= StrToFloat(Val2);
end;

end.
