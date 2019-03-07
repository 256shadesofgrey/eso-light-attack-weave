;This script adds a simple mouse click to each of the enabled keys and optionally a delayed right click.

;========== Do not change this section unless you know what you are doing. ==========
#SingleInstance, force
#NoEnv
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input
SetWorkingDir %A_ScriptDir%
;====================================================================================

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

;Change this to false if you want to disable weaving on individual keys, but allow 
;block cancelling to continue.
global enableWeave1 := true
global enableWeave2 := true
global enableWeave3 := true
global enableWeave4 := true
global enableWeave5 := true
global enableWeaveU := true

;WARNING: If you change this value to anything other than 0,
;this macro will be more likely to be considered botting.
;Change at your own risk.
;Increasing this vaule might help if you see that the light attacks don't go off before the skill.
global msDelay := 100

;The following parameters are inactive unless you enabled block cancelling.
;The default values were successfully tested with Endless Hail (Bow skill) at low latency.
;You might want to adjust them depending on what skills you will be cancelling and your internet connection.

;This is used to determine how long to wait, after a skill was used, before blocking.
global msBlockDelay := 500
;This is used to determine how long to hold block once it's triggered.
global msBlockHold := 50
;Global cooldown on skills. Time for which the script will ignore new inputs. 
;This is typically 1000 ms. To disable this feature set this to 0.
global msGlobalCooldown := 1000

;This determines how many button presses will be executed later if the input comes before
;the global cooldown (GCD) is over. 
;If this is set to 0, the GCD will cause inputs to be ignored for its duration. 
;Any number greater than that will cause the inputs to be saved and used automatically 
;when the GCD is over. 
;If the queue is full, new presses will override the last performed input.
global queueLength := 1

;========== END OF CONFIGURATION ==========

;Do not change anything starting here, unless you know what you are doing.
global lastSkillActivation := -msGlobalCooldown

global Queue := Object()

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

Schedule(key, enabled, blockCancel, weave)
{
    remainingGCD := lastSkillActivation + msGlobalCooldown - A_TickCount
    
    if (remainingGCD > 0) {
        ;The time has to be given as a negative number for a single execution by SetTimer.
        remainingGCD := remainingGCD < 0 ? 0 : -remainingGCD
        
        ;Make sure we don't exceed max. queue size.
        qSize := Queue.MaxIndex() ? Queue.MaxIndex() : 0
        
        ;Make sure the new action is performed after all the previous ones.
        remainingGCD -= (msGlobalCooldown * qSize)
            
        if (qSize < queueLength) {
            W := Func("ScheduledWeave").Bind(key, enabled, blockCancel, weave)
            Queue.Insert(W)
            SetTimer, % W, %remainingGCD%
        } else {
            W := Queue.Remove()
            SetTimer, % W, Delete
            W := Func("ScheduledWeave").Bind(key, enabled, blockCancel, weave)
            Queue.Insert(W)
            remainingGCD += msGlobalCooldown
            if (remainingGCD > 0) {
                remainingGCD = -1
            }
            SetTimer, % W, %remainingGCD%
        }
        
        return
    }
    
    Weave(key, enabled, blockCancel, weave)
}

ScheduledWeave(key, enabled, blockCancel, weave)
{
    Weave(key, enabled, blockCancel, weave)
    Queue.Remove(1)
}

;key - the key to activate after weaving. 
;enabled - whether weaving is enabled.
;blockCancel - whether the animation will be block cancelled.
Weave(key, enabled, blockCancel, weave)
{
    if (enabled && weave) {
        if (!GetKeyState(attack) && !GetKeyState(block)) {
            Send, {%attack%}
            Sleep msDelay
        }
    }
    Send, {%key%}
    dm := A_TickCount-lastSkillActivation
    OutputDebug, %dm%
    lastSkillActivation := A_TickCount
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
    Schedule(skillOne, true, enableBlockCancel1, enableWeave1)
Return

s2:
    Schedule(skillTwo, true, enableBlockCancel2, enableWeave2)
Return

s3:
    Schedule(skillThree, true, enableBlockCancel3, enableWeave3)
Return

s4:
    Schedule(skillFour, true, enableBlockCancel4, enableWeave4)
Return

s5:
    Schedule(skillFive, enableFive, enableBlockCancel5, enableWeave5)
Return

su:
    Schedule(skillUltimate, enableUlti, enableBlockCancelU, enableWeaveU)
Return
