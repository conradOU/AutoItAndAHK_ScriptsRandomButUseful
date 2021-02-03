#include <MsgBoxConstants.au3>

Local $sAnswer = InputBox("Security Check", "Enter your password.", "hahaha12", "*", _
             - 1, -1, 0, 0)

If $sAnswer == "hahaha123" Then _
   Run('"' & @AutoItExe & '" /AutoIt3ExecuteScript "' & "C:\Users\User\Documents\Fax\Inbox\DontDeleteIwillKnowItWasYou\AutoIt3\SwitchHideFiles.au3" & '"')