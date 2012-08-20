unit LSNFun;

interface

uses
  Windows;


{灵信LED显示动态链接库函数声明}
//1.创建串口通讯实例
function CreateComm():boolean;stdcall;
//2.删除串口通讯实例
function DeleteComm():boolean;stdcall;
//3.设置参数
procedure SetScreenPara(FPNO:integer;FColorStyle:integer;FWidth,FHeight:integer;FModeStyle:integer;FTimerOn,FTemperatureOn,FMAINOn,FTitleOn:Boolean;FTitleStyle:integer);stdcall;
//4.加载参数
function SendScreenPara(ComNo:integer;Baud:integer;hParent: Thandle):integer;stdcall;
//5.加载图片数据
procedure AddBmp(FInMode, FRunSpeed, FShowTime: integer;FBeginY :integer; FHexFile,FBmpFile: PChar;FAddstyle:integer);stdcall;
//6.加载字符串数据
procedure AddString(FInMode, FRunSpeed, FShowTime: integer;FBeginY:integer;FFontName:PChar;FFontSize,FFontColor:integer;FHexFile,FInString: PChar;FAddstyle:integer);stdcall;
//7.加载主区RTF文件
procedure AddRtf(FInMode, FRunSpeed, FShowTime: integer;FBeginY:integer;FHexFile,FInFiles: PChar;FAddstyle:integer);stdcall;
//8.加载字幕区图片数据
procedure AddBmp_Title(FInMode, FRunSpeed, FShowTime: integer;FBeginY :integer; FHexFile,FBmpFile: PChar;FAddstyle:integer);stdcall;stdcall;
//9.加载字幕区字符串数据
procedure AddString_Title(FInMode, FRunSpeed, FShowTime: integer;FBeginY:integer;FFontName:PChar;FFontSize,FFontColor:integer;FHexFile,FInString: PChar;FAddstyle:integer);stdcall; 
//10.加载字幕区RTF文件
procedure AddRtf_Title(FInMode, FRunSpeed, FShowTime: integer;FBeginY:integer;FHexFile,FInFiles: PChar;FAddstyle:integer);stdcall; 
//11.校对时间
function AdjustTime(ComNo:integer;Baud:integer;PNO:integer;hParent: Thandle):integer;stdcall; 
//12.设置时钟格式
function SendTimerPara(ComNo:integer;Baud:integer;PNO:integer;FTimerModel,FTimerStyle,FTimerColor,FTimerX,FTimerY:INTEGER;FTimersec,FTimermin,FTimerhour,FTimerday,FTimermon,FTimerweek,FTimeryear:boolean;hParent: Thandle):integer;stdcall; 
//13 发送串口数据
function SendDATAToComm(ComNo:integer;Baud:integer;DATAName:Pchar;hParent: Thandle):integer; stdcall; 
//14 开关显示屏
function PowerDisplay(ComNo:integer;Baud:integer;PNO:integer;PwState:integer;hParent: Thandle):integer;stdcall; 
//15 串口发送进度查询
function GetProcessCount():integer;stdcall; 
//16  字库方式发送主区数据到串口
function SendString_Lib(ComNo:integer;Baud:integer;FInMode, FRunSpeed, FShowTime: integer;FBeginY:integer;FFontColor:integer;FInString: PChar;hParent: Thandle):integer;stdcall; 
//17  字库方式发送字幕区数据到串口
function SendString_Title_Lib(ComNo:integer;Baud:integer;FInMode, FRunSpeed, FShowTime: integer;FBeginY:integer;FFontColor:integer;FInString: PChar;hParent: Thandle):integer;stdcall; 
//18  设置广播发送模式
procedure SetBoardCase(BC:boolean);stdcall; 
{以下为 UDP Socket 发送}
//19 UDP加载参数
function SendScreenPara_UDP(IP:Pchar;Port:integer;hParent: Thandle):integer;stdcall; 
//20 UDP 校对时间
function AdjustTime_UDP(IP:Pchar;Port:integer;PNO:integer;hParent: Thandle):integer;stdcall; 
//21 UDP 设置时钟格式
function SendTimerPara_UDP(IP:Pchar;Port:integer;PNO:integer;FTimerModel,FTimerStyle,FTimerColor,FTimerX,FTimerY:INTEGER;
                       FTimersec,FTimermin,FTimerhour,FTimerday,FTimermon,FTimerweek,FTimeryear:boolean;hParent: Thandle):integer;stdcall; 
