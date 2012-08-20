unit cpower;

interface
uses
  Windows ;

//c-power5200接口函数

//Playbill
function CP5200_Playbill_Create	(width:Integer;  height:Integer; BYTE:Byte):PLongint;stdcall ;
function CP5200_Playbill_Destroy	(hObj : PLongint):Integer; stdcall;
function CP5200_Playbill_AddFile	(hObj : PLongint; pFilename:AnsiString):Integer; stdcall;
function CP5200_Playbill_SaveToFile (hObj : PLongint; pFilename:AnsiString):Integer; stdcall;

//Program
function CP5200_Program_Create	(width:Integer;  height:Integer; BYTE:Byte):PLongint ; stdcall ;
function CP5200_Program_Destroy	(hObj : PLongint):Integer; stdcall;
function CP5200_Program_SetProperty(hObj : PLongint; nPropertyValue:Integer; nPropertyID:Integer):Integer; stdcall;
function CP5200_Program_AddPlayWindow(hObj : PLongint; x:Integer; y:Integer; cx:Integer; cy:Integer):Integer; stdcall;
function CP5200_Program_SetWindowProperty(hObj : PLongint; nWinNo:Integer; nPropertyValue:Integer; nPropertyID:Integer):Integer; stdcall;
function CP5200_Program_AddText(hObj : PLongint; nWinNo:Integer; pText:PChar; nFontSize:Integer; crColor:DWORD; nEffect:Integer;nSpeed:Integer; nStay:Integer):Integer; stdcall;
function CP5200_Program_AddPicture(hObj : PLongint; nWinNo:Integer; pPictFile:PChar; nMode:Integer; nEffect:Integer; nSpeed:Integer; nStay:Integer;nCompress:Integer):Integer; stdcall;
function CP5200_Program_SaveToFile(hObj : PLongint; pFilename:AnsiString):Integer; stdcall;


//RS232/485
function CP5200_RS232_InitEx(fName:AnsiString; nBaund:Integer; nTimeout:Integer):Integer; stdcall;
function CP5200_RS232_Open():Integer; stdcall;
function CP5200_RS232_Close():Integer; stdcall;
function CP5200_RS232_WriteEx(pBuf:PByte; nLength:Integer):Integer; stdcall;
function CP5200_RS232_ReadEx(pBuf:PByte; nBufSize:Integer):Integer; stdcall;
function CP5200_RS232_PlaySelectedPrg(nCardID:Integer; pSelected:PWord; nSelCnt:Integer; nOption:Integer):Integer; stdcall;
function CP5200_RS232_SendText(nCardID:Integer;nWndNo:Integer;pText:PChar;crColor:DWORD;nFontSize:Integer;nSpeed:Integer;nEffect:Integer;nStayTime:Integer;nAlignment:Integer):Integer; stdcall;
function CP5200_RS232_SendPicture(nCardID:Integer;nWndNo:Integer;nPosX:Integer;nPosY:Integer;nCx:Integer;nCy:Integer;pPictureFile:PChar;nSpeed:Integer;nEffect:Integer;nStayTime:Integer;nPictRef:Integer):Integer; stdcall;
function CP5200_RS232_SendStatic(nCardID:Integer;nWndNo:Integer;pText:PChar;crColor:DWORD;nFontSize:Integer;nAlignment:Integer;x:Integer;y:Integer;cx:Integer;cy:Integer):Integer; stdcall;
function CP5200_RS232_SendClock(nCardID:Integer;nWinNo:Integer;nStayTime:Integer;nCalendar:Integer;nFormat:Integer;nContent:Integer;nFont:Integer;nRed:Integer;nGreen:Integer;nBlue:Integer;pTxt:PCHAR ):Integer; stdcall;
function CP5200_RS232_SetTime(nCardID:Integer;pInfo:pByte):Integer; stdcall;
function CP5200_RS232_SplitScreen(nCardID:Integer; nScrWidth:Integer; ScrHeight:Integer;nWndCnt:Integer;pWndRects:pInteger):Integer; stdcall;
function CP5200_RS232_UploadFile( nCardID:Integer; pSourceFilename:AnsiString; pTargetFilename:AnsiString):Integer; stdcall;
function CP5200_RS232_RestartApp( nCardID : Byte ):Integer; stdcall;

//Network
function CP5200_Net_Init(dwIP:DWORD; nIPPort:Integer;dwIDCode:Integer; nTimeout:Integer):Integer; stdcall;
function CP5200_Net_Connect():Integer; stdcall;
function CP5200_Net_Disconnect():Integer; stdcall;
function CP5200_Net_Write(pBuf:PByte; nLength:Integer):Integer; stdcall;
function CP5200_Net_Read(pBuf:PByte; nBufSize:Integer):Integer; stdcall;

