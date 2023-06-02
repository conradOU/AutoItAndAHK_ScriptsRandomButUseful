;TicTocTitle.ahk
;Show time and date on the title bar

#SingleInstance,Force
SetWinDelay,0
#NoEnv 
SendMode Input 
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off

AutoTrim,Off
StringCaseSense,On
StringTrimRight,applicationname,A_ScriptName,4

Gosub,READINI
Gosub,START
Gosub,LOOP

START:
string=%titlestring%
Gosub,EXPAND
Gui,1:Destroy
Gui,1:+Owner +AlwaysOnTop -Resize -SysMenu -MinimizeBox -MaximizeBox Disabled -SysMenu -Caption -Border -ToolWindow
Gui,1:Font,C%color% S%size% W%boldness%,%font%
Gui,1:Margin , 0, -2
Gui,1:Add,Text,Vtext,%timestring%, ym, xm
Gui,1:Show,,%applicationname% - Title  ; NoActivate avoids deactivating the currently active window.
Gui,1:+LastFound
winid:=WinExist("A")
Gui,1:+E0x20
WinSet, Transparent, 100, ahk_id %winid%
WinMove,ahk_id %winid%,,A_ScreenWidth-107,0
Return

LOOP:
Sleep, 1000
string=%titlestring%
Gosub,EXPAND
GuiControl,,text,%timestring%
Goto,LOOP

EXPAND:
StringGetPos,pos,string,"
If pos=0
  timepos=3
else
  timepos=1
StringSplit,timearray,string,"
LOOP1:
  FormatTime,week,,YWeek
  StringRight,week,week,2
  week+=0
  FormatTime,day,,YDay
  FormatTime,longday,,dddd
  StringLower,dllower,longday
  StringLower,dltitle,longday,T
  StringUpper,dlupper,longday  
  FormatTime,shortday,,ddd
  StringLower,dslower,shortday
  StringLower,dstitle,shortday,T
  StringUpper,dsupper,shortday 
  FormatTime,longmonth,,MMMM
  StringLower,mllower,longmonth
  StringLower,mltitle,longmonth,T
  StringUpper,mlupper,longmonth  
  FormatTime,shortmonth,,MMM
  StringLower,mslower,shortmonth
  StringLower,mstitle,shortmonth,T
  StringUpper,msupper,shortmonth 
  time=timearray%timepos%
  time:=%time%
  If time=
    Goto,NEXT1

  StringReplace,time,time,caps,^~~~~,All
  StringReplace,time,time,num,^~~~,All
  StringReplace,time,time,scroll,^~~,All
  StringReplace,time,time,insert,^~,All

  StringReplace,time,time,week,@@@@,All
  StringReplace,time,time,day,@@@,All
  StringReplace,time,time,dddd,!!!!,All
  StringReplace,time,time,Dddd,$!!!,All
  StringReplace,time,time,DDDD,$$$$,All
  StringReplace,time,time,ddd,!!!,All
  StringReplace,time,time,Ddd,$!!,All
  StringReplace,time,time,Ddd,$$$,All
  StringReplace,time,time,mmmm,££££,All
  StringReplace,time,time,Mmmm,§£££,All
  StringReplace,time,time,MMMM,§§§§,All
  StringReplace,time,time,mmm,£££,All
  StringReplace,time,time,Mmm,§££,All
  StringReplace,time,time,MMM,§§§,All

  FormatTime,time,,%time%

  GetKeyState,state,CapsLock,T
  value=c
  If state=D
    value=C
  StringReplace,time,time,^~~~~,%value%,All
  GetKeyState,state,NumLock,T
  value=n
  If state=D
    value=N
  StringReplace,time,time,^~~~,%value%,All
  GetKeyState,state,ScrollLock,T
  value=s
  If state=D
    value=S
  StringReplace,time,time,^~~,%value%,All
  GetKeyState,state,Insert,T
  value=i
  If state=D
    value=I
  StringReplace,time,time,^~,%value%,All

  StringReplace,time,time,@@@@,%week%,All
  StringReplace,time,time,@@@,%day%,All
  StringReplace,time,time,!!!!,%dllower%,All
  StringReplace,time,time,$!!!,%dltitle%,All
  StringReplace,time,time,$$$$,%dlupper%,All
  StringReplace,time,time,!!!,%dslower%,All
  StringReplace,time,time,$!!,%dstitle%,All
  StringReplace,time,time,$$$,%dsupper%,All
  StringReplace,time,time,££££,%mllower%,All
  StringReplace,time,time,§£££,%mltitle%,All
  StringReplace,time,time,§§§§,%mlupper%,All
  StringReplace,time,time,£££,%mslower%,All
  StringReplace,time,time,§££,%mstitle%,All
  StringReplace,time,time,§§§,%msupper%,All

  timearray%timepos%=%time%
NEXT1:
  timepos+=2 
