Opt("WinTitleMatchMode", 2)
WinActivate("Watch later - YouTube - Mozilla Firefox")

Local $sleeptime = 400

For $i = 25 To 1 Step -1
	Sleep($sleeptime)
    MouseClick("left", 1300, 219)
    Sleep($sleeptime)
    MouseClick("left", 1167, 366)
Next