trickykegstands
===============

trickykegstands.com is one of my static websites. I converted it to markdown in Jan 2013 with the plan to start maintaining it. I kind of stopped because I moved the server to AWS and pushing files to it was a PITA. Since then I've moved everything to S3 which made it easier, but I wanted an easier way to make site-wide changes. I stripped out the header and footer (leaving it as HTML) and converted the meat to markdown so I no longer have excuses to not update the site. 

The site is built using make (invokes pandoc) and has a target to deploy to S3. If you want to build your site using a similar method, you'll need pandoc and s3cmd.

There's also a bash file that builds the site in a similar way to the makefile. It is no longer maintained.

The photos and media directories are ginormous so they're in my .gitignore and not here on github.

Not that anything on my site is worth stealing, but I have to say the contents of the site are owned by me, Jordan Woerndle and are not available for use by anyone else. Sorry!
