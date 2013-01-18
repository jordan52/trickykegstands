### Some Thoughts

#### 2012 05 26

Words have actual meanings, like eschaton and echelon. I'm a fast reader
in that I can get through something and get the general gist of it
quickly w/o knowing the precise meanings of a lot of words. Works
wonders in marathon long DFW novels, but I realized just now how many
levels of awesome I miss out on by being good at extracting meaning from
context. For example, the tennis academy kids played a game called
Eschaton in Infinite Jest. I spent the entire book thinking eschaton was
vaguely similar to echelon and that was good enough. A few minutes ago I
realized I didn't really know exactly what echelon meant so I looked it
up along with a bunch of other words including eschaton which really
means the end of all things, or the final destiny of the world. Nice
name for a game about thermonuclear political domination.

#### 2012 05 19

To try to fix my little issue (2012 05 17) with using all the papers I
printed out to learn **hidden markov models** and because I had to sit
in a presentation (that really only contained about 10 minutes of
material) for 4 hours yesterday I figured I'd give them a shot. Problem
is, I took the wikipedia route which sent me to simple markov models
which made me realize I didn't understand those enough. I dug in.
**[Here](http://probability.ca/MT/) is a free textbook that starts with
some very practical applications of markov models in the real world.**
It's a great intro! Reading that made me realize that I keep forgetting
what stochastic means so I thought I'd review today (by typing it out
here) to see if I still understand it.

Something is **stochastic** when it isn't deterministic, meaning it
can't be described by a solid equation and always end with the same
value. Instead, it will take on a range of values described by some sort
of distribution because it is affected by random forces or outside
actions.

Think of it as the result of a function.. something like y=mx+b. in a
deterministic model, plugging in x and b always gives the same y. in a
stochastic model, x and b are not just numbers, they're distributions so
the Y is kind of random but it should typically lie within some range.
That range can be calculated given the distributions of y and b.

What does that mean for markov models? They're a way to model these sort
of non-deterministic problems that vary over time. That is, a stageful
model where the current thing moves from state to state with a known
probability. I'd try to type out an example, but I couldn't do it
justice (just yet) have a look at the first chapter of that book I
linked to above if you're interested.

How does this apply to hidden markov models? Well, those are models that
you use when you are pretty sure there are hidden, or unknown "states"
but you are unable to find the probability distribution of reaching
those states.

Reasons why I'm interested: This is a graph based problem which i sort
of love. It's rooted deep in probabilities which I am trying to get a
handle on because, well, they're useful. And, finally, I have no idea
why I'm working on this. I just am. There is this intersection between
stats, probability, finance, machine learning, computer modeling and
analysis that I'm trying to crack.

#### 2012 05 17