If timepos<=%timearray0%
  Goto,LOOP1

timestring=
timepos=1 
LOOP2:
  time=timearray%timepos%
  time:=%time% 
  timestring=%timestring%%time%
  timepos+=1 
If timepos<=%timearray0%
  Goto,LOOP2
Return

READINI:
IfNotExist,%applicationname%.ini 
{
  ini=[Settings]
  ini=%ini%`ntitlestring=H:mm:ss - dddd d.MM.yyy - "d"day "w"week - capsnumscrollinsert
  ini=%ini%`ncopystring=yyy.MM.d H:mm:ss
  ini=%ini%`nfont=MS sans serif
  ini=%ini%`nsize=9
  ini=%ini%`nboldness=700
  ini=%ini%`n`;1-1000 400=normal 700=bold
  ini=%ini%`ncolor=FFFFFF
  ini=%ini%`nxoffset=-50
  ini=%ini%`nyoffset=0`n

  
  ini=%ini%`n`;%applicationname%.ini
  ini=%ini%`n`;
  ini=%ini%`n`;Date Formats (case sensitive)
  ini=%ini%`n`;
  ini=%ini%`n`;d    Day of the month without leading zero (1 - 31)
  ini=%ini%`n`;dd   Day of the month with leading zero (01 – 31)
  ini=%ini%`n`;ddd  Lowercase abbreviated name for the day of the week (e.g. mon)
  ini=%ini%`n`;Ddd  Like ddd`, but Titlecase
  ini=%ini%`n`;DDD  Like ddd`, but UPPERCASE
  ini=%ini%`n`;dddd Lowercase full name for the day of the week (e.g. monday)
  ini=%ini%`n`;Dddd Like ddd`, but Titlecase
  ini=%ini%`n`;DDDD Like ddd`, but UPPERCASE
  ini=%ini%`n`;M    Month without leading zero (1 – 12)
  ini=%ini%`n`;MM   Month with leading zero (01 – 12)
  ini=%ini%`n`;mmm  Lowercase abbreviated month name (e.g. jan)
  ini=%ini%`n`;Mmm  Like mmm`, but Titlecase
  ini=%ini%`n`;MMM  Like mmm`, but UPPERCASE
  ini=%ini%`n`;mmmm Full month name (e.g. january)
  ini=%ini%`n`;Mmmm Like mmmm`, but Titlecase
  ini=%ini%`n`;MMMM Like mmmm`, but UPPERCASE
  ini=%ini%`n`;y    Year without century`, without leading zero (0 – 99)
  ini=%ini%`n`;yy   Year without century`, with leading zero (00 - 99)
  ini=%ini%`n`;yyyy Year with century. Example: 2005
  ini=%ini%`n`;gg   Period/era string for the current user's locale (blank if none)
  ini=%ini%`n`;day  Day of the year
  ini=%ini%`n`;week Week of the year
  ini=%ini%`n`;
  ini=%ini%`n`;Time Formats (case sensitive)
  ini=%ini%`n`;
  ini=%ini%`n`;h    Hours without leading zero; 12-hour format (1 - 12)
  ini=%ini%`n`;hh   Hours with leading zero; 12-hour format (01 – 12)
  ini=%ini%`n`;H    Hours without leading zero; 24-hour format (0 - 23)
  ini=%ini%`n`;HH   Hours with leading zero; 24-hour format (00– 23)
  ini=%ini%`n`;m    Minutes without leading zero (0 – 59)
  ini=%ini%`n`;mm   Minutes with leading zero (00 – 59)
  ini=%ini%`n`;s    Seconds without leading zero (0 – 59)
  ini=%ini%`n`;ss   Seconds with leading zero (00 – 59)
  ini=%ini%`n`;t    Single character time marker`, such as A or P (depends on locale)
  ini=%ini%`n`;tt   Multi-character time marker`, such as AM or PM (depends on locale) 
  ini=%ini%`n`;
  ini=%ini%`n`;Other Formats (case sensitive)
  ini=%ini%`n`;
  ini=%ini%`n`;caps   Caps Lock state
  ini=%ini%`n`;num    Num Lock state
  ini=%ini%`n`;scroll Scroll Lock state
  ini=%ini%`n`;insert Insert state
  FileAppend,%ini%,%applicationname%.ini
  ini=
}
IniRead,font,%applicationname%.ini,Settings,font
IniRead,titlestring,%applicationname%.ini,Settings,titlestring
IniRead,copystring,%applicationname%.ini,Settings,copystring
IniRead,size,%applicationname%.ini,Settings,size
IniRead,boldness,%applicationname%.ini,Settings,boldness
IniRead,color,%applicationname%.ini,Settings,color
IniRead,xoffset,%applicationname%.ini,Settings,xoffset
IniRead,yoffset,%applicationname%.ini,Settings,yoffset
Return
