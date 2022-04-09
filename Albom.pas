unit Albom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, jpeg, ExtCtrls, StdCtrls, OleCtnrs, DBTables, DB, Buttons,
  DBCtrls, ADODB, Grids, DBGrids, ComCtrls, ExtDlgs, MPlayer,
  dblookup, FileCtrl, Style, Connect, Redaktor, Mask, Handles, pngimage;

type
  TForm1 = class(TForm)
    ScrollBoxAlbum: TScrollBox;
    ImgAlbum: TImage;
    ScrollBoxLeftSide: TScrollBox;
    DBTxtFamily: TDBText;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    TmrClose: TTimer;
    TmrShow: TTimer;
    BtnNext: TBitBtn;
    BtnBack: TBitBtn;
    DBGrid1: TDBGrid;
    ScrollBoxPlayer: TScrollBox;
    LabNomS1: TLabel;
    Lire: TSpeedButton;
    Resumer: TSpeedButton;
    Stopper: TSpeedButton;
    Charger: TSpeedButton;
    LblPlaylist: TLabel;
    Bibliotheque: TListBox;
    TmrPlayer: TTimer;
    PopupMenu2: TPopupMenu;
    Sauver: TMenuItem;
    Effacer: TMenuItem;
    MenuItem1: TMenuItem;
    Charge: TMenuItem;
    N2: TMenuItem;
    Effacer1: TMenuItem;
    ScrollBoxPoisk: TScrollBox;
    Edit1: TEdit;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    BtnPoisk: TButton;
    SkritPoisk: TButton;
    BtnInsert: TButton;
    BtnDelete: TButton;
    BtnEdit: TSpeedButton;
    ImgPlayer: TImage;
    DBTxtName: TDBText;
    DBEdit1: TDBEdit;
    TmrPoisk: TTimer;
    OpenPictureDialog1: TOpenPictureDialog;
    BddS: TSaveDialog;
    Bdd: TOpenDialog;
    tmrLoadPhoto: TTimer;
    PopupMenu3: TPopupMenu;
    DBIma: TDBEdit;
    DBTxtTeacher: TDBText;
    DBTxtAge: TDBText;
    DBEditName: TDBEdit;
    DBEditFamily: TDBEdit;
    LabelTeacher: TLabel;
    LabelAge: TLabel;
    ADOTable1: TADOTable;
    DataSource2: TDataSource;
    DBText5: TDBText;
    DBBoxTeacher: TDBComboBox;
    DBBoxAge: TDBComboBox;
    DBNavigator1: TDBNavigator;
    ScrollBoxPhoto: TScrollBox;
    imgPhoto: TImage;
    DBTextTop: TDBText;
    DBTextLeft: TDBText;
    DBTextHeight: TDBText;
    DBTextWidth: TDBText;
    TmrEditing: TTimer;
    ImgActPlayer: TImage;
    ImgEnteredActPlayer: TImage;
    BtnSkritPlayer: TButton;
    LblPlayer: TLabel;
    btnCreatePicture: TButton;
    ScrollBoxMenu: TScrollBox;
    LblMenu: TLabel;
    BtnMenu: TButton;
    tmrMenuLeave: TTimer;
    ImgEnteredSpiski: TImage;
    ImgSpiski: TImage;
    LblSpiski: TLabel;
    ScrollBoxSpiski: TScrollBox;
    ScrollBoxVariants: TScrollBox;
    BtnSpiskiChoose: TButton;
    ImgRazdel: TImage;
    BtnEfekts: TSpeedButton;
    ImgEnteredAboutUs: TImage;
    LblAboutUs: TLabel;
    ImgAboutUs: TImage;
    ImgEnteredSpisok: TImage;
    ImgSpisok: TImage;
    LblSpisok: TLabel;
    DBTeacher: TDBEdit;
    DBGod: TDBEdit;
    BtnChangeObl: TButton;
    ImgDoor: TImage;
    ImgEnteredDoor: TImage;
    lblDoor: TLabel;
    ShapeEnteredDoor: TShape;
    BtnSaveCol: TButton;
    BtnLoadCol: TButton;
    SaveDlgLeftSide: TSaveDialog;
    OpenDlgLeftSide: TOpenDialog;
    BtnStyle: TButton;
    LblChangeObl: TLabel;
    LblChooseCol: TLabel;
    BtnChooseCol: TButton;
    ImgEnteredPoisk: TImage;
    ImgPoisk: TImage;
    LblPoisk: TLabel;
    DBProfil: TDBEdit;
    BtnSave: TButton;
    LabelProfil: TLabel;
    DBBoxProfil: TDBComboBox;
    DBTxtProfil: TDBText;
    BtnChangePhoto: TButton;
    btnStretch: TSpeedButton;
    MediaPlayer1: TMediaPlayer;
    LblTime: TLabel;
    procedure Form1Create(Sender: TObject);
    procedure btnCreatePictureClick(Sender: TObject);
    {procedure BitBtnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer); }
    procedure TmrCloseTimer(Sender: TObject);
    procedure TmrShowTimer(Sender: TObject);
    procedure BtnDeletePictureClick(Sender: TObject);
    procedure BtnChoosePictureClick(Sender: TObject);
    procedure BtnMovUnmovClick(Sender: TObject);
    procedure BtnNextClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    function FileLangToStr(leng: Integer): string;
    procedure BtnSkritPlayerClick(Sender: TObject);
    {procedure SetMultiLineButton(AParent: TWinControl);}
    procedure ChargerClick(Sender: TObject);
    procedure TmrPlayerTimer(Sender: TObject);
    procedure LireClick(Sender: TObject);
    procedure StopperClick(Sender: TObject);
    procedure ResumerClick(Sender: TObject);
    procedure SauverClick(Sender: TObject);
    procedure EffacerClick(Sender: TObject);
    procedure ChargeClick(Sender: TObject);
    procedure Effacer1Click(Sender: TObject);
    procedure BibliothequeClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SkritPoiskClick(Sender: TObject);
    procedure ImgFoundClick(Sender: TObject);
    procedure BibliothequeDblClick(Sender: TObject);
    procedure BtnPoiskClick(Sender: TObject);
    procedure BtnInsertClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnStyleClick(Sender: TObject);
    procedure btnStandartClick(Sender: TObject);
    procedure btnCalendarClick(Sender: TObject);
    procedure TmrPoiskTimer(Sender: TObject);
    procedure tmrLoadPhotoTimer(Sender: TObject);
    procedure BtnChangePhotoClick(Sender: TObject);
    procedure btnStretchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TmrEditingTimer(Sender: TObject);
    procedure ImgActPlayerMouseEnter(Sender: TObject);
    procedure ImgEnteredActPlayerMouseLeave(Sender: TObject);
    procedure ImgEnteredActPlayerClick(Sender: TObject);
    //procedure BtnSetMovableClick(Sender: TObject);
    procedure BtnMenuClick(Sender: TObject);
    procedure ScrollBoxMenuMouseLeave(Sender: TObject);
    procedure tmrMenuLeaveTimer(Sender: TObject);
    procedure ScrollBoxMenuMouseEnter(Sender: TObject);
    procedure ImgEnteredSpiskiMouseLeave(Sender: TObject);
    procedure ImgEnteredSpiskiClick(Sender: TObject);
    procedure ImgSpiskiMouseEnter(Sender: TObject);
    procedure LblSpiskiMouseLeave(Sender: TObject);
    procedure LblSpiskiMouseEnter(Sender: TObject);
    procedure LblSpiskiClick(Sender: TObject);
    procedure imgVariantClick(Sender: TObject);
    procedure BtnSpiskiChooseClick(Sender: TObject);
    procedure BtnEfektsClick(Sender: TObject);
    procedure ImgAboutUsMouseEnter(Sender: TObject);
    procedure LblAboutUsMouseEnter(Sender: TObject);
    procedure ImgEnteredAboutUsMouseLeave(Sender: TObject);
    procedure ImgEnteredAboutUsClick(Sender: TObject);
    procedure LblAboutUsMouseLeave(Sender: TObject);
    procedure LblAboutUsClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ImgEnteredSpisokMouseLeave(Sender: TObject);
    procedure LblSpisokMouseLeave(Sender: TObject);
    procedure LblSpisokMouseEnter(Sender: TObject);
    procedure ImgSpisokMouseEnter(Sender: TObject);
    procedure ImgEnteredSpisokClick(Sender: TObject);
    procedure LblSpisokClick(Sender: TObject);
    procedure BtnChangeOblClick(Sender: TObject);
    procedure lblDoorMouseLeave(Sender: TObject);
    procedure ImgEnteredDoorMouseLeave(Sender: TObject);
    procedure ImgDoorMouseEnter(Sender: TObject);
    procedure lblDoorMouseEnter(Sender: TObject);
    procedure BtnSaveColClick(Sender: TObject);
    procedure BtnLoadColClick(Sender: TObject);
    procedure TmrLeftSideTimer(Sender: TObject);
    procedure ImgEnteredDoorClick(Sender: TObject);
    procedure lblDoorClick(Sender: TObject);
    procedure ImgPoiskMouseEnter(Sender: TObject);
    procedure ImgEnteredPoiskMouseLeave(Sender: TObject);
    procedure BtnChooseColClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  n=50;
  StandartPicture = 'C:\Program Files\Album of Graduates\Pictures\StandartPicture.jpg';
  StandartPhoto = 'C:\Program Files\Album of Graduates\DataBase\StandartPhoto.jpg';
  TextFileName = 'C:\Program Files\Album of Graduates\Parametrs.txt';
  PapkaPhoto = 'C:\Program Files\Album of Graduates\DataBase\';
  PapkaPictures = 'C:\Program Files\Album of Graduates\Pictures\';
  MAX_SON = 2;
  TextSQL = 'SELECT osnova.Top, osnova.Width, osnova.Height, osnova.Left,osnova.ID_osnova, osnova.Ima as [Фамилия],osnova.kl_ruk as [Кл руководитель], osnova.profil,osnova.god_vipuska as [Год], osnova.Ima2 as [Имя] FROM osnova';


type TLeftSidePictures = Record
              Namesjj: string;   //имена файлов с картинками
              Deleted: string;   //указывает, была ли картинка удалена
              Editing: boolean;  //режим редактирования вкл/выкл
              Image: TImage;     //картинка
              StretchHandle: TStretchHandle;
              BtnDeletePicture,BtnChangePicture,BtnEditPicture: TButton;
End;

type massiv = array[10..n] of TLeftSidePictures;

var
  Form1: TForm1;
  PATH, NameFile, ID, LeftSide: string;
  Vverh, Vlevo, AutoStretch, boolStretch: boolean;
  F, i, btnFocus, val1, j1, l1, NomerDorohki: integer;
  LeftSidePicture: massiv;
  efekts, redakt: boolean;
  imgVariant: array[1..40,1..40] of TImage;
  shapeVariant: array[1..40,1..40] of TShape;
  lblTeacher, lblGod: array[1..40] of TLabel;

implementation

uses menu;

{$R *.dfm}

//Процедура создает треугольник, который можно вписать в прямоугольник с
//заданной шириной и высотой
procedure Make3AnglePravo(width, height: Integer; var points: array of TPoint);
begin
  points[0].X := 0;
  points[0].Y := 0;
  points[1].X := 0;
  points[1].Y := Height - 1;
  points[2].X := width - 1;
  points[2].Y := (height div 2) - 1;
end;

procedure Make3AngleLevo(width, height: Integer; var points: array of TPoint);
begin
  points[0].X := width - 1;
  points[0].Y := 0;
  points[1].X := width - 1;
  points[1].Y := Height - 1;
  points[2].X := 0;
  points[2].Y := (height div 2) - 1;
end;

{procedure TForm1.SetMultiLineButton(AParent: TWinControl);
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
end;      }

procedure TForm1.Form1Create(Sender: TObject);
Var
  points: array [0..3] of TPoint;
  but1Rgn, but3Rgn: HRGN;
  procent: integer;
begin
  i:=9;
  PATH:= ExtractFilePath(Application.ExeName);

  //Оптимизируем программу под разрешение экрана
  procent:= round((Screen.Width * Screen.Height) / (1024 * 1280) * 100);
  ChangeScale(procent, 100);
  form1.AutoSize:= False;

  //треугольная кнопка "вправо"
    Make3AnglePravo(BtnNext.Width, BtnNext.Height, points);
    but1Rgn := CreatePolygonRgn(points, 3, WINDING);
    SetWindowRgn(BtnNext.Handle, but1Rgn, FALSE);
  //треугольная кнопка "влево"
    Make3AngleLevo(BtnBack.Width, BtnBack.Height, points);
    but3Rgn := CreatePolygonRgn(points, 3, WINDING);
    SetWindowRgn(BtnBack.Handle, but3Rgn, FALSE);

    vlevo:= True;
    Form1.Width:= Form1.Width - DBGrid1.Width;
    DBGrid1.Visible:=False;
    SkritPoisk.Click;
    BtnSkritPlayer.Click;
end;


procedure TForm1.btnCreatePictureClick(Sender: TObject); // добавление новой картинки
begin
  i:=i+1;
  with LeftSidePicture[i] do begin
    Namesjj:= StandartPicture;
    Image:= TImage.Create(Form1);
    Image.Parent:= ScrollBoxLeftSide;
    Image.Picture.LoadFromFile(StandartPicture);
    Image.AutoSize:= True;
    Image.AutoSize:= False;
    Image.Stretch:= True;

    StretchHandle:= TStretchHandle.Create(Form1);
    StretchHandle.Attach(Image);

    btnEditPicture:= TButton.Create(Form1);
    btnEditPicture.Parent:= ScrollBoxLeftSide;
    btnEditPicture.Caption:= 'И';
    btnEditPicture.Width:= EditWidth;
    btnEditPicture.Height:= EditHeight;
    btnEditPicture.Top:= Image.Top + Image.Height - EditHeight;
    btnEditPicture.Left:= Image.Left;
    btnEditPicture.OnClick:= BtnMovUnmovClick;
    btnEditPicture.Hint:= 'Редактировать картинку';
    btnEditPicture.ShowHint:= True;

    Application.HintPause:= 10;
    Application.HintHidePause:=3000;

    btnChangePicture:= TButton.Create(Form1);
    btnChangePicture.Parent:= ScrollBoxLeftSide;
    btnChangePicture.Caption:='З';
    btnChangePicture.Width:= ChangeWidth;
    btnChangePicture.Height:= ChangeHeight;
    btnChangePicture.Top:= Image.Top + Image.Height - ChangeHeight;
    btnChangePicture.Left:= Image.Left + Image.Width - ChangeWidth;
    btnChangePicture.OnClick:= BtnChoosePictureClick;
    btnChangePicture.Hint:= 'Загрузить изображение из файла';
    btnChangePicture.ShowHint:= True;

    btnDeletePicture:= TButton.Create(Form1);
    btnDeletePicture.Parent:= ScrollBoxLeftSide;
    btnDeletePicture.Caption:='X';
    btnDeletePicture.Width:= DeleteWidth;
    btnDeletePicture.Height:= DeleteHeight;
    btnDeletePicture.Top:= Image.Top;
    btnDeletePicture.Left:= Image.Left + Image.Width - DeleteWidth;
    BtnDeletePicture.OnClick:= BtnDeletePictureClick;
    BtnDeletePicture.Hint:= 'Удалить картинку';
    BtnDeletePicture.ShowHint:= True;

    Deleted:= '';
    Editing:= True;
  end;

end;

{procedure TForm1.BitBtnMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  btnFocus := 9;
  repeat
    btnFocus := btnFocus + 1;
    if LeftSidePicture[btnFocus].Deleted = 'True' then Continue;
  until (btnFocus>=i) or (Form1.ActiveControl = LeftSidePicture[btnFocus].Image);

  if Form1.ActiveControl = LeftSidePicture[btnFocus].Image then begin
      if ssCtrl in Shift then begin
        ReleaseCapture;
        LeftSidePicture[btnFocus].Image.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0); //если нажат Ctrl, тогда перемещаем
      end;
  end;

end;}

procedure TForm1.TmrCloseTimer(Sender: TObject);
begin
//"Растворение" окна
  Form1.AlphaBlendValue := val1;
  val1:= val1 - 5;
  if val1 = 0 then begin
      Form1.Close;
      menuForm.Close;
      TmrClose.Enabled:= False;
  end;
end;

procedure TForm1.TmrShowTimer(Sender: TObject);
begin
//обратная процедура (см. TForm1.Timer2Timer)
  Form1.AlphaBlendValue := val1;
  val1:= val1 + 5;
  if val1 = 255 then begin
      TmrShow.Enabled:= False;
  end;
end;

