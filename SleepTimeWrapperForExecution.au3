Func SleepTimeWrapperForExecution($function, $arg = Default, $arg2 = Default, $arg3 = Default, $arg4 = Default, $arg5 = Default)

	If $arg5 <> Default Then
		Sleep($LOADING_TIME_SLOW_PC_RELATED)
		Call($function, $arg, $arg2, $arg3, $arg4, $arg5)			;Send("{DOWN}")
		Sleep($LOADING_TIME_SLOW_PC_RELATED)
		Return
	EndIf

	If $arg4 <> Default Then
		Sleep($LOADING_TIME_SLOW_PC_RELATED)
		Call($function, $arg, $arg2, $arg3, $arg4)			;Send("{DOWN}")
		Sleep($LOADING_TIME_SLOW_PC_RELATED)
		Return
	EndIf

	If $arg3 <> Default Then
		Sleep($LOADING_TIME_SLOW_PC_RELATED)
		Call($function, $arg, $arg2, $arg3)			;Send("{DOWN}")
		Sleep($LOADING_TIME_SLOW_PC_RELATED)
		Return
	EndIf

	If $arg2 <> Default Then
		Sleep($LOADING_TIME_SLOW_PC_RELATED)
		Call($function, $arg, $arg2)			;Send("{DOWN}")
		Sleep($LOADING_TIME_SLOW_PC_RELATED)
		Return
	EndIf

	If $arg <> Default Then
		Sleep($LOADING_TIME_SLOW_PC_RELATED)
		Call($function, $arg)			;Send("{DOWN}")
		MsgBox(0,"","")
		Sleep($LOADING_TIME_SLOW_PC_RELATED)
		Return
	EndIf

EndFunc

SleepTimeWrapperForExecution("MouseMove", "50", "100", "3")
