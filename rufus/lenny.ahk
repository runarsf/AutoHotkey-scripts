; -------------------------------------
; Script behaviour
; -------------------------------------
#SingleInstance Force																					; Skip replace dialog.
#Persistent																							; Keeps a script permanently running.
SetTitleMatchMode 2																						; A window's title can contain WinTitle anywhere inside it to be a match.
SetWorkingDir %A_ScriptDir%																				; Ensures a persistent working directory.
SetNumlockState AlwaysOn																					; Locks NumLock in an on state.
SetCapslockState AlwaysOff																				; Locks CapsLock in an off state.
DetectHiddenWindows, On																					; Enables the detection of hidden windows

I_Icon = %A_ScriptDir%\icons\cmd.ico																		; Defines I_Icon.
IfExist, %I_Icon%																						; Tests if I_Icon exists.
menu, tray, Icon, %I_Icon%																				; Sets the tray icon to the value of I_Icon.

ToolTip, lenny.ahk launched, 1910, 1070																		; Display tooltip.
SetTimer, RemoveToolTip, 5000																				; Set the length of the tooltip.
return

RemoveToolTip:																							; Define RemoveToolTip.
SetTimer, RemoveToolTip, Off
ToolTip																								; Removes the tooltip.
return

+Esc::reload																							; Reloads script with hotkey.


; +-----------------------------+
; |                             |
; |          Template           |
; |                             |
; +-----------------------------+


; -------------------------------------
; Script access
; -------------------------------------
^!a::edit, %A_ScriptName%																				; Open current script in editor.
^!+a::run, explorer.exe %A_ScriptDir%																		; Open the current script's path.

; -------------------------------------
; Text replacements and other binds
; -------------------------------------
::;lenny::( ͡° ͜ʖ ͡°)
::;sadlenny::( ͡° ʖ̯ ͡°)
::;runny::ᕕ( ͡° ͜ʖ ͡° )ᕗ	
::;menny::( ͠° ͟ʖ ͡°)
::;wenny::( ͡~ ͜ʖ ͡°)
::;plenny::͡° ͜ʖ ͡°
::;stony::( ͡ຈ ͜ʖ ͡ຈ)	
::;ilny::( ͡° _ʖ ͡°)
::;wutty::( ͝סּ ͜ʖ͡סּ)
::;silenny::( ͡^ ͜ʖ ͡^ )
::;stary::( ͡o ͜ʖ ͡o)
::;gary::ᕕ( ᐛ )ᕗ
::;regary::ᕕ( ᐕ )ᕗ
::;speedygary::三三ᕕ( ᐛ )ᕗ
::;spidgary::/╲/\(╭ ᐛ ╮)/\╱\
:*:;gmail::runar.fredagsvik@gmail.com
:*:@@::runar.fredagsvik@gmail.com
:*:;proton::runarsf@protonmail.com
:*:;jmail::JustRunez@gmail.com
:*:;mmail::runar.miner@gmail.com
::;xd::lmao xd lol rofl ialmaorn roflmao XD lawl Cx
::;pi::π
:*:/r/::reddit.com/r/
+NumpadMult::×
+NumpadDiv::÷
::;b::🅱
^!s::run, C:\Users\runarsf\AppData\Local\osu!\Skins\- 「Shinzou」 -
^!g::run %A_ScriptDir%\gui.ahk

; #####################################
; Scripts
; #####################################
hk := "~LWin"
hotkey, % hk, super

^+v::
	sendRaw, ``````
	sleep, 150
	send, %clipboard%
	sleep, 150
	sendRaw, ``````
return

; -------------------------------------
; Mail signature
; -------------------------------------
::;sign::
	sendRaw, Runar Fredagsvik
	sendRaw, +47 948 67 816
	sendRaw, VG2 Studieretning for IKT Servicefag
return

; -------------------------------------
; Chrome
; -------------------------------------
/*F1::
IfWinExist, ahk_class Chrome_WidgetWin_1
	WinActivate
else IfWinNotExist, ahk_class Chrome_WidgetWin_1
	run, chrome.exe
else
	WinActivate, ahk_class Chrome_WidgetWin_1
	send, {Ctrl Down}{Tab}{Ctrl Up}
	sleep, 100
return
*/
; -------------------------------------
; Media keys
; -------------------------------------
NumpadDot::return																						; Disable NumpadDot
	NumpadDot & NumpadSub::																				; Next media.
send, {Media_Next}
return
	NumpadDot & NumpadDiv::																				; Previous media.
send, {Media_Prev}
return
	NumpadDot & NumpadMult::																				; Pause media.
send, {Media_Play_Pause}
return
	NumpadDot & NumpadAdd::																				; Stop media.
send, {Media_Stop}
return

; -------------------------------------
; Restart VoiceMeeter Banana
; -------------------------------------
^+!r::
process, close, voicemeeterpro.exe																			; Ends the process for VoiceMeeter Banana.
sleep, 500																							; Wait for 500ms.
run, C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe													; Launch VoiceMeeter Banana.
return

; -------------------------------------
; CapsLock modifier
; -------------------------------------
!CapsLock::
GetKeyState, capsstate, CapsLock, T
if capsstate = U
	SetCapsLockState AlwaysOn
