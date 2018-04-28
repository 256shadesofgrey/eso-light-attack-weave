;This script adds a simple mouse click to each of the enabled keys.

#SingleInstance, force
#NoEnv
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input
SetWorkingDir %A_ScriptDir%
Suspend

;WARNING: If you change this value to anything other than 0, it would be considered botting.
;Change at your own risk.
global msDelay := 0

#ifWinActive Elder Scrolls Online

Tab::
	Suspend
Return

1::
	if (!GetKeyState("LButton") && !GetKeyState("RButton"))
		MouseClick, Left
	Sleep msDelay
	Send, {NumPad1}
Return

2::
	if (!GetKeyState("LButton") && !GetKeyState("RButton"))
		MouseClick, Left
	Sleep msDelay
	Send, {NumPad2}
Return

3::
	if (!GetKeyState("LButton") && !GetKeyState("RButton"))
		MouseClick, Left
	Sleep msDelay
	Send, {NumPad3}
Return

4::
	if (!GetKeyState("LButton") && !GetKeyState("RButton"))
		MouseClick, Left
	Sleep msDelay
	Send, {NumPad4}
Return

;5::
;	if (!GetKeyState("LButton") && !GetKeyState("RButton"))
;		MouseClick, Left
;	Sleep msDelay
;	Send, {NumPad5}
;Return
