EXTERNAL showToggle()
EXTERNAL changeBG(BG)
VAR topics = 0
VAR bee = false
VAR sock = false
VAR crypid = false
VAR car = false
VAR microwave = false
VAR congress = false
VAR umami = false
VAR Influence = 0
VAR Money = 0
VAR Approval = 0
VAR Morale = 0
VAR switch = false
~changeBG("prologue_intro")
"Welcome!"
"In this game you will be playing as a senator."
"your goal is to successfully balance your time within the public eye and in the privacy of your office in order to get re-elected for another term."
"Normally, this would be a matter of voting along party lines, but..."
"there are many people who would either like to see you fail!"
"or leverage your position to their own advantage."
"Pretty scary,huh?"
"Use your words and anything else at your disposal to be remembered for your leadership and not your corruption."
"Manage your Influence, Approval Ratings, Money, and Staff Morale in order to make it through your first term."
"I bet it's complicated than you originally thought."
"Anyway, let's get started!"
"Your first order of business is to choose your main policies."
->Intro

=== Intro ===
{ topics > 1:
    -> ending
}
{ topics == 0:
    "Any policies?"
}
{ topics == 1:
    "One more policy?"
}
// * Anti-Bees
//     ~topics= topics +1
//     ~bee = true
//     ->Intro
* Ban On Socks with Sandals
    ~topics= topics +1
    ~sock = true
    ->Intro
// * National Holiday for Cryptid Hunting
//     ~topics= topics +1
//     ~crypid = true
//     ->Intro
* Universal Child Cars
    ~topics= topics +1
    ~car = true
    ->Intro
* Every microwave will be used to mine bitcoin
    ~topics= topics +1
    ~microwave = true
    ->Intro
* Umami Ban
    ~topics= topics +1
    ~umami = true
    ->Intro
// * Disputes in Congress will be settled via mud wretsling
//     ~topics= topics +1
//     ~toggleTopic(congress)
//     ->Intro

=== ending ===
"Good luck senator!"
~showToggle()
// ~switch = true
-> END

