unit Redaktor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, ExtDlgs, Mask, DBCtrls, DB, ADODB,
  Buttons;

type
  TfrmRedaktor = class(TForm)
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Shape1: TShape;
    LoadPicture: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    Label1: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    DBEditTop: TDBEdit;
    DBEditLeft: TDBEdit;
    SpeedBtnVverh: TSpeedButton;
    SpeedBtnLeft: TSpeedButton;
    SpeedBtnVniz: TSpeedButton;
    SpeedBtnRight: TSpeedButton;
    DBEditWidth: TDBEdit;
    DBEditHeight: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditProcent: TEdit;
    Label5: TLabel;
    TmrControl: TTimer;
    BtnProcent: TButton;
    BtnReset: TButton;
    TmrRepeatClick: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure LoadPictureClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SetMultiLineButton(AParent: TWinControl);
    procedure TmrControlTimer(Sender: TObject);
    procedure BtnProcentClick(Sender: TObject);
    procedure BtnResetClick(Sender: TObject);
    procedure SpeedBtnVverhMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedBtnLeftMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedBtnVnizMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedBtnRightMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TmrRepeatClickTimer(Sender: TObject);
    procedure SpeedBtnVverhMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedBtnLeftMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedBtnVnizMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedBtnRightMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    {procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);}
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  SQLTextRedakt = 'SELECT osnova.Left, osnova.Top, osnova.ID_osnova FROM osnova WHERE ID_osnova = ';

var
  frmRedaktor: TfrmRedaktor;
  ButtonDown: Boolean;
  Strelka: string;

implementation

{$R *.dfm}

uses
  Albom;

procedure TfrmRedaktor.SetMultiLineButton(AParent: TWinControl);
var
  j: integer;
  ah: THandle;
begin
  for j := 0 to AParent.ControlCount - 1 do
      if (AParent.Controls[j] is TButton) then
      begin
        ah := (AParent.Controls[j] as TButton).Handle;
        SetWindowLong(ah, GWL_STYLE,
        GetWindowLong(ah, GWL_STYLE) OR BS_MULTILINE) ;
      end;
end;

procedure TfrmRedaktor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Enabled:= True;
end;

procedure TfrmRedaktor.FormCreate(Sender: TObject);
var
  procent: integer;
begin
  SetMultiLineButton(frmRedaktor);

  procent:= round((Screen.Width * Screen.Height) / (1024 * 1280) * 100);
  ChangeScale(procent, 100);

end;

procedure TfrmRedaktor.LoadPictureClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then begin
      Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
      Image1.Stretch:= False;
      Image1.AutoSize:= True;
      Image1.AutoSize:= False;
      Image1.Stretch:= True;
  end;
end;

procedure TfrmRedaktor.btnOkClick(Sender: TObject);
begin
  Form1.ADOQuery1.Edit;
  DBEditTop.Text:= IntToStr(Shape1.Top);
  DBEditLeft.Text:= IntToStr(Shape1.Left);
  DBEditWidth.Text:= IntToStr(Image1.Width);
  DBEditHeight.Text:= IntToStr(Image1.Height);
  Form1.ADOQuery1.Post;
  Image1.Picture.SaveToFile(PapkaPhoto + Form1.DBEdit1.Text + '.jpg');

  Form1.imgPhoto.Picture:= Image1.Picture;
  Form1.Enabled:= True;
  Form1.imgPhoto.Top:= - StrToInt(DBEditTop.Text);
  Form1.imgPhoto.Left:= - StrToInt(DBEditLeft.Text);
  Form1.imgPhoto.Width:= StrToInt(DBEditWidth.Text);
  Form1.imgPhoto.Height:= StrToInt(DBEditHeight.Text);
  frmRedaktor.Close;
end;