Per the [damodaran finance class](http://pages.stern.nyu.edu/~adamodar/)
i'm listening to, the **risk free rate** basically boils down to the
expected rate of inflation in the currency in which you are working.
(This is the sound of lightbulbs going off in my head.) Rule of thumb -
Use the 10 year zero coupon rate for the risk free rate if the bond is
rated AAA. If it is not rated AAA, then take the published rate and
subtract off any default risk. You do this because often you will add in
default risk at a different point in your analysis. You do not want to
double count.

For me, this is kind of huge. I always thought of the risk free rate as
the minimum return you could possibly expect with zero risk of default.
Which, sure, that's true, but understanding that the market essentially
drives that number to track expected inflation of the currency in which
you are investing helps me to better understand the fact that different
countries have wildly different risk free rates. I never knew why you
wouldn't just shift currencies around to get the best deal.. well, i
forgot to think about inflation.

**update 20120519** - Heh, in lecture 6 he said that the risk free rate
is really inflation + macro market growth. I guess that makes sense,
too. Still learning

The difference between html's **bold** and **strong** tags and *italic*
and *emphasis* tags eludes me.

Let's talk about **hidden markov models.** No, really, someone teach me
because I ran out of copy paper this week and wound up using all the
papers I printed out that I hoped would help me understand them as
printer paper. Dammit.

I love **John Steinbeck's** letter that is on [letters of
note](http://www.lettersofnote.com/2012/05/it-has-never-got-easier.html)
today:

> "If there is a magic in story writing, and I am convinced that there
> is, no one has ever been able to reduce it to a recipe that can be
> passed from one person to another. The formula seems to lie solely in
> the aching urge of the writer to convey something he feels important
> to the reader. If the writer has that urge, he may sometimes but by no
> means always find the way to do it."

I know I'm no writer, but everything on this site and armp.it is from me
getting this compulsive need (out of nowhere, typically) to put a
certain feeling into words and most of the time it doesn't work. Or,
rather, I Get It.

I'm putting together a **comment service** for the app i'm building. I
think my implementation is interesting. Here's how i'm doing it.
Everything in my system uses a UUID as its ID or primary key.
Everything, including each comment. Each comment stores the UUID of the
item to which it is attached, the comment text, timestamp, etc. All
comments are shoved into this service so that when something says, "I
want to display any comments associated with me." All it has to do is
pass its UUID to the service which returns a (JSON) list of comments.

Easy peeeezy

The challenge here is how do you go from Comment to the Item. Well,
since I don't store the Item's location we fall back to a searching
pattern. Every item is indexed anyway, so we just hit the search service
with the UUID and get the item back.

This is completely decoupled. It fails if you delete an Item (which, of
course, you NEVER delete anything. So, that's not a problem.) Or, if you
need to move the comments. Not sure why you would do that, though.

Finally, you can comment on comments. So, your comments can have
comments that comment about the comments.

![](media/trunkRecording.jpg)

I'm recording guitar parts in my car again while I wait for band
practice to start. YOU CAN RECORD DECENT SOUNDING ALBUMS WHILE SITTING
IN YOUR CAR. I love the present.

#### 2012 06 05

Real sentences I heard yesterday free of context:

> "Queensryche? Must be canadian."

> "I just want to know, where should I be going?"

> "Good job, girls. Lick that turkey bucket good and clean."

#### 2012 05 14

There are ETF's that track daily s&p returns but are leveraged and
inverted. For ex. you can buy an etf that tracks the s&p 3x's inverse.
Meaning, if the s&p goes up 10, the etf will go down 30. I didn't read
into it much so I'm assuming it is a percentage, and not actual points.
it's got to be, right? Anyway: **ProShares UltraShort Dow30
NYSEARCA:DXD** and **ProShares UltraPro SS&P500 NYSEARCA:SPXU** seems
like a good tool for risk management which leads to:

**JP Morgan** -\> trading complex, highly leveraged, synthetic...
hedges? Not sure what to call them yet (still wrapping my head around
the syntax) to manage risk can blow up, and everyone makes mistakes, and
JP Morgan is trading something like \$17T when they're worth something
like \$14B (that's some leverage.) So, a \$2B loss isn't that horrible
and it is bound to happen (risk is, by definition, risky.) I won't
pretend to know if this kind of thing warrants regulation and as far as
I understand of what I've read, they (JP's CIO arm) sort of cornered the
market on hedging credit risk which pissed off hedge funds but hedge
funds have been fighting regulation so there isn't much they could do
but talk to reporters (mid April) which published, which got the
attention of other JP arms which ordered CIO to unwind their positions
at a costly time and so the pissed off hedge funds are going to sit and
wait causing wide bid/ask spreads which will cost JP even more. whoops.

**java logging**, which framework to choose? After a stack overflow
conversation
(http://stackoverflow.com/questions/354837/whats-up-with-logging-in-java)
I'm guessing I should use slf4j and logback. Done. Today I learned (from
code at work) that you can interrogate the api to figure out what
appenders/loggers are configured so you can do things to these at
runtime. Never gave that any thought till I saw the code and thought,
"that's neat." Trying to decide if I want to use JDBC appenders instead
of text. didn't have time to dig in to see if 1) they're more performant
because if they are I'd like to use them as a deep access log to allow
analytics on my method calls and whatnot.

**gainseville punk bands** and against! me. trying to figure out how
much I remember about against! me because they've been trending. I've
forgotten more than I know. In fact, I probably only know of against! me
because someone gave me a few songs so they're on shuffle and also the
admin from cardiology really likes them and told me about a concert she
went to last summer. I think that's the extent of my knowledge on pretty
much every band until I go to wikipedia and read for 45 seconds and
pretend like I know everything about them. yes, that's my roll.

I've given up FB for twitter because I can say stupid things on twitter.
To me, Twitter is FB without the cognitive strain of wondering what all
these people I only half know from 20 years ago think about my status
updates. By design, i never mention anything personal on any social
site, until I have to due to well-deserved pressure which is also
completely removed from twitter (why would you ever post anything
personal on twitter?) but now I have this feeling that 1) i try way too
hard to be funny. 2) am i funny at all? 3) people use this thing as a
marketing tool to further their careers and to self-promote a well
branded image of... themselves. I just talk about meaningless crap and
make awful jokes. Is that OK? should I be using social media to put
myself in a better light? should I (what are the benefits of) use(ing)
social media platforms as a window display of who I think I am as a
person? Or, is it that I am, in fact, displaying my true self and
what/who I think I am is off mark and I am, in reality, shallow and
unable to have an intelligent conversation about the things I think (I
think) are important? As a parallel thought, I love to tweet about pop
culture and sort of poke fun at it, not because of hate or some
self-righteous thing where I sanctimonisouly criticize things people
love with a feeling of smug moral superiority making me intolerant of
other's opinions and behaviors, but because I genuinely love hearing
about what other people (who have feelings) spend their spare time
thinking about and seeking out on the internet. Sure, I do not like,
"call me maybe" and will never read "50 Shades of Grey" but I love that
millions of people do like these things enough to make them a Thing. I
love the author of 50 Shades said, in an interview, that she loved
Stephanie Meyer's Twilight so much that when she finished reading them
she was inspired to write her own books. There is a lot to be said about
that. Something about inspiration and believing you can do it to and
having the gumption, fortitude and determination to write novels on a
goddamned blackberry while commuting to work. I love that. And, for some
reason, I express my love for these amazing things that fall completely
out of my demographic by mentioning them and poking a little fun, when
what I am really saying is, look at me, i know about these Things. This
is easier, somehow, than bringing to light things that are important to
me.

