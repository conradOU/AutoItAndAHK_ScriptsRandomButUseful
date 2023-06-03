#NoTrayIcon ;to make no try icon
#SingleInstance,Force ;to make sure no more than one instances of the script are running
#Persistent
filename := "L:\FrontOffice\Nights\ChecklistNights.docx"

handle := DllCall("CreateFile"
      , "Str", filename      ; lpFileName
      , "UInt", 0x80000000      ; dwDesiredAccess (GENERIC_READ)
      , "UInt", 0x00000001      ; dwShareMode (no share)
      , "UInt", 0      ; lpSecurityAttributes
      , "UInt", 3      ; dwCreationDisposition (OPEN_EXISTING)
      , "UInt", 0      ; dwFlagsAndAttributes
      , "UInt", 0)   ; hTemplateFile
If (handle = -1 or handle = 0 or ErrorLevel != 0)
{
   MsgBox 16, Test, Couldn't open the file %filename%
   ExitApp
}

OnExit, QuitScript
Return

QuitScript:
result := DllCall("CloseHandle"
      , "UInt", handle)
ExitApp
Return