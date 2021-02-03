;~ used to speed up filling of custumers addresses when drop-shipping on eBay.
;if window name = "eBay: Order details - Mozilla Firefox" then after pressing f4 just copy the address and close that tab

#include <Misc.au3>
#include <Array.au3>

Global Const $LOADING_TIME_SLOW_PC_RELATED = 900
Opt("SendKeyDelay", 60)

HotKeySet("{F3}", "_Continue") ;after copying raw address to clipboard, to paste the processed form of it just press F4

$regexPattern = '([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})' ; old one, commented out on 16/Sep/20
;$regexPattern = '([Gg][Ii][Rr] 0[Aa]{2})|(^(?!ebay*$)(([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})'

While True
	Sleep(100)
WEnd

Func _Continue()

	If WinGetTitle("[active]") == "Checkout | eBay - Mozilla Firefox" Then
		Send("{LWINDOWN}{SPACE}{LWINUP}") ;to toggle off the AutoCorrect script, as it was "correcting" the addresses
		Sleep(100)
		$sData = ClipGet()

		;if it begins with CRLF - strip that. - ToDo

		;If it has "United Kingdom" line - stip that as well together with the last CRLF.
		$sData = StringReplace($sData, @CRLF&"United Kingdom", "", 1)

		$result = StringReplace($sData, " ", "{TAB}", 1) ;tab character to first space character to fill the surname field
		If Not @error Then
			;convert
			$result = StringReplace($result, @CRLF, "{TAB}", 1)

			$has2ndLineOfAddress = StringInStr($result, @CRLF, 0, 2) ;if True, then yes

			If $has2ndLineOfAddress == 0 Then
				$result = StringReplace($result, @CRLF, "{TAB}{TAB}", 1)
				If @error Then
				EndIf
				Else
				$result = StringReplace($result, @CRLF, "{TAB}", 1)
				If @error Then

				EndIf
			EndIf

			$aArray = StringRegExp($result, $regexPattern, 3)
			If @error Then
			EndIf
		;array row 7 if a final match exists

			If ubound($aArray) >= 7 Then
				$result = StringReplace($result, $aArray[7], "{TAB}{TAB}" & $aArray[7], 1)
				If @error Then
				EndIf
				Else
				$result = StringReplace($result, $aArray[1], "{TAB}{TAB}" & $aArray[1], 1)
				If @error Then
				EndIf
			EndIf

			;_ArrayDisplay($result, "2D $result")

			Send($result)
			Send("{LWINDOWN}{SPACE}{LWINUP}") ;to toggle on the AutoCorrect script, as it was "correcting" the addresses
			Sleep(100)
			Send("{ENTER}") ;to accept the address
			Sleep(100)
		EndIf

	ElseIf WinGetTitle("[active]") == "eBay: Order details – Mozilla Firefox" Then
		;copy it by two clicks while holding shift key to get the address
		MouseClick("left", 910, 267, 1, 1)
		Send("{SHIFTDOWN}")
		Sleep($LOADING_TIME_SLOW_PC_RELATED)
		MouseClick("left", 1258, 368, 1, 1)
		Send("{SHIFTUP}")
		Sleep($LOADING_TIME_SLOW_PC_RELATED) ;it was too fast and clipboard wasn't always changing immediately
		Send("^c") ;to copy
		Sleep($LOADING_TIME_SLOW_PC_RELATED) ;it was too fast and clipboard wasn't always changing immediately

		Send("{CTRLDOWN}w{CTRLUP}") ;closes the tab
		Sleep($LOADING_TIME_SLOW_PC_RELATED)
		Send("{CTRLDOWN}{PGDN}{CTRLUP}")
	EndIf


EndFunc   ;==>_Continue