I constantly google things like "define:self-righteous" because I never
know if I'm using words correctly and goddammit, words have actual
meanings. you can't just type stuff that sounds right. If I had to
guess, i'd say i'm running at about 75% correct usage.

Do an image search for **"1957 Ferrari 625 TRC Scaglietti Spider"** It
is gorgeous.

**bonnie (prince) billy (Will Oldham)**- a coworker pointed me to this
prolific songwriter four days ago. I like his stuff and had never heard
of him before. Within 2 days of coming to know about this guy, his
name/work has come up in a blog post (one week one band) and as a
listentothis on reddit. How does that work? How many times has he come
up but I wasn't paying attention? how many great things do I miss or is
it that once you hear about something you gravitate toward the sources
that likely contain that Thing? Or, is it the Universe (random chance)
trying to tell us something. And why is it I randomly thought about the
**daily coyote** (haven't thought about that in at least 2 years) and
checked in how she was doing the day she put up a long post about how it
is OK to eat meat as long as it (the livestock) is treated really well.
Which, fine, ok, that's good. You can't eat wheat, so your diet is
already restricted, and you like meat, so ok, justify it, that's great.
And Then, **5 days later she announces she used the money from "the
daily coyote" book to buy calves which she is now slaughtering for her
new company, "Star Brand Beef" which is basically she hugs the cow
before she loads it on the slaughterhouse truck where they get sliced up
and packaged so she can sell you meat over the internet.** There is so
much wrong and so much right about that i feel like it balances out to a
non-story.

**Pandas + rapidQuant** = things I would like to spend some time
learning but can't 'cause there's just so much.
http://www.lambdafoundry.com/rapidquant.html http://pandas.pydata.org/

Also, trying to find time to read **Corporate Finance : A Practical
Approach** by Clayman, Michelle R.; Fridson, Martin S.; Troughton,
George H.; Scanlan, Matthew. it is a CFA prep book, but it gets the job
done. available electronically via the wustl library but I can't get it
when I'ma home.

**Manifest file in a jar…** mostly useless. Google's guava lib is really
good. I can't decide if it and apache-commons libs are complimentary or
duplication... I'm using both in the same projects. i probably shouldn't
over think this.

Just back from a **coworker conversation re: sleep schedules** which led
to an epic realization. 10 years ago I had a roommate who had a
ridiculous 2 hour a night sleep cycle punctuated by a good 20-30 hour
sleep binge on the weekend. Sure, she got a ton done and became an MD in
the process, but you can't explain that w/o adderal. Never gave that any
thought until just now. I don't think she was like that until after she
started hanging out with a bunch of young doctors. I was living a real
life Jessie Spano I'm so Excited! SBTB episode. I was screech, of
course. I'm always Screech...

The only way (I think) to get good at something is to practice it by
compulsively working on really hard problems that use the "thing" you
want to get good at and seeing them through the end. At least, as many
as possible. Anecdote: I got really good at debugging code I had no clue
what were doing because of a work-study job at an imaging lab that
required me to fix undocumented code that did crazy physics simulations
on tagged MRI DICOM data.

She had the kind of face you'd expect to see on a Neutrogena commercial.

* * * * *

#### 2012 05 26

Reading [The Real war
1939-1945](http://www.theatlantic.com/past/docs/unbound/bookauth/battle/fussell.htm)
and just wanted to keep this in mind:

> A little booklet issued to infantry replacements joining the Fifth
> Army in Italy contained tips to ease the entry of innocents into
> combat: Don't believe all the horror stories circulating in the outfit
> you're joining. Don't carry too much stuff. Don't excrete in your
> foxhole -- if you can't get out, put some dirt on a shovel, go on
> that, and throw the load out. Keep your rifle clean and ready. Don't
> tape down the handles of your grenades for fear of their flying off
> accidentally -- it takes too long to get the tape off. Learn to dig in
> fast when shelling starts. Watch the ground for evidence of mines and
> booby traps. On the move, keep contact but don't bunch up. And use
> common sense in your fight against fear: \
>  Don't be too scared. Everybody is afraid, but you can learn to
> control your fear. And, as non-coms point out, "you have a good chance
> of getting through if you don't lose your head. Being too scared is
> harmful to you. " Remember that a lot of noise you hear is ours, and
> not dangerous. It may surprise you that on the whole, many more are
> pulled out for sickness or accident than become battle casualties.

#### 2012 06 13

Today I'm going to present a situation and leave it to you to decide if
my reaction was correct.

I like to take a short walk to a coffee kiosk in the hospital where I
can get a decent shot of espresso for \$1. I toss in a few packets of
sugar, let it cool for the walk back to my cube, and it's perfect. The
same lady is always there and she's quick, and nice, and doesn't talk
much. Perfect.

Today I went around lunch time and she was eating while working. No big
deal, although she did say, "what do you want?" with a mouth full of
muffin, but, come on, that's funny. She took my money and started my
drink. I grabbed a few packets of sugar and waited. She saw said packets
and motioned for me to hand them to her. How nice! I passed her the
sugar and she ripped them open and poured them in. Then she reached in
my espresso with her fingers to retrieve a packet she had dropped. It
took her a second, but she got it (how did that not burn?) She let it
drip for a second, tossed it in the trash, lidded the cup and passed it
to me with a smile. I thanked her graciously for the additional service
of adding sugar, walked out of sight and tossed that dirty cup right in
the trash.

#### 20120515

**I'm recording vocals and guitars** for a folk/rock album (the band I'm
in is called "The Sorry People") but I only have an sm58 for a mic and
an maudio usb interface. I tried some vocals this morning before work
and realized the sm58 is not going to cut it. I did some guitar tracks
with it and wasn't entirely pleased, but it is good enough. Sadly, not
so much for vocals (i need all the help I can get, quality wise) I know
I need a good mic, but also thought I needed a good, tube preamp. After
doing some research, it looks like as long as you have a good, clean
preamp with enough gain, the fact that it has a tube in it doesn't
matter as much. I don't know if my cheap maudio interface has enough
clean gain for a good condensor mic, but i'm sort of at the point where
I don't have a choice. I can borrow a friend's usb interface that may
have more/cleaner gain, but I need to source a mic somewhere. I do have
access to a blu, but I... I don't think i like how it sounds. I'm going
to try to get access to an AKG a friend may be able to let me borrow....
cool story, bro.

I'm working on a list of the bare-minimum requirements for a customer
facing web app... all the technologies and features you have to be
concerned with before you can open a web-based business. things as
simple as an SSL cert to the logic behind signups and payments. There's
a lot to think about!

So many shows are about horrible people.

* * * * *

#### 2012 05 16

Let's talk about the **kelly criterion**. **The Kelly Ratio** is how
much of your bank roll you should bet given a probability of winning,
losing, and your edge over the house. This type of strategy can be
applied in many different domains, obviously for gaming, sort of for
investing but why can't it be applied when estimating other finite
resources? Could your "bankroll" represent the "amount of time you can
spend" (the finite resource)? Not sure that works because I haven't
thought it through, just thinking as i type. I digress. to use the kelly
criterion, we have to calculate the player's edge. Say you're playing a
game with a dealer where odds are 6/5 and payout is 7/6, or, rather,
odds of losing are 1.2 and payout is 1.167. Let's break that down. Say
you play the game 11 times. you'll win 5 times and lose 6. Bet \$12 each
time. You'll wind up with \$12x(7/6)=\$14 each time you win and \$0 when
you lose. When you play 11 times, you'll win 5 times giving you
5x\$14=\$70. you spent a total of \$12x11=\$132. you lost 6 times which
is 6x\$12=\$72. In other words, in 11 plays you lost \$2. edge is
loss/total so that's \$2/\$132 = 0.015 which means the dealer's edge is
1.5%. Your edge is -1.5%. Don't make the bet. Instead, try being on the
other side of the bet (become the dealer.)

We're trying to figure out the optimal fraction of our total wealth
(bankroll) to bet on each game that will maximize our long term
winnings, ignoring volatility but assuring we always have enough \$ to
bet on the next game (don't allow ruin). The fraction is ((odds received
on win)\*probability of winning - probability of losing)/(odds received
on a win). lets bet on a coin toss where the dealer pays us 100/99
(1.01) on each win. In english, that means for every dollar you bet,
they'll give you your dollar back plus one penny if you win. pWin = 0.5,
pLose = 0.5 so (1.01\*0.5-0.5)/1.01=0.005 = 0.5% That means we should
bet 0.5% of our bankroll on each toss. Given those odds and payouts,
that makes sense because we get so little for winning. What if we played
the same game but the dealer payed us 2/1 for a win? In english, they'd
pay you \$2 for every dollar you bet. Bet \$1, you keep your \$1 and
they hand you \$2 for a total of \$3. Common sense says you'd probably
want to bet a lot more of your bankroll at that point. Let's do the
math. 2\*0.5-0.5/2 = 0.25 which means we'd want to bet 25% of our
bankroll on each play of the game. Doing so minimizes the chance of ruin
and maximizes our total winnings in the long run.

