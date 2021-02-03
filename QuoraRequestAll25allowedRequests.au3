;it works

Opt("WinTitleMatchMode", 2)
WinActivate("Quora - Mozilla Firefox")

Local $counter = 0

For $i = 25 To 1 Step -1
	Sleep(500)
	Local $cord[2]
	$cord = PixelSearch(949, 236, 997, 611, 0x2E69FF)
	MouseClick("left", $cord[0] + 6, $cord[1] + 6)
	$counter += 1
	If $counter == 5 Then
		Sleep(500)
		MouseWheel("down", 4)
		$counter = 0
	EndIf
Next

