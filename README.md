# eso-light-attack-weave
This is a macro for the game Elder Scrolls Online. "Light attack weaving" is the term the ESO community uses to describe the use of a simple weapon attack right before using a spell, resulting in the animation of the weapon attack being cancelled, allowing you to do more attacks in the same amount of time.

# Usage #
1. Install the AutoHotkey interpreter ( https://autohotkey.com/ ).
2. Run the game (since Update 24 this must be done before running the macro).
3. Run the macro.
4. While the game window is active, enable/disable it by pressing tab.
5. \[Optional\] Press Ctrl+Tab to toggle light attack weaving when pressing 5. This has to be done after the macro is already active (i.e. you enabled it in accordance to step 4).

# FAQ #
## General questions
Q: Will there be an update because of a change in this patch?
A: If an update is necessary, it will generally happen within a few days of a new patch hitting live servers. If this is not the case, no update is necessary and the thing you're quoting from the patch notes is not affecting the macro. If you think I missed something, create a new ticket/issue explaining the problem, that way I can address the question once for everyone instead of writing the same thing in 10 different emails.

Q: Will this macro get me banned?  
A: I don't know, I don't work for ZOS. Technically macros are against TOS, so use it at your own risk.

## Technical questions
Q: Does this macro work in full screen mode?  
A: Yes.

Q: I'm using custom keybinds in the game, can the macro work with them?  
A: Yes, take a look at the "CONFIGURATION" section inside of the .ahk file. There you can change the key configuration to whatever you want.

Q: The macro doesn't work, what can I do?  
A: Here are some of the frequent problems I come across when helping people troubleshoot:
   1. Make sure the macro is actually active. Once the macro is running, it will show a green icon in the tray with either an S or an H. If you see an S, that means the macro is suspended (all keybinds except for the suspend toggle hotkey are disabled). To make it show an H, either press the suspend hotkey (Tab by default) while the game window is active, or right click on the icon and remove the checkmark next to the "Suspend Hotkeys" option.
   2. The default keybinds are configured to work with an English QWERTY keyboard layout. If you have for example a German QWERTZ keyboard, the bar swap button will be by default "ö" and not "\`", causing the script to not delete the queue on bar swap, causing problems if you're swapping before the queue is emptied. And on a French AZERTY keyboard, it's not even numbers on the skill keys. In both cases either adjust the keybinds in the configuration of the script, or switch the keyboard layout to English in windows.

Q: I play in full screen mode, and I do not see the tray, but I would like to be able to see if the macro is active. How can I do that?  
A: You can change the suspendKey parameter to "CapsLock", "NumLock" or "ScrollLock", and make sure that suspendKeyBehavior is set to 1. That way the state of the macro will synch up with the state of the corresponding keys, and you can use the corresponding LEDs on your keyboard to see if the macro is active.

Q: Why can 5 be toggled on/off independently from other keybinds?  
A: There are some skills that you may not want to activate with a light attack, like for example Rapid Maneuver, because you can use it while mounted, but doing a light attack would dismount you. If you put it on 5 and disable the hotkey, you don't need to toggle the macro entirely whenever you're mounted. 

Q: And if I like to put Rapid Maneuver on 4?  
A: If you prefer to have this functionality on a different key, adjust the key configuration accordingly, since it's "skillFive" that is being toggled, not actually the keybind 5, you can set "skillFive := 4" and "skillFour := 5".

Q: Will this macro give me an advantage over other players?  
A: Not really. You don't need a macro to do light attack weaving, and it is currently considered a legitimate mechanic by ZOS, so anyone can do it, macro or not. If you are having big problems with weaving though, it will allow you to do it cleaner. With that said, I've seen plenty of people doing it better manually than anyone ever could by using this macro with the "queueLength" parameter set to anything other than 0.

Q: If with the "queueLength" of 0 one can weave better, why is it set to 1 by default?  
A: 0 will work better for you if you have a good feel for the global cooldown of the game and for the quirks with various animations. With the queue length of 1 you do not need to worry about those things, since the macro will time the skills appropriately (assuming the "msDelay", "msGlobalCooldown" and "msBarSwapCooldown" parameters are set correctly), so if you do not have a good feel for those things, 1 is better for you.

## Philosophical questions
Q: If this macro doesn't give an advantage, why was it made?  
A: I don't like how animation cancelling is implemented in ESO, and this macro basically allows you to experience combat the way it would work if I was put in charge of overhauling the combat system. With the macro you can pretend like light attack weaving doesn't exist, but still do competitive DPS.

Q: What's wrong with animation cancelling?  
A: There is nothing inherently wrong with it. In my opinion some forms of animation cancelling are necessary to make the game feel responsive, but no form of animation cancelling should result in just flat out more damage. Light attack weaving is the biggest offender, since it's currently easily making up 25% of the damage on certain builds.

Q: What forms of animation cancelling are in your opinion necessary?  
A: For example dodge rolling. If a skill with a long animation locked you in place and you couldn't dodge roll, it would often lead to the death of your character. When you dodge roll, you cancel the skill animation, but that doesn't allow you to perform any additional action that would increase your damage, because while you're rolling, you can't perform any attacks.
