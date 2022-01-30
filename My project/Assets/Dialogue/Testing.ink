VAR influenceIndex = 10
VAR fund = 0
VAR background = 0
VAR Dave = false
VAR John = false
VAR current_epilogue = -> Rally1
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
HAHAHAH
{bee}
->Intro
=== Intro ===
{ topics > 1:
    ~gotoNod(->meetingroom1)
    ->current_epilogue
}
{ topics == 0:
    "Any topics?"
}
{ topics == 1:
    "Any more topics?"
}
* Anti-Bee
    ~topics= topics +1
    ~gotoNod(->Intro)
    ->current_epilogue
* [Ban On Socks with Sandals]
    ~topics= topics +1
    ~gotoNod(->Intro)
    ->current_epilogue
* Criptid Hunting
    ~topics= topics +1
    ~gotoNod(->Intro)
    ->current_epilogue
* Child Car
    ~topics= topics +1
    ~gotoNod(->Intro)
    ->current_epilogue

===meetingroom1===
Your sponsers were staring at you with dignified complexion.
"Even though your run is not promising, but..."
~ addFund(1)
You received {fund} million dollars.
"Anyway..."
"Hope this rally can be a turn around."
"Or you are done."
"Good luck!" #surly
"Don't fail our expectations."
~gotoNod(->beerally)
->current_epilogue
===beerally===
~switch()
"No bee!"
There are reporters trying to ask you questions.
+ John(Liberal)
    ~toggleJohn()
    "So you mentioned no bee."
    "May I ask why?"
    ** Because bee are evil!(stupid choice)
        "Holy crap," says John.
        "You need to see a doctor."
        ~lowerEffect()
        ~toggleJohn()
        You lose some effectIndex
        But you still need to face your sponsers
        ->done
    ** Because bee produces honey which makes human become fat(smart choice)
        "Make sense."
        ~raiseEffect()
        ~toggleJohn()
        You gained some effectIndex
        But you can tell your sponsers your success
        ->done
+ Dave(Conservative)
    ~toggleDave()
    "So you mentioned..."
    ~gotoNod(->meetingroom1)
    ->current_epilogue
- (done)
    ~gotoNod(->meetingroom2)
    ->current_epilogue

===socksrally===
"No Socks in Sandals"
===meetingroom2===
~switch()
{influenceIndex < 10:
    "Holy cow!"
    "We asked you to gain popularity, not to lose face!"
    "But anyway, you defend our interests."
    "Here's some more fund"
    ~addFund(5)
    "Good luck next round!"
    ~gotoNod(->meetingroom2)
    ->current_epilogue
}
{influenceIndex > 10:
    "Well done!"
    "You gained some popularity."
    "But you need to defend our interests."
    "How to you plan to solve this?"
}
*{influenceIndex > 10}"I'm gonna fool my supporters."
    "Good boy."
    "Here's some more fund."
    ~addFund(15)
    
*{influenceIndex > 10}"Do what I promised."
    "Lol"

=== Rally1 ===
~switch()
It's a small rally.
After all, you can't do much with such little amount of money.
"MAGA"
You shouted at the crowd.
But noone really gives a shit about your speech.

+ "Holly crap. Wtf is wrong with you people"
    ~gotoNod(->Rally1)
    ->current_epilogue
    // -> astonished
+ [Try MAGA again] 
    -> nod

=== astonished ===
"You are in jest!" I told him in dignified affront. "You make mock of me, Monsieur."
"I am quite serious."

+ "But of course"
    -> ending


=== nod ===
"MAGA!!"
Suddenly.
-> ending

=== ending
"We shall circumnavigate the globe within eighty days." He was quite calm as he proposed this wild scheme. "We leave for Paris on the 8:25. In an hour."
-> END
=== function addFund(x)
    ~fund = fund + x
=== function emptyFund(x)
    ~fund = 0
=== function switch()
{
    -background > 0:
        ~background = 0
    -background < 1:
        ~background = 1
}
===function toggleDave()
    ~Dave = !Dave
===function toggleJohn()
    ~John = !John
=== function gotoNod(->x)
    ~current_epilogue = x
=== function raiseEffect()
    ~influenceIndex = influenceIndex + 10 + RANDOM(1,3)
=== function lowerEffect()
    ~influenceIndex = influenceIndex - 10