**Let's talk about roulette.** put \$1 on red which pays even money, or
1/1 or 100%. there are 18 red numbers and 20 non red. So, probability of
winning is 18/(18+20) = 0.474. plug that into our formula to get
1\*0.474-0.526/0.474 = -0.1097... what's that negative number? That
means you should take the other side of the bet, or rather, bet AGAINST
red using 10.97% of your bankroll. But, there's no betting against red,
so you're better off moving along. The casino will always win. (this
paragraph is copied from the wikipedia article on the kelly criterion.
Go there for more fun information.)

Thinking about the best way to structure my **Selenium 2** tests. Need
to retrieve the base url from a properties file, of course. probably
should have some support inside the application that lets the test avoid
certain, untestable-by-selenium features such as email confirmation
codes. Maybe the test could log in as admin for a second to grab a copy
of the confirm URL so it can be used in subsequent tests. In other
words, the app has to support certain features to make automated testing
possible. no big deal, but yet another thing I didn't foresee.

Watching shark tank I couldn't off the top of my head how the sharks
were **valuing a company** based on the founder's cash request and the
equity offered... I was over thinking it, of course, but here's some
things I learned. Typically, a VC wants a 5-10x return on the
investment. If I'm a VC and I invest \$25k for 25% of a company and
expect a 10% return then I want to see a check for \$250k when the
company exits... That can only happen if the company sells for \$1M. If
the company sells for \$500k then I get a 5x's return so, as a VC, i
should still be happy. (rule of thumb, a company's valuation is
sometimes 2x's revenue) (Fred Wilson says 1/3 sell for 5-10x's return.
1/3 sell for 1-2x's return and 1/3 fail (0x's return). Since VC's get
any leftover cash first, the founders sort of have about a 1/3rd shot of
making money, see the paragraph after the next for some discussion.)

