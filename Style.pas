unit Style;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, ExtDlgs, Buttons;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Shape1: TShape;
    Shape3: TShape;
    Shape2: TShape;
    Shape4: TShape;
    Image5: TImage;
    BtnOk: TButton;
    BtnLoad: TButton;
    Label1: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    BtnCancel: TBitBtn;
    procedure Image1Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnLoadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  txtStyle, txtIfCancel: String;

const
  OldStyle = 'C:\Program Files\Album of Graduates\Folders\OldStyle.jpg';
  IcebookStyle = 'C:\Program Files\Album of Graduates\Folders\IcebookStyle.jpg';
  FiguredStyle = 'C:\Program Files\Album of Graduates\Folders\FiguredStyle.jpg';
  SimpleStyle = 'C:\Program Files\Album of Graduates\Folders\SimpleStyle.jpg';

implementation

{$R *.dfm}

uses Albom;

procedure TForm2.Image1Click(Sender: TObject);
begin
  Shape1.Visible:= True;
  Shape2.Visible:= False;
  Shape3.Visible:= False;
  Shape4.Visible:= False;
  Image5.Picture:= Image1.Picture;
  BtnOk.Enabled:= True;
  txtStyle:= FiguredStyle;
end;

procedure TForm2.Image2Click(Sender: TObject);
begin
  Shape1.Visible:= False;
  Shape2.Visible:= True;
  Shape3.Visible:= False;
  Shape4.Visible:= False;
  Image5.Picture:= Image2.Picture;
  BtnOk.Enabled:= True;
  txtStyle:= IcebookStyle;
end;

procedure TForm2.Image3Click(Sender: TObject);
begin
  Shape1.Visible:= False;
  Shape2.Visible:= False;
  Shape3.Visible:= True;
  Shape4.Visible:= False;
  Image5.Picture:= Image3.Picture;
  BtnOk.Enabled:= True;
  txtStyle:= OldStyle;
end;

procedure TForm2.Image4Click(Sender: TObject);
begin
  Shape1.Visible:= False;
  Shape2.Visible:= False;
  Shape3.Visible:= False;
  Shape4.Visible:= True;
  Image5.Picture:= Image4.Picture;
  BtnOk.Enabled:= True;
  txtStyle:= SimpleStyle;
end;

procedure TForm2.BtnOkClick(Sender: TObject);
begin
  Form1.ImgAlbum.Picture:= Image5.Picture;
  Form2.Close;
end;

procedure TForm2.BtnCancelClick(Sender: TObject);
begin
  txtStyle:= txtIfCancel;
  Form2.Close;
end;

procedure TForm2.BtnLoadClick(Sender: TObject);
begin
  if (OpenPictureDialog1.Execute) then begin
      Image5.Picture.LoadFromFile(OpenPictureDialog1.FileName);
      BtnOk.Enabled:= True;
      txtStyle:= OpenPictureDialog1.FileName;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  procent: integer;
begin
//Оптимизируем программу под разрешение экрана
  procent:= round((Screen.Width * Screen.Height) / (1024 * 1280) * 100);
  ChangeScale(procent, 100);

//задаем расположение формы
  Form2.Left:= (Screen.Width - Form2.Width) div 2;
  Form2.Top:= (Screen.Height - Form2.Height) div 2;
end;

end.
