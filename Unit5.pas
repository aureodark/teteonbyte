unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TCadastro = class(TForm)
    Image2: TImage;
    Shape1: TShape;
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Nom: TEdit;
    Cpf: TEdit;
    Rg: TEdit;
    Endr: TEdit;
    Cep: TEdit;
    Tel: TEdit;
    SCon: TEdit;
    Sen: TEdit;
    Cad: TButton;
    Bck: TButton;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Cfrmd: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Nme: TLabel;
    Regi: TLabel;
    Ecd: TLabel;
    Post: TLabel;
    PesF: TLabel;
    nha: TLabel;
    lef: TLabel;
    Contn: TLabel;
    procedure BckClick(Sender: TObject);
    procedure NomChange(Sender: TObject);
    procedure CpfChange(Sender: TObject);
    procedure RgChange(Sender: TObject);
    procedure EndrChange(Sender: TObject);
    procedure CepChange(Sender: TObject);
    procedure TelChange(Sender: TObject);
    procedure TelClick(Sender: TObject);
    procedure SenChange(Sender: TObject);
    procedure SenExit(Sender: TObject);
    procedure SConChange(Sender: TObject);
    procedure CadClick(Sender: TObject);
    //function NumChecker(Sender: TObject);
  private
    { Private declarations }
    //procedure ChkData(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Cadastro: TCadastro;
  Reg: TextFile;
  Pass, CPass: Integer;
  Edr: String[150];
  Nm, IdRc, IdRr, EdC, Fon, Sword, Ncont, ValR: String;
  Sal: Real;

implementation

{$R *.dfm}

procedure TCadastro.BckClick(Sender: TObject);
begin
   Close;
end;

procedure TCadastro.NomChange(Sender: TObject);
begin
   Nm:= Nom.Text;
   AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\Cliente.txt');
   Rewrite(Reg);
   Writeln(Reg, Nm);
   CloseFile(Reg);
end;

procedure TCadastro.CpfChange(Sender: TObject);
begin
   Cpf.MaxLength:= 14;
   If (Length(Cpf.Text) = 3) Then
     Begin
        Cpf.Text:= Cpf.Text + '.';
        Cpf.SelStart:= Length(Cpf.Text);
     End;
   If (Length(Cpf.Text) = 7) Then
     Begin
        Cpf.Text:= Cpf.Text + '.';
        Cpf.SelStart:= Length(Cpf.Text);
     End;
   If (Length(Cpf.Text) = 11) Then
     Begin
        Cpf.Text:= Cpf.Text + '-';
        Cpf.SelStart:= Length(Cpf.Text);
     End;
   IdRc:= Cpf.Text;
end;

procedure TCadastro.RgChange(Sender: TObject);
begin
   Rg.MaxLength:= 12;
   If (Length(Rg.Text) = 2) Then
     Begin
        Rg.Text:= Rg.Text + '.';
        Rg.SelStart:= Length(Rg.Text);
     End;
   If (Length(Rg.Text) = 6) Then
     Begin
        Rg.Text:= Rg.Text + '.';
        Rg.SelStart:= Length(Rg.Text);
     End;
   If (Length(Rg.Text) = 10) Then
     Begin
        Rg.Text:= Rg.Text + '-';
        Rg.SelStart:= Length(Rg.Text);
     End;
   IdRr:= Rg.Text;
end;

procedure TCadastro.EndrChange(Sender: TObject);
begin
   Edr:= Endr.Text;
end;

procedure TCadastro.CepChange(Sender: TObject);
begin
   Cep.MaxLength:= 9;
   If (Length(Cep.Text) = 5) Then
     Begin
        Cep.Text:= Cep.Text + '-';
        Cep.SelStart:= Length(Cep.Text);
     End;
   EdC:= Cep.Text;
end;

procedure TCadastro.TelChange(Sender: TObject);
begin
   Tel.MaxLength:= 13;
   If (Length(Tel.Text) = 3) Then
     Begin
        Tel.Text:= Tel.Text + ')';
        Tel.SelStart:= Length(Tel.Text);
     End;
   If (Length(Tel.Text) = 8) Then
     Begin
        Tel.Text:= Tel.Text + '-';
        Tel.SelStart:= Length(Tel.Text);
     End;
   Fon:= Tel.Text;
end;

procedure TCadastro.TelClick(Sender: TObject);
begin
   Tel.Text:= '(';
   Tel.SelStart:= 2;
end;

procedure TCadastro.SenChange(Sender: TObject);
begin
   Sen.MaxLength:= 8;
   Sen.PasswordChar:= '*';
   Pass:= StrToInt(Sen.Text);
end;

procedure TCadastro.SenExit(Sender: TObject);
begin
   If (Length(Sen.Text) < 8) Then
     Begin
            ShowMessage('A senha deve conter 8 caracteres.');
            Sen.SetFocus;
     End
     Else
       SCon.SetFocus;
end;

procedure TCadastro.SConChange(Sender: TObject);
begin
     SCon.MaxLength:= 8;
     SCon.PasswordChar:= '*';
     CPass:= StrToInt(SCon.Text);
end;

procedure TCadastro.CadClick(Sender: TObject);
     Var
       Ref, Sin: Integer;
       Stat: Boolean;
       CriacCon: TDateTime;
       Dum: String;
begin
   Stat:= false;
   If (Stat = false) Then
     Begin
        If (Pass <> CPass) Then
          Begin
             Stat:= false;
             ShowMessage('A confirmação da senha não confere com a original.');
             Label2.Font.Color:= $0000FF;
             Label3.Font.Color:= $0000FF;
          End;
        If (Sen.Text = '') Then
          Begin
             Stat:= false;
             ShowMessage('A senha é obrigatória.');
             Label2.Font.Color:= $0000FF;
          End;
        If (Tel.Text = '') Then
          Begin
             Stat:= false;
             ShowMessage('O campo de telefone é obrigatório.');
             Label7.Font.Color:= $0000FF;
          End
          Else If (Length(Tel.Text) < 13) And (Length(Tel.Text) > 0) Then
              Begin
                 Stat:= false;
                 ShowMessage('Este número de telefone não é válido.');
                 Label7.Font.Color:= $0000FF;
              End;
        If (Cpf.Text = '') Then
          Begin
             Stat:= false;
             ShowMessage('O campo do CPF é obrigatório.');
             Label5.Font.Color:= $0000FF;
          End
          Else If (Length(Cpf.Text) < Cpf.MaxLength) And (Length(Cpf.Text) > 0) Then
             Begin
                  Stat:= false;
                  ShowMessage('Este número de CPF não é válido.');
                  Label5.Font.Color:= $0000FF;
               End;
        If (Cep.Text = '') Then
            Begin
               Stat:= false;
               ShowMessage('O campo do CEP é obrigatório.');
               Label6.Font.Color:= $0000FF;
            End
            Else If (Length(Cep.Text) < Cep.MaxLength) And (Length(Cep.Text) > 0) Then
                Begin
                   Stat:= false;
                   ShowMessage('Este número do CEP não é válido.');
                   Label6.Font.Color:= $0000FF;
                End;
        If (Nom.Text = '') Then
          Begin
             Stat:= false;
             ShowMessage('O campo de nome é obrigatório.');
             Label1.Font.Color:= $0000FF;
          End;
        If (Endr.Text = '') Then
          Begin
             Stat:= false;
             ShowMessage('O campo de endereço é obrigatório.');
             Label4.Font.Color:= $0000FF;
          End;
        If (Rg.Text = '') Then
          Begin
             Stat:= false;
             ShowMessage('O campo do Rg é obrigatório.');
             Label8.Font.Color:= $0000FF;
          End
          Else If (Length (Rg.Text) < Rg.MaxLength) And (Length(Rg.Text) > 0)Then
              Begin
                 Stat:= false;
                 ShowMessage('O número do RG não é válido.');
                 Label8.Font.Color:= $0000FF;
              End;
     End
     Else
       Begin
          Stat:= true;
       End;
          CriacCon:= Now;
          Dum:= DateToStr(CriacCon);
          Sword:= IntToStr(Pass);
          AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\Senha.txt');
          Rewrite(Reg);
          Writeln(Reg, Sword);
          CloseFile(Reg);
          Randomize;
          Ref:= Random(9999);
          If (Ref < 1000) Then
            Begin
               Repeat
                   Ref:= Random(9999);
               Until(Ref > 1000);
            End;
          Sin:= Random(9);
          Ncont:= IntToStr(Ref) + '-' + IntToStr(Sin);
          AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\Conta.txt');
          Rewrite(Reg);
          Writeln(Reg, Ncont);
          CloseFile(Reg);
          Nme.Caption:= Nm;
          PesF.Caption:= IdRc;
          Regi.Caption:= IdRr;
          Ecd.Caption:= Edr;
          Post.Caption:= EdC;
          lef.Caption:= Fon;
          nha.Caption:= Sword;
          Contn.Caption:= Ncont;
          Cfrmd.Visible:= true;
          Sal:= 200.0;
          ValR:= FloatToStr(Sal);
          AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\CorSal.txt');
          Rewrite(Reg);
          Writeln(Reg, ValR);
          CloseFile(Reg);
          AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\PouSal.txt');
          Rewrite(Reg);
          Writeln(Reg, ValR);
          CloseFile(Reg);
          AssignFile(Reg, '\\servidor\Rede Lab\Alunos\ALEX VELOSO RODRIGUES - 974\Delphi Mod I\Teste\Dats\DataCreat.txt');
          Rewrite(Reg);
          Writeln(Reg, Dum);
          CloseFile(Reg);
   //    End;
   {If(Stat = true) Then
     Begin

     End;}
end;

//Stat:= true;

{function THall.NumChecker(Chk: String): boolean;
begin
   If (Chk <> '0') Or (Chk <> '0')Then
end;}

end.
