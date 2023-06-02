;all the below credentials were never valid, this is just an example, example which worked and done the job
;automating relogging 

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
SetTitleMatchMode, 2 ;2 = A window's title can contain WinTitle anywhere inside it to be a match.
SetKeyDelay, 200 ;if it stops working, just increase it

ScriptStart   := 2240	;	shift start time
ScriptEnd     := 800	;	shift end time

ArrayF11grid := {A1:"G",	B1:"5",	C1:"I",	D1:"P",	E1:"0",	F1:"E",	G1:"1",	H1:"8",	I1:"C",	J1:"4",	K1:"Q",	L1:"A",A2:"L",	B2:"P",	C2:"5",	D2:"9",	E2:"D",	F2:"1",	G2:"L",	H2:"4",	I2:"X",	J2:"Z",	K2:"C",	L2:"I",A3:"I",	B3:"3",	C3:"1",	D3:"2",	E3:"U",	F3:"X",	G3:"1",	H3:"A",	I3:"G",	J3:"D",	K3:"8",	L3:"X",A4:"1",	B4:"3",	C4:"U",	D4:"2",	E4:"6",	F4:"5",	G4:"1",	H4:"P",	I4:"Z",	J4:"Q",	K4:"D",	L4:"5",A5:"0",	B5:"U",	C5:"1",	D5:"J",	E5:"I",	F5:"X",	G5:"1",	H5:"Z",	I5:"S",	J5:"I",	K5:"J",	L5:"1",A6:"P",	B6:"6",	C6:"Q",	D6:"X",	E6:"D",	F6:"E",	G6:"2",	H6:"X",	I6:"3",	J6:"R",	K6:"A",	L6:"6",A7:"J",	B7:"4",	C7:"X",	D7:"2",	E7:"G",	F7:"U",	G7:"4",	H7:"G",	I7:"0",	J7:"Z",	K7:"S",	L7:"J"}

ArrayF12grid := {A1:"X",	B1:"7",	C1:"E",	D1:"Q",	E1:"U",	F1:"8",	G1:"X",	H1:"G",	I1:"2",	J1:"0",	K1:"1",	L1:"R",A2:"U",	B2:"G",	C2:"R",	D2:"5",	E2:"E",	F2:"E",	G2:"U",	H2:"I",	I2:"S",	J2:"4",	K2:"0",	L2:"J",A3:"R",	B3:"I",	C3:"P",	D3:"7",	E3:"5",	F3:"K",	G3:"6",	H3:"Z",	I3:"W",	J3:"3",	K3:"C",	L3:"Q",A4:"9",	B4:"3",	C4:"J",	D4:"C",	E4:"8",	F4:"3",	G4:"8",	H4:"X",	I4:"C",	J4:"1",	K4:"G",	L4:"R",A5:"Q",	B5:"3",	C5:"D",	D5:"6",	E5:"U",	F5:"9",	G5:"R",	H5:"W",	I5:"U",	J5:"A",	K5:"3",	L5:"2",A6:"6",	B6:"A",	C6:"D",	D6:"6",	E6:"A",	F6:"G",	G6:"G",	H6:"1",	I6:"4",	J6:"P",	K6:"9",	L6:"K",A7:"X",	B7:"5",	C7:"S",	D7:"0",	E7:"7",	F7:"0",	G7:"2",	H7:"L",	I7:"Q",	J7:"S",	K7:"5",	L7:"Q"}

noqX( txt, noq=13 ){
	StartLetter := "A", Replacement := "$U1$U2$L1$L2$U2$U1$L2$L1", Offset := noq*4
		
	Loop, % noq*2
		src .= chr(asc( StartLetter )-1+A_index)
	src := RegExReplace( src, "(.{" noq "})(.{" noq "})", Replacement )
	
	Loop, Parse, txt
		o .= RegExMatch( src, "\Q" A_LoopField "\E" ) 
				? SubStr( src, RegExMatch( src,"\Q" A_LoopField "\E" )+Offset, 1 ) : A_LoopField
	return o
}

#F11::
	FormatTime, CurrentTime, , Hmm
	If (WinActive("Marriott Extranet Login") AND (CurrentTime >= ScriptStart OR CurrentTime <= ScriptEnd)) {
		Send, {Tab}
		Send, % noqX("xemhp001")
		Send, {Tab}
		Send, % noqX("z/h/f/20")
		Send, {Enter}
		return
		}
	else if (WinActive("Entrust IdentityGuard Authentication") AND (CurrentTime >= ScriptStart OR CurrentTime <= ScriptEnd)) {
		Send, ^c	;	to copy
		Sleep, 500 	;	.5 second in case the computer is slow
		clipboard := clipboard	;	Convert any copied files, HTML, or other formatted text to plain text.
		tempClipboard := clipboard
		
		pos := 0
		loop, {
		  pos := regexmatch(tempClipboard, "(?<=\[).+?(?=\])", found, pos + 1)
		  if (pos) {
			found0 := a_index
			found%a_index% := found
		  } else
			break
		}		
				
		Send, {Tab}
		Send, % noqX(ArrayF11grid[found1])
		Send, {Tab}
		Send, % noqX(ArrayF11grid[found2])
		Send, {Tab}
		Send, % noqX(ArrayF11grid[found3])
		Send, {Enter}
		return 
		}
return