{procedure MakeMovable(Handle: HWND);
var
  style, exstyle: LongInt;
  flags: UINT;
  rc: TRect;
begin
//Разрешаем перемещение элемента управления
  style := GetWindowLong(Handle, GWL_STYLE);
  style := style or WS_OVERLAPPED or WS_THICKFRAME or WS_CAPTION;
  SetWindowLong(Handle, GWL_STYLE, style);

  exstyle := GetWindowLong(Handle, GWL_EXSTYLE);
  exstyle := exstyle or WS_EX_TOOLWINDOW;
  SetWindowLong(Handle, GWL_EXSTYLE, exstyle);

//Сделаем так, чтобы положение клиентской области получившегося окна
//совпадало с первоначальным положением  элемента управления
//..расчет размера окна
  GetWindowRect(Handle, rc);
  ScreenToClient(GetParent(Handle), rc.TopLeft);
  ScreenToClient(GetParent(Handle), rc.BottomRight);
  AdjustWindowRectEx(rc, style, FALSE, exstyle);
//..перемещение окна
  flags := SWP_DRAWFRAME or SWP_NOZORDER;
  SetWindowPos(Handle,0, rc.Left, rc.Top,
               rc.Right - rc.Left, rc.Bottom - rc.Top, flags);
end;

procedure MakeUnmovable(Handle: HWND);
var
  style: LongInt;
  flags: UINT;
  rc: TRect;
  isHScroll, isVScroll: Boolean;
begin
//Убираем поломы прокрутки (если они есть)
  style := GetWindowLong(Handle, GWL_STYLE);
  if (style and WS_HSCROLL <> 0) then
  begin
    //Есть горизонтальная полоска прокруки
      isHScroll := True;
      style := style and not WS_HSCROLL;
  end
  else
    isHScroll:= False;

  if (style and WS_VSCROLL <> 0) then
  begin
    //Есть вертикальная полоска прокруки
    isVScroll := True;
    style := style and not WS_VSCROLL;
  end
  else
    isVScroll:= False;

  SetWindowLong(Handle, GWL_STYLE, style);
  UpdateWindow(Handle);

//Устанавливаем элемент управления в то же место,
//где находилась клиентская область окна с рамкой
  GetClientRect(Handle, rc);
  ClientToScreen(Handle, rc.TopLeft);
  ClientToScreen(Handle, rc.BottomRight);
  ScreenToClient(GetParent(Handle), rc.TopLeft);
  ScreenToClient(GetParent(Handle), rc.BottomRight);

//Возвращаем полосы прокрутки на место
  if isHScroll then style := style or WS_HSCROLL;
  if isVScroll then style := style or WS_VSCROLL;
  SetWindowLong(Handle, GWL_STYLE, style);

//Запрещаем перемещение элемента управления
  style := GetWindowLong(Handle, GWL_STYLE);
  style := style and not WS_OVERLAPPED and not WS_THICKFRAME
                                                and not WS_CAPTION;
  SetWindowLong(Handle, GWL_STYLE, style);

  style:= GetWindowLong(Handle, GWL_EXSTYLE);
  style:= style and not WS_EX_TOOLWINDOW;
  SetWindowLong(Handle, GWL_EXSTYLE, style);

//Перемещение элемента управления
  flags := SWP_DRAWFRAME or SWP_NOZORDER;
  SetWindowPos(Handle, 0, rc.Left, rc.Top, rc.Right - rc.Left,
                                                  rc.Bottom - rc.Top, flags);
end;    }


procedure TForm1.BtnSaveClick(Sender: TObject);
var
  myFile: textFile;
  k: integer;
begin
  AssignFile(myFile, PapkaPhoto + DBEdit1.Text + '.txt');
  ReWrite(myFile);
  WriteLn(myFile, i);
  for k:= 10 to i do with LeftSidePicture[k] do begin
    WriteLn(myFile, IntToStr(Image.Width));
    WriteLn(myFile, IntToStr(Image.Height));
    WriteLn(myFile, IntToStr(Image.Top));
    WriteLn(myFile, IntToStr(Image.Left));
    if not FileExists(PapkaPictures+DBEdit1.Text) then
      CreateDir(PapkaPictures+DBEdit1.Text);
    Namesjj:= PapkaPictures+DBEdit1.Text+'\'+IntToStr(k)+Deleted;
    Image.Picture.SaveToFile(Namesjj);
    WriteLn(myFile, Namesjj);
    WriteLn(myFile, Deleted);
  end;
  CloseFile(myFile);

end;

procedure TForm1.BtnSaveColClick(Sender: TObject);
var
  myFile: TextFile;
  k: integer;
  lost: integer;
  index, FileName1: string;
begin
  if (SaveDlgLeftSide.Execute) then begin
    BtnSaveCol.Font.Color:= clBlack;
    FileName1:= SaveDlgLeftSide.FileName;
    if copy(FileName1,Length(FileName1)-3,4)='.alb' then
      delete(FileName1,Length(FileName1)-3,4);
    for k := 1 to Length(FileName1) do begin
      if FileName1[k] = '\' then lost:=k+1;
    end;
    index:= copy(FileName1,lost,Length(FileName1)-lost+1);

    AssignFile(myFile, FileName1 + '.alb');
    ReWrite(myFile);
    //Запись параметров картинок в файл
    WriteLn(myFile, i);
    for k:= 10 to i do with LeftSidePicture[k] do begin
      WriteLn(myFile, IntToStr(Image.Width));
      WriteLn(myFile, IntToStr(Image.Height));
      WriteLn(myFile, IntToStr(Image.Top));
      WriteLn(myFile, IntToStr(Image.Left));
      Namesjj:= PapkaPictures+index+IntToStr(k)+Deleted;
      Image.Picture.SaveToFile(Namesjj);
      WriteLn(myFile, Namesjj);
      WriteLn(myFile, Deleted);
    end;
    CloseFile(myFile);

    AssignFile(myFile, PapkaPhoto + DBEdit1.Text + '.txt');
    ReWrite(myFile);
    WriteLn(myFile, i);
    for k:= 10 to i do with LeftSidePicture[k] do begin
      WriteLn(myFile, IntToStr(Image.Width));
      WriteLn(myFile, IntToStr(Image.Height));
      WriteLn(myFile, IntToStr(Image.Top));
      WriteLn(myFile, IntToStr(Image.Left));
      if not FileExists(PapkaPictures+DBEdit1.Text) then
        CreateDir(PapkaPictures+DBEdit1.Text);
      Namesjj:= PapkaPictures+DBEdit1.Text+'\'+IntToStr(k)+Deleted;
      Image.Picture.SaveToFile(Namesjj);
      WriteLn(myFile, Namesjj);
      WriteLn(myFile, Deleted);
    end;
    CloseFile(myFile);
  end;
end;

{procedure TForm1.btnSetMovableClick(Sender: TObject);
var
  k: integer;
begin
  chkSetMovable:= not chkSetMovable;

  if chkSetMovable then
  begin
    //Разрешаем перемещение элементов
    for k:=10 to i do
    with LeftSidePicture[k] do begin
      BtnSave.Font.Color:= clRed;
      if (Deleted<>'True') then begin
        StretchHandle:= TStretchHandle.Create(Form1);
        StretchHandle.Attach(Image);
        Editing:= True;

        btnEditPicture.Free;
        btnEditPicture:= TButton.Create(Form1);
        btnEditPicture.Parent:= ScrollBoxLeftSide;
        btnEditPicture.Caption:='Edit';
        btnEditPicture.Width:= EditWidth;
        btnEditPicture.Height:= EditHeight;
        btnEditPicture.Top:= Image.Top + Image.Height - EditHeight;
        btnEditPicture.Left:= Image.Left;
        btnEditPicture.OnClick:= BtnMovUnmovClick;

        btnChangePicture:= TButton.Create(Form1);
        btnChangePicture.Parent:= ScrollBoxLeftSide;
        btnChangePicture.Caption:='change';
        btnChangePicture.Width:= ChangeWidth;
        btnChangePicture.Height:= ChangeHeight;
        btnChangePicture.Top:= Image.Top + Image.Height - ChangeHeight;
        btnChangePicture.Left:= Image.Left + Image.Width - ChangeWidth;
        btnChangePicture.OnClick:= BtnChoosePictureClick;

        btnDeletePicture:= TButton.Create(Form1);
        btnDeletePicture.Parent:= ScrollBoxLeftSide;
        btnDeletePicture.Caption:='X';
        btnDeletePicture.Width:= DeleteWidth;
        btnDeletePicture.Height:= DeleteHeight;
        btnDeletePicture.Top:= Image.Top;
        btnDeletePicture.Left:= Image.Left + Image.Width - DeleteWidth;
        BtnDeletePicture.OnClick:= BtnDeleteClick;
      end;
    end;
  end

  else begin
    //Запрещаем перемещение элементов
    for k:=10 to i do
    with LeftSidePicture[k] do begin
      if (Deleted<>'True') and (Editing) then begin
        StretchHandle.Detach;
        Editing:= False;

        StretchHandle.Free;
        BtnDeletePicture.Free;
        btnChangePicture.Free;
      end;
    end;
  end;
end;     }