But, that doesn't jive with the numbers they throw around on shark
tank.. That's because they're not thinking of their return at that time.
They're just valuing the current price of the company based on what the
founder says. So, if the founder says I want 100k for 25%, the shark
tank guys call it a \$400k company.

Back to the "founders have a 1/3rd shot to make any money at all" idea.
This may or may not be a copy/paste from Fred Wilson's blog. if it is,
well, then it is, if it is my words, then great: "A VC is negotiating
how much of the upside they'll be in the 1/3 of deals that produce
gains. Their deals provide as much downside protection as possible. A VC
deal is sort of a loan plus an option where the option part is in the
money fully 1/3 of the time and partially about 1/2. loan is repaid
fully 2/3 of the time and partially 1/3 of the time."

With that said, I had an idea a few weeks ago. **I propose a monte carlo
approach to predict project viability and using the results of that
calculation as inputs to a binomial pricing model that will let a
founder choose among many projects (ideas) to maximize the likelihood of
a positive exit.** Here's the beginning of an abstract I wrote that day:

> "This paper introduces a system for managing uncertain data when
> predicting market results using a binomial options pricing model to
> predict exit valuation across multiple projects. This system lets one
> choose the best projects based on predicted returns using a monte
> carlo approach to predict project viability."

#### 2012 05 23