procedure TfrmRedaktor.BtnProcentClick(Sender: TObject);
begin
  try
    if (EditProcent.Text <> '0') then begin
      Image1.Width:= Round(StrToInt(EditProcent.Text)/100 * Image1.Width);
      Image1.Height:= Round(StrToInt(EditProcent.Text)/100 * Image1.Height);
      EditProcent.Text:= '100';
      Shape1.Top:= 0;
      Shape1.Left:= 0;
    end
    else ShowMessage('Ошибка ввода данных. вводимое значение не может быть равно ' + EditProcent.Text);

  except
    ShowMessage('Ошибка ввода данных. вводимое значение не может быть равно ' + EditProcent.Text);
  end;
end;

procedure TfrmRedaktor.BtnResetClick(Sender: TObject);
begin
  Image1.Picture:= Form1.imgPhoto.Picture;
  EditProcent.Text:= '100';
  try
    Image1.Width:= StrToInt(DBEditWidth.Text);
    Image1.Height:= StrToInt(DBEditHeight.Text);
    Shape1.Top:= StrToInt(DBEditTop.Text);
    Shape1.Left:= StrToInt(DBEditLeft.Text);
  except
    Shape1.Top:= 0;
    Shape1.Left:= 0;
    Image1.Stretch:= False;
    Image1.AutoSize:= True;
    Image1.AutoSize:= False;
    Image1.Stretch:= True;
  end;
end;

procedure TfrmRedaktor.btnCancelClick(Sender: TObject);
begin
  Form1.Enabled:= True;
  frmRedaktor.Close;
end;

{procedure TfrmRedaktor.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  If msg.Result=1 then
  case msg.charcode of
    37: SpeedBtnLeft.Click;
    38: SpeedBtnVverh.Click;
    39: SpeedBtnRight.Click;
    40: SpeedBtnVniz.Click;
  End;
end; }

procedure TfrmRedaktor.FormShow(Sender: TObject);
begin
  Image1.Picture:= Form1.imgPhoto.Picture;
  EditProcent.Text:= '100';
  try
    Image1.Width:= StrToInt(DBEditWidth.Text);
    Image1.Height:= StrToInt(DBEditHeight.Text);
    Shape1.Top:= StrToInt(DBEditTop.Text);
    Shape1.Left:= StrToInt(DBEditLeft.Text);
  except
    Shape1.Top:= 0;
    Shape1.Left:= 0;
    Image1.Stretch:= False;
    Image1.AutoSize:= True;
    Image1.AutoSize:= False;
    Image1.Stretch:= True;
  end;
end;

procedure TfrmRedaktor.SpeedBtnVverhMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Strelka:= 'Vverh';
  tmrRepeatClick.Enabled:= True;
end;

procedure TfrmRedaktor.SpeedBtnVverhMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  tmrRepeatClick.Enabled:= False;
end;

procedure TfrmRedaktor.TmrControlTimer(Sender: TObject);
begin
  if ((EditProcent.Text = '0') or (EditProcent.Text = '100')) then BtnProcent.Enabled:= False
  else BtnProcent.Enabled:= True;
end;

procedure TfrmRedaktor.TmrRepeatClickTimer(Sender: TObject);
begin
  if Strelka = 'Vverh' then
    Shape1.Top:= Shape1.Top - 2;
  if Strelka = 'Vniz' then
    Shape1.Top:= Shape1.Top + 2;
  if Strelka = 'Left' then
    Shape1.Left:= Shape1.Left - 2;
  if Strelka = 'Right' then
    Shape1.Left:= Shape1.Left + 2;
end;

procedure TfrmRedaktor.SpeedBtnVnizMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Strelka:= 'Vniz';
  tmrRepeatClick.Enabled:= True;
end;

procedure TfrmRedaktor.SpeedBtnVnizMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  tmrRepeatClick.Enabled:= False;
end;

procedure TfrmRedaktor.SpeedBtnRightMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Strelka:= 'Right';
  tmrRepeatClick.Enabled:= True;
end;

procedure TfrmRedaktor.SpeedBtnRightMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  tmrRepeatClick.Enabled:= False;
end;

procedure TfrmRedaktor.SpeedBtnLeftMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Strelka:= 'Left';
  tmrRepeatClick.Enabled:= True;
end;

procedure TfrmRedaktor.SpeedBtnLeftMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  tmrRepeatClick.Enabled:= False;
end;

end.
