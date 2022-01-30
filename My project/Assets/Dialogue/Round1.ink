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
~changeBG("round1_conference")
You are at the press conference on the topic of Universal Child Cars.
After your speech, it the Q&A session with reporters.
You picked a reporter.
"Your recent proposal for Universal Child Cars has some parents concerned over the potential safety risks. How would you respond to those parents? "
* The Little Lambos Act will provide every child with an age appropriate curriculum on driver’s safety.
    ~add(spectrum*-3)
    ->done
* I take it they’ve never been in a PT Cruiser with the top down, a diaper full of crap, and nowhere to be but the open road. Next question.
    ~add(spectrum*-1.5)
    ->done
* Uber has reduced their minimum age for employment to 5. For the sake of our economy, it’s important that we have all hands on deck. Even the tiny ones. 
    ~add(spectrum*0.5)
    ->done
* What’s important for parents to understand is how cool it would be to have a baby driver. You know, like the movie?
    ~add(spectrum*1.5)
    ->done
* This piece of legislation is incredibly popular among children ages 10-12 months. To deny their Goos and Gahs would be undemocratic.
    ~add(spectrum*3)
    ->done
- (done)

    ->q2

===q2===

~temp spectrum = RANDOM(-2,2)
~temp previousApproval = Approval
~changeBG("round1_conference")
"A whistleblower from within your own office has stated that the Little Lambos Act is a ploy to sell more Teslas. A company that you are currently invested in. Is this accurate? "
* I believe in the right to participate in the Free Market.
    ~add(spectrum*-3)
    ->done
* This is the first I’m hearing of this, actually.
    ~add(spectrum*-1.5)
    ->done
* Who told you that? Was it Ted? Aw, he sucks! 
    ~add(spectrum*0.5)
    ->done
* I will not give any credence to an unsubstantiated rumor.
    ~add(spectrum*1.5)
    ->done
* I think it’s important that we all take a moment to reflect on these issues and realize no one is truly at fault. We should not allow this to divide our nation.
    ~add(spectrum*3)
    ->done
- (done)

	->q3
	
===q3===

~temp spectrum = RANDOM(-2,2)
~temp previousApproval = Approval
~changeBG("round1_conference")
"Your most recent piece of legislation, giving every newborn the right to drive a motor vehicle has been praised by insurance firms. Do you believe that this legislation will negatively impact the insurance rates of your constituents?"
* Of course not. There will be no insurance!.
    ~add(spectrum*-3)
    ->done
* Their premiums will go up. How is that a bad thing?
    ~add(spectrum*-1.5)
    ->done
* The data is simply not there yet. We have no way of concluding that children are bad at driving. 
    ~add(spectrum*0.5)
    ->done
* It’s not just the insurance firms that are praising this bill. 47% of children blinked when asked if they support enacting this law.
    ~add(spectrum*1.5)
    ->done
* As long as citizens are practicing safe driving habits and not running into any babies, they have nothing to be concerned about.
    ~add(spectrum*3)
    ->done
- (done)
{
	- Approval > previousApproval + 2:
	The baby reporter appreciates your candor.
    Unfortunately, he is not satisfied with your answer.

	- Approval < previousApproval - 2:
    The reporter smiles.
    He seems enthusiastic to report on this news.

	- else:
	Their eyes gloss over a bit.
}

->ending
=== ending ===
"Good luck senator!"
~showToggle()
// ~switch = true
-> END
=== function add(x)
    ~Approval = Approval + x
