unit menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, pngimage, StdCtrls, Albom, Handles, Mask, Style;

type
  TmenuForm = class(TForm)
    ImgAlbum: TImage;
    ImgPen: TImage;
    ImgEnteredPen: TImage;
    imgEnteredGlases: TImage;
    imgGlases: TImage;
    LblGlases: TLabel;
    LblPen: TLabel;
    TmrClose: TTimer;
    TmrShow: TTimer;
    ImgDoor: TImage;
    ShapeEnteredDoor: TShape;
    lblDoor: TLabel;
    ImgEnteredDoor: TImage;
    EditPassword: TMaskEdit;
    BtnOk: TButton;
    BtnCancel: TButton;
    procedure ImgPenMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImgEnteredPenMouseLeave(Sender: TObject);
    procedure imgGlasesMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgEnteredGlasesMouseLeave(Sender: TObject);
    procedure imgEnteredGlasesClick(Sender: TObject);
    procedure TmrCloseTimer(Sender: TObject);
    procedure TmrShowTimer(Sender: TObject);
    procedure ImgDoorMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImgEnteredDoorMouseLeave(Sender: TObject);
    procedure ImgEnteredDoorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure ImgEnteredPenClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure EditPasswordEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  DeleteWidth = 13;
  DeleteHeight = 13;
  EditWidth = 13;
  EditHeight = 13;
  ChangeWidth = 13;
  ChangeHeight = 13;
  PassWay = 'C:\Program Files\Album of Graduates\pass.ini';
  reservPass = 'admin';

var
  menuForm: TmenuForm;
  val1: integer;
  EnteringPassword: boolean;

implementation

{$R *.dfm}

procedure TmenuForm.imgGlasesMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  imgGlases.Visible:= False;
  LblGlases.Visible:= True;
end;

procedure TmenuForm.BtnCancelClick(Sender: TObject);
begin
  EnteringPassword:= False;
  EditPassword.Width:= 2;
  EditPassword.Visible:= False;
  btnOk.Visible:= False;
  btnCancel.Visible:= False;
  ImgPen.Visible:= True;
  LblPen.Visible:= False;
end;

procedure TmenuForm.BtnOkClick(Sender: TObject);
var
  j,k,l: integer;
  Password, zapr, text: string;
  MyFile: TextFile;