I've had no time to think about anything interesting for the past four
days. Babysitting, birthdays, Avengers, got rear-ended, did a couple of
hard pushes writing boilerplate code. Took a vacation day so I could
work my other job. Only got to run once.

#### 2012 05 18

The Lumineers' "Slow It Down" is my favorite song of the day.

#### 2012 09 10

Whoops, I forgot to blog. Read this, especially the part that talks
about the Olympus Mons
[http://www.warrenellis.com/?p=14314](http://www.warrenellis.com/?p=14314)

#### 2012 09 12

Ok, so the real reason i haven't been updating this sorry excuse for a
blog is i migrated everything to EC2 and I still haven't written an
update script to easily publish trickykegstands. Or any of my sites,
really.

some links:

-   \<[http://www.ritholtz.com/blog/2012/08/the-15-rules-of-web-disruption/](http://www.ritholtz.com/blog/2012/08/the-15-rules-of-web-disruption/)
-   \<[http://conversionxl.com/pricing-experiments-you-might-not-know-but-can-learn-from/](http://conversionxl.com/pricing-experiments-you-might-not-know-but-can-learn-from/)
-   \<[http://blog.supplysideliberal.com/post/31224211784/the-logarithmic-harmony-of-percent-changes-and-growth](http://blog.supplysideliberal.com/post/31224211784/the-logarithmic-harmony-of-percent-changes-and-growth)
-   \<[http://simonbenninga.com/](http://simonbenninga.com/) - had the
    library buy a copy of Principles of Finance with Excell
-   \<[http://www.reddit.com/r/AskReddit/comments/zhz8d/ive\_never\_been\_able\_to\_see\_where\_ill\_be\_in\_5/c64sa0p](http://www.reddit.com/r/AskReddit/comments/zhz8d/ive_never_been_able_to_see_where_ill_be_in_5/c64sa0p)
-   \<[http://www.chicagoreader.com/gyrobase/dt-max-biography-of-david-foster-wallace/Content?oid=7303700&showFullText=true](http://www.chicagoreader.com/gyrobase/dt-max-biography-of-david-foster-wallace/Content?oid=7303700&showFullText=true)
-   \<[http://t.co/AAE4OJz4](http://t.co/AAE4OJz4)

#### 2012 05 24

HA! this week has been one disaster after another, but everything still
seems to be on course and everyone is pretty much fine. R had a cold, S
caught it and started running a fever. We sat with him in the ER from
midnight till 4am last night. Now I have the cold. I got rear ended on
the day that I had to take a vacation day from one job to work a full
day on the other of which I did not get enough work done and should
probably take another day or two off. I'll get a new bumper, i guess,
eventually. I had to take a few hours off today to recoup from last
night's ER visit. As if R didn't already have enough going on taking
care of her and S, she lost her wallet so we had to do the whole
transfer money out of the ATM account and keep close tabs on the credit
card statement, but luckily she found her wallet so that worry is done.
Her computer was on the fritz and the parts
for-which-she-had-to-drop-everything-to-go-buy were incorrect. So, I
wound up fixing the broken part with solder and tape while we ordered a
replacement online and had to return the wrong part today on my way in
to work (late.) I am falling behind on all 4 of my jobs to the point
where all I can do is sit back and laugh. There is so much work I think
Keeping Up is an unrealistic expectation. So, I stay the course. That's
all I can try to do. I laugh as I type this because even though
everything is falling apart, everything and everyone really is fine and
there are no real worries. Everything is just a silly mess soaked with
vomit and poo right now. Nothing more. This isn't supposed to come off
as sympathy seeking or complaining even though I know it does. It is
more of a setup for a side-note:

ER waiting areas really are something, aren't they? I work at a hospital
so I'm exposed to them (and the places just outside where smokers sit)
almost every day. The concern, tears, pacing and phone calls you see
happening in these areas make them (the ER waiting areas) feel to me
like the front row seat to the last, raw, true glimpse of human beings.
Catching a shaky, one ended phone conversation that starts out with, "We
lost him" and is punctuated by quick draws on a cigarette by someone
sort of hunched over with one arm akimbo probably isn't right but
accidentally catching that moment while walking between work areas
(really, just cold, grey rooms filled with cubes.) on a generic workday
is wow (this is something that someone else can do a better job of
describing with real words that mean something but I'm a quitter who
settles for wow.)

Last night, after committing various moving violations on the way to the
hospital, I dropped S & R off at the door so they could rush inside
while I parked the car. I got a good spot then walked with a woman into
the ER. She beat me to front desk and asked about so-and-so and the ER
nurse said so-and-so was getting a CT and they couldn't say anything
more but that there was a whole group of friends there already who knew
everything. She pointed to a dozen or so fresh faced HS kids each with
that look huddled in chairs, texting and hugging. I eventually found S &
R and R said, 'wow, did you see all those kids? I walked in behind 2
parents, i think their son tried to kill himself and those were all his
friends.'

wow. yeah, i think my week hasn't been half bad.

* * * * *

[old content here](someThoughtsOld.html)
