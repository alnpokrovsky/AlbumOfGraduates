program Albom1;

uses
  Forms,
  Windows,
  Albom in 'Albom.pas' {Form1},
  Style in 'Style.pas' {Form2},
  Connect in 'Connect.pas' {frmConnect},
  Redaktor in 'Redaktor.pas' {frmRedaktor},
  menu in 'menu.pas' {menuForm};

{$R *.res}

var hPrevWin: HWND;

begin
  hPrevWin:=FindWindow('TForm1','Альбом выпускников');
//Если окно уже существует, то активировать его
  if hPrevWin<>0 then begin
     SetForegroundWindow(hPrevWin);
     Application.Terminate;
  end
  else begin
  Application.Initialize;
  Application.Title:= 'Альбом выпускников';
  Application.CreateForm(TmenuForm, menuForm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TfrmConnect, frmConnect);
  Application.CreateForm(TfrmRedaktor, frmRedaktor);
  Application.Run;
  end;
end.
