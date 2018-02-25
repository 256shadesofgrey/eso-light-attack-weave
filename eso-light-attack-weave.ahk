;This script adds a simple mouse click to each of the enabled keys.

#NoEnv
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input
SetWorkingDir %A_ScriptDir%
Suspend

global msDelay := 10

#ifWinActive Elder Scrolls Online

Tab::
	Suspend
Return

1::
	MouseClick, Left
	Sleep msDelay
	Send, {NumPad1}
Return

2::
	MouseClick, Left
	Sleep msDelay
	Send, {NumPad2}
Return

3::
	MouseClick, Left
	Sleep msDelay
	Send, {NumPad3}
Return

4::
	MouseClick, Left
	Sleep msDelay
	Send, {NumPad4}
Return

;5::
;	MouseClick, Left
;	Sleep msDelay
;	Send, {NumPad5}
;Return
