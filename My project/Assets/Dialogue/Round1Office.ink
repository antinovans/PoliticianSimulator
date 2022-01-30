EXTERNAL showToggle()
EXTERNAL changeBG(BG)
//static variables
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
//local variables
->q1
=== q1 ===
~temp spectrum = RANDOM(-2,2)
~temp previousApproval = Approval
~changeBG("round1_prologue")
You return to your office, but it appears your work is far from over. A group Lobbyists have gathered to speak with you.
"We have a problem. The new peripherals that allow babies to reach down to the pedals of a car have been leaked to the press. If you don’t push this legislation through now. People are going to get suspicious. "
* It's as good as done.
    ->done
* I won't be beholden to your schedule 
    ->done

* I won't compromise my beliefs.
    ->done
- (done)

    ->q2

===q2===

~temp spectrum = RANDOM(-2,2)
~temp previousApproval = Approval
~changeBG("round1_prologue")
"How could you pull a stunt like that? Our members are furious. You better make things right. You're only here because we thought that you could play ball. Do you think you can’t be replaced? "
* You'll just have to find another errand boy
    ~add(spectrum*-3)
    ->done
* Whoopsie! 
    ~add(spectrum*0.5)
    ->done

* I'll do whatever I can to make this right
    ~add(spectrum*3)
    ->done
- (done)

	->q3
	
===q3===

~temp spectrum = RANDOM(-2,2)
~temp previousApproval = Approval
~changeBG("round1_prologue")
"We saw your passionate campaign efforts on behalf of the movement to put a baby in every driver’s seat. We were wondering if you could do the same for the umami ban? We’re sick of making savory foods. We’re prepared to offer you a lifetime of the sourest meals you can imagine if you lend us your support.
"

* Tempting, but I'll need more than that.
    ~add(spectrum*-1.5)
    ->done
* Why would I? 
    ~add(spectrum*0.5)
    ->done
* You have my support
    ~add(spectrum*3)
    ->done
- (done)
{
	- Approval > previousApproval + 2:
	Nobody walked away from this meeting looking particularly happy

	- Approval < previousApproval - 2:
    Knowing glances are flashed before the meeting concludes.

	- else:
	It seems that not much progress has been made
}

->ending
=== ending ===
"It's about time for your next press conference. Shall we?"
~showToggle()
// ~switch = true
-> END
=== function add(x)
    ~Approval = Approval + x
