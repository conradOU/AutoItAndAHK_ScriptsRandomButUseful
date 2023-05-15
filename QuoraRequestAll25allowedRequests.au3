;it works
;set the window with firefox on full screen, and the file explorer to the left with WIN+<-

For $i = 25 To 1 Step -1
	If $i < 25 Then Sleep(1000) ;500 was too small, changed to 800
	;Local $cord[2]
	Local $cord[2] = PixelSearch(998, 285, 1000, 627, 0x2E69FF, 0, 2)

	If @error Then ;throws error when coordinate not found. Means that it should scroll down
		Sleep(1000) ;it has to be here
		MouseWheel("down", 4)
		Sleep(500)
		$cord = PixelSearch(998, 285, 1000, 627, 0x2E69FF, 0, 2)
		If @error Then Exit ;when there is error here, there were less than 25 suggestions to request, and therefore exit without an error message
	EndIf

	MouseClick("left", $cord[0], $cord[1]) ;$cord[0] + 6, $cord[1] + 6) before change
Next