procedure TForm1.BtnDeletePictureClick(Sender: TObject);
var
  zy,zy1: integer;
begin
  btnFocus:= 9;
  repeat
    btnFocus := btnFocus + 1;
    if (LeftSidePicture[btnFocus].Deleted = 'True') or
      (LeftSidePicture[btnFocus].Editing=False) then Continue;
  until (btnFocus>=i) or (Form1.ActiveControl = LeftSidePicture[btnFocus].btnDeletePicture);

  if Form1.ActiveControl = LeftSidePicture[btnFocus].btnDeletePicture then begin
    if LeftSidePicture[btnFocus].Namesjj <> StandartPicture then
      SysUtils.DeleteFile(PapkaPictures + IntToStr(btnFocus) + '.jpg');
    with LeftSidePicture[btnFocus] do begin
      StretchHandle.Detach;
      StretchHandle.Free;
      Image.Width:= 0;
      Image.Height:= 0;
      Namesjj:= StandartPicture;
      Image.Free;
      BtnDeletePicture.Free;
      BtnChangePicture.Free;
      BtnEditPicture.Free;
      Deleted:= 'True';
    end;
    //вычленяем картинку, удаленные за сеанс пользователем
    for zy:= 10 to i do begin
      if LeftSidePicture[zy].Deleted = 'True' then begin
        i:= i-1;
        for zy1:= zy to i do LeftSidePicture[zy1]:= LeftSidePicture[zy1+1];
      end;
    end;
  end;
end;


procedure TForm1.BtnChangeOblClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then begin
    with ImgVariant[l1,j1] do begin
      Picture.LoadFromFile(OpenPictureDialog1.FileName);
      Picture.SaveToFile(PapkaPictures + IntToStr(Tag) + '.jpg');
    end;
  end;
end;

procedure TForm1.BtnChooseColClick(Sender: TObject);
var
  zapr, text1: string;
  myFile, copyFile: TextFile;
  i1,k: integer;
begin
  if (OpenDlgLeftSide.Execute) then begin
    zapr:='(god_vipuska LIKE "' + lblGod[j1].Caption + '") AND (profil LIKE "' +
                                              lblTeacher[l1].Caption + '")';
    try
      ADOQuery1.Active:= False;
      ADOQuery1.SQL.Text:= TextSQL + ' WHERE ' + zapr;
      ADOQuery1.Active:= True;
    finally;
    end;

    repeat
      AssignFile(myFile, OpenDlgLeftSide.FileName);
      AssignFile(copyFile, PapkaPhoto + DBEdit1.Text + '.txt');
      Reset(myFile);
      ReWrite(copyFile);
      ReadLn(myFile, text1); i1:=StrToInt(Text1); WriteLn(copyFile,text1);
      for k:=10 to i1 do begin
            ReadLn(myFile,text1); WriteLn(copyFile,text1);
            ReadLn(myFile,text1); WriteLn(copyFile,text1);
            ReadLn(myFile,text1); WriteLn(copyFile,text1);
            ReadLn(myFile,text1); WriteLn(copyFile,text1);
            ReadLn(myFile,text1); WriteLn(copyFile,text1);
            ReadLn(myFile,text1); WriteLn(copyFile,text1);
      end;
      CloseFile(myFile);
      CloseFile(copyFile);

      zapr:= DBtxtFamily.Caption+DBtxtName.Caption;
      ADOQuery1.Next;
    until zapr = DBtxtFamily.Caption+DBtxtName.Caption;
  end;
end;

procedure TForm1.BtnChoosePictureClick(Sender: TObject);
var
  j,last: integer;
  razr: string;