function CP5200_Net_PlaySelectedPrg(nCardID:Integer; pSelected:PWord; nSelCnt:Integer; nOption:Integer):Integer; stdcall;
function CP5200_Net_SendText(nCardID:Integer;nWndNo:Integer;pText:PChar;crColor:DWORD;nFontSize:Integer;nSpeed:Integer;nEffect:Integer;nStayTime:Integer;nAlignment:Integer):Integer; stdcall;
function CP5200_Net_SendPicture(nCardID:Integer;nWndNo:Integer;nPosX:Integer;nPosY:Integer;nCx:Integer;nCy:Integer;pPictureFile:PChar;nSpeed:Integer;nEffect:Integer;nStayTime:Integer;nPictRef:Integer):Integer; stdcall;
function CP5200_Net_SendStatic(nCardID:Integer;nWndNo:Integer;pText:PChar;crColor:DWORD;nFontSize:Integer;nAlignment:Integer;x:Integer;y:Integer;cx:Integer;cy:Integer):Integer; stdcall;
function CP5200_Net_SendClock(nCardID:Integer;nWinNo:Integer;nStayTime:Integer;nCalendar:Integer;nFormat:Integer;nContent:Integer;nFont:Integer;nRed:Integer;nGreen:Integer;nBlue:Integer;pTxt:PCHAR ):Integer; stdcall;
function CP5200_Net_SetTime(nCardID:Integer;pInfo:pByte):Integer; stdcall;
function CP5200_Net_SplitScreen(nCardID:Integer; nScrWidth:Integer; ScrHeight:Integer;nWndCnt:Integer;pWndRects:pInteger):Integer; stdcall;
function CP5200_Net_UploadFile( nCardID:Integer; pSourceFilename:AnsiString; pTargetFilename:AnsiString):Integer; stdcall;
function CP5200_Net_RestartApp( nCardID : Byte ):Integer; stdcall;

implementation

//c-power5200接口函数
function CP5200_Playbill_Create; external 'cp5200.dll' name 'CP5200_Playbill_Create';
function CP5200_Playbill_Destroy; external 'cp5200.dll' name 'CP5200_Playbill_Destroy';
function CP5200_Playbill_AddFile; external 'cp5200.dll' name 'CP5200_Playbill_AddFile';
function CP5200_Playbill_SaveToFile; external 'cp5200.dll' name 'CP5200_Playbill_SaveToFile';

//Program
function CP5200_Program_Create; external 'cp5200.dll' name 'CP5200_Program_Create';
function CP5200_Program_Destroy; external 'cp5200.dll' name 'CP5200_Program_Destroy';
function CP5200_Program_SetProperty; external 'cp5200.dll' name 'CP5200_Program_SetProperty';
function CP5200_Program_AddPlayWindow; external 'cp5200.dll' name 'CP5200_Program_AddPlayWindow';
function CP5200_Program_SetWindowProperty; external 'cp5200.dll' name 'CP5200_Program_SetWindowProperty';
function CP5200_Program_AddText; external 'cp5200.dll' name 'CP5200_Program_AddText';
function CP5200_Program_AddPicture; external 'cp5200.dll' name 'CP5200_Program_AddPicture';
function CP5200_Program_SaveToFile; external 'cp5200.dll' name 'CP5200_Program_SaveToFile';


//RS232/485
function CP5200_RS232_InitEx; external 'cp5200.dll' name 'CP5200_RS232_InitEx';
function CP5200_RS232_Open; external 'cp5200.dll' name 'CP5200_RS232_Open';
function CP5200_RS232_Close; external 'cp5200.dll' name 'CP5200_RS232_Close';
function CP5200_RS232_WriteEx; external 'cp5200.dll' name 'CP5200_RS232_WriteEx';
function CP5200_RS232_ReadEx; external 'cp5200.dll' name 'CP5200_RS232_ReadEx';
function CP5200_RS232_PlaySelectedPrg; external 'cp5200.dll' name 'CP5200_RS232_PlaySelectedPrg';
function CP5200_RS232_SendText; external 'cp5200.dll' name 'CP5200_RS232_SendText';
function CP5200_RS232_SendPicture; external 'cp5200.dll' name 'CP5200_RS232_SendPicture';
function CP5200_RS232_SendStatic; external 'cp5200.dll' name 'CP5200_RS232_SendStatic';
function CP5200_RS232_SendClock; external 'cp5200.dll' name 'CP5200_RS232_SendClock';
function CP5200_RS232_SetTime; external 'cp5200.dll' name 'CP5200_RS232_SetTime';
function CP5200_RS232_SplitScreen; external 'cp5200.dll' name 'CP5200_RS232_SplitScreen';
function CP5200_RS232_UploadFile; external 'cp5200.dll' name 'CP5200_RS232_UploadFile';
function CP5200_RS232_RestartApp; external 'cp5200.dll' name 'CP5200_RS232_RestartApp';

//Network
function CP5200_Net_Init; external 'cp5200.dll' name 'CP5200_Net_Init';
function CP5200_Net_Connect; external 'cp5200.dll' name 'CP5200_Net_Connect';
function CP5200_Net_Disconnect; external 'cp5200.dll' name 'CP5200_Net_Disconnect';
function CP5200_Net_Write; external 'cp5200.dll' name 'CP5200_Net_Write';
function CP5200_Net_Read; external 'cp5200.dll' name 'CP5200_Net_Read';
function CP5200_Net_PlaySelectedPrg; external 'cp5200.dll' name 'CP5200_Net_PlaySelectedPrg';
function CP5200_Net_SendText; external 'cp5200.dll' name 'CP5200_Net_SendText';
function CP5200_Net_SendPicture; external 'cp5200.dll' name 'CP5200_Net_SendPicture';
function CP5200_Net_SendStatic; external 'cp5200.dll' name 'CP5200_Net_SendStatic';
function CP5200_Net_SendClock; external 'cp5200.dll' name 'CP5200_Net_SendClock';
function CP5200_Net_SetTime; external 'cp5200.dll' name 'CP5200_Net_SetTime';
function CP5200_Net_SplitScreen; external 'cp5200.dll' name 'CP5200_Net_SplitScreen';
function CP5200_Net_UploadFile; external 'cp5200.dll' name 'CP5200_Net_UploadFile';
function CP5200_Net_RestartApp; external 'cp5200.dll' name 'CP5200_Net_RestartApp';
end.
