;This script adds a simple mouse click to each of the enabled keys and optionally a delayed right click.

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

;If you don't want to weave when using ultimate, set this to false.
global enableUlti := false

;Enable or disable block cancelling on the given skills.
;WARNING: If you enable any of these functions, this macro is more likely to be considered botting.
global enableBlockCancel1 := false
global enableBlockCancel2 := false
global enableBlockCancel3 := false
global enableBlockCancel4 := false
global enableBlockCancel5 := false
global enableBlockCancelU := false

;WARNING: If you change this value to anything other than 0,
;this macro will be more likely to be considered botting.
;Change at your own risk.
;Increasing this vaule might help if you see that the light attacks don't go off before the skill.
global msDelay := 0

;The following parameters are inactive unless you enabled block cancelling.
;The default values were successfully tested with Endless Hail (Bow skill) at low latency.
;You might want to adjust them depending on what skills you will be cancelling and your internet connection.

;This is used to determine how long to wait, after a skill was used, before blocking.
global msBlockDelay := 500
;This is used to determine how long to hold block once it's triggered.
global msBlockHold := 50

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

;key - the key to activate after weaving. 
;enabled - whether weaving is enabled.
;blockCancel - whether the animation will be block cancelled.
Weave(key, enabled, blockCancel)
{
    if (enabled) {
        if (!GetKeyState(attack) && !GetKeyState(block)) {
            Send, {%attack%}
            Sleep msDelay
        }
    }
    Send, {%key%}
    if (enabled && blockCancel && !GetKeyState(attack) && !GetKeyState(block)) {
        Sleep msBlockDelay
        if (!GetKeyState(attack) && !GetKeyState(block)) {
            Send, {%block% down}
            Sleep msBlockHold
            Send, {%block% up}
        }
    }
}

s1:
    Weave(skillOne, true, enableBlockCancel1)
Return

s2:
    Weave(skillTwo, true, enableBlockCancel2)
Return

s3:
    Weave(skillThree, true, enableBlockCancel3)
Return

s4:
    Weave(skillFour, true, enableBlockCancel4)
Return

s5:
    Weave(skillFive, enableFive, enableBlockCancel5)
Return

su:
    Weave(skillUltimate, enableUlti, enableBlockCancelU)
Return