begin
  AssignFile(MyFile, PassWay);
  //Открытие файла для чтения
  Reset(myFile);
  ReadLn(myFile, Password);
  CloseFile(myFile);
  if (Password = '') then begin
    Rewrite(myFile);
    Password:= reservPass;
    WriteLn(myFile, Password);
    CloseFile(myFile);
  end;

  if EditPassword.Text = Password then begin
    Form1.Show;
    redakt:= True;
    menuForm.Visible:= False;

    AssignFile(myFile, TextFileName);
    ReSet(myFile);
    try
      // Считываем параметры формы
      ReadLn(myFile, txtStyle); ImgAlbum.Picture.LoadFromFile(txtStyle);
      ReadLn(myFile, text); if text = 'True' then Form1.BtnEfekts.Click;
      ReadLn(myFile, text); if text = 'True' then Form1.BtnStretch.Click;
    except
    end;
    CloseFile(myFile);

    with Form1 do begin
      btnCreatePicture.Visible:= True;
      BtnEdit.Click;
      tmrEditing.Enabled:= True;
      lblChangeObl.Visible:=true;
      BtnChangeObl.Visible:= True;
      lblChooseCol.Visible:= True;
      btnChooseCol.Visible:=True;
      BtnInsert.Visible:= True;
      BtnDelete.Visible:= True;
      BtnSaveCol.Visible:= True;
      btnLoadCol.Visible:= True;
      btnSave.Visible:= True;
      //btnStretch.Visible:= True;
      btnChangePhoto.Visible:= True;
      btnStyle.Visible:= True;
      //btnInsertGod.Visible:= True;
      //btnInsertTeacher.Visible:= True;

      ScrollBoxSpiski.Width:= Round(imgAlbum.Width*0.92);
      ScrollBoxVariants.Width:= ScrollBoxSpiski.Width - lblChooseCol.Width - 30;
      btnSpiskiChoose.Left:= ScrollBoxVariants.Width + round(btnSpiskiChoose.Width*0.13);
      lblChangeObl.Left:= ScrollBoxVariants.Width;
      lblChooseCol.Left:= ScrollBoxVariants.Width;
      btnChangeObl.Left:= ScrollBoxSpiski.Width-btnChangeObl.Width;
      btnChooseCol.Left:= ScrollBoxSpiski.Width-btnChooseCol.Width;
      ADOTable1.Active:= False;
      ADOTable1.TableName:= 'profil';
      DBText5.DataField:= 'profil';
      ADOTable1.Active:= True;
      k:= 0;
      repeat
        k:= k + 1;
        lblTeacher[k]:= TLabel.Create(Form1);
        lblTeacher[k].Parent:= ScrollBoxVariants;
        lblTeacher[k].Caption:= DBText5.Caption;
        lblTeacher[k].Font.Color:= clLime;
        lblTeacher[k].Font.Size:= 12;
        if k<>1 then lblTeacher[k].Left:=lblTeacher[k-1].Left+lblTeacher[k-1].Width+60
        else lblTeacher[k].Left:= ImgRazdel.Width + 60;
        ADOTable1.Next;
      until (lblTeacher[k].Caption = DBText5.Caption);
      {btnInsertTeacher.Visible:= True;
      btnInsertTeacher.Left:= lblTeacher[k].Left + lblTeacher[k].Width + 30;}

      ADOTable1.Active:= False;
      ADOTable1.TableName:= 'god_vipuska';
      DBText5.DataField:= 'god_vipuska';
      ADOTable1.Active:= True;
      j:= 0;
      repeat
        j:=j+1;
        lblGod[j]:= TLabel.Create(Form1);
        lblGod[j].Parent:= ScrollBoxVariants;
        lblGod[j].Caption:= DBText5.Caption;
        lblGod[j].Font.Color:= clLime;
        lblGod[j].Font.Size:= 12;
        lblGod[j].Left:= Round(imgRazdel.Width/3);
        if j<>1 then lblGod[j].Top:=lblGod[j-1].Top+lblGod[j-1].Height + 60
        else lblGod[j].Top:= ImgRazdel.Height + 60;

        for l:= 1 to k do begin
          zapr:='(god_vipuska LIKE "' + lblGod[j].Caption + '") AND (profil LIKE "' +
                                              lblTeacher[l].Caption + '")';
          try
            ADOQuery1.Active:= False;
            ADOQuery1.SQL.Text:= TextSQL + ' WHERE ' + zapr;
            ADOQuery1.Active:= True;
          finally;
          end;
          shapeVariant[l,j]:= TShape.Create(Form1);
          shapeVariant[l,j].Parent:= ScrollBoxVariants;
          imgVariant[l,j]:= TImage.Create(Form1);
          imgVariant[l,j].Parent:= ScrollBoxVariants;
          imgVariant[l,j].Tag:=l*1000+j;
          try
            imgVariant[l,j].Picture.LoadFromFile(PapkaPictures+IntToStr(imgVariant[l,j].Tag)+'.jpg');
          except
            imgVariant[l,j].Picture.LoadFromFile(StandartPicture);
          end;
          imgVariant[l,j].Stretch:= True;
          imgVariant[l,j].Top:= lblGod[j].Top - 25;
          imgVariant[l,j].Height:= lblGod[j].Height + 50;
          imgVariant[l,j].Left:= lblTeacher[l].Left-25;
          imgVariant[l,j].Width:= lblTeacher[l].Width+50;
          imgVariant[l,j].Tag:=l*1000+j;
          imgVariant[l,j].OnClick:= ImgVariantClick;
          shapeVariant[l,j].Top:= lblGod[j].Top - 30;
          shapeVariant[l,j].Height:= lblGod[j].Height + 50;
          shapeVariant[l,j].Left:= lblTeacher[l].Left-30;
          shapeVariant[l,j].Width:= lblTeacher[l].Width+55;
          shapeVariant[l,j].Visible:= False;
          shapeVariant[l,j].Brush.Color:= clLime;
        end;
        ADOTable1.Next;
      until (lblGod[j].Caption = DBText5.Caption);
      {btnInsertGod.Visible:= True;
      btnInsertGod.Top:= lblGod[k].Top + lblGod[k].Height + 30; }

      ScrollBoxSpiski.Left:= - ScrollBoxSpiski.Width;
      ScrollBoxSpiski.Visible:= True;

      if efekts then
      Repeat
        ScrollBoxSpiski.Left:= ScrollBoxSpiski.Left + 1;
      Until ScrollBoxSpiski.Left>= Round(btnSpiskiChoose.Width*0.5)
      else ScrollBoxSpiski.Left:= Round(btnSpiskiChoose.Width*0.5);

    end;
  end
  else
    MessageDlg('Неверный пароль', mtError, [mbOk], 0);
end;

procedure TmenuForm.EditPasswordEnter(Sender: TObject);
begin
  EditPassword.Text:= '';
  EditPassword.PasswordChar:= '#';
end;

procedure TmenuForm.FormShow(Sender: TObject);
begin
  EditPassword.Width:= 2;
  TmrShow.Enabled:= True;
end;

procedure TmenuForm.ImgDoorMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  ImgDoor.Visible:= False;
  ShapeEnteredDoor.Visible:= True;
  LblDoor.Visible:= True;
end;

procedure TmenuForm.ImgEnteredDoorClick(Sender: TObject);
begin
  val1:=255;
  TmrClose.Enabled:= True;
end;

procedure TmenuForm.ImgEnteredDoorMouseLeave(Sender: TObject);
begin
  ImgDoor.Visible:= True;
  ShapeEnteredDoor.Visible:= False;
  LblDoor.Visible:= False;
end;

procedure TmenuForm.imgEnteredGlasesClick(Sender: TObject);
var
  k,j,l: integer;
  zapr, text: string;
  myFile: TextFile;
begin
  Form1.Show;
  redakt:= False;

  AssignFile(myFile, TextFileName);
  ReSet(myFile);
  try
    // Считываем параметры формы
    ReadLn(myFile, txtStyle); ImgAlbum.Picture.LoadFromFile(txtStyle);
    ReadLn(myFile, text); if text = 'True' then Form1.BtnEfekts.Click;
    ReadLn(myFile, text); if text = 'True' then Form1.BtnStretch.Click;
  except
  end;
  CloseFile(myFile);

  with Form1 do begin
    ScrollBoxSpiski.Width:= Round(imgAlbum.Width*0.92);
    ScrollBoxVariants.Width:= ScrollBoxSpiski.Width - Round(btnSpiskiChoose.Width*1.26);
    btnSpiskiChoose.Left:= ScrollBoxVariants.Width + round(btnSpiskiChoose.Width*0.13);
    btnChangeObl.Left:= ScrollBoxSpiski.Width-btnChangeObl.Left;

    ADOTable1.Active:= False;
    ADOTable1.TableName:= 'profil';
    DBText5.DataField:= 'profil';
    ADOTable1.Active:= True;
    k:= 0;
    repeat
      k:= k + 1;
      lblTeacher[k]:= TLabel.Create(Form1);
      lblTeacher[k].Parent:= ScrollBoxVariants;
      lblTeacher[k].Caption:= DBText5.Caption;
      lblTeacher[k].Font.Color:= clLime;
      lblTeacher[k].Font.Size:= 12;
      if k<>1 then lblTeacher[k].Left:=lblTeacher[k-1].Left+lblTeacher[k-1].Width+60
      else lblTeacher[k].Left:= ImgRazdel.Width + 60;
      ADOTable1.Next;
    until (lblTeacher[k].Caption = DBText5.Caption);

    ADOTable1.Active:= False;
    ADOTable1.TableName:= 'god_vipuska';
    DBText5.DataField:= 'god_vipuska';
    ADOTable1.Active:= True;
    j:= 0;
    repeat
      j:=j+1;
      lblGod[j]:= TLabel.Create(Form1);
      lblGod[j].Parent:= ScrollBoxVariants;
      lblGod[j].Caption:= DBText5.Caption;
      lblGod[j].Font.Color:= clLime;
      lblGod[j].Font.Size:= 12;
      lblGod[j].Left:= Round(imgRazdel.Width/3);
      if j<>1 then lblGod[j].Top:=lblGod[j-1].Top+lblGod[j-1].Height+60
      else lblGod[j].Top:= ImgRazdel.Height + 60;

      for l:= 1 to k do begin
        zapr:='(god_vipuska LIKE "' + lblGod[j].Caption + '") AND (profil LIKE "' +
                                              lblTeacher[l].Caption + '")';
        try
          ADOQuery1.Active:= False;
          ADOQuery1.SQL.Text:= TextSQL + ' WHERE ' + zapr;
          ADOQuery1.Active:= True;
        finally;
        end;
        zapr:= DBtxtFamily.Caption+DBtxtName.Caption;
        ADOQuery1.Next;
        if zapr <> DBtxtFamily.Caption+DBtxtName.Caption then begin
          shapeVariant[l,j]:= TShape.Create(Form1);
          shapeVariant[l,j].Parent:= ScrollBoxVariants;
          imgVariant[l,j]:= TImage.Create(Form1);
          imgVariant[l,j].Parent:= ScrollBoxVariants;
          imgVariant[l,j].Tag:=l*1000+j;
          try
            imgVariant[l,j].Picture.LoadFromFile(PapkaPictures+IntToStr(imgVariant[l,j].Tag)+'.jpg');
          except
            imgVariant[l,j].Picture.LoadFromFile(StandartPicture);
          end;
          imgVariant[l,j].Stretch:= True;
          imgVariant[l,j].Top:= lblGod[j].Top - 25;
          imgVariant[l,j].Height:= lblGod[j].Height + 50;
          imgVariant[l,j].Left:= lblTeacher[l].Left-25;
          imgVariant[l,j].Width:= lblTeacher[l].Width+50;
          imgVariant[l,j].Tag:=l*1000+j;
          imgVariant[l,j].OnClick:= ImgVariantClick;
          shapeVariant[l,j].Top:= lblGod[j].Top - 30;
          shapeVariant[l,j].Height:= lblGod[j].Height + 50;
          shapeVariant[l,j].Left:= lblTeacher[l].Left-30;
          shapeVariant[l,j].Width:= lblTeacher[l].Width+55;
          shapeVariant[l,j].Visible:= False;
          shapeVariant[l,j].Brush.Color:= clLime;
        end;
      end;
      ADOTable1.Next;
    until (lblGod[j].Caption = DBText5.Caption);

    ScrollBoxSpiski.Left:= - ScrollBoxSpiski.Width;
    ScrollBoxSpiski.Visible:= True;

    if efekts then
    Repeat
      ScrollBoxSpiski.Left:= ScrollBoxSpiski.Left + 1;
    Until ScrollBoxSpiski.Left>= Round(btnSpiskiChoose.Width*0.5)

    else ScrollBoxSpiski.Left:= Round(btnSpiskiChoose.Width*0.5);
  end;

  menuForm.Visible:= False;
end;

procedure TmenuForm.imgEnteredGlasesMouseLeave(Sender: TObject);
begin
  imgGlases.Visible:= True;
  LblGlases.Visible:= False;
end;

procedure TmenuForm.ImgEnteredPenClick(Sender: TObject);
begin
  if not EnteringPassword then begin
    EnteringPassword:= True;
    EditPassword.Visible:= True;
    repeat
      EditPassword.Width:= EditPassword.Width + 3;
      sleep(7);
    until EditPassword.Width >= btnCancel.Left+btnCancel.Width;
    btnOk.Visible:= True;
    btnCancel.Visible:= True;
  end;
end;

procedure TmenuForm.ImgEnteredPenMouseLeave(Sender: TObject);
begin
  if not EnteringPassword then begin
    ImgPen.Visible:= True;
    LblPen.Visible:= False;
  end;
end;

procedure TmenuForm.ImgPenMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  ImgPen.Visible:= False;
  LblPen.Visible:= True;
end;

procedure TmenuForm.TmrShowTimer(Sender: TObject);
begin
//обратная процедура (см. TmenuForm.Timer1Timer)
  menuForm.AlphaBlendValue := val1;
  val1:= val1 + 5;
  if val1 = 255 then begin
      TmrShow.Enabled:= False;
  end;
end;

procedure TmenuForm.TmrCloseTimer(Sender: TObject);
begin
//"Растворение" окна
  menuForm.AlphaBlendValue:= val1;
  val1:= val1 - 5;
  if val1 = 0 then begin
      TmrClose.Enabled:= False;
      menuForm.Close;
  end;
end;

end.
