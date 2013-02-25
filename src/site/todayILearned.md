### Today I Learned

#### 2013 02 24

[monsters](http://armp.it/#monsters) - a work in progress.

IF you are using Hibernate and JPA and have cascade set in your relationships, you HAVE to put the cascade
type in the @OneToMany annotation for JPA to see it. If you only set it in the hibernate @Cascade it will probably 
not see it and you will have bugs. I'm saying, do it like this:

@OneToMany(fetch = FetchType.EAGER, targetEntity = Role.class, cascade={CascadeType.MERGE})

and forgo the extra @Cascade annotation if you don't need it.

I noticed the problem when JPA was essentially trying to a cascade.ALL even though I had an annotation telling it to
only MERGE.  I removed the hibernate annotation and added the cascade option to the JPA annotation and everything
started to work. The more you know...

Something something oral history something something.

Say you put your task scheduler in your applicationContext.xml. Say you also reference that file twice in your web.xml
once for the context, once for the dispatcher servlet. Well then, your scheduled tasks are going to run twice. So, don't do that.
I created an applicationContext-tasks.xml and put the tasks there and passed it to my contextconfiglocation. that fixed the
double tap.

#### 2013 02 23

When I have a key->value Map, i often want to serialize it to json. Doing that gives:

{"key1":"value1","key2":"value2"}

Say I want to turn that into a select box. how do you do it? Here's how I did it:

~~~~~~
		$.getJSON("/path/to/json", function(result) {
		  var options = $("#options") //the id of the select box to which we'll append;
		  for (var key in result) {
		    if (result.hasOwnProperty(key)) {
		      options.append($("<option />").val(result[key]).text(key));
		    }
		  }	
		});
~~~~~~

but I thought I could do better so I did:

~~~~~~
     	$.getJSON("/path/to/json", function(result) {
 	    	var options = $("#options"); 	
 	    	$.each(result, function(key, value) {
 	    		options.append($("<option />").val(value).text(key));
 	    	});
~~~~~~

But then they list was unordered, so I added some sorting:

~~~~~~
    	$.getJSON("/path/to/json", function(result) {
	    	var options = $("#options"); 	
	    	var keys=[];
	    	$.each(result, function(key, value) {
	    		keys.push(key);
	    	});
	    	keys.sort();
	    	$.each(keys, function(index, key){
	    		options.append($("<option />").val(result[key]).text(key));
    		});
    	});
~~~~~~

Op-Shop is another term for thrift shop.

#### 2013 02 22

Zookeeper + elastic search with the zookeeper plugin that turns off _Zen Discovery_. Remember, zookeeper can keep track and manage SOLR instances, as well.

I love the idea of making an open source, boilerplate kind of spring app that has all the features I think are necessary/useful for an MVP, but actually doing it is tedious!

Some pomodoro notes - <http://en.wikipedia.org/wiki/Pomodoro_technique_software> <http://nodetimer.com/>

I can get free access to ValueLine and Morningstar through the St. Louis County library. wow. <http://www.slcl.org/research/databases-a-z/v>, <http://www.slcl.org/research/databases-a-z/m>

#### 2013 02 21

Worthless trivia - [Peacock Alley](http://en.wikipedia.org/wiki/Peacock_Alley_(jazz_club)) and Club Riviera were the hot spots when my 70 year old friend was cavorting with the glitterati around St. Louis in the 1950's.

I would like to read this and implement it soon - <http://centripetal.ca/blog/2011/02/07/getting-started-with-selenium-and-jenkins/>.

There is a robot on another planet drilling holes into rocks right now. Humans effectively have a mine on another planet. Baby steps, of course.

[The Antics Roadshow](http://www.youtube.com/watch?v=SA27ffal7Yk) is a fun show that might have been created by Banksy.

#### 2013 02 20

Remember the Pepsi Chill-Out?

I learned about [Haim](http://en.wikipedia.org/wiki/Haim_(band)) today from audioindie: <https://www.youtube.com/watch?v=0ovrplcNwXo>

I'm pleased with my Warby Parker experience. I bought the Crane frames in Sugar Maple. On one hand they feel like inexpensive frames. On the other hand, they're nice looking, you can't beat the price, I got them in less than a week, and I can see. The only downside is I'll have to adjust them myself so they fit my face. I wonder what people who do not have a heat gun do.

My app had a log4j.properties file in the classpath which had environment specific stuff hard coded into it (and therefore committed to mecurial.) Remember back when I pulled all the passwords and environment specific config out of the config files that lived in the webapp? I couldn't figure out how to do a similar thing with log4j.properties. So, I left it in my classpath (the WAR file.) Today I realized I can tell web.xml to look in /etc/\<appname\>/log4j.properties for the file. Yes, that path is hard coded, but, the /etc/\<appname\>/\<appname\>.properties file is also hard coded in applicationContext.xml. I feel relatively comfortable having just those two places that call out a directory that _has_ to exist before the app can start up. At this point, I can't think of any place in my app that has things that shouldn't be hard-coded in the source, database, or in some arbitrary place. Everything is in /etc/\<appname\>/*. Feels good, man. Added bonus is I can set up my graylog2 logger with appropriate originHost based on the machine that is running. That means I can filter by machine. Now I'll be able to easily tell what's coming from development, test, production, etc. 

NEATWHEELIES.COM IS AVAILABLE!!! If only I had a reason to buy it.


#### 2013 02 19

Three more reasons for using markdown instead of Word: grep, xargs and sed.

#### 2013 02 18

[Sand Mandala](http://en.wikipedia.org/wiki/Sand_mandala) & [Sisyphean](http://en.wikipedia.org/wiki/Sisyphus) - I'm writing a book/short story about a young man who spends the majority of the time re-building the runway at his family's old farm. He steals airplanes and grows a little and eventually crashes and the runway turns back into an overgrown field. If everything goes to plan, the book or story should be finished sometime around 2022.

Are reposts (re: reddit) simply A-B tests for content? Or, maybe training sets for click maximization algorithms? Even [_I Can Haz Cheezburger_ admits that data is the most important thing to drive business](http://venturebeat.com/2012/08/23/screw-design-and-get-data-says-ben-huh-of-i-can-has-cheezburger/) - There is no way they only use algorithms to lay out their pages. Why wouldn't they do some crazy optimization for content to drag people in as deep and for as long as possible. In fact, that's the only thing they should be optimizing for assuming that is what drives their revenue.

#### 2013 02 17

drained.

**ok, weird moment**

I have awesome, vivid dreams and I love coincidences. I know you're not supposed to talk/write about dreams because no one cares and it makes you sound like a nut, but this is all I've got today.

I took a break from working to read ["A Look Back" article about 1940's gang violence in stl](http://www.stltoday.com/news/local/metro/look-back/a-look-back-former-boss-of-notorious-egan-s-rats/article_25148622-6c7e-50af-8e46-d77fdea349af.html). I mapped a couple of the addresses including the one mentioned here: "The Rats’ hangout was the Maxwelton Club, on St. Charles Rock Road at Pennsylvania Avenue." There's nothing much there anymore except a few cemeteries (and a children's psychiatric hospital? sad!)  

An hour later a FB friend posted photos of a mausoleum she was in (it was very cool!) someone asked her where it was and she said it was at Valhalla on St. Charles Rock Road... I was like, wow, that's weird, i was just looking at a cemetary on a map, i wonder if it is the same one. I found Valhalla's website and yep, it is very close to where the Maxwelton Club used to be. Then I scrolled down and saw the Valhalla building. Sho 'nuff, I was in and around building that _looked exactly like that_ in a dream a few months ago. I was being chased and it wasn't cool but I stumbled on this very cool looking mausoleum and kind of hid there for a while.

Fun coincidences! I really want to drive up there to see if I get chased.

**done**


#### 2013 02 16

I finally shut down my underutilized-but-always-on EC2 instance. Look at me, being all frugal and whatnot.

Regarding "What'd I Say" on the 2004 soundtrack for "Ray!" I love how the instrumentation slowly falls into place rhythm-wise. The band is like, "Whatever... We'll hit a couple things here and there until he gets a groove going." They get it together just in time for Ray Charles to miss the mic when the words start. The whole intro is somehow both wrecked and perfect. "Roller, baby..." I can't find much information on this particular recording. IMDB says it is courtesy of Atlantic Records but it says nothing about where or when it was recorded. I'd link to the song but I can't find one for you.

Wait for a sunny day and find a kitchen who's sink is under a nicely lit window. Thaw frozen blueberries in a stainless steel bowl. Eat the blueberries but leave the juice. Rinse that bowl under a stream of water and watch closely. Wait for the instant where the purple juice turns blue. That's my favorite color. A white bowl works, too. But, it has to be stainless steel to be my favorite.

Holy shit, my continuous integration process is amazing. I committed a change set to github. My Jenkins server immediately started building the project. When the build finished Jenkins deployed the war to my test tomcat instance. The webapp restarted and my changes are live. I'm checking my static code analysis results and smiling like Whitney Houston. I have no idea what that means...

#### 2013 02 15

If your csv file starts with the string, "ID," Excel thinks it should be a SYLK file and barfs a bunch of warning dialogs <http://support.microsoft.com/kb/323626>

I'm setting aside my hatred for funk and fusion so I can learn about [The Meters](http://en.wikipedia.org/wiki/The_Meters) today. They're a 70's funk band from New Orleans. I get it, I think. There was a 5 minute bass solo which included a minute of wha wha and a few moments where he ignored the rest of the band (it is a polyrhythm! applaud goddammit!) I guess they aren't fusion at all, certainly funky, though.

**locking down my workflow for editing this site** 

Last week, (2/8/2013) I was complaining a bit about maintaining this site in markdown. Specifically, dealing with line breaks while writing and not having a good way to spellcheck. Thanks to a friend's tweet, I learned that VIM can deal with soft wrapped lines pretty well. Check it <http://alols.github.com/2012/11/07/writing-prose-with-vim/>. The first thing I did is convert this page's source (markdown) to soft wrapped lines. Then I realized I don't use VI. I happen to be using eclipse as a text editor because it is always open and I like organizing the files in a "project." Today I switched from the default editor to WikiTextEditor. Not having to manually manage line breaks makes typing and editing a breeze. In fact, it makes me want to type more. Ruh-Oh! 

I converted the line breaks by hand. I might (eventually) have to run a script on all the pages if editing in this mode turns out to be better. So far, it is WAY better. I love it. If you're into emacs, i just found this <http://blog.avarthrel.org/blog/2011/05/lets-just-use-emacs.html>. That brings up some interesting ideas, like splitting your editor to work on 2 sections of the same doc at once (eclipse does this) and having multiple files open at once (also, available in eclipse). I'm still missing a decent spell check, though. Let me try to fix that.

Fixed it!. First, download one of Kevin's word lists from here <http://wordlist.sourceforge.net/>. Install it in eclipse as a user dictionary (Preferences-\>editors-\>text editors-\>spelling). I used Kevin's scowl list by concatenating all english and american words into a single text file. I saved it to /jordan/notes/allWordsForSpelling.txt and pointed the eclipse user specified spelling list there..

There are a ton of words in there and it has helped tremendously. I didn't think I could get the spellcheck to suggest correct spellings until I noticed wikiText editor has the "quick fix" option. Hover over the word and hit cmd-1. It gives suggestions. Rad!  A few other ideas if you're using eclipse. Want a word count? Do a file search, select the file, enable regex and search for \w+ Sure, it's clunky, but it works.

I spent a few minutes looking at org-mode, but I don't have the energy to learn it. Immabe happy with a smattering of markdown files and my new, soft-break editor.

Have I mentioned how awesome pandocs and make are for generating the html and shipping the contents off to S3? If not, have a look at the [github repo](https://github.com/jordan52/trickykegstands) where all this BS lives and check out that make file. It isn't anything fancy, but it saves me a lot of time. I can publish with one command.

Finally, I set the font in the text editor to be something a little more readable. Now I'm writing comfortably inside a IDE. I have like no excuses left for not writing armp.it.

**done**

Google returns zero results for Compilenaut. Let's hope from now on it will return at least one.

Remind me to go here when they open this spring - <http://www.strangedonuts.com/>

#### 2013 02 14

Pandas explained in ten minutes <http://vimeo.com/59324550>

If you're sad that wasn't a video of baby pandas, here is a bucket of sloths <http://vimeo.com/59234110>	

**$1.5M**

I've been working on a thought experiment where I derive paths to get $1.5M\*. Or, rather, what exactly does it take to create $1.5M of value. Take t-shirt sales, for example. (I'm making these numbers up. I'm sure they're naive. Try not to get hung up on them.) Say you make $1.30 profit on each shirt sold. Assuming a 30% tax rate, you'd have to sell 1.5 million shirts. How can you sell that many shirts? It will take herculean combination of marketing and luck no doubt, but what about manufacturing and distribution? What kind of support would you need (server capacity, call center, physical warehouse, employees) What kind of pains are bound to happen at that sort of scale? What are your quantifiable risks?

Sure, it is silly but it takes me way outside my comfort zone. That has got to be good, right?. In the future I'm going to apply that sort of framework to the ideas I think of or get pitched. A sad part of it is applying it to most of my ideas lead to the whole, "You'll make more money opening a couple of Dunkin' Donuts and it will be way easier." conclusion. **I call it "The Dunkin' Donuts Test" &#174;** 

Maybe I should write a self-help how to book based on the Dunkin' Donuts Test. Could that book net me $1.5M? How long would it take to write the book? What does it take to market a $1.5M book? What are the risks involved? Take an objective look at existing book sales, publishing figures and the number of starving authors out there... What's the back of the envelope conclusion? It would be eaiser and less risky to open a few Dunkin' Donuts...

And why Dunkin' Donuts? My grandfather was a baker so it is in my blood. Sadly, I can't bake so I'd needsort of a turnkey franchise to set everything up and I'd need to hire people who can deal with mixers and whatever it takes to make food. 

**done**

The first thread on this HN post <http://news.ycombinator.com/item?id=3816350> (which is about Gabe's argument for a single co-founder) is a nice conversation about diversifying with several, small, monthly income type projects.

The Show is the Rainbow is now [Touch People](https://soundcloud.com/touch_people) and after checking his twitter feed it seems like he is a big gamer. Cool story, brah.

\* - this is what I consider the lowest rung of f-you money. Enough to retire on some rocky land in the Ozarks and not do anything except maybe learn to hunt.

#### 2013 02 13

Before this morning the only [Deer Tick](http://en.wikipedia.org/wiki/Deer_Tick_(band)) I've heard is off Divine Providence (they're latest album.) Hearing some things off [War Elephant](http://en.wikipedia.org/wiki/War_Elephant_(album)) is a surprise. They're folk-alt-country? I had no idea. I'm sure the recent change to their sound was a deliberate move, but I like to think that through the years they've been accidentally writing these one-off songs that didn't at all fit with their sound. Then one day they were like, "let's finally record all these fuckers and put them on one album."

Last night in the State of the Union address Obama said, "Today, our scientists are mapping the human brain to unlock the answers to Alzheimer’s." I work on the platform that handles imaging data for the Human Connectome Project and all that FDA stuff I bitch about is for a new class of Alzheimer's drug. Our lab is managing the brain imaging data. Fun!

#### 2013 02 12

I have no problem with [The Show is the Rainbow](http://en.wikipedia.org/wiki/The_Show_is_the_Rainbow).

Little else going on today. This FDA BS is getting me down. But, band practice is in a bit so that'll make it all better.

She walked slowly though her gait was one of a barback sliding quickly through the crowd with buckets of ice. Her walk is best described as some sort of reverse moonwalk in high heels.

Practice was better this week. I was more with it than last week. The two new songs are coming along nicely. Best joke of the night was Frank Ocean was simply channeling the spirit of Wesley Willis Sunday night at the Grammy's.

Speaking of jokes, here's a doozie I made up while brushing my teeth, "Of course i'm jealous of her ex's. They can dodge bullets." This, my friends, is why I'm often confused for a comedy genius.\*

\* - not true.


#### 2013 02 11

Frank Ocean is a little rough around the edges when it comes to Grammy performances. I should have watched. Instead I was working.

I still love We Were Promised Jetpacks and then a Counting Crows song came on and I thought, "oh you..." and then i listened to it and then i realized that there is always room for these effusive songwriters like Dashboard Confessional and now, who, Mumford and Sons? What are they really doing? Playing the game. And then 15 minutes later I realize I'm still listening to Counting Crows.

Oh, and yeah, so a lot of the stuff I've been listening to relies heavily on rich reverbs and echo (braids, givers, seryn, tree ring) so that's sort of the sound now. And then some old pearl jam or this counting crows stuff comes up which relies heavily on multitap delays. Was multitap delay sort of the sound of the late 90's? I know I was using the hell out of it (even though I had no idea what I was doing and it sounded like crap)

Friday the sys admins were losing their shit. Today it is the developers who are doing a live demo in ten minutes. I'm glad it isn't me.

#### 2013 02 10

Google API's are a tease. I know they can do what I want them to do but google imposes artificial limits that stop me just before I get a solution. I can't blame them, of course.

"Foodfight" is a terrible movie I want to see: <http://www.youtube.com/watch?v=uROQ9nplxIY>

**Notes from Ray Dalio's Manifesto** 

If you can give  society what it wants you have a higher likelihood of being "successful." If you can, move forward using a process of productive adaptation (assuming you can observe the landscape as you trudge through it and all of its inevitable setbacks) in an effort to "evolve" your process in cooperation with the general path of the system's nature. Don't let your self interests be in conflict with the system because you won't succeed. Nature is testing you and it is
not sympathetic. You need to step back and design a machine of the right people doing the right things. Constantly assess and improve that machine by objectively comparing outcomes with goals. If the outcomes are inconsistent with your goals, modify the machine. Include yourself as part of the machine and place yourself in the correct role. If you aren't good at that particular role, be sure to fire yourself. Again, the most important requirement is you are objective and logical at all times. 

**done**

Download with curl and immediately untar: curl http://site/someFile.tar.gz | tar xvz

I used that trick to install elastisearch today. (these really are just my notes so I don't forget.) ./bin/elasticsearch to start it up. It is running on port 9200. Then I wrote an app to index a ton of json. hit http://localhost:9200/cases/case/_search Then I installed elasticsearch-head using these instructions <https://github.com/mobz/elasticsearch-head> use it by hitting http://localhost:9200/_plugin/head/

Elasticsearch might replace solr in our environment. However, i think elasticsearch's documentation is god awful.

#### 2013 02 08

<http://en.wikipedia.org/wiki/Saudade>

**The Gardener**

I'm oddly excited about using Quickbooks. I spent two hours with an accountant this morning and it sort of changed my life (not really.) I wonder what else I could learn by hanging out with someone I normally wouldn't. For example, what could I learn in 2 hours with a tow truck driver? How about 2 hours with a funeral director, or, I don't know, an arborist? 

I hang out with a gardener from timeto time and you know what? It is fascinating. One time he was showing me a book (he's a reader)and I opened it up and some sort of pressed leaf fell out and he was like, "Wow, let me have a look at that... Oh, yes, that's from a blah-blah-blah(latin) which is a rare species of blah blah (more latin) typically found in (exotic location.) I was somewhere in Clayton when I saw it. I was so excited I took a leaf." 

**done**

And holy shit, FDA documentation is a drag but the power keeps going out and the admin guys are running around losing their minds. Today also includes lots of chocolate milk and there is a surprise party tonight. It is a good day.

**Markdown is sort of fantastic**

Here's the deal. If you're on a team and trying to do documentation don't use Word. Make a simple rule: Everyone writes everything in markdown and everything is committed to bitbucket or github. This goes for specs, documentation, whatever. If you need some sort of fancy font or table, provide a stylesheet or embed some html. Doing this solves a sundry of problems. (I wanted to say "sundried list of problems" but i don't know if sundried is a form of the adjective sundry and it looks like sun dried as in tomatoes. which are fan frikin' tastic by the way.) You get your versioning under control, you don't have to worry about losing anything and you never have to deal with Word destroying your formatting.

Fuck MS Word. Excel? Excel is fine. Powerpoint? Ppt is annoying (use markdown if you can.)

The only beef I have with markdown is I can't ever decide how to deal with word wrapping. I do carriage returns manually right now instead of using an editor that wraps for me. Doing that is painful when editing, and i edit a lot (I know, doesn't seem like it, right?) Maybe I have
two beefs, but not with markdown per se. My editor is an IDE which barely has spell check. My mac doesn't have spell, So, well, until
I do a site-wide spell check this whole thing is going to be riddled with typos. yay.

**done**

My toynbee tile has not survived the winter.

This <http://selectadecision.info/> is a cold war era russian choose your own adventure type game.

I pulled this next thing out of my checklist doc (private) because it doesn't belong there. It belongs here:

Things to remember:

*  Kanban Board <http://en.wikipedia.org/wiki/Kanban_board>
*  Watch "The 400 Blows" <http://en.wikipedia.org/wiki/The_400_Blows>
*  This guy is a good photog <http://mrelllis.tumblr.com/>
*  This is a good forum thread <http://supertalk.superfuture.com/index.php?/topic/33420-style-inspiration/page__st__2310>
*  Learn more about superfuture.com

The superfuture thing comes from something I read on /r/malefashionadvice regarding a boot choice and the fact that yes, someone could pull it off, but "you'd have to be so ridiculously on point you probably wouldn't be on MFA in the first place" and then someone mentioned superfuture and I went there and kind of get it but not really.

#### 2013 02 07

I'm running on empty.

If you're close to using all of your RAM, quit screwing around. Go out and buy some more!

Pudenda... is it a real word? I'm at work so I can't look it up.

I can't get the hearbeat task to run in my app. 

Today I am... chatty. 

Creating documentation for FDA regulated trials is a drag.

How many people out there get some level of enjoyment out of making a joke that is either so meta or obscure that everyone listening thinks you are serious? This is one of my favorite things. Along those lines, sometimes I am bitter about growing up with a comically gifted set of friends. Here's why. When someone makes an average joke and everyone sort of chuckles I kind of want to smash their face with bricks. The joke was painfully obvious and there were a dozen other things they could have said that would have been funnier.

Of course, I typically keep quiet because I know most of my jokes aren't that good.  

This is a great D3 tutorial <http://alignedleft.com/tutorials/d3/>

Mixpanel - using properties <https://mixpanel.com/docs/properties-or-segments/a-tutorial-on-using-properties>

#### 2013 02 06

I should purchase parts at a discount site and take them with me when I take a car in for repair. I paid $84 for a rubber boot today. Never again.

I don't write very well anymore.

Frightened Rabbit's "Pedestrian Verse" is really good!

#### 2013 02 05

It is impossible for me to fake my way through band practice with this new band. There aren't enough of us in the band to cover mistakes. I like that.

#### 2013 02 04

Centralize logging (see Graylog2) is the shit. I never gave much thought to logs in the past but now that there is a way to search/filter and view all logs from all apps and servers from one dashboard, 
I want to use them for everything. I will spend the next few days making my log messages work for me. First thing is sort of a heartbeat that does a system check and spits it to a log. I'll be able to
filter for those heartbeat messages to assess the status of my apps realtime (and historically if I need to track down an issue.)

Warby Parker!

#### 2013 02 02

My life of late has been a grind house soundtrack of glitch punctuated by bits of progcore twee.

I am getting 2 pairs of glasses. Normal and computer.

#### 2013 01 15

Nagios: 'taint pretty, but it gets the job done.

#### 2013 01 12

The Chippewa boots are really nice! I busted out my vintage, made in England Doc Martens and cleaned them up. Now I have 2 pairs of boots. The docs are also very nice. I had no idea how good I had it
back then. I've worn nothing but crap shoes for the past 10 years and, well, now I know the error of my ways. Also, wool socks are phenomenal. I used to only wear them snowboarding like they were only for special occasions. I asked for a few pairs for Christmas and have been wearing them ever since. Amazing!

#### 2013 01 06

Boot Decision 2013!  I wanted Wolverine 1000 Mile boots, but they were $340. Then I wanted Red Wing Iron Rangers, but they were $285. I bought Chippewa Apache Lacer's for $136.

#### 2013 01 02

Miami Connection - <http://youtu.be/VpZu69OB2KM>

I moved configuration (passwords and tokens and whatnots) out of the webapp properties so I wouldn't accidentally push them to a repo. I wasn't sure the best way to do this, though. I explored using
jasypt, but it seemed like overkill, and its development isn't very active. I wound up putting everything into /etc/\<project\>/\<project\>.properties on each server. I figure the server knows
its own environment so it can be responsible for providing the correct settings in that properties file. I did not encrypt because 1) Each of my servers is typically responsible for one thing and 2)
if someone has access to that file on one of my servers, i have big problems anyway. Sure, I should encrypt sensitive data there, but I'm saving that for a rainy day.

#### 2012 12 19

A moment that, for me, is both terrifying and confusing.

#### 2012 12 18

lee /lē/ Shelter from wind or weather given by a neighboring object, especially nearby land. 2. The sheltered side; the side away from the wind.

#### 2012 12 17

We move faster if, for anything, to spend less time in it.

#### 2012 05 05

<http://en.wikipedia.org/wiki/Chingon_(band)>


[**Here is my last attempt at blogging consistently**](someThoughts.html)

