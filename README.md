# eso-light-attack-weave
This is a macro for the game Elder Scrolls Online. "Light attack weaving" is the term the ESO community uses to describe the use of a simple weapon attack right before using a spell, resulting in the animation of the weapon attack being cancelled, allowing you to do more attacks in the same amount of time.

# Usage #
1. Install the AutoHotkey interpreter ( https://autohotkey.com/ ).
2. Run the macro.
3. Enable/disable it by pressing tab.
4. \[Optional\] Press Ctrl+Tab to enable light attack weaving when pressing 5. Press again to disable. This has to be done after the macro is already active (i.e. you enabled it in accordance to step 3).

# FAQ #
## Technical questions
Q: Will this macro get me banned?  
A: I don't know, I don't work for ZOS. Technically macros are against TOS, so use it at your own risk. With default settings however the functionality of this macro is simpler than what you could do with a gaming mouse, and I don't think those are banned.

Q: Why is 5 disabled by default?  
A: This is where I recommend to put skills you might not want to trigger light attacks, for example things you might want to cast while in stealth or in a place where you want to avoid getting into combat, like a crowded town. You can always change this behavior if you want it to be active as soon as you enable the macro (read the comments inside the macro for more info).

Q: Will this macro give me an advantage over other players?  
A: Not really. You don't need a macro to do light attack weaving. In fact, if you do it manually, you can probably find a way to do it more efficiently. It would only give you an advantage over players who don't know how light attack weaving works, but if you're here, chances are you already do.

Q: Are there future plans for the macro?
A: I intend to do away with AutoHotkey and rewrite the macro in a different language (probably Python) to make it work on Mac and Linux too. However when and if that happens will depend on not just me but also on whether ESO will ever run out of the box on Linux. Until then I might make occasional updates just like before.

## Philosophical questions
Q: If this macro doesn't give an advantage, why was it made?
A: I don't like how animation cancelling is implemented in ESO, and this macro basically allows you to experience combat the way it would work if I was put in charge of overhauling the combat system. With the macro you can pretend like light attack weaving didn't exist.

Q: What's wrong with animation cancelling?
A: There is nothing inherently wrong with it. In my opinion some forms of animation cancelling are necessary to make the game feel responsive, but no form of animation cancelling should result in just flat out more damage. Light attack weaving is the biggest offender, since it's currently easily making up 25% of the damage on certain builds.

Q: What forms of animation cancelling are in your opinion necessary?
A: For example dodge rolling. If a skill with a long animation locked you in place and you couldn't dodge roll, it would often lead to the death of your character. When you dodge roll, you cancel the skill animation, but that doesn't allow you to perform any additional action that would increase your damage, because while you're rolling, you can't do any attacks.