//22 UDP 发送显示数据
function SendDATA_UDP(IP:Pchar;Port:integer;Baud:integer;DATAName:Pchar;hParent: Thandle):integer; stdcall; 
//23 UDP 开关显示屏
function PowerDisplay_UDP(IP:Pchar;Port:integer;PNO:integer;PwState:integer;hParent: Thandle):integer;stdcall; 
//24 UDP 发送主区字库数据到串口
function SendString_Lib_UDP(IP:Pchar;Port:integer;Baud:integer;FInMode, FRunSpeed, FShowTime: integer;
                        FBeginY:integer;FFontColor:integer;FInString: PChar;hParent: Thandle):integer;stdcall; 
//25 UDP 发送字幕区字库数据到串口
function SendString_Title_Lib_UDP(IP:Pchar;Port:integer;Baud:integer;FInMode, FRunSpeed, FShowTime: integer;
                              FBeginY:integer;FFontColor:integer;FInString: PChar;hParent: Thandle):integer;stdcall; 
//26 预览主区显示转换数据
procedure MainPreview(PreviewFile:Pchar;OutFile:pchar;PageNo:integer);stdcall; 
//27 预览字幕区显示转换数据
procedure TitlePreview(PreviewFile:Pchar;OutFile:pchar;PageNo:integer);stdcall; 
//28 发送亮度显示数据
function AdjustBright(ComNo:integer;Baud:integer;PNO:integer;Brightness:integer;hParent: Thandle):integer;stdcall; 
//29 UDP 发送亮度显示数据
function AdjustBright_UDP(IP:Pchar;Port:integer;PNO:integer;Brightness:integer;hParent: Thandle):integer;stdcall; 
//30 字库方式字体颜色定义接口
procedure SetStringColor_Lib(FColorGroup:integer;FColorCount:integer;FFontColor:integer;FCountBegin,FCountEnd:integer);stdcall; 
//31 字幕字库方式字体颜色定义接口
procedure SetStringColor_Title_Lib(FColorGroup:integer;FColorCount:integer;FFontColor:integer;FCountBegin,FCountEnd:integer);stdcall; 


implementation

{灵信LED显示动态链接库函数声明}
//1.创建串口通讯实例
function CreateComm():boolean;stdcall;External 'ListenDisplay.dll';
//2.删除串口通讯实例
function DeleteComm():boolean;stdcall;External 'ListenDisplay.dll';
//3.设置参数
procedure SetScreenPara(FPNO:integer;FColorStyle:integer;FWidth,FHeight:integer;FModeStyle:integer;FTimerOn,FTemperatureOn,FMAINOn,FTitleOn:Boolean;FTitleStyle:integer);stdcall;External 'ListenDisplay.dll';
//4.加载参数
function SendScreenPara(ComNo:integer;Baud:integer;hParent: Thandle):integer;stdcall;External 'ListenDisplay.dll';
//5.加载图片数据
procedure AddBmp(FInMode, FRunSpeed, FShowTime: integer;FBeginY :integer; FHexFile,FBmpFile: PChar;FAddstyle:integer);stdcall;External 'ListenDisplay.dll';
//6.加载字符串数据
procedure AddString(FInMode, FRunSpeed, FShowTime: integer;FBeginY:integer;FFontName:PChar;FFontSize,FFontColor:integer;FHexFile,FInString: PChar;FAddstyle:integer);stdcall;External 'ListenDisplay.dll';
//7.加载主区RTF文件
procedure AddRtf(FInMode, FRunSpeed, FShowTime: integer;FBeginY:integer;FHexFile,FInFiles: PChar;FAddstyle:integer);stdcall;External 'ListenDisplay.dll';
//8.加载字幕区图片数据
procedure AddBmp_Title(FInMode, FRunSpeed, FShowTime: integer;FBeginY :integer; FHexFile,FBmpFile: PChar;FAddstyle:integer);stdcall;stdcall;External 'ListenDisplay.dll';
//9.加载字幕区字符串数据
procedure AddString_Title(FInMode, FRunSpeed, FShowTime: integer;FBeginY:integer;FFontName:PChar;FFontSize,FFontColor:integer;FHexFile,FInString: PChar;FAddstyle:integer);stdcall;External 'ListenDisplay.dll';
//10.加载字幕区RTF文件
procedure AddRtf_Title(FInMode, FRunSpeed, FShowTime: integer;FBeginY:integer;FHexFile,FInFiles: PChar;FAddstyle:integer);stdcall;External 'ListenDisplay.dll';
//11.校对时间
function AdjustTime(ComNo:integer;Baud:integer;PNO:integer;hParent: Thandle):integer;stdcall;External 'ListenDisplay.dll';
//12.设置时钟格式
function SendTimerPara(ComNo:integer;Baud:integer;PNO:integer;FTimerModel,FTimerStyle,FTimerColor,FTimerX,FTimerY:INTEGER;FTimersec,FTimermin,FTimerhour,FTimerday,FTimermon,FTimerweek,FTimeryear:boolean;hParent: Thandle):integer;stdcall;External 'ListenDisplay.dll';
//13 发送串口数据
function SendDATAToComm(ComNo:integer;Baud:integer;DATAName:Pchar;hParent: Thandle):integer; stdcall;External 'ListenDisplay.dll';
//14 开关显示屏
function PowerDisplay(ComNo:integer;Baud:integer;PNO:integer;PwState:integer;hParent: Thandle):integer;stdcall;External 'ListenDisplay.dll';
//15 串口发送进度查询
function GetProcessCount():integer;stdcall;External 'ListenDisplay.dll';
//16  字库方式发送主区数据到串口
function SendString_Lib(ComNo:integer;Baud:integer;FInMode, FRunSpeed, FShowTime: integer;FBeginY:integer;FFontColor:integer;FInString: PChar;hParent: Thandle):integer;stdcall;External 'ListenDisplay.dll';
//17  字库方式发送字幕区数据到串口
function SendString_Title_Lib(ComNo:integer;Baud:integer;FInMode, FRunSpeed, FShowTime: integer;FBeginY:integer;FFontColor:integer;FInString: PChar;hParent: Thandle):integer;stdcall;External 'ListenDisplay.dll';
//18  设置广播发送模式
procedure SetBoardCase(BC:boolean);stdcall;External 'ListenDisplay.dll';
{以下为 UDP Socket 发送}
//19 UDP加载参数
function SendScreenPara_UDP(IP:Pchar;Port:integer;hParent: Thandle):integer;stdcall;External 'ListenDisplay.dll';
//20 UDP 校对时间
function AdjustTime_UDP(IP:Pchar;Port:integer;PNO:integer;hParent: Thandle):integer;stdcall;External 'ListenDisplay.dll';
//21 UDP 设置时钟格式
function SendTimerPara_UDP(IP:Pchar;Port:integer;PNO:integer;FTimerModel,FTimerStyle,FTimerColor,FTimerX,FTimerY:INTEGER;
                       FTimersec,FTimermin,FTimerhour,FTimerday,FTimermon,FTimerweek,FTimeryear:boolean;hParent: Thandle):integer;stdcall;External 'ListenDisplay.dll';
