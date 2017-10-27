[code]
type
  TBtnEventProc = procedure (h:HWND);
  TPBProc = function(h:hWnd;Msg,wParam,lParam:Longint):Longint;  //°Ù·Ö±È
  TTimerProc = procedure(h:longword; msg:longword; idevent:longword; dwTime:longword);
const
  Radius  = 9;
  GWL_EXSTYLE = (-20);
//´°¿ÚÒÆ¶¯
  WM_SYSCOMMAND = $0112;
  WS_EX_LAYERED = $80000;
  WS_EX_TRANSPARENT = $20;
  LWA_COLORKEY = 1;
  TransparentColor = clLime;  //ÒªÈ¥µôµÄÍ¼Æ¬µ×É«
  TransparentPercent = 80;
  BTN_MAX_PATH = 1024; //íå èçìåíÿòü !!!

  //èäåíòèôèêàòîðû ñîáûòèé äëÿ êíîïîê
  BtnClickEventID      = 1;
  BtnMouseEnterEventID = 2;
  BtnMouseLeaveEventID = 3;
  BtnMouseMoveEventID  = 4;
  BtnMouseDownEventID  = 5;
  BtnMouseUpEventID    = 6;
  
  
//function WrapBtnCallback(Callback: TBtnEventProc; ParamCount: Integer): Longword;  external 'wrapcallback@files:innocallback.dll stdcall';
function  WrapTimerProc(callback: TTimerProc; Paramcount: Integer): Longword; external 'wrapcallback@files:innocallback.dll stdcall';

function  LoadCursorFromFile(FileName: String): Cardinal; external 'LoadCursorFromFile{#A}@user32 stdcall';
function  DeleteObject(p1: Longword): BOOL; external 'DeleteObject@gdi32.dll stdcall';
function  GetPM(nIndex:Integer):Integer; external 'GetSystemMetrics@user32.dll stdcall';
//botva2
function  ImgLoad(Wnd :HWND; FileName :PAnsiChar; Left, Top, Width, Height :integer; Stretch, IsBkg :boolean) :Longint; external 'ImgLoad@{tmp}\botva2.dll stdcall delayload';
procedure ImgSetVisibility(img :Longint; Visible :boolean); external 'ImgSetVisibility@{tmp}\botva2.dll stdcall delayload';
procedure ImgApplyChanges(h:HWND); external 'ImgApplyChanges@{tmp}\botva2.dll stdcall delayload';
procedure ImgSetPosition(img :Longint; NewLeft, NewTop, NewWidth, NewHeight :integer); external 'ImgSetPosition@files:botva2.dll stdcall';
procedure ImgRelease(img :Longint); external 'ImgRelease@{tmp}\botva2.dll stdcall delayload';
procedure gdipShutdown;  external 'gdipShutdown@{tmp}\botva2.dll stdcall delayload';
function  WrapBtnCallback(Callback: TBtnEventProc; ParamCount: Integer): Longword; external 'wrapcallback@{tmp}\innocallback.dll stdcall delayload';
function  BtnCreate(hParent:HWND; Left,Top,Width,Height:integer; FileName:PAnsiChar; ShadowWidth:integer; IsCheckBtn:boolean):HWND;  external 'BtnCreate@{tmp}\botva2.dll stdcall delayload';
procedure BtnSetText(h:HWND; Text:PAnsiChar);  external 'BtnSetText@{tmp}\botva2.dll stdcall delayload';
procedure BtnSetVisibility(h:HWND; Value:boolean); external 'BtnSetVisibility@{tmp}\botva2.dll stdcall delayload';
procedure BtnSetFont(h:HWND; Font:Cardinal); external 'BtnSetFont@{tmp}\botva2.dll stdcall delayload';
procedure BtnSetFontColor(h:HWND; NormalFontColor, FocusedFontColor, PressedFontColor, DisabledFontColor: Cardinal); external 'BtnSetFontColor@{tmp}\botva2.dll stdcall delayload';
procedure BtnSetEvent(h:HWND; EventID:integer; Event:Longword); external 'BtnSetEvent@{tmp}\botva2.dll stdcall delayload';
procedure BtnSetCursor(h:HWND; hCur:Cardinal); external 'BtnSetCursor@{tmp}\botva2.dll stdcall delayload';
procedure BtnSetEnabled(h:HWND; Value:boolean); external 'BtnSetEnabled@{tmp}\botva2.dll stdcall delayload';
function  GetSysCursorHandle(id:integer):Cardinal; external 'GetSysCursorHandle@{tmp}\botva2.dll stdcall delayload';
function  BtnGetChecked(h:HWND):boolean; external 'BtnGetChecked@{tmp}\botva2.dll stdcall delayload';
procedure BtnSetChecked(h:HWND; Value:boolean); external 'BtnSetChecked@{tmp}\botva2.dll stdcall delayload';
procedure CreateFormFromImage(h:HWND; FileName:PAnsiChar); external 'CreateFormFromImage@{tmp}\botva2.dll stdcall delayload';
procedure BtnSetPosition(h:HWND; NewLeft, NewTop, NewWidth, NewHeight: integer);  external 'BtnSetPosition@{tmp}\botva2.dll stdcall delayload';
function  SetLayeredWindowAttributes(hwnd:HWND; crKey:Longint; bAlpha:byte; dwFlags:longint ):longint;
external  'SetLayeredWindowAttributes@user32 stdcall'; //º¯ÊýÉùÃ÷
function  SetWindowLong(Wnd: HWnd; Index: Integer; NewLong: Longint): Longint; external 'SetWindowLongA@user32.dll stdcall';
function  PBCallBack(P:TPBProc;ParamCount:integer):LongWord; external 'wrapcallback@files:innocallback.dll stdcall';
function  CallWindowProc(lpPrevWndFunc: Longint; hWnd: HWND; Msg: UINT; wParam, lParam: Longint): Longint; external 'CallWindowProcA@user32.dll stdcall';
procedure ImgSetVisiblePart(img:Longint; NewLeft, NewTop, NewWidth, NewHeight : integer); external 'ImgSetVisiblePart@files:botva2.dll stdcall';
function  SetTimer(hWnd: LongWord; nIDEvent, uElapse: LongWord; lpTimerFunc: LongWord): LongWord; external 'SetTimer@user32.dll stdcall';
function  KillTimer(hWnd: LongWord; nIDEvent: LongWord): LongWord; external 'KillTimer@user32.dll stdcall';
function  GetWindowLong(Wnd: HWnd; Index: Integer): Longint; external 'GetWindowLongA@user32.dll stdcall';
function  ReleaseCapture(): Longint; external 'ReleaseCapture@user32.dll stdcall';
function  CreateRoundRectRgn(p1, p2, p3, p4, p5, p6: Integer): THandle; external 'CreateRoundRectRgn@gdi32 stdcall';
function  SetWindowRgn(hWnd: HWND; hRgn: THandle; bRedraw: Boolean): Integer; external 'SetWindowRgn@user32 stdcall';

procedure ShapeForm(aForm: TForm; edgeSize: integer);//Ô²½Ç
var
  FormRegion:LongWord;
begin
  FormRegion:=CreateRoundRectRgn(0,0,aForm.Width,aForm.Height,edgeSize,edgeSize);
  SetWindowRgn(aForm.Handle,FormRegion,True);
end;