else
	SetCapsLockState AlwaysOff
return

; -------------------------------------
; Search google for highlighted text
; -------------------------------------
^+c::
send, ^c
sleep, 50
run, http://www.google.com/search?q=%clipboard%																; Search google for clipboard.
return

; -------------------------------------
; Task manager on taskbar
; -------------------------------------
;ahk_class Shell_TrayWnd


; ####################################
; Super/Win hotkeys
; ####################################
~LWin Up::																							; Disables the Windows key.
if (A_PriorHotkey <> "~LWin Up" or A_TimeSincePriorHotkey > 200)
{
	KeyWait, #
	return
}
sendInput, {Alt Down}
sleep, 16
sendInput, {Tab}
sleep, 16
sendInput, {Alt up}
sleep, 16
return

#l::DllCall("LockWorkStation")																			; Shortcut for locking pc.
#+l::DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)											; Shortcut for hibernating pc.
#q::!F4																								; Win+Q to Alt+F4 (xKill with SuperF4).
#r::run %appdata%\Microsoft\Windows\Start Menu\Programs\System Tools\run.lnk										; Enables run dialog shortcut.
#Del::
FileRecycleEmpty																						; Empty recycle bin.
MsgBox, Recycle bin emptied
return

; -------------------------------------
; Always on top
; -------------------------------------
#space::																								; Super+Space to make window stay on top.
Winset, AlwaysOnTop, Toggle, A																			; Toggles the attribute AlwaysOnTop.
mousegetpos, x, y, possum
WinGet, ExStyle, ExStyle, ahk_id %possum%
if (ExStyle & 0x8)																						; 0x8 Checks if the window is AlwaysOnTop or not
	ExStyle = AlwaysOnTop
else
	ExStyle = Not AlwaysOnTop
ToolTip, %exstyle%																						; Shows a ToolTip that displays AlwaysOnTop or Not AlwaysOnTop depending on what state AlwaysOnTop is in.
sleep, 1000																							; Sleeps for 1.5 Seconds.
ToolTip																								; Removes the ToolTip.
return

; -------------------------------------
; Restore/Maximize with hotkey
; -------------------------------------
#MButton::
#x::																									; Maximize/Restore active window with Super+X.
WinGet, active_id, ID, A
WinGet, checkmax, MinMax, A
If(checkmax == 1) {
	WinGet, active_id, ID, A
	WinRestore, ahk_id %active_id%
} else {
	WinGetClass, class, ahk_id %active_id%
	if class not in ahk_class WorkerW,Shell_TrayWnd, Button, SysListView32,Progman,#32768 
		WinMaximize, ahk_id %active_id%
}
return

; -------------------------------------
; Super key to resize windows
; -------------------------------------
#RButton::
WinGetPos,,, W, H, A
MouseMove, W, H
loop {
	if (!GetKeyState("RButton","P")) {
		MouseGetPos, xpos, ypos 
		while (!GetKeyState("RButton","P")) {
			WinMove, A,,,, %xpos%, %ypos%
			break
		}
		break
	}
}
WinGetPos,,, W, H, A
MouseMove, W/2, H/2
return

; -------------------------------------
; Super key to move windows
; -------------------------------------
#LButton::

CoordMode, Mouse, Relative
MouseGetPos, cur_win_x, cur_win_y, window_id
WinGet, window_minmax, MinMax, ahk_id %window_id%

if window_minmax <> 0
{
	return
}

CoordMode, Mouse, Screen
SetWinDelay, 0

loop
{
	if !GetKeyState("LButton", "P")
	{
		break
	}
	MouseGetPos, cur_x, cur_y
	WinMove, ahk_id %window_id%,, (cur_x - cur_win_x), (cur_y - cur_win_y)
}
return

; #####################################
; IfWinActive scripts
; #####################################

; -------------------------------------
; osu! changes
; -------------------------------------
#IfWinActive, ahk_exe osu!.exe
AppsKey::
	SendInput, {!}recommend
	sleep, 100
	sendInput, {Enter Down}
	sleep, 25
	sendInput, {Enter Up}
	sleep, 5000
return
$F1::F8
$F2::F9
Insert::return
Numpad6::Escape
#IfWinActive
	
; -------------------------------------
; Fix console paste
; -------------------------------------
#If WinActive("ahk_exe ConEmu64.exe") || WinActive("ahk_exe cmd.exe")
^v::
	SendInput, {Raw}%clipboard%
return
#IfWinActive
	
; -------------------------------------
; Double click space for fullscreen 
; -------------------------------------
#If WinActive(" - YouTube") || WinActive("Netflix")
	~Space::
if (A_PriorHotkey <> "~Space" or A_TimeSincePriorHotkey > 200)
{
	KeyWait, space
	return
}
sendInput, f
return
#IfWinActive
	
; -------------------------------------
; Excel hotkeys and fixes
; -------------------------------------
#IfWinActive, ahk_class XLMAIN
#IfWinActive
		
#IfWinActive, ahk_class Shell_TrayWnd
	~MButton Up::run, taskmgr.exe
#IfWinActive