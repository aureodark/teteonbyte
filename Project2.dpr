program Project2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Hall},
  Unit2 in 'Unit2.pas' {Cosc},
  Unit3 in 'Unit3.pas' {Saque},
  Unit4 in 'Unit4.pas' {Deposito},
  Unit5 in 'Unit5.pas' {Cadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(THall, Hall);
  Application.CreateForm(TCosc, Cosc);
  Application.CreateForm(TSaque, Saque);
  Application.CreateForm(TDeposito, Deposito);
  Application.CreateForm(TCadastro, Cadastro);
  Application.Run;
end.
