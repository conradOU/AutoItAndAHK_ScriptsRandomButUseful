#NoTrayIcon ;to make no try icon
#SingleInstance,Force ;to make sure no more than one instances of the script are running
SetWinDelay,0 
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0 ;no key history
ListLines Off
AutoTrim,Off
#Persistent

ScriptStart   := 2240
ScriptEnd     := 800

SetTimer, CheckIdle, 60000    ; 60 sec / 1 min
Return

CheckIdle:
	FormatTime, CurrentTime, , Hmm
	If ( (CurrentTime >= ScriptStart OR CurrentTime <= ScriptEnd ) AND A_TimeIdle > 60000 ) ;A_TimeIdle - The number of milliseconds that have elapsed since the system last received keyboard, mouse, or other input. This is useful for determining whether the user is away.
		{
			Send {RShift} ;right shift as it does nothing in most apps, but it will prevent PC from sleeping, anyway it will only be sent when the PC has had been inactive for a minute
		}
	Return
