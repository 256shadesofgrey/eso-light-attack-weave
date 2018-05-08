;This script adds a simple mouse click to each of the enabled keys.

;>>>>>Do not change this unless you know what you are doing.
#SingleInstance, force
#NoEnv
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input
SetWorkingDir %A_ScriptDir%
;<<<<<

;========== CONFIGURATION ==========

;Comment this out (put ; in front of the line) if you want
;the script to run right from the start, rather than load suspended.
Suspend

;Key configuration. Change this if your keybinds differ from the default ones.
;Note: you can't select numpad keys 1-5 and 9.
global attack := "LButton"
global block := "RButton"
global skillOne := "1"
global skillTwo := "2"
global skillThree := "3"
global skillFour := "4"
global skillFive := "5"
global skillUltimate := "r"

;Change this to true if you want skillFive to be activated when running the script.
global enableFive := false

;WARNING: If you change this value to anything other than 0, it could be considered botting.
;Change at your own risk.
;Increasing this vaule might help if you see that the light attacks don't go off before the skill.
global msDelay := 0

;========== END OF CONFIGURATION ==========

;Do not change anything starting here, unless you know what you are doing.
Hotkey, %skillOne%, s1, On
Hotkey, %skillTwo%, s2, On
Hotkey, %skillThree%, s3, On
Hotkey, %skillFour%, s4, On
Hotkey, %skillFive%, s5, On
Hotkey, %skillUltimate%, su, On

#ifWinActive Elder Scrolls Online

Tab::
	Suspend
Return

;Control + tab.
^Tab::
    enableFive := !enableFive
return

s1:
	if (!GetKeyState(attack) && !GetKeyState(block)) {
		Send, {%attack%}
        Sleep msDelay
    }
	Send, {NumPad1}
Return

s2:
	if (!GetKeyState(attack) && !GetKeyState(block)) {
		Send, {%attack%}
        Sleep msDelay
    }
	Send, {NumPad2}
Return

s3:
	if (!GetKeyState(attack) && !GetKeyState(block)) {
		Send, {%attack%}
        Sleep msDelay
    }
	Send, {NumPad3}
Return

s4:
	if (!GetKeyState(attack) && !GetKeyState(block)) {
        Send, {%attack%}
        Sleep msDelay
    }
	Send, {NumPad4}
Return

s5:
    if (enableFive) {
        if (!GetKeyState(attack) && !GetKeyState(block)) {
            Send, {%attack%}
            Sleep msDelay
        }
    }
    Send, {NumPad5}
Return

su:
	if (!GetKeyState(%attack%) && !GetKeyState(%block%)) {
		Send, {%attack%}
        Sleep msDelay
    }
	Send, {NumPad9}
Return
