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
SetKeyDelay, 100 ;testing

:*:\mar:: ;a/r number 43915
Sleep, 1000
sendinput {Alt down}t{Alt up}
Sleep, 1000
sendinput {Alt down}i{Alt up} 
Sleep, 1000
sendinput {Alt down}w{Alt up} 
Sleep, 1000
sendinput {Tab 10}mar
return

:*:\exp::
sendinput {Alt down}t{Alt up}
Sleep, 1000
sendinput {Alt down}i{Alt up} 
Sleep, 1000
sendinput {Alt down}w{Alt up} 
Sleep, 1000
sendinput {Tab 10}exp{Tab 19} 
Sleep, 1000
sendinput 98806
Sleep, 1000
sendinput {Alt down}h{Alt up} 
Sleep, 1000
sendinput {Alt down}o{Alt up} 
Sleep, 1000
sendinput {Alt down}y{Alt up}        
Sleep, 1000
sendinput {Alt down}o{Alt up} 
Sleep, 1000
sendinput {Alt down}c{Alt up} 
Sleep, 1000
sendinput {Alt down}c{Alt up} 
return

:*:\hol::
sendinput {Alt down}t{Alt up}
Sleep, 1000
sendinput {Alt down}i{Alt up} 
Sleep, 1000
sendinput {Alt down}w{Alt up} 
Sleep, 1000
sendinput {Tab 10}hol{Tab 7} 
Sleep, 1000
sendinput {Space}
Sleep, 1000
sendinput {Alt down}h{Alt up}
Sleep, 1000
sendinput {Alt down}o{Alt up}
Sleep, 1000
sendinput {Enter}
Sleep, 1000
sendinput {Tab 3}
Sleep, 1000
sendinput {Down 4}
Sleep, 1000
sendinput {Alt down}o{Alt up}
Sleep, 1000
sendinput {Enter}
Sleep, 1000
sendinput {Alt down}o{Alt up}
Sleep, 1000
sendinput {Alt down}c{Alt up}
Sleep, 1000
sendinput {Alt down}c{Alt up}
Sleep, 1000
return