begin
  btnFocus := 9;
  repeat
    btnFocus := btnFocus + 1;
    if (LeftSidePicture[btnFocus].Deleted = 'True') or
      (LeftSidePicture[btnFocus].Editing=False) then Continue;
  until (btnFocus>=i) or (Form1.ActiveControl = LeftSidePicture[btnFocus].BtnChangePicture);

  if Form1.ActiveControl = LeftSidePicture[btnFocus].btnChangePicture then begin

    if OpenPictureDialog1.Execute then begin
      for j := 1 to length(OpenPictureDialog1.FileName) do
        if OpenPictureDialog1.FileName[j]='.' then last:=j;
      razr:= copy(OpenPictureDialog1.FileName,last,length(OpenPictureDialog1.FileName)-last+1);

      try
        with LeftSidePicture[btnFocus] do begin
          Image.Picture.LoadFromFile(OpenPictureDialog1.FileName);
          Deleted:=razr;
          Image.AutoSize:= True;
          Image.AutoSize:= False;
          if Image.Height > ScrollBoxLeftSide.Height then
            Image.Height:= round(ScrollBoxLeftSide.Height / 2);
          if Image.Width > ScrollBoxLeftSide.Width then
            Image.Width:= round(ScrollBoxLeftSide.Width / 2);

          BtnEditPicture.SetFocus;
          BtnEditPicture.Click;
          BtnEditPicture.SetFocus;
          BtnEditPicture.Click;
        end;
      except
        MessageDlg('Picture ' + OpenPictureDialog1.FileName + ' is not found' + #10#13 + 'Пожалуйста, выбирете другой файл.', mtError, [mbOk], 0);
      end;
    end;

  end;
end;


procedure TForm1.BtnMenuClick(Sender: TObject);
begin
  if (BtnMenu.Left > 0) then begin
    tmrMenuLeave.Enabled:= False;
    if efekts then begin
      repeat
        ScrollBoxMenu.Left:= ScrollBoxMenu.Left - 1;
        BtnMenu.Left:= BtnMenu.Left - 1;
        sleep(3);
      until BtnMenu.Left <= 0;
      BtnMenu.Caption:= '>';
    end
    else begin
      ScrollBoxMenu.Left:= ScrollBoxMenu.Left - BtnMenu.Left;
      BtnMenu.Left:= 0;
      BtnMenu.Caption:= '>';
    end;
  end

  else begin
    if efekts then begin
      repeat
        ScrollBoxMenu.Left:= ScrollBoxMenu.Left + 1;
        BtnMenu.Left:= BtnMenu.Left + 1;
        sleep(3);
      until ScrollBoxMenu.Left >= 0;
      BtnMenu.Caption:= '<';
    end
    else begin
      BtnMenu.Left:= ScrollBoxMenu.Width;
      ScrollBoxMenu.Left:= 0;
      BtnMenu.Caption:= '<';
    end
  end;
end;

procedure TForm1.BtnMovUnmovClick(Sender: TObject);
begin
  btnFocus := 9;
  repeat
    btnFocus := btnFocus + 1;
    if LeftSidePicture[btnFocus].Deleted = 'True' then Continue;
  until (btnFocus>=i) or (Form1.ActiveControl = LeftSidePicture[btnFocus].btnEditPicture);

  if Form1.ActiveControl = LeftSidePicture[btnFocus].btnEditPicture then begin
  with LeftSidePicture[btnFocus] do begin
    Editing:= not Editing;
    if Editing then begin
      StretchHandle:= TStretchHandle.Create(Form1);
      StretchHandle.Attach(Image);//Разрешаем перемещение

      btnEditPicture.Free;
      btnEditPicture:= TButton.Create(Form1);
      btnEditPicture.Parent:= ScrollBoxLeftSide;
      btnEditPicture.Caption:= 'И';
      btnEditPicture.Width:= EditWidth;
      btnEditPicture.Height:= EditHeight;
      btnEditPicture.Top:= Image.Top + Image.Height - EditHeight;
      btnEditPicture.Left:= Image.Left;
      btnEditPicture.OnClick:= BtnMovUnmovClick;
      btnEditPicture.Hint:= 'Редактировать картинку';
      btnEditPicture.ShowHint:= True;

      btnChangePicture:= TButton.Create(Form1);
      btnChangePicture.Parent:= ScrollBoxLeftSide;
      btnChangePicture.Caption:='З';
      btnChangePicture.Width:= ChangeWidth;
      btnChangePicture.Height:= ChangeHeight;
      btnChangePicture.Top:= Image.Top + Image.Height - ChangeHeight;
      btnChangePicture.Left:= Image.Left + Image.Width - ChangeWidth;
      btnChangePicture.OnClick:= BtnChoosePictureClick;
      btnChangePicture.Hint:= 'Загрузить изображение из файла';
      btnChangePicture.ShowHint:= True;

      btnDeletePicture:= TButton.Create(Form1);
      btnDeletePicture.Parent:= ScrollBoxLeftSide;
      btnDeletePicture.Caption:='X';
      btnDeletePicture.Width:= DeleteWidth;
      btnDeletePicture.Height:= DeleteHeight;
      btnDeletePicture.Top:= Image.Top;
      btnDeletePicture.Left:= Image.Left + Image.Width - DeleteWidth;
      BtnDeletePicture.OnClick:= BtnDeletePictureClick;
      BtnDeletePicture.Hint:= 'Удалить картинку';
      BtnDeletePicture.ShowHint:= True;
    end
    else begin
      StretchHandle.Detach;//Запрещаем перемещение
      StretchHandle.Free;
      BtnDeletePicture.Free;
      btnChangePicture.Free;
    end;
  end;
  end;

end;


procedure TForm1.BtnNextClick(Sender: TObject);
begin
  ADOQuery1.Next;
end;

procedure TForm1.BtnBackClick(Sender: TObject);
begin
  ADOQuery1.Prior;
end;

function TForm1.FileLangToStr(leng: longint): string;
var
//Переменная результирующей строки
   strTime: string;
   sec: longint;
   min: longint;
begin
//Получаем секунды и минуты из миллисекунд (leng)
  sec:= trunc(leng/1000);
  min:= trunc(sec/60);
  sec:= sec - min*60;
  strTime:= IntToStr(min);
//Если секунд меньше десяти, то преобразуем результирущую
//строку (участок минут), добовляя '0' спереди
  if sec < 10 then strTime := strTime + ':0' + IntToStr(sec)
  else strTime := strTime + ':' + IntToStr(sec);
  FileLangToStr := strTime;
end;

procedure TForm1.BtnSkritPlayerClick(Sender: TObject);
var a: integer;
begin
 if efekts then begin
  a:= ScrollBoxPlayer.Top + ScrollBoxPlayer.Height;
  repeat
    ScrollBoxPlayer.Top:= ScrollBoxPlayer.Top+1;
    sleep(7);
  until ScrollBoxPlayer.Top >= a;
 end
 else begin
  ScrollBoxPlayer.Top:= ScrollBoxPlayer.Top + ScrollBoxPlayer.Height;
 end;
end;

procedure TForm1.BtnSpiskiChooseClick(Sender: TObject);
var
  zapr: string;
  a: integer;
begin
  zapr:='(god_vipuska LIKE "' + lblGod[j1].Caption + '") AND (profil LIKE "' +
                                              lblTeacher[l1].Caption + '")';
  try
    ADOQuery1.Active:= False;
    ADOQuery1.SQL.Text:= TextSQL + ' WHERE ' + zapr;
    ADOQuery1.Active:= True;
  finally;
  end;

  if efekts then
  Repeat
    ScrollBoxSpiski.Left:= ScrollBoxSpiski.Left + 1;
  Until ScrollBoxSpiski.Left>= Form1.Width
  else ScrollBoxSpiski.Left:= Form1.Width;
  ScrollBoxSpiski.Visible:= False;
  btnNext.Enabled:= True;
  btnBack.Enabled:= True;
  btnMenu.Enabled:= True;
  btnStyle.Enabled:= True;
  if redakt then begin
    Vlevo:=not Vlevo;
    if not Vlevo then begin
      if efekts then begin
        a:= Form1.Width + DBGrid1.Width;
        DBGrid1.Visible:=True;
        repeat
          Form1.Width:= Form1.Width + 1;
        until Form1.Width >= a;
      end
      else begin
        Form1.Width:= Form1.Width + DBGrid1.Width;
        DBGrid1.Visible:= True;
      end
    end;
  end;
end;

procedure TForm1.ChargerClick(Sender: TObject);
begin
  Bdd.FilterIndex:=1;
  if(Bdd.Execute) then Bibliotheque.Items.Add(Bdd.FileName);
end;

procedure TForm1.TmrPlayerTimer(Sender: TObject);
var
  leng: longint;
begin
  leng:=MediaPlayer1.Length;
  lblTime.Caption:=FileLangToStr(MediaPlayer1.Position);
  labNomS1.Caption:= 'Композиция: '+MediaPlayer1.FileName;
  if leng<=MediaPlayer1.Position then begin
    if Bibliotheque.GetCount<=NomerDorohki+1 then
      NomerDorohki:=0
    else
      NomerDorohki:=NomerDorohki+1;
    MediaPlayer1.FileName := Bibliotheque.Items.Strings[NomerDorohki];
    if not MediaPlayer1.AutoOpen then MediaPlayer1.Open;
    MediaPlayer1.Play;
  end;

end;

procedure TForm1.LblAboutUsClick(Sender: TObject);
begin
  MessageBox(0, 'Автор:' + #10#13 + 'Ли Александр' + #10#13 + 'Служба поддержки:' + #10#13 +  'SamurayLee@mail.ru' + #10#13 + 'Смоленск, 2010 год', 'О программе',
  MB_ICONINFORMATION + MB_OK + MB_SETFOREGROUND + MB_SYSTEMMODAL);
end;

procedure TForm1.LblAboutUsMouseEnter(Sender: TObject);
begin
  ImgAboutUs.Visible:= False;
  lblAboutUs.Font.Color:= clLime;
end;

procedure TForm1.LblAboutUsMouseLeave(Sender: TObject);
begin
  ImgAboutUs.Visible:= True;
  lblAboutUs.Font.Color:= clWindowText;
end;

procedure TForm1.lblDoorClick(Sender: TObject);
begin
  if MessageBox(handle,PChar('Вы действительно хотите выйти?'+#13#10),
     PChar('Подтверждение'), MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION) = IDYes then
  begin
    val1 := 255;
    TmrClose.Enabled:= True;
  end;
end;

procedure TForm1.lblDoorMouseEnter(Sender: TObject);
begin
  ImgDoor.Visible:= False;
  ShapeEnteredDoor.Visible:= True;
  LblDoor.Font.Color:= clRed;
end;

procedure TForm1.lblDoorMouseLeave(Sender: TObject);
begin
  ImgDoor.Visible:= True;
  ShapeEnteredDoor.Visible:= False;
  LblDoor.Font.Color:= clWindowText;
end;

procedure TForm1.LblSpiskiClick(Sender: TObject);
begin
  btnMenu.Click;
  ScrollBoxSpiski.Left:= - ScrollBoxSpiski.Width;
  ScrollBoxSpiski.Visible:= True;
  Repeat
    ScrollBoxSpiski.Left:= ScrollBoxSpiski.Left + 1;
  Until ScrollBoxSpiski.Left>= Round(btnSpiskiChoose.Width*0.5);
end;

procedure TForm1.LblSpiskiMouseEnter(Sender: TObject);
begin
  ImgSpiski.Visible:= False;
  lblSpiski.Font.Color:= clLime;
end;

procedure TForm1.LblSpiskiMouseLeave(Sender: TObject);
begin
  ImgSpiski.Visible:= True;
  lblSpiski.Font.Color:= clWindowText;
end;

procedure TForm1.LblSpisokClick(Sender: TObject);
var
  a: integer;
begin
  Vlevo:= not Vlevo;
  if Vlevo then begin
    if efekts then begin
      a:= DBGrid1.Left - DBGrid1.Width;
      repeat
        Form1.Width:= Form1.Width - 1;
      until DBGrid1.Left = a;
      DBGrid1.Visible:=False;
    end
    else begin
      Form1.Width:= Form1.Width - DBGrid1.Width;
      DBGrid1.Visible:=False;
    end;
  end
  else begin
    if efekts then begin
      a:= DBGrid1.Left + DBGrid1.Width;
      DBGrid1.Visible:=True;
      repeat
        Form1.Width:= Form1.Width + 1;
      until DBGrid1.Left = a;
    end
    else begin
      Form1.Width:= Form1.Width + DBGrid1.Width;
      DBGrid1.Visible:= True;
    end
  end;
end;

procedure TForm1.LblSpisokMouseEnter(Sender: TObject);
begin
  ImgSpisok.Visible:= False;;
  lblSpisok.Font.Color:= clLime;
end;

procedure TForm1.LblSpisokMouseLeave(Sender: TObject);
begin
  ImgSpisok.Visible:= True;
  lblSpisok.Font.Color:= clWindowText;
end;

procedure TForm1.LireClick(Sender: TObject);
begin
  try
    MediaPlayer1.Play;
  except
    NomerDorohki:=0;
    MediaPlayer1.FileName := Bibliotheque.Items.Strings[NomerDorohki];
    if not MediaPlayer1.AutoOpen then MediaPlayer1.Open;
    if tmrPlayer.Enabled=False then tmrPlayer.Enabled:=True;
    MediaPlayer1.Play;
  end;
end;

procedure TForm1.StopperClick(Sender: TObject);
begin
  MediaPlayer1.Stop;
end;

procedure TForm1.ResumerClick(Sender: TObject);
begin
  MediaPlayer1.Pause;
end;

procedure TForm1.SauverClick(Sender: TObject);
begin
  if(BddS.Execute)then Bibliotheque.Items.SaveToFile(BddS.FileName+'.dat');
end;

procedure TForm1.ScrollBoxMenuMouseEnter(Sender: TObject);
begin
  tmrMenuLeave.Enabled:= False;
end;

procedure TForm1.ScrollBoxMenuMouseLeave(Sender: TObject);
begin
  tmrMenuLeave.Enabled:= True;
end;

procedure TForm1.EffacerClick(Sender: TObject);
begin
  Bibliotheque.Clear;
end;

procedure TForm1.ChargeClick(Sender: TObject);
begin
  Bdd.FilterIndex:=2;
  if(Bdd.Execute) then Bibliotheque.Items.LoadFromFile(Bdd.FileName);
end;

procedure TForm1.Effacer1Click(Sender: TObject);
begin
  Bibliotheque.Items.Delete(Bibliotheque.ItemIndex);
end;

procedure TForm1.BibliothequeClick(Sender: TObject);
begin
  NomerDorohki:= Bibliotheque.itemIndex;
  MediaPlayer1.FileName := Bibliotheque.Items.Strings[NomerDorohki];
  if not MediaPlayer1.AutoOpen then MediaPlayer1.Open;

  if tmrPlayer.Enabled=False then tmrPlayer.Enabled:=True;
  
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  Edit1.Enabled:= CheckBox1.Checked;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  Edit2.Enabled:= CheckBox2.Checked;
end;

procedure TForm1.SkritPoiskClick(Sender: TObject);
var
  a: integer;
begin
 if efekts then begin
    a:= ScrollBoxPoisk.Top + ScrollBoxPoisk.Height;
    repeat
      ScrollBoxPoisk.Top:=ScrollBoxPoisk.Top+1;
      SkritPoisk.Top:=SkritPoisk.Top+1;
      sleep(7);
    until ScrollBoxPoisk.Top >= a;
 end
 else begin
    ScrollBoxPoisk.Top:= ScrollBoxPoisk.Top + ScrollBoxPoisk.Height;
    SkritPoisk.Top:= SkritPoisk.Top + ScrollBoxPoisk.Height;
 end;
 SkritPoisk.Visible:= False;

  ADOQuery1.Active:= False;
  ADOQuery1.SQL.Text:= TextSQL + ' WHERE ' + '(god_vipuska LIKE "'
      + lblGod[j1].Caption + '") AND (profil LIKE "' + lblTeacher[l1].Caption + '")';
  ADOQuery1.Active:= True;
end;

procedure TForm1.ImgFoundClick(Sender: TObject);
var a: integer;
begin

  if SkritPoisk.Visible = False then begin
     if efekts then begin
        SkritPoisk.Visible:=True;
        a:= ScrollBoxPoisk.Top - ScrollBoxPoisk.Height;
        repeat
          ScrollBoxPoisk.Top:=ScrollBoxPoisk.Top-1;
          SkritPoisk.Top:=SkritPoisk.Top-1;
          sleep(7);
        until ScrollBoxPoisk.Top <= a;
     end
     else begin
        SkritPoisk.Visible:= True;
        ScrollBoxPoisk.Top:= ScrollBoxPoisk.Top - ScrollBoxPoisk.Height;
        SkritPoisk.Top:= SkritPoisk.Top - ScrollBoxPoisk.Height;
     end;
  end;

end;

procedure TForm1.ImgPoiskMouseEnter(Sender: TObject);
begin
  ImgPoisk.Visible:= False;
  LblPoisk.Visible:= True;
end;

procedure TForm1.BibliothequeDblClick(Sender: TObject);
begin
  Lire.Click;
end;

procedure TForm1.BtnPoiskClick(Sender: TObject);
var
  zapr: string;
begin
  zapr:= '';
  if Edit2.Enabled then zapr:= '(Ima2 LIKE "' + Edit2.Text + '")'; //Имя

  if Edit1.Enabled and Edit2.Enabled then zapr:= zapr + ' AND ';

  if Edit1.Enabled then
        zapr:= zapr + '(Ima LIKE "' + Edit1.Text + '")'; //фамилия

  try
    ADOQuery1.Active:= False;
    ADOQuery1.SQL.Text:= TextSQL + ' WHERE ' + zapr;
    ADOQuery1.Active:= True;
  except
    ShowMessage('Ошибка запроса');
    ADOQuery1.SQL.Text:= TextSQL;
  end;

end;

procedure TForm1.BtnEfektsClick(Sender: TObject);
begin
  efekts:= not efekts;
end;

procedure TForm1.BtnInsertClick(Sender: TObject);
begin
  ADOQuery1.Insert;
  DBIma.Text:= '<New>';
  DBGod.Text:= lblGod[j1].Caption;
  DBProfil.Text:= lblTeacher[l1].Caption;
  ADOQuery1.Post;
  ADOQuery1.Active:= False;
  ADOQuery1.Active:= True;
  while DBIma.Text<>'<New>' do ADOQuery1.Next;
end;

procedure TForm1.BtnLoadColClick(Sender: TObject);
var
  myFile: TextFile;
  k,i1, lost: integer;
  text1, FileName1, index: string;
begin
  if (OpenDlgLeftSide.Execute) then begin
    for k:= i downto 10 do begin
      with LeftSidePicture[k] do begin
        if not Editing then begin
          BtnEditPicture.SetFocus;
          BtnEditPicture.Click;
        end;
        BtnDeletePicture.SetFocus;
        BtnDeletePicture.Click;
      end;
    end;
    i:=9;

    AssignFile(myFile, OpenDlgLeftSide.FileName);
    //Открытие файла для чтения
    Reset(myFile);
    try
      //Считываем параметры картинок
      ReadLn(myFile, text1); i1:=StrToInt(Text1);

      for k:=10 to i1 do begin
        btnCreatePicture.Click;
        with LeftSidePicture[k] do begin
          try
            ReadLn(myFile,text1); Image.Width:= StrToInt(Text1);
            ReadLn(myFile,text1); Image.Height:= StrToInt(Text1);
            ReadLn(myFile,text1); Image.Top:= StrToInt(Text1);
            ReadLn(myFile,text1); Image.Left:= StrToInt(Text1);
            ReadLn(myFile,text1); Image.Picture.LoadFromFile(Text1);
                                                  Namesjj:= text1;

            ReadLn(myFile, Deleted);
            if Deleted='True' then Begin
              btnDeletePicture.SetFocus;
              btnDeletePicture.Click;
            End;

          except
            MessageDlg('Picture ' + text + ' is not found' + #10#13 + 'Элементу будет присвоена стандартная картинка', mtError, [mbOk], 0);
            Namesjj:= StandartPicture;
            Image.Picture.LoadFromFile(Namesjj);
            Image.AutoSize:= True;
            Image.AutoSize:= False;
          end;
        end;
      end;
    except
    i:= 9;
    end;
    CloseFile(myFile);

    FileName1:= OpenDlgLeftSide.FileName;
    if copy(FileName1,Length(FileName1)-3,4)='.alb' then
      delete(FileName1,Length(FileName1)-3,4);
    for k := 1 to Length(FileName1) do begin
      if FileName1[k] = '\' then lost:=k+1;
    end;
    index:= copy(FileName1,lost,Length(FileName1)-lost+1);

    AssignFile(myFile, PapkaPhoto + DBEdit1.Text + '.txt');
    ReWrite(myFile);
    WriteLn(myFile, i);
    for k:= 10 to i do with LeftSidePicture[k] do begin
      WriteLn(myFile, IntToStr(Image.Width));
      WriteLn(myFile, IntToStr(Image.Height));
      WriteLn(myFile, IntToStr(Image.Top));
      WriteLn(myFile, IntToStr(Image.Left));
      if not FileExists(PapkaPictures+DBEdit1.Text) then
        CreateDir(PapkaPictures+DBEdit1.Text);
      Namesjj:= PapkaPictures+DBEdit1.Text+'\'+IntToStr(k)+'.jpg';
      Image.Picture.SaveToFile(Namesjj);
      WriteLn(myFile, Namesjj);
      WriteLn(myFile, Deleted);
    end;
    CloseFile(myFile);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  zy: integer;
begin
  repeat
      try
        SysUtils.DeleteFile(PapkaPhoto + DBEdit1.Text + '.jpg');
        ADOQuery1.Delete;
        zy:=1;
      finally;
      end;
  until (zy=1);
end;

procedure TForm1.BtnEditClick(Sender: TObject);
var
  DBtext: string;
begin
  DBTxtTeacher.Visible:= not DBTxtTeacher.Visible;
  DBTxtAge.Visible:= not DBTxtAge.Visible;
  DBTxtName.Visible:= not DBTxtName.Visible;
  DBTxtFamily.Visible:= not DBTxtFamily.Visible;
  DBTxtProfil.Visible:= not DBTxtProfil.Visible;

  DBBoxTeacher.Visible:= not DBBoxTeacher.Visible;
  DBBoxAge.Visible:= not DBBoxAge.Visible;
  DBEditName.Visible:= not DBEditName.Visible;
  DBEditFamily.Visible:= not DBEditFamily.Visible;
  DBBoxProfil.Visible:= not DBBoxProfil.Visible;

  DBNavigator1.Visible:= not DBNavigator1.Visible;

  ADOTable1.Active:= False;
  ADOTable1.TableName:= 'profil';
  DBText5.DataField:= 'profil';
  ADOTable1.Active:= True;
  repeat
    DBBoxProfil.Items.Add(DBText5.Caption);
    DBtext:= DBText5.Caption;
    ADOTable1.Next;
  until (DBtext = DBText5.Caption);

  ADOTable1.Active:= False;
  ADOTable1.TableName:= 'kl_ruk';
  DBText5.DataField:= 'kl_ruk';
  ADOTable1.Active:= True;
  repeat
    DBBoxTeacher.Items.Add(DBText5.Caption);
    DBtext:= DBText5.Caption;
    ADOTable1.Next;
  until (DBtext = DBText5.Caption);

  ADOTable1.Active:= False;
  ADOTable1.TableName:= 'god_vipuska';
  DBText5.DataField:= 'god_vipuska';
  ADOTable1.Active:= True;
  repeat
    DBBoxAge.Items.Add(DBText5.Caption);
    DBtext:= DBText5.Caption;
    ADOTable1.Next;
  until (DBtext = DBText5.Caption);
end;

procedure TForm1.BtnStyleClick(Sender: TObject);
begin
  Form2.Shape1.Visible:= False;
  Form2.Shape2.Visible:= False;
  Form2.Shape3.Visible:= False;
  Form2.Shape4.Visible:= False;
  Form2.Image5.Picture:= ImgAlbum.Picture;

  txtIfCancel:= txtStyle;
  Form2.Show;
end;

procedure TForm1.btnStandartClick(Sender: TObject);
var
  myFile: TextFile;
  k: integer;
begin
  if MessageBox(0, 'Установить стандартное оформление?', 'Оформление',
  MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION + MB_SETFOREGROUND + MB_SYSTEMMODAL) = idYes then
  Begin
    AssignFile(myFile, TextFileName);
    ReWrite(myFile);
    CloseFile(myFile);

    for k:= 10 to i do
        if LeftSidePicture[k].Namesjj<>StandartPicture then
            SysUtils.DeleteFile(LeftSidePicture[k].Namesjj);

    MessageBox(0, 'Изменения вступят в силу после перезапуска приложения', 'Уведомление',
    MB_ICONWarning + mb_Ok + MB_SETFOREGROUND + MB_SYSTEMMODAL);

    val1 := 255;
    TmrClose.Enabled := True;
  end;
end;

procedure TForm1.btnCalendarClick(Sender: TObject);
begin
  if SkritPoisk.Visible then SkritPoisk.Click;
  frmConnect.Show;
end;

procedure TForm1.TmrPoiskTimer(Sender: TObject);
begin
  if Edit1.Enabled then
    if (Edit1.Text <> '') and (Edit1.Text[1]<>' ') then
      BtnPoisk.Enabled:= True
    else
      BtnPoisk.Enabled:= False;

  if Edit2.Enabled then
    if (Edit2.Text <> '') and (Edit2.Text[1]<>' ') then
      BtnPoisk.Enabled:= True
    else
      BtnPoisk.Enabled:= False;

  if Edit1.Enabled and Edit2.Enabled then
      if (Edit1.Text <> '') and (Edit1.Text[1]<>' ') and
                            (Edit2.Text <> '') and (Edit2.Text[1]<>' ') then
                                                BtnPoisk.Enabled:= True
      else BtnPoisk.Enabled:= False;

  if (Edit1.Enabled = False) and (Edit2.Enabled = False) then
    BtnPoisk.Enabled:= False;
end;

procedure TForm1.TmrEditingTimer(Sender: TObject);
var
  k: integer;
begin
  for k:=10 to i do
  with LeftSidePicture[k] do begin
    if (Deleted<>'True') and (Editing) then
      if (btnEditPicture.Top<>Image.Top+Image.Height-EditHeight) or
      (btnEditPicture.Left<>Image.Left) or
      (btnChangePicture.Top<>Image.Top+Image.Height-ChangeHeight) or
      (btnChangePicture.Left<>Image.Left+Image.Width-ChangeWidth) or
      (btnDeletePicture.Top<>Image.Top) or
      (btnDeletePicture.Left<>Image.Left+Image.Width-DeleteWidth) then begin
          btnDeletePicture.Top:= Image.Top;
          btnDeletePicture.Left:= Image.Left + Image.Width - DeleteWidth;
          btnChangePicture.Top:= Image.Top + Image.Height - ChangeHeight;
          btnChangePicture.Left:= Image.Left + Image.Width - ChangeWidth;
          btnEditPicture.Top:= Image.Top + Image.Height - EditHeight;
          btnEditPicture.Left:= Image.Left;
      end;
  end;

end;

procedure TForm1.TmrLeftSideTimer(Sender: TObject);

begin

end;

//обработка перемещения ScrollBox1
{procedure TForm1.Picture1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  ReleaseCapture;
  ScrollBox1.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
end;}

procedure TForm1.tmrLoadPhotoTimer(Sender: TObject);
var
  k,i1,j,last: integer;
  myFile1: TextFile;
  text1: string;
begin
  if ID <> DBEdit1.Text then begin
    try
      imgPhoto.Picture.LoadFromFile(PapkaPhoto + DBEdit1.Text + '.jpg');
      ID:= DBEdit1.Text;
      if AutoStretch <> True then try
        imgPhoto.Top:= - StrToInt(DBTextTop.Caption);
        imgPhoto.Left:= - StrToInt(DBTextLeft.Caption);
        imgPhoto.Width:= StrToInt(DBTextWidth.Caption);
        imgPhoto.Height:= StrToInt(DBTextHeight.Caption);
      except
        imgPhoto.Top:= 0;
        imgPhoto.Left:= 0;
        imgPhoto.Stretch:= False;
        imgPhoto.AutoSize:= True;
        imgPhoto.AutoSize:= False;
        imgPhoto.Stretch:= True;

        ADOQuery1.Edit;
        DBTextWidth.Caption:= IntToStr(imgPhoto.Width);
        DBTextHeight.Caption:= IntToStr(imgPhoto.Height);
        ADOQuery1.Post;
      end;

    except
      imgPhoto.Picture.LoadFromFile(StandartPhoto);
      imgPhoto.Top:= 0;
      imgPhoto.Left:= 0;
      imgPhoto.Width:= ScrollBoxPhoto.Width;
      imgPhoto.Height:= ScrollBoxPhoto.Height;
      ID:= DBEdit1.Text;
    end;


/////////////////////////////////////////////////////////
  //удаляем текущее содержимое
    i1:=i;
    for k := i1 downto 10 do begin
      with LeftSidePicture[k] do begin
        if not Editing then begin
          BtnEditPicture.Visible:=True;
          BtnEditPicture.SetFocus;
          BtnEditPicture.Click;
        end;
        BtnDeletePicture.SetFocus;
        BtnDeletePicture.Click;
      end;
    end;
    i:=9;

    try
      AssignFile(myFile1, PapkaPhoto + DBEdit1.Text + '.txt');
      ReSet(myFile1);
      //Считываем параметры картинок
      ReadLn(myFile1, text1); i1:=StrToInt(Text1);

      for k:=10 to i1 do begin
        btnCreatePicture.Click;
        with LeftSidePicture[k] do begin
          try
            ReadLn(myFile1,text1); Image.Width:= StrToInt(Text1);
            ReadLn(myFile1,text1); Image.Height:= StrToInt(Text1);
            ReadLn(myFile1,text1); Image.Top:= StrToInt(Text1);
            ReadLn(myFile1,text1); Image.Left:= StrToInt(Text1);
            ReadLn(myFile1,text1); Image.Picture.LoadFromFile(Text1);
                                                  Namesjj:= text1;

            ReadLn(myFile1, Deleted);
            for j := 1 to length(text1) do
              if text1[j]='.' then last:=j;
            Deleted:= copy(text1,last,length(text1)-last+1);

            btnDeletePicture.Top:= Image.Top;
            btnDeletePicture.Left:= Image.Left + Image.Width - DeleteWidth;
            btnChangePicture.Top:= Image.Top + Image.Height - ChangeHeight;
            btnChangePicture.Left:= Image.Left + Image.Width - ChangeWidth;
            btnEditPicture.Top:= Image.Top + Image.Height - EditHeight;
            btnEditPicture.Left:= Image.Left;

          except
            MessageDlg('Picture ' + text + ' is not found' + #10#13 + 'Элементу будет присвоена стандартная картинка', mtError, [mbOk], 0);
            Namesjj:= StandartPicture;
            Image.Picture.LoadFromFile(Namesjj);
            Image.AutoSize:= True;
            Image.AutoSize:= False;
          end;
          btnEditPicture.SetFocus;
          btnEditPicture.Click;
          if not redakt then begin
            btnEditPicture.Visible:= False;
          end;
        end;
      end;

    except
    end;
    CloseFile(myFile1);

  end;
end;

procedure TForm1.tmrMenuLeaveTimer(Sender: TObject);
begin
  btnMenu.Click;
  tmrMenuLeave.Enabled:= False;
end;

procedure TForm1.BtnChangePhotoClick(Sender: TObject);
begin
  Form1.Enabled:= False;
  frmRedaktor.Show;
end;

procedure TForm1.btnStretchClick(Sender: TObject);
begin
  boolStretch:= not BoolStretch;
  imgPhoto.Stretch:= boolStretch;
  if imgPhoto.Stretch then begin
      imgPhoto.AutoSize:= False;
      imgPhoto.Height:= ScrollBoxPhoto.Height;
      imgPhoto.Width:= ScrollBoxPhoto.Width;
      imgPhoto.Top:= 0;
      imgPhoto.Left:= 0;
      AutoStretch:= True;
  end
  else begin
      imgPhoto.AutoSize:= True;
      AutoStretch:= False;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  myFile: TextFile;
begin
  AssignFile(myFile, TextFileName);
  ReWrite(myFile);
  try
    // записываем параметры формы
    WriteLn(myFile, txtStyle);
    if efekts then WriteLn(myFile, 'True');
    if boolStretch then Writeln(myFile, 'True');
  except
  end;
  CloseFile(myFile);

  menuForm.Close;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  TmrShow.Enabled:= True;
end;

procedure TForm1.ImgEnteredSpiskiClick(Sender: TObject);
var
  a: integer;
begin
  btnMenu.Click;
  ScrollBoxSpiski.Left:= - ScrollBoxSpiski.Width;
  ScrollBoxSpiski.Visible:= True;
  
  if efekts then
  Repeat
    ScrollBoxSpiski.Left:= ScrollBoxSpiski.Left + 1;
  Until ScrollBoxSpiski.Left>= Round(btnSpiskiChoose.Width*0.5)
  else ScrollBoxSpiski.Left:= Round(btnSpiskiChoose.Width*0.5);
  btnNext.Enabled:= False;
  btnBack.Enabled:= False;
  btnMenu.Enabled:= False;
  btnStyle.Enabled:= False;
  if not Vlevo then begin
    Vlevo:= not Vlevo;
    if efekts then begin
      a:= Form1.Width - DBGrid1.Width;
      repeat
        Form1.Width:= Form1.Width - 1;
      until Form1.Width <= a;
      DBGrid1.Visible:=False;
    end
    else begin
      Form1.Width:= Form1.Width - DBGrid1.Width;
      DBGrid1.Visible:=False;
    end;
  end
end;

procedure TForm1.ImgVariantClick(Sender: TObject);
begin
  try
    shapeVariant[l1,j1].Visible:= False;
  except
  end;
  btnChangeObl.Enabled:= True;
  btnChooseCol.Enabled:= True;
  btnSpiskiChoose.Enabled:= True;
  j1:=(Sender as TImage).Tag mod 1000;
  l1:=(Sender as TImage).Tag div 1000;
  shapeVariant[l1,j1].Visible:= True;
end;

procedure TForm1.ImgEnteredSpiskiMouseLeave(Sender: TObject);
begin
  ImgSpiski.Visible:= True;
  lblSpiski.Font.Color:= clWindowText;
end;

procedure TForm1.ImgEnteredSpisokClick(Sender: TObject);
var
  a: integer;
begin
  Vlevo:= not Vlevo;
  if Vlevo then begin
    if efekts then begin
      a:= Form1.Width - DBGrid1.Width;
      repeat
        Form1.Width:= Form1.Width - 1;
      until Form1.Width <= a;
      DBGrid1.Visible:=False;
    end
    else begin
      Form1.Width:= Form1.Width - DBGrid1.Width;
      DBGrid1.Visible:=False;
    end;
  end
  else begin
    if efekts then begin
      a:= Form1.Width + DBGrid1.Width;
      DBGrid1.Visible:=True;
      repeat
        Form1.Width:= Form1.Width + 1;
      until Form1.Width >= a;
    end
    else begin
      Form1.Width:= Form1.Width + DBGrid1.Width;
      DBGrid1.Visible:= True;
    end
  end;
end;

procedure TForm1.ImgEnteredSpisokMouseLeave(Sender: TObject);
begin
  ImgSpisok.Visible:= True;
  lblSpisok.Font.Color:= clWindowText;
end;

procedure TForm1.ImgSpiskiMouseEnter(Sender: TObject);
begin
  ImgSpiski.Visible:= False;
  lblSpiski.Font.Color:= clLime;
end;

procedure TForm1.ImgSpisokMouseEnter(Sender: TObject);
begin
  ImgSpisok.Visible:= False;;
  lblSpisok.Font.Color:= clLime;
end;

procedure TForm1.ImgAboutUsMouseEnter(Sender: TObject);
begin
  ImgAboutUs.Visible:= False;
  lblAboutUs.Font.Color:= clLime;
end;

procedure TForm1.ImgActPlayerMouseEnter(Sender: TObject);
begin
  ImgActPlayer.Visible:= False;
  LblPlayer.Visible:= True;
end;

procedure TForm1.ImgDoorMouseEnter(Sender: TObject);
begin
  ImgDoor.Visible:= False;
  ShapeEnteredDoor.Visible:= True;
  LblDoor.Font.Color:= clRed;
end;

procedure TForm1.ImgEnteredAboutUsClick(Sender: TObject);
begin
  MessageBox(0, 'Автор:' + #10#13 + 'Ли Александр' + #10#13 + 'Служба поддержки:' + #10#13 +  'SamurayLee@mail.ru' + #10#13 + 'Смоленск, 2010 год', 'О программе',
  MB_ICONINFORMATION + MB_OK + MB_SETFOREGROUND + MB_SYSTEMMODAL);
end;

procedure TForm1.ImgEnteredAboutUsMouseLeave(Sender: TObject);
begin
  ImgAboutUs.Visible:= True;
  lblAboutUs.Font.Color:= clWindowText;
end;

procedure TForm1.ImgEnteredActPlayerClick(Sender: TObject);
var
  a: integer;
begin
  if efekts then begin
    a:= ScrollBoxPlayer.Top - ScrollBoxPlayer.Height;
    repeat
      ScrollBoxPlayer.Top:= ScrollBoxPlayer.Top-1;
      sleep(7);
    until ScrollBoxPlayer.Top <= a;
  end
  else begin
    ScrollBoxPlayer.Top:= ScrollBoxPlayer.Top - ScrollBoxPlayer.Height;
  end;
end;

procedure TForm1.ImgEnteredActPlayerMouseLeave(Sender: TObject);
begin
  ImgActPlayer.Visible:= True;
  LblPlayer.Visible:= False;
end;

procedure TForm1.ImgEnteredDoorClick(Sender: TObject);
var
  myFile: TextFile;
begin
  if MessageBox(handle,PChar('Вы действительно хотите выйти?'+#13#10),
     PChar('Подтверждение'), MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION) = IDYes then
  begin
    AssignFile(myFile, TextFileName);
    ReWrite(myFile);
    try
      // записываем параметры формы
      WriteLn(myFile, txtStyle);
      if efekts then WriteLn(myFile, 'True');
    except
    end;
    CloseFile(myFile);

    val1 := 255;
    TmrClose.Enabled:= True;
  end;
end;

procedure TForm1.ImgEnteredDoorMouseLeave(Sender: TObject);
begin
  ImgDoor.Visible:= True;
  ShapeEnteredDoor.Visible:= False;
  LblDoor.Font.Color:= clWindowText;
end;

procedure TForm1.ImgEnteredPoiskMouseLeave(Sender: TObject);
begin
  ImgPoisk.Visible:= True;
  LblPoisk.Visible:= False;
end;

end.
