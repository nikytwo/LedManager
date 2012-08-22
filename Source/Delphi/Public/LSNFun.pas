unit LSNFun;

interface


procedure  StartSend;stdcall; external 'ListenPlayDll.dll';
   
function  AddControl(PNO,DBColor:integer):integer;stdcall; external 'ListenPlayDll.dll';


function AddProgram(pno:Integer;jno:Integer;playTime:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function AddLnTxtArea(pno:Integer;jno:Integer;qno:Integer;left:Integer;top:Integer;width:Integer;height:Integer;LnFileName:PChar;PlayStyle:Integer;Playspeed:Integer;times:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function AddFileArea(pno:Integer;jno:Integer;qno:Integer;left:Integer;top:Integer;width:Integer;height:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function AddFile(pno:Integer;jno:Integer;qno:Integer;mno:Integer;fileName:PChar;width:Integer;height:Integer;playstyle:Integer;QuitStyle:Integer;playspeed:Integer;delay:Integer;MidText:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function AddTimerArea(pno:Integer;jno:Integer;qno:Integer;left:Integer;top:Integer;width:Integer;height:Integer;fontColor:Integer;fontName:PChar;fontSize:Integer;fontBold:Integer;Italic:Integer;Underline:Integer;mode:Integer;DayShow:Integer;CulWeek:Integer;CulDay:Integer;CulHour:Integer;CulMin:Integer;CulSec:Integer;year:Integer;week:Integer;month:Integer;day:Integer;hour:Integer;minute:Integer;second:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function AddAClockArea(pno:Integer;jno:Integer;qno:Integer;left:Integer;top:Integer;width:Integer;height:Integer;bkMode:Integer;bkColor:Integer;bkFilePath:PChar;handHourColor:Integer;handMinColor:Integer;handSecColor:Integer;scaleColor:Integer;scaleSize:Integer;scaleIntStyle:Integer;scaleIntColor:Integer;scaleIntSize:Integer;uVisible:Integer;uText:PChar;uFontColor:Integer;uFontName:PChar;uFontSize:Integer;uFontBold:Integer;uDlt:Integer;dMode:Integer;dFontColor:Integer;dFontName:PChar;dFontSize:Integer;dFontBold:Integer;dDlt:Integer;spanMode:Integer;hour:Integer;minute:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function AddDClockArea(pno:Integer;jno:Integer;qno:Integer;left:Integer;top:Integer;width:Integer;height:Integer;fontColor:Integer;fontName:PChar;fontSize:Integer;fontBold:Integer;Italic:Integer;Underline:Integer;year:Integer;week:Integer;month:Integer;day:Integer;hour:Integer;minute:Integer;second:Integer;TwoOrFourYear:Integer;HourShow:Integer;format:Integer;spanMode:Integer;Advacehour:Integer;Advaceminute:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function SendControl(PNO,SendType:Integer;hwnd:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function SendScreenPara(pno:Integer;DBColor:Integer;width:Integer;height:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function SetTransMode(TransMode:Integer;ConType:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function SetNetworkPara(pno:Integer;ip:PChar):Integer;stdcall;external 'ListenPlayDll.dll';

function SetSerialPortPara(pno:Integer;port:Integer;rate:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function SetTest(pno:Integer;value:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function AdjustTime(PNO:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function SetPower(PNO:Integer;power:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function GetHardPara(PNO:Integer;FilePath:PChar):Integer;stdcall;external 'ListenPlayDll.dll';

function SetProgramTimer(pno:Integer;jno:Integer;TimingModel:Integer;WeekSelect:Integer;startSecond:Integer;startMinute:Integer;startHour:Integer;startDay:Integer;startMonth:Integer;startWeek:Integer;startYear:Integer;endSecond:Integer;endMinute:Integer;endHour:Integer;endDay:Integer;endMonth:Integer;endWeek:Integer;endYear:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function SearchController(filePath:PChar;IPAddress:PChar):Integer;stdcall;external 'ListenPlayDll.dll';

function CreateUtility(srcName:PChar):Integer;stdcall;external 'ListenPlayDll.dll';

function GetTotal():Integer;stdcall;external 'ListenPlayDll.dll';

//将第index帧的gif图像转换为bmp图，保存到dstName的文件中
function GIF2BMP(dstName:PChar;index:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

//删除gif转换工具实例
function DeleteUtility():Integer;stdcall;external 'ListenPlayDll.dll';

//设置硬件驱动
function SetHardPara(PNO:Integer;Sign:Integer;Mirror:Integer;ScanStyle:Integer;LineOrder:Integer;cls:Integer;RGChange:Integer;zhangKong:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

//定时开关
function SetPowerTimer(pno:Integer;bTimer:Integer;startHour1:Integer;startMinute1:Integer;endHour1:Integer;endMinute1:Integer;startHour2:Integer;startMinute2:Integer;endHour2:Integer;endMinute2:Integer;startHour3:Integer;startMinute3:Integer;endHour3:Integer;endMinute3:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

//亮度调节


//定时亮度调节
function SetBrightnessTimer(pno:Integer;bTimer:Integer;startHour1:Integer;startMinute1:Integer;endHour1:Integer;endMinute1:Integer;brightness1:Integer;startHour2:Integer;startMinute2:Integer;endHour2:Integer;endMinute2:Integer;brightness2:Integer;startHour3:Integer;startMinute3:Integer;endHour3:Integer;endMinute3:Integer;brightness3:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

//
function AddQuitText(pno:Integer;jno:Integer;qno:Integer;left:Integer;top:Integer;width:Integer;height:Integer;FontColor:Integer;fontName:PChar;fontSize:Integer;fontBold:Integer;Italic:Integer;Underline:Integer;text:PChar):Integer;stdcall;external 'ListenPlayDll.dll';

function AddModelClock(pno:Integer;jno:Integer;qno:Integer;left:Integer;top:Integer;width:Integer;height:Integer;BeforOrDelay:Integer;TimeHour:Integer;TimeMin:Integer;HourColor:Integer;MinColor:Integer;SecColor:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function SetRemoteNetwork(pno:Integer;macAddress:PChar;ip:PChar;gateway:PChar;subnetmask:PChar):Integer;stdcall;external 'ListenPlayDll.dll';

function SetTimingLimit(pno:Integer;FSecond:Integer;FMinute:Integer;FHour:Integer;FDay:Integer;FMonth:Integer;FWeek:Integer;FYear:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function CancelTimingLimit(pno:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function AddFlashArea(pno:Integer;jno:Integer;qno:Integer;left:Integer;top:Integer;width:Integer;height:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function AddFlashBmpFile(pno:Integer;jno:Integer;qno:Integer;mno:Integer;fileName:PChar;width:Integer;height:Integer;playspeed:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function ComSearchController(PNO:Integer;ComNo:Integer;BaudRate:Integer;filePath:PChar):Integer;stdcall;external 'ListenPlayDll.dll';

function SetLiuShuiKuan(pno:Integer;PlayStyle:Integer;PlaySpeed:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function AddTemperature(pno:Integer;jno:Integer;qno:Integer;left:Integer;top:Integer;width:Integer;height:Integer;fontColor:Integer;fontName:PChar;fontSize:Integer;fontBold:Integer;Italic:Integer;Underline:Integer;Temp_Mode:Integer;Temp_digit:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function AddNoise(pno:Integer;jno:Integer;qno:Integer;left:Integer;top:Integer;width:Integer;height:Integer;fontColor:Integer;fontName:PChar;fontSize:Integer;fontBold:Integer;Italic:Integer;Underline:Integer;Noise_digit:Integer;NAdjus:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function SetOrderPara(pno:Integer;diskName:PChar):Integer;stdcall;external 'ListenPlayDll.dll';

function AddHumidity(pno:Integer;jno:Integer;qno:Integer;left:Integer;top:Integer;width:Integer;height:Integer;fontColor:Integer;fontName:PChar;fontSize:Integer;fontBold:Integer;Italic:Integer;Underline:Integer;Humidity_digit:Integer;HumidityDiff:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function AutoGetComPara(ComNo:Integer;filePath:PChar):Integer;stdcall;external 'ListenPlayDll.dll';

function AddSingleLnTxt(pno:Integer;jno:Integer;qno:Integer;left:Integer;top:Integer;width:Integer;height:Integer;FontColor:Integer;FontName:PChar;FontSize:Integer;FontBold:Integer;Italic:Integer;UnderLine:Integer;text:PChar;PlayStyle:Integer;Playspeed:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function AddNeiMaTxtArea1(pno:Integer;jno:Integer;qno:Integer;left:Integer;top:Integer;width:Integer;height:Integer;showtext:PChar;ShowStyle:Integer;fontname:Integer;fontcolor:Integer;fontsize:Integer;PlayStyle:Integer;QuitStyle:Integer;Playspeed:Integer;times:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function AddModelClockShow(pno:Integer;jno:Integer;qno:Integer;left:Integer;top:Integer;Width:Integer;Height:Integer;Hour_styleNo:Integer;Hour_SQUARESIZE:Integer;Hour_clrColor:Integer;Min_SQUARESIZE:Integer;Min_clrColor:Integer;HHour_clrColor:Integer;MMin_clrColor:Integer;SSec_clrColor:Integer;Dist_DrawYN:Integer;Dist_DistrictName:PChar;Dist_FName:PChar;Dist_FColor:Integer;Dist_FSize:Integer;Dist_FStyle:Integer;Dist_Offset:Integer;DownDistShow:Integer;Down_FName:PChar;Down_FColor:Integer;Down_FSize:Integer;Down_FBoldYN:Integer;Down_Offset:Integer;TimeDelay:Integer;DelayHour:Integer;DelayMin:Integer;bkMode:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function AddVoiceArea(pno:Integer;jno:Integer;qno:Integer;Voice_Style:Integer;Voice_Type:Integer;Voice_Speed:Integer;Voice_Tone:Integer;Voice_Volume:Integer;Play_Times:Integer;Display_string:PChar):Integer;stdcall;external 'ListenPlayDll.dll';

function AddFileString(pno:Integer;jno:Integer;qno:Integer;mno:Integer;str:PChar;fontname:PChar;fontsize:Integer;fontcolor:Integer;bold:Integer;italic:Integer;underline:Integer;align:Integer;width:Integer;height:Integer;playstyle:Integer;QuitStyle:Integer;playspeed:Integer;delay:Integer;MidText:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function AddLnTxtString(pno:Integer;jno:Integer;qno:Integer;left:Integer;top:Integer;width:Integer;height:Integer;str:PChar;fontname:PChar;fontsize:Integer;fontcolor:Integer;bold:Integer;italic:Integer;underline:Integer;PlayStyle:Integer;Playspeed:Integer;times:Integer):Integer;stdcall;external 'ListenPlayDll.dll';

function GenerateFile(PNO:Integer;path:PChar):Integer;stdcall;external 'ListenPlayDll.dll';


function AddGood(pno:Integer;jno:Integer;qno:Integer;left:Integer;top:Integer;width:Integer;height:Integer;fontColor:Integer;fontName:PChar;fontSize:Integer;fontBold:Integer;Italic:Integer;Underline:Integer;mode:Integer;DayShow:Integer;CulWeek:Integer;CulDay:Integer;CulHour:Integer;CulMin:Integer;CulSec:Integer;year:Integer;week:Integer;month:Integer;day:Integer;hour:Integer;minute:Integer;second:Integer):Integer;stdcall;external 'ListenPlayDll.dll';




implementation

end.
