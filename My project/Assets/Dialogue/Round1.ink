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
{
	- Approval > previousApproval + 2:
	The reporter frowns.
    Apperantly, he is not satisfied with your answer.

	- Approval < previousApproval - 2:
    The reporter smiles.
    He likes your response.

	- else:
	He's neutral about your response.
}
    ->q2

===q2===

->ending
=== ending ===
"Good luck senator!"
~showToggle()
// ~switch = true
-> END
=== function add(x)
    ~Approval = Approval + x
