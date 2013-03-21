#Checklists

##Getting Seth to School

###Monday Morning - Hope

* Lunch Bag:
    + 2 4-5oz bottles of milk
    + 1 2oz bottle of milk
    + 2 nipples
* Stuffed Monkey
* Swaddle
* Pay for Daycare

###Tuesday Morning - Hope

* Lunch Bag:
    + 2 4-5oz bottles of milk
    + 1 2oz bottle of milk
    + 2 nipples

###Wed Morning - Mary's

* Lunch Bag:
    + 2 4-5oz bottles of milk
    + 1 2oz bottle of milk
    + 2 nipples
* Breakfast
* Lunch
* Snack

* Diaper Bag:
    + Notebook
    + Diapers
    + Wipes
    + Change of Clothes
    + Bib


* Pacifier on a Rope
* Paste Mon/Tues log from Hope into Notebook


###Thursday Morning - Mary's

* Lunch Bag:
    + 2 4-5oz bottles of milk
    + 1 2oz bottle of milk
    + 2 nipples
* Breakfast
* Lunch
* Snack
* Bib
* Diaper Bag:
    + Notebook
    + Diapers
    + Wipes
    + Change of Clothes
    + Pacifier on a Rope
* **$100**

###Friday Morning - Hope

* Lunch Bag:
    + 2 4-5oz bottles of milk
    + 1 2oz bottle of milk
    + 2 nipples

##Diaper Bag

* Spare Pacifier
* Extra Set of Clothes
* Toy
* Burp Cloth
* Bib
* 4 Diapers
* Wipes
* Spoon
* Puffs
* Sippy Cup
* If Milk
    + Milk
    + Ice Pack
    + Nipples
    + Nipple Cap
    + White Cap

##How to build this document
* use pandoc, make sure checklist.txt and checklist.css are in the Dropbox folder.

~~~~
cd /Users/jordanOriginal/Dropbox
pandoc -s -S --toc -H checklist.css checklist.txt -o checklist.html

*update*

I added this to trickykegstands so 
1) it is public. 
2) i don't have to do the above command 
3) I don't have to worry about being out of sync or losing any changes when working on it in multiple places. 

~~~~

##Domains I Have To Know About

Domain                   Owner           Host           DNS
------------------------ --------------- -------------- -------------
allnightrehearsal.com    Jim             S3             Route 53
analyticsjust.us         me              NOT USED
androidindie.com         me              S3             Route 53
armp.it                  me              S3             Route 53
echocvr.com              me              NOT USED
fiftytwo.net             me              Home IP        Route 53
fiftytwodesign.com       me              S3             Route 53
fiftytwodesign.net       me              S3             Route 53
greenmachinesmidwest.com Jim             S3             Route 53
jordan-rhonda.com        me              S3             Route 53
menfacingdivorce.com     me              tumblr         GoDaddy
menseekingdivorce.com    me              NOT USED
rockuniform.com          me              tumblr         NO CLUE!?!
thesorrypeople.com       me              107.21.228.187 Route 53
thewoerndles.com         me              S3             Route 53
trickykegstands.com      me              S3             Route 53
woerndleelectronics.net  John            S3             Route 53
womenfacingdivorce.com   me              NOT USED
womenseekingdivorce.com  me              NOT USED
beta.juristat.com        Bob Ward        jordan Home IP Bob Ward

## AWS Instances

Instance Id  Elastic IP      username    Size   EBS Attached
------------ --------------- ----------- ------ -------------------------
i-9ff1cbfc   184.73.194.228  ubuntu      Micro  8GB and 10GB at /mnt/data
i-fc04759e   107.21.228.187  ec2-user    Micro  8GB
i-39f43c5c   OFF             ec2-user    Large  8GB


##Amazon AWS IP's and Machines

* 184.73.194.228 **IS TURNED OFF** It used to have apache, django, and tomcat 
for juristat. It now only has tomcat and postgres for juristat. 
The extra, mounted EBS was for httpd (Static files) which are 
all now in S3 buckets. I shut it down at 12:54pm 20130216 after
copying the juristat database to /jordan/httpd/analyticsjust.us/archivedData/website20130216


* 107.21.228.187 is thesorrypeople.com it has postgres, solr, 
and tomcat. Postgres is not very reliable. in fact, it goes down all the time.
I think the data is stored on an EBS mount which might have something to do with it.
service postgresql-9.0 restart is your friend.

* The large instance was a server we used for scraping. I can 
scrap it for I don't remember what is on it. I think I was 
keeping it around because it contained all the scraped data. 
We have so many copies of it laying around it's cool to 
destroy.


##Verify Local VM IP's and Machines

--------------------------------------------------------------
Reason        IP    SSH  Port Forwarding
------------- ----- ---- -------------------------------------
VM HOST       .4,.3 54   wlan2 is .3, .4 is wired  CHANGE IP!!      

tomcat test   .5    55   

HAProxy       .6    56   80-\>80 443-\>443
(called 
tomcaandha
proxy but I 
uninstalled 
tomcat!)
              
Redmine       .7    57   7999-\>80 

Postgres      .8    58

R Studio      .9    59   8787-\>8787

Wordpress     .10   60   8081-\>80
Tomcat
Apache

NAGIOS        .11   61   8888

SOLR          .12   8084 8080

Jenkins       .13   63   8013->8080

Graylog2      .14   64   8014->8080

Windows XP    .90

Hadoop        .20   60   60010-\>60010 60020-\>60020 70-\>22

Macbook       .99

--------------------------------------------------------------

##Backup Everything

* macbook
* virtualbox host and vms
* rhonda's laptop
* amazon vms
* clone backup drives
* gmail - open mail app on macbook and refresh
* camera - sync camera to macbook


##Backup Macbook ~90 min

* Obtain the Time Machine Backup disk
* Obtain the macback Backup disk
* Plug in the macback disk which will mount it to /Volumes/macBack500GB
* Delete /Volumes/macBack500GB/var/vm/sleepimage
* If you used parallels since you last did a backup, delete the parallels VM from 
the external drive: /Volumes/macBack500GB/Users/jordanOriginal/Documents/Parallels/Microsoft Windows XP/winxp.hdd
* If you used virtualbox since your last backup, clean out the vm's by deleting *.vmdk files in /Volumes/macBack500GB/Users/jordanOriginal/VirtualBox VMs/
* sudo rsync -vaxE --delete --ignore-errors --progress / /Volumes/macBack500GB/
* Eject the macback disk
* Plug in the Time Machine backup disk
* Click "back up now" in the time machine menu by the clock.
* Click "open time machine preferences" if you want to see the progress. Should 
take approx 40 min.



##Create a macBack500GB Drive For Macbook Backups

* Obtain a blank **big**GB external drive in an enclosure
* Open DiskUtility
* Create a **same size as HD in macbook** GB partition as GUID (not apple 
partition map) call it macBack500GB
* Do a "Get Info" on the partition and uncheck "Ignore Ownership on this Drive" 
which is under "Ownership and Permissions"
* If your disk is big enough, create a second partition called 
TimeMachineBackup that fills the rest of the disk. Make sure it matches your 
current disk's Format which should be Mac OS Extended (Case-sensitive, 
Journaled) IF YOU DO THIS, REMEMBER TO CLONE THIS DISK EVERY TIME 
YOU DO A BACKUP.




##Backup VirtualBox Host and VMs

* The next 5 steps are captured in a script called backupvms in /root on the host
* mkdir /mnt/data/vmBackup\<date\>
* Shut down each running VM (make sure they all react appropriately to the 
acpipowerbutton:
* VBoxManage controlvm \<NAME\> acpipowerbutton
* rsync -rvz /root/VirtualBox\ VMs /mnt/data/vmBackup\<date\>
* rsync -rvz /root/.VirtualBox /mnt/data/vmBackup\<date\>
* Start each VM in the correct order (likely, postgres first)
* Now run /root/backuproot to backup everything except the VM's

##Backup Amazon Vm's

* Audioindie's database is a sqllite file called 
entries.sqlite. it seems to be both in 
/home/Jordan/djangowork and 
/home/ubuntu/chef/pythonProjects/ I'm not 
sure which one is actually used. The site has 
been static since 2010 so there's not too much 
to worry about as long as I grab a snapshot of 
it.
* Juristat's database is local, on the 
184.blah.blah.blah vm. BACK THE TRUCK UP!


##Backup Rhonda's Laptop

##Clone Backup Drives

* macBack500GB

##Time Machine Backup


##Rhonda's Laptop Backup


##virtualBox host



##Install Juristat Webapp jar on AWS


##Use S3 to Host a Static Site 

* Here's the official walkthrough 
<http://docs.aws.amazon.com/AmazonS3/latest/dev/website-hosting-custom-
domain-walkthrough.html>
* You want to copy your files to S3. You can use the web console, or if you're on 
a mac and the applet won't work, use the command line tool s3cmd.
* Apt-get install s3cmd or if you're on a mac, download S3cmd (git clone 
git://github.com/s3tools/s3cmd.git) and run "sudo python setup.py install"
* Create a bucket called trickykegstands.com, enable it for web content set the 
root and error pages via the aws console interface (web)
* Get your access key and your secret key from aws.console.amazon.com by 
clicking "Security credentials" in the account section.
* s3cmd --configure   paste in your access key id and your secret access key 
retrieved in the step above. Leave encryption password blank. Tell it to use 
HTTPS
* S3cmd ls  to list all your buckets. I have one called trickykegstands.com
* cd to the directory that has files you want to copy. In this case I'm in EC2 on a 
machine that has my EBS mounted to /mnt/data
* s3cmd put --acl-public --guess-mime-type index.html s3://trickykegstands.com/index.html
* That put command will throw back the public url. Check it to make sure all is 
good.
* Use s3cmd sync to do an rsync like action:
s3cmd sync --acl-public . s3://trickykegstands.com/
you can do things like --dry-run and --delete-removed. Check 
http://s3tools.org/s3cmd-sync for options
* Now, use all the information in the walkthrough (first step of this checklist) to do 
the rest.  The gist is to add a bucket called www.trickykegstands.com and set 
the static web hosting settings to redirect to the trickykegstands.com bucket. 
Then you set up route53 with an A Record that is an alias to the 
trickykegstands.com bucket and a CName record that points to the full domain 
name of the bucket (something like trickykegstands.com.s3-website-us-east-
1.amazonaws.com)


##Crawl audioindie.com to make it static

* Make a directory on the EC2 instance in /mnt/data/audioindieCrawl and cd to it
* wget --mirror -p --convert-links www.audioindie.com
* cd to the newly created directory, www.audioindie.com
* Use s3cmd to copy it to the audioindie.com s3 bucket
* cd to the static_media directory hosted by apache and copy all the mp3's to 
S3.
* You'll have to do a global search and replace for every instance of 
static_media//mp3 to get rid of the double slashes. Do that by running grep -lr 
-e 'static_media//' * | xargs sed -i 's/static_media\/\//static_media\//g'
* Service apache2 stop
* Fix audioindie.com in route53 by pointing it to the s3 bucket
* done

##s3cmd with multiple accounts
* cp ~/.s3cfg ~/.s3cfg-altAccount
* open .s3cfg-altAccount and paste your key and passphrase from the new account.
* s3cmd ls -c ~/.s3cfg=altAccount (lots of typing, yes.)

##Ssh Tunnels

* Normal Tunnels:
ssh  -N -p port user@theserver.com -L 2000:localhost:25 

-P port tells ssh to use a non standard port on the remote machine
-f tells ssh to go to the background as soon as it starts (not used)
-L local-port:host:remote-port
-N means don't execute a command on the remote system

* Reverse Tunnel:
    + I'm at work, I ssh -R into my machine at home. When I get home, I log on to 
my machine and ssh to a localhost:port which opens an ssh connection to the 
machine at work.
    + ssh -R 2210:localhost:22 myHomeServer.com
    + then when I get home: ssh -p 2210 localhost

* More examples: <http://rhnotebook.wordpress.com/2010/02/13/reverse-ssh-port-forwarding-t-o-i-c-o-r-g/>

##Enable JPDA on a Ubuntu tomcat6 service

* edit /etc/init.d/tomcat6 and add this to the beginning of the default 

~~~~
JAVA_OPTS-agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=y
~~~~

more details in the Catalina_sh() method in the bash script, 

* add a line just after  the line that escapes quotes in JAVA_OPTS and add a line that says

~~~~
JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=y $JAVA_OPTS" 
~~~~

* then down in TOMCAT_SH=- you have to reorder things by moving JAVA_OPTS as high as it can go:

~~~~
TOMCAT_SH="set -a; JAVA_HOME=\"$JAVA_HOME\"; source \"$DEFAULT\"; 
JAVA_OPTS=\"$JAVA_OPTS\"; 
CATALINA_HOME=\"$CATALINA_HOME\"; 
~~~~

##To get tomcat to use sun java 7 on my VM

Apparently, sun's java got installed directly to /usr/lib/jvm/bin instead of 
something like /usr/lib/jvm/sun-7-jdk/bin right? Right.

~~~~
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/bin/java" 1

sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/bin/javac" 1
~~~~

But that didn't really work... so:

Update /etc/init.d/tomcat6 to only find the sun 7 jdk

##Get Postgres to accept external connections

* Edit /etc/postgresql/9.1/main/pg_hba.conf

~~~~
host    all             all             192.168.1.0  255.255.255.0      md5
~~~~

lets anyone on the 192.168.1.0 network connect with a password


##Start SOLR Manually

* ssh -I \<pem file\> ec2-user@107.21.228.187
* cd /usr/share/solr/example 
* sudo java -jar start.jar 2\>&1 \> /var/log/solr.out &  
* **I NEED TO WRITE A STARTUP SCRIPT AND MONITOR IT WITH MONIT.**
* Process 1597 when I started it 30 DEC 2012
* http://thesorrypeople.com:8983/solr/admin/


##SSH Key How-To

* <http://oreilly.com/pub/h/66>

* as the user i'm using on the machine i am using now (like my laptop) or, rather, 
the machine I'm ssh'ing from, do this

~~~~
ssh-keygen -t rsa
~~~~

* use an empty passphrase. it will copy 2 files to ~/.ssh/

* ssh-copy-id \<user\>@\<server\>  (where user it the user I want to log in as on the 
remote server. it will ask me to log in to that machine using that user's 
password. Perfect. This is basically a bash script that copies my public key to 
that server and adds it to authorized keys. If you don't have this script, create 
the .ssh dir, chmod it 700. Then create authorized_keys and chmod 600 it. 
Paste your public key into authorized keys.)

* now you can simply do ssh \<user\>@\<server\> and it'll let you in, no matter who you are on the client 
(your laptop or whatever) side.


##Add Harddrive to Linux mounted to /mnt/data

* <https://help.ubuntu.com/community/InstallingANewHardDrive> OR do this:
* Plug it in, check dmesg to see what interface it hooks to, likely, sdb
* fdsik /dev/sdb
* p (artition), n (ew), p (rimary), default sizes, etc. w(rite)
* mkfs -t ext3 /dev/sdb1
* Run blkid to get the id, copy it.
* Create a directory /mnt/data
* Edit /etc/fstab   by copying the one from /dev/sda pasting, and changing the 
UUID=\<uuid from blkid\> and mount point to /mnt/data
* mount -a to mount everything in fstab


##Get ubuntu command line to shut down gracefully with powerbutton

* Check /etc/acpi/ and /etc/acpi/events to see the powerbtn script. Looks good. 
* Let's try it . From the host run VBoxManage controlvm \<NAME\> 
acpipowerbutton and watch your cmd prompt that's logged into the server 
you're shutting down. It should say, "gracefully shutting down" or whatever.

##Configure utf-8

* <http://templth.wordpress.com/2011/06/05/does-your-java-based-web-applications-really-support-utf8/>
* Chef recipe - https://github.com/heavywater/chef-locale 
* Make sure your POM has the line \<project.build.sourceEncoding\>UTF-
8\</project.build.sourceEncoding\> in it.
* Make sure your ide is set to use UTF-8. Eclipse-\>preferences-\>general-
\>workspace (this defaults to macroman in mac!) BUT, remember, java 
resources files must be ISO-8859-1 (See 
http://stackoverflow.com/questions/4659929/how-to-use-utf-8-in-resource-
properties-with-resourcebundle)
* **BUT**, my vm's look like they're set to utf8 and the source files seem largely ok. I 
don't see much reason to worry about it. 

##VDRP server Virtualbox, connect to XP VM

* When you set the vrdp port in the VM's settings, you are really setting which 
port on the HOST you will connect to to access the VM. Remember, don't try 
to RDC to the VM's IP. Connect to the HOST on the correct port.
* The XP machine's IP is 192.168.1.90 (set up through static DHCP
* Use RDC 192.168.1.4:3390 and log in. user ned, password ned.
* Of course, the server is enabled and port set thru the vm's settings page-
\>display-\>Remote Display.
* Remember, you have to start the XP box headless. It will no longer start unless 
it is headless because the resolution on the host has changed. (because I now 
use xrdp to serve the host so I can connect to it via rdp too
* I did all this on 2013-01-013 after moving the machine to the basement.
* BUT RDC SUCKS. So, I installed realvnc server on XP and realvnc client on 
my mac. Just use realvnc to connect to 192.168.1.90


##Misc Commands

* Copy a file to the mac clipboard
pbcopy \< ~/.ssh/id_rsa.pub

* Paste the mac clipboard to a file
pbpaste  \> ~/someFile

* Rsync over a non-standard port
rsync -rvz --rsh='ssh -p666' * 
junk@host.com:/tmp/.

* Full path and params of a running process
ps -ef | grep tomcat

* See which ports are listening
netstat -ano | grep 8080

* Adjust sudo to work differently - let things like rsh \<host\> sudo ls
visudo - (find the line with "Default requiretty" and comment it out)

* Look at / configure your network 
interfaces
Ifconfig
Ifconfig -a
Ifconfig eth0 down/up

* Look at nameservers/domains
Nslookup

* Bulk, recursive file rename by 
matching and replacing a part of 
the name from 
http://ask.metafilter.com/16433/
UNIX-recursive-file-renaming-
based-on-patters

find . -name "\*old\*" -exec bash -c "mv \$1 \'echo \$1 | sed s/old/new/\'" - {} \;

* Reroute port 8080 to 80
iptables -A PREROUTING -t nat -i eth0 -p 
tcp --dport 80 -j REDIRECT --to-port 8080
then run
iptables-save or else the change will 
disappear after a reboot.

* find current mecurial changeset id 
hg id -i

* do a word count inside eclipse
file search, select the file, enable regex and search for \\w+

* do a multiline (vertical) edit in eclipse.
select a block of text by placing your cursor where you want the edit to start and dragging straight down, option/command/A then edit away
remember option/command/A will throw you in block select mode. hit it again to turn it off.

* global find replace using xargs and sed works on os x 
find . -type f | xargs sed -i '' -e 's/juristat/boilerplate/g'

##create a boilerplate app using the juristat code base
* copy juristat project to a boilerplate directory
* find . -type f | xargs sed -i '' -e 's/juristat/boilerplate/g'
* find . -type f | xargs sed -i '' -e 's/Juristat/boilerplate/g'
* find any directory called juristat and move it to boilerplate (probably can create a command to do this, but it is easy enough)
* get rid of any entities or services you don't want
* fix persistence.xml so it doesn't have juristat in it AND remove the entities you no longer are using.

##use cargo to deploy a war to tomcat
* on the tomcat server do apt-get install tomcat6-admin
* update tomcat users so a user has manager-gui and manager-script roles


##Tell Tomcat to use a different war for ROOT
* **I COULD NOT GET THIS TO WORK**
* <http://stackoverflow.com/questions/7276989/howto-set-the-context-path-of-a-web-application-in-tomcat-7-0>
* create a file called ROOT.xml and save it to catalina/conf/Catalina/localhost/
* contents of ROOT.xml looks like:

~~~~
    <Context 
      docBase="/opt/mywebapps/<yourApp>" 
      path="" 
      reloadable="true" 
    />
~~~~


##SSL Certificates

* Nightly SSL Cert Check

You want to run a check on all your SSL certs nightly to make sure they're 
valid. Check http://news.ycombinator.com/item?id=4499593 for some advice 
on how to do that.

~~~~
for pem in *.pem; do ssl-cert-check -a -x 15 -e admin@yourdomain.com 
-q -c $pem; done
~~~~

after you grab ssl-cert-check from http://prefetch.net/code/ssl-cert-check

ALSO, you'll want to use nagios's check_http, too which hopefully will check 
your server's configuration to make sure it's all good.

* Buying a cert
Best - http://www.digicert.com/ $156-$500 a year.
StartSSL is free...  GeoTrust, Comodo, Globalsign should be good, too.
Single root certificates are a better option and the RapidSSL certificate that NameCheap is selling for $10 is 
single root and run and signed by the same people as GeoTrust. Do go with a single root as it makes life 
easier.
Here is some helpful advice about SSL certs https://stripe.com/help/ssl

* Set up haproxy to handle SSL and forward everything to tomcat... sort of explained, here 
http://www.exratione.com/2012/12/websockets-over-ssl-haproxy-nodejs-nginx/  here's someone's 
configuration - https://groups.google.com/forum/?fromgroups=\#!topic/socketstream/_KbMUPjsUaM
Doing a script (called stepsToBuildInstallHaproxyWithSSL.txt right now) to build haproxy and forward it to a 
local tomcat.

##Dealing With Logrotate and rsyslog

* Here's a good how-to: <http://www.linuxinstead.com/blog/2012/05/27/haproxy-quick-setup/>


##HAProxy
* <http://www.linuxinstead.com/blog/2012/05/27/haproxy-quick-setup/>
* back up haproxy by logging into the machine and rsync -avz /etc/haproxy/haproxy.cfg jordan@192.168.1.4:/mnt/data/haproxy\<YYYYMMDD\>.cfg

##Graylog2
* install via cookbook... lots of mods to get it to work.
* change passenger to use ruby 1.9.3 using the guide here <http://wiki.brightbox.co.uk/docs:ruby-ng> lots of apt-get installs and a reboot.
* that did not work, so i'm trying to install it w/o the mod passenger apt package using 
<http://bitprison.net/install_passenger_ruby_1.9.2> make sure your load file contains the .so extension on the passenger 
shared lib
* Ok, so **I got it installed just by installing the fucker like the docs told me to...**
* there is an upstart script in /etc/init/graylog2-server which starts the service by doing service graylog2-server start
* start elastic search using service elasticsearch start
* Here's how you start the web interface:
* cd /opt/graylog2/graylog2-web-interface
* sudo su
* ./script/rails server -e production &> /tmp/graylog.out &  #i know, redirecting output like this is dumb.
* hit <http://fiftytwo.net:3014/>
* I eventually want to run it as a service. TO do that, i used instructinos here to create the init.d
scripts: <http://thetek.net/how-to/13-how-to/42-how-to-install-graylog2-on-ubuntu.html>
* so, i did that and created an /etc/init.d/graylog2-web-interface bash script that is crap but it works

##ElasticSearch

* I installed elasticsearch on my macbook. it was this easy:
* cd /jordan/projects/code/
* curl http://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.20.4.tar.gz | tar xvz
* cd elasticsearch-0.20.4/bin
* ./elasticsearch **this starts the service**
* Hit it using <http://localhost:9200/>
* I wanted to install a plugin, so I ran ./plugin -install mobz/elasticsearch-head and that was it.
* for future reference, this is a good list of commands to not only install it, but set it up as
a service on ubuntu (aww shit, i forgot to paste the link)
* to stop it, i did a ps -A | grep lastic and did a kill -9 on the PID. I'm sure there's a better way
but it works for now


##Juristat environment

* /var/log/juristat  - with read perms 
* /etc/juristat/juristat.properties - with appropriate write perms (what? write perms?) this location is 
configured in applicationContext.xml the idea is everything that is server specific (like paths) is to be 
set in here which is then picked up by applicationContext.xml... same goes for the logging file (see next)
* there is another juristat.properties on the classpath. This holds the buildNumber and version which is 
created by maven. It is a really good idea to keep this feature working.
* /etc/juristat/log4j.properties - this location is configured in web.xml, this has paths to things like 
/var/log which should be set on a server by server basis, anyway.
* Database called juristat with a user/password that is also stored in the properties file.
* you have to create a page name terms title Terms of Use with the content being the site's terms of use.

#### juristat - adding startup parameters
Juristat starts up and grabs a ton of parameters out of /etc/juristat/juristat.properties. If you want to
add something to there, you have to deal with it in 3 places.
1. add it to /etc/justistat/juristat.properties (REMEMBER to add it to that file in all your environemnts!)
2. add it to SystemSettings.java (you'll need getters and setters)
3. Add it to applicationContext.xml. this is where the value gets pulled from the properties file and set in
the SystemSettings object.

## backing up postgres

su postgres
pg_dump -c <db_name> > backupFile.bak

## postgres create database drop one, etc
* <http://articles.slicehost.com/2009/5/7/postgresql-creating-and-dropping-databases>
* log into the machine. 
* sudo su - postgres
* dropdb 'databaseName' will drop a database 
* psql -U postgres (starts psql)
* \\l (list databases)
* CREATE DATABASE databaseName ENCODING 'UTF8';
* psql -U postgres -d databaseName
* \\d (list tables)

##To start a business

<http://www.sba.gov/content/follow-these-steps-starting-business>
<http://www.irs.gov/Businesses/Small-Businesses-&-Self-Employed/Checklist-for-Starting-a-Business>

* Apply for EIN <http://www.irs.gov/Businesses/Small-Businesses-&-Self-Employed/Missouri-3>

* register in your state.
* register in your local city
* Get a DBA (doing business as)
* Physical address
* Mailing address
* LLC
* Terms of service
* SSL cert
* Ability to accept payment
* Quickbooks
* Bank account
* Credit card
* Tax id
* Accountant
* Start paying quarterly taxes, self emplyment tax,
* Logo/branding
* PR agency - pay one to get your name out.
* Bug tracker as a todo list
* Visiter log in office

##Using pandoc
* Install it... dmg package, or available in distros apt-get, etc.
* if you are using a mac and plan to use latex or tex or generate a PDF, go [here](http://www.tug.org/mactex/morepackages.html) and download basictex. install it. open a command line and run sudo tlmgr update --self then run sudo tlmgr install dvipng (that's more for getting anki2 to run properly!) then you'll be all set for generating pdfs.
* Make a file, then run pandoc -s FILENAME -o file.html

##Using pandoc to convert trickykegstands to markdown then markdown to a finished site (full circle)

* sed -n '/Content Starts/,/Content Ends/p' manhunt.html \> manhunt.snip

* pandoc -s -f html -t markdown  manhunt.snip

* Put all the .html files in the current directory, run these three commands which 
will give you a .md file for each html file. It pulls the text from between the 
"Content starts" and "content ends" and puts it into a .snip file. Then we run 
pandoc on each .snip file to create a md file. Then we rename the final file to 
just .md...

~~~~
find . -name "*.html" -exec bash -c "sed -n '/Content Starts/,/Content Ends/p' \$1 \> \$1.snip " - {} \;

find . -name "*.snip" -exec bash -c " pandoc -s -f html -t markdown  \$1 -o \$1.md" - {} \;

find . -type f -name \*.html.snip.md |  while read f; do mv -- "$f" "${f/%.html.snip.md/.md}"; done

\#now, generate the site from .md files

find . -name "*.md" -exec bash -c "pandoc -B header.html -A footer.html \$1 -o \$1.html" - {} \;

find . -type f -name \*.md.html |  while read f; do mv -- "$f" "${f/%.md.html/.html}"; done
~~~~

* What's my workflow?
    + A ton of md files. Media, images, blueprints, etc. folders in src (site and resources)
    + Run pandoc using make (makefile in /jordan/projects/code/markdownSite and in trickykegstands project on github
 
##Change trickykegstands
* Edit the .md files
* git commit -m "message goes here." -a
* git push -u origin master
* make (to make the site)
* Go to aws-\>s3 and upload the new file via their gui. If you can run applets, the 
uploader will let you do a lot. Otherwise:
* s3cmd sync --acl-public . s3://trickykegstands.com/
you can do things like --dry-run and --delete-removed. Check 
http://s3tools.org/s3cmd-sync for options
* make deploy **(untested! it won't work until you put the bucket name in the command.)**
* make til will do s3cmd on todayILearned.html. **It is tested and it works fine!**

##Server Monitoring NAGIOS and MONIT

* Use nagios and monit
* I created a nagios cookbook. I edited the config templates directly (bad!) 
because I didn't feel like getting the databags to work.
* Here's how to get nagios to send via google mail:

<http://blog.chriskankiewicz.com/post/253/postfix-using-gmail-as-a-relay-host/>

* but I ended up adding a postfix recipe to the nagios node and that worked 
great. You'll probably want to enable notifications in nagios

* if you want to change nagiosadmin's password from nagios, use this command
sudo htpasswd /etc/nagios3/htpasswd.users nagiosadmin

use
sudo htpasswd -c /etc/nagios3/htpasswd.users Jordan

to create a new user

* Here's how you add hosts to monitor: Add the host to /etc/nagios3/conf.d/hosts

* I copied all the configs to a folder on my macbooks desktop called nagiosServerConfigBackup

* On the machine you want to monitor, 
<http://www.debiantutorials.com/installing-nagios-core-monitoring-system-
client-and-server/>

apt-get install nagios-nrpe-server

nano /etc/nagios/nrpe.cfg
allowed_hosts=192.168.1.11  where that's the IP of the nagios server

service nagios-nrpe-server restart

* **OR** use the nagiosClient.json recipe. I hacked the nagios cookbook's client.rb 
to use the mon_host param provided in the nodes/nagiosClient.json config file to pass
to the allowed_hosts param in npre.cfg. it works. i haven't used this in a recipe much


##Host set up FQDN fully qualified domain name
* hostname -f  to check what it is set to
* hostname www.newdomain.com
* Edit /etc/hostname to keep it set properly after reboot

##Eclipse tomcat directory
* /jordan/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0

##maven

* mvn install will push your pom/project to your local .m2 repo
* mvn deploy will push it to your maven team internal maven repo like jfrog artifactory, apache archiva, or 
sonatype nexus
* I don't know exactly what that means, I need to learn more about maven! go here 
<http://maven.apache.org/repository-management.html> to learn more. Apparently, you have your local
repo which stores jars. If you build a project that depends on other things you've built, those jars will
be automatically pulled out of your local repo. awesome. BUT, if someone else tries to build your code, 
they won't have those jars (unless they pull each project and run mvn install). SO, you want to deploy your
jars to some central repo like artifactory so when your buddy tries to build your project, the necessary
jars will be pulled from that central repo. If you have one of these, you have to put it in your pom so
maven can find it. It winds up in your \<distributionManagement\>\<repository\> section and there is the
\<snapshotRepository\> section, too.
* mvn dependency:tree is your savior when trying to figure out what is included and what isn't.

##Integration, code checking servers

* jenkins, sonar
* here's a jenkins cookbook <http://dev.nuclearrooster.com/2011/05/18/simple-chef-cookbook-to-install-jenkins/>
* I made one like that and called it "simple-jenkins." Set up a node with apt, java, simple-jenkins and nagios::client. it installs maven too.
* i forwarded port 8013 to port 8080 on the jenkins server.
* first thing to do is tell it where maven is (/usr/share/maven ) and install some plugins, like git and mecurial.
* probably want to install the sonar plugin, too.
* probably should install the Checkstyle plugin.
* Should I look into these: Clover? (test coverage) PMD? (pmd finds unused variables, unecessary object creation, etc. <http://pmd.sourceforge.net>
* there is a suite of plugins <https://wiki.jenkins-ci.org/display/JENKINS/Static+Code+Analysis+Plug-ins> which I should use.

##Jenkins setup

* i set up a project in jenkins that automatically builds every time i commit
to bitbucket (wow!) i used the instructions here <http://felixleong.com/blog/2012/02/hooking-bitbucket-up-with-jenkins>
I had to log into the jenkins server, sudo su jenkins generate a public rsa
key and paste it into my account at bitbucket. I also had to run an hg clone ssh://
as the jenkins user once in tmp to make sure it worked. it did.
* oh yeah, i had to do an apt-get mercurial in the jenkins server. hopefully
by time you read this the chef recipe will be updated.
* I installed these plugins
    + Static Code Analysis Plug-ins
    + Analysis Collector Plugin
    + Checkstyle Plugin	
    + FindBugs Plugin	
    + Task Scanner Plugin
    + PMD Plugin
    + DRY Plugin
* to backup jenkins, rsync the /var/lib/jenkins directory somewhere.
    + On 192.168.1.4 i added jordan to the "users" group (usermod -a -G users jordan). and chmod'd the group of /mnt/data to root:users
    + on the jenkins machine, run rsync -avz * jordan@192.168.1.4:/mnt/data/jenkinsBackup\<yyyymmdd\>/
* either the tomcat deploy plugin didn't work, or i just didn't like it, SO, i deploy to tomcat6 using 
org.codehaus.cargo:cargo-maven2-plugin:redeploy in my pom.

##Get Anki 2 to work on my mac
* <http://apple.stackexchange.com/questions/15695/how-can-i-get-latex-working-on-anki>
* download basictex <http://www.tug.org/mactex/morepackages.html>
* sudo tlmgr update --self
* sudo tlmgr install dvipng
* bonus is you now have basictex on your machine so you can write latex docs

##Install tomcat on my mac

* download it
* unzip it to /usr/local/share
* symlink it to /Library/Tomcat (I cannot 100% remember why i did that)

##Install HBase on my mac

* download it
* unzip it to /usr/local/share
* edit bash_profile to look like this:

export CATALINA_HOME=/Library/Tomcat
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJD$
export HBASE_HOME=/usr/local/share/hbase-0.92.2

export PATH=$HBASE_HOME:$JAVA_HOME:$PATH

* edit $HBASE_HOME/conf/hbase-env.sh file, update the JAVA_HOME

export JAVA_HOME=$JAVA_HOME

* cd $HBASE_HOME/bin
* ./start-hbase.sh
* ./hbase shell
* ./stop-hbase.sh
* [here](http://spawgi.wordpress.com/2012/12/03/basics-of-hbase/) is a handy guide for installing hbase as a pseudo-distributed environment.

##Install hadoop on my mac

* download it
* unzip it to /usr/local/share
* bin/hadoop to run some hadoop jobs.go [here](http://hadoop.apache.org/docs/stable/single_node_setup.html) for more

#Import a seq file in hadoop
./hbase org.apache.hadoop.hbase.mapreduce.Import case ~/Downloads/cases.seq -libjars /jordan/projects/code/api/target/API-0.0.1-SNAPSHOT.jar

#enable applet debugging by connecting via socket

* system preferences->other->java 
* java button, "view" then add the -Xnoagent -Xdebug -Xrunjdwp:transpor... stuff to the "Runtime Parameters"
* start the applet then connect using eclipse.

##Quotes
* as soon as you're in the smartest person in the room, go to another room.
* if there isn't anyone in the room who's weird or terrible, it's probably you.
* the moment your head hits your pillow, time is yours and there is nothing you can do that will affect  anything in the outside world. You might as well enjoy it and get some rest.

##Wishlist

-------------------------------------------------------------
Item                                                     Cost
------------------------------------------------- -----------
Hilux - lifted 4x4 tacoma                             $12,000

Defender 90 or 2 door G Wagen                         $25,000

Breitling Navitimer from the 60's*                     $6,000

Restore Dad's Jaguar                                  $85,000

924SE - Make it nice and/or put an LSx in it.         $12,000

Fix up the covered porch and hot tub area             $10,000

Get the 928 Running OK                                 $5,000

A good office chair                                      $700

lock picking tools                                       $100

Firstarter (flint/steel)                                  $10

Bug out bag                                              $500

red turtleneck, button down shirt (pink or blue,          $50
with some sort of texture), dark blue pants, 
awesome shoes.

-------------------------------------------------------------

* <http://forums.watchuseek.com/f39/breitling-navitimer-brief-history-most-famous-breitling-all-25057.html>

##Workflow for SOP's/checklists for System validation
installation steps
pre test setup
test
post test

##appliances
dishwasher model number is kuds30ixss1 - here's some parts online - [here](http://www.searspartsdirect.com/partsdirect/part-model/Kitchenaid-Parts/Dishwasher-Parts/Model-KUDS30IXSS1/0593/0130000/W1102063/00002?blt=06&prst=&shdMod=)

