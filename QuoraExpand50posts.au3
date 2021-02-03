; it works. It highlights and clicks on all "(more)" on Quora, so that the msgs expand and can then be converted to audio in balabolka

Opt("WinTitleMatchMode", 2)
WinActivate("Quora - Mozilla Firefox")

For $i = 50 To 1 Step -1
	Sleep(500)
	Send("{CTRLDOWN}g{CTRLUP}")
	Sleep(500)
	Send("{ENTER}")
;	Sleep(500)
;	Local $cord[2]
;	$cord = PixelSearch(12, 59, 841, 721, 0x38D878)
;	MouseClick("left", $cord[0]+3, $cord[1]+3)
Next