//22 UDP 发送显示数据
function SendDATA_UDP(IP:Pchar;Port:integer;Baud:integer;DATAName:Pchar;hParent: Thandle):integer; stdcall;External 'ListenDisplay.dll';
//23 UDP 开关显示屏
function PowerDisplay_UDP(IP:Pchar;Port:integer;PNO:integer;PwState:integer;hParent: Thandle):integer;stdcall;External 'ListenDisplay.dll';
//24 UDP 发送主区字库数据到串口
function SendString_Lib_UDP(IP:Pchar;Port:integer;Baud:integer;FInMode, FRunSpeed, FShowTime: integer;
                        FBeginY:integer;FFontColor:integer;FInString: PChar;hParent: Thandle):integer;stdcall;External 'ListenDisplay.dll';
//25 UDP 发送字幕区字库数据到串口
function SendString_Title_Lib_UDP(IP:Pchar;Port:integer;Baud:integer;FInMode, FRunSpeed, FShowTime: integer;
                              FBeginY:integer;FFontColor:integer;FInString: PChar;hParent: Thandle):integer;stdcall;External 'ListenDisplay.dll';
//26 预览主区显示转换数据
procedure MainPreview(PreviewFile:Pchar;OutFile:pchar;PageNo:integer);stdcall;External 'ListenDisplay.dll';
//27 预览字幕区显示转换数据
procedure TitlePreview(PreviewFile:Pchar;OutFile:pchar;PageNo:integer);stdcall;External 'ListenDisplay.dll';
//28 发送亮度显示数据
function AdjustBright(ComNo:integer;Baud:integer;PNO:integer;Brightness:integer;hParent: Thandle):integer;stdcall;External 'ListenDisplay.dll';
//29 UDP 发送亮度显示数据
function AdjustBright_UDP(IP:Pchar;Port:integer;PNO:integer;Brightness:integer;hParent: Thandle):integer;stdcall;External 'ListenDisplay.dll';
//30 字库方式字体颜色定义接口
procedure SetStringColor_Lib(FColorGroup:integer;FColorCount:integer;FFontColor:integer;FCountBegin,FCountEnd:integer);stdcall;External 'ListenDisplay.dll';
//31 字幕字库方式字体颜色定义接口
procedure SetStringColor_Title_Lib(FColorGroup:integer;FColorCount:integer;FFontColor:integer;FCountBegin,FCountEnd:integer);stdcall;External 'ListenDisplay.dll';


end.
 