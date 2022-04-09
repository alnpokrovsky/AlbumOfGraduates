unit Connect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmConnect = class(TForm)
    BtnCreate: TButton;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Image1: TImage;
    EditGod: TEdit;
    Timer1: TTimer;
    CheckBox3: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure BtnCreateClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure ComboBox2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  SQL = 'C:\Program Files\Album of Graduates\Calendar\SQL.txt';
  AlbGod = 'C:\Program Files\Album of Graduates\Calendar\AlbGod.txt';
  CalendarEXE = 'C:\Program Files\Album of Graduates\Calendar\Calendar.exe';

var
  frmConnect: TfrmConnect;

implementation

{$R *.dfm}

uses Albom;

procedure TfrmConnect.FormCreate(Sender: TObject);
var
  procent: integer;
begin
//Оптимизируем программу под разрешение экрана
  procent:= round((Screen.Width * Screen.Height) / (1024 * 1280) * 100);
  ChangeScale(procent, 100);

//задаем расположение формы
  frmConnect.Left:= (Screen.Width - frmConnect.Width) div 2;
  frmConnect.Top:= (Screen.Height - frmConnect.Height) div 2;
end;

procedure TfrmConnect.BtnCreateClick(Sender: TObject);
var
  TextingFile: TextFile;
  zapr: string;
begin
  zapr:= '';
  if CheckBox1.Checked then
    case ComboBox1.ItemIndex of
        0: zapr:= '(Ima LIKE "' + Edit1.Text + '")'; //Фамилия
        1: zapr:= '(Ima2 LIKE "' + Edit1.Text + '")'; //Имя
        2: zapr:= '(god_vipuska LIKE "' + Edit1.Text + '")'; //год выпуска
        3: zapr:= '(profil LIKE "' + Edit1.Text + '")'; //профиль
        4: zapr:= '(kl_ruk LIKE "' + Edit1.Text + '")'; //кл. руководитель
        5: zapr:= '(medal LIKE "' + Edit1.Text + '")'; // медаль
    end;

  if CheckBox1.Checked and CheckBox2.Checked then
                                          zapr:= zapr + ' AND ';

  if CheckBox2.Checked then
    case ComboBox2.ItemIndex of
        0: zapr:= zapr + '(Ima LIKE "' + Edit2.Text + '")'; //Фамилия
        1: zapr:= zapr + '(Ima2 LIKE "' + Edit2.Text + '")'; //Имя
        2: zapr:= zapr + '(god_vipuska LIKE "' + Edit2.Text + '")'; //год выпуска
        3: zapr:= zapr + '(profil LIKE "' + Edit2.Text + '")'; //профиль
        4: zapr:= zapr + '(kl_ruk LIKE "' + Edit2.Text + '")'; //кл. руководитель
        5: zapr:= zapr + '(medal LIKE "' + Edit2.Text + '")'; // медаль
    end;

  AssignFile(TextingFile, SQL);
  ReWrite(TextingFile);
  if (zapr <> '') then WriteLn(TextingFile, zapr);
  CloseFile(TextingFile);

  AssignFile(TextingFile, AlbGod);
  ReWrite(TextingFile);
  WriteLn(TextingFile, EditGod.Text);
  CloseFile(TextingFile);

  WinExec(CalendarEXE, SW_ShowNormal);
  frmConnect.Close;
end;

procedure TfrmConnect.btnCancelClick(Sender: TObject);
begin
  frmConnect.Close;
end;

procedure TfrmConnect.CheckBox1Click(Sender: TObject);
begin
  ComboBox1.Enabled:= CheckBox1.Checked;
  if ComboBox1.ItemIndex <> -1 then Edit1.Enabled:= CheckBox1.Checked;
end;

procedure TfrmConnect.CheckBox2Click(Sender: TObject);
begin
  ComboBox2.Enabled:= CheckBox2.Checked;
  if ComboBox2.ItemIndex <> -1 then Edit2.Enabled:= CheckBox2.Checked;
end;

procedure TfrmConnect.ComboBox1Click(Sender: TObject);
begin
  if ComboBox1.ItemIndex <> -1 then begin
      Edit1.Enabled:= CheckBox1.Checked;
      if ComboBox2.ItemIndex = ComboBox1.ItemIndex then begin
          ComboBox2.ItemIndex:= -1;
          Edit2.Enabled:= False;
      end;
  end;
end;

procedure TfrmConnect.ComboBox2Click(Sender: TObject);
begin
  if ComboBox2.ItemIndex <> -1 then begin
      Edit2.Enabled:= CheckBox2.Checked;
      if ComboBox1.ItemIndex = ComboBox2.ItemIndex then begin
          ComboBox1.ItemIndex:= -1;
          Edit1.Enabled:= False;
      end;
  end;
end;

procedure TfrmConnect.Timer1Timer(Sender: TObject);
begin
  if Edit1.Enabled then
    if (Edit1.Text <> '') and (Edit1.Text[1]<>' ') and (EditGod.Text <> '') then
      BtnCreate.Enabled:= True
    else
      BtnCreate.Enabled:= False;

  if Edit2.Enabled then
    if (Edit2.Text <> '') and (Edit2.Text[1]<>' ') and (EditGod.Text <> '') then
      BtnCreate.Enabled:= True
    else
      BtnCreate.Enabled:= False;

  if Edit1.Enabled and Edit2.Enabled then
      if (Edit1.Text <> '') and (Edit1.Text[1]<>' ') and (EditGod.Text <> '')
                         and (Edit2.Text <> '') and (Edit2.Text[1]<>' ') then
                                                BtnCreate.Enabled:= True
      else BtnCreate.Enabled:= False;

  if (Edit1.Enabled = False) and (Edit2.Enabled = False) then
    BtnCreate.Enabled:= False;

  if (CheckBox1.Checked) and (Edit1.Enabled = False) then
    BtnCreate.Enabled:= False;

  if (CheckBox2.Checked) and (Edit2.Enabled = False) then
    BtnCreate.Enabled:= False;
end;

procedure TfrmConnect.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked then begin
      CheckBox1.Checked:= False;
      CheckBox1.Enabled:= False;
      ComboBox1.Enabled:= False;
      Edit1.Enabled:= False;

      CheckBox2.Checked:= False;
      CheckBox2.Enabled:= False;
      ComboBox2.Enabled:= False;
      Edit2.Enabled:= False;

      Timer1.Enabled:= False;

      BtnCreate.Enabled:= True;
  end
  else begin
      CheckBox1.Enabled:= True;
      CheckBox2.Enabled:= True;
      Timer1.Enabled:= True;
  end;
end;

end.
