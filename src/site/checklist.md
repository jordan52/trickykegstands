#Checklist

##How to build this document
* use pandoc via the trickykegstands makefile

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
demo.juristat.com        Bob Ward        jordan Home IP Route 53

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


* 107.21.228.187 is thesorrypeople.com it **IS TURNED OFF** has postgres, solr, 
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

## AWS IAM Login url

<https://ACCOUNTNAME.signin.aws.amazon.com/console/ec2>

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
ssh  -N -p 159 <macuser>@<mydomain> -L 9999:localhost:5900  then connect to server, vnc://127.0.0.1:9999


-P port tells ssh to use a non standard port on the remote machine
-f tells ssh to go to the background as soon as it starts (not used)
-L local-port:host:remote-port
-N means don't execute a command on the remote system

* Reverse Tunnel:
    + I'm at work, I ssh -R into my machine at home. When I get home, I log on to 
my machine and ssh to a localhost:port which opens an ssh connection to the 
machine at work. Here is a nice how-to <http://www.noah.org/wiki/SSH_tunnel>
    + ssh -f -N -R 2210:localhost:22 myHomeServer.com   (-f forks it to the background. -N keeps you from executing a remote command)
    + then when I get home: ssh -p 2210 localhost

* More examples: <http://rhnotebook.wordpress.com/2010/02/13/reverse-ssh-port-forwarding-t-o-i-c-o-r-g/>

* Bob set it up so that I can tunnel right to the dev box in the office with ssh -p 9999 nagios.juristat.com

##Enable JPDA on a Ubuntu tomcat6 service

NOPE - the right place to do this is in /etc/default/tomcat6. don't mess with the init.d/tomcat6 script!

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

##WAIT##
it looks like the proper place to put this would be in /etc/default/tomcat6.

##To get tomcat to use sun java 7 on my VM

Apparently, sun's java got installed directly to /usr/lib/jvm/bin instead of 
something like /usr/lib/jvm/sun-7-jdk/bin right? Right.

~~~~
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/bin/java" 1

sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/bin/javac" 1
~~~~

But that didn't really work... so:

Update /etc/init.d/tomcat6 to only find the sun 7 jdk

##enable ssl on my local tomcat in eclipse
edit server.xml - uncomment the 8443 sections
by default on os x, the server will look for the key in ~/ with a password changeit. so, open a terminal, cd to ~/ and type
keytool -genkey -alias tomcat -keyalg RSA
start tomcat.


##Get Postgres to accept external connections

* Edit /etc/postgresql/9.1/main/pg_hba.conf

~~~~
host    all             all             192.168.1.0  255.255.255.0      md5
~~~~

lets anyone on the 192.168.1.0 network connect with a password


## add a unix user then add them to a database

adduser tom
passwd tom

su - postgres
psql template1 OR psql -d template1 -U postgres
CREATE USER tom WITH PASSWORD 'myPassword'
GRANT ALL PRIVILEGES ON DATABASE jerry to tom;


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

## postgres - stop and start on mountain lion
* open terminal sudo postgres
* cd /Library/PostgreSQL/9.1/bin
* ./pg_ctl -D ../data/ stop
* ./pg_ctl -D ../data/ start


## back up a big database and zip it:
(from <http://www.postgresql.org/docs/9.1/static/backup-dump.html#BACKUP-DUMP-RESTORE>)

pg_dump dbname | gzip > filename.gz

gunzip -c filename.gz | psql dbname
or
cat filename.gz | gunzip | psql dbname

## install postgres on aws using the chef-postgres cookbook

launch an ec2 instance, ubuntu, small. set the security group to something called postgresUspto (only allow port 22) add your JordanWoerndle.pem as the private key

knife solo prepare ubuntu@ec2-174-129-62-151.compute-1.amazonaws.com  (running this from the chef box didn't require a password...)
knife solo cook ubuntu@ec2-174-129-62-151.compute-1.amazonaws.com nodes/postgresqlUspto.json

now, to connect to the server, open a tunnel
ssh -i /jordan/JordanWoerndle.pem -N ubuntu@ec2-174-129-62-151.compute-1.amazonaws.com -L 9876:localhost:5432
and connect using pgadmin or whatever. uspto_raw has a user and password specified in postgresqlUspto.json

###that worked fine but perfomance sucked so I tried moving data to a different volume.
create the EBS volume 8GB in the same zone as the machine, name it. Attach it to the instance.

sudo su
apt-get install -y xfsprogs
mkfs.xfs /dev/xvdf
echo "/dev/xvdf /data xfs noatime 0 0" | sudo tee -a /etc/fstab
mkdir -m 000 /data
mount /data
service postgresql stop
nano /etc/postgresql/9.1/main/postgresql.conf
  change data_directory = '/var/lib/postgresql/9.1/main' to data_directory = '/data'
cp -r /var/lib/postgresql/9.1/main/* /data/.
chown -R postgres:postgres /data
chmod 0700 /data

###that actually slowed down the query, let's try an IOPS EBS volume
service stop postgresql
umount /data
create a 100GB 1000IOPS EBS volume and attach it as /dev/xvdf
mkfs.xfs /dev/xvdf
mount /data
cp -r /var/lib/postgresql/9.1/main/* /data/.

### that did nothing to increase speed. let's undo all that and change to a larger instance.
service postgresql stop
nano /etc/postgresql/9.1/main/postgresql.conf
  change data_directory = '/data' to data_directory = '/var/lib/postgresql/9.1/main'
umount data
nano /etc/fstab 
  delete the mount /data thing 
shutdown -h now

go to the aws action->change instance type -> AND THEN REALIZE ANY SUITABLE INSTANCE TYPE WILL COST $300 A MONTH. fuck that.

you'll probably want to store data on a separate EBS volume ( I didn't) to do so:
create an EBS volume 
attach it to /dev/sdf
format it sudo mkfs.ext4 /dev/xvdf
mount it and edit fstab so it sticks around
sudo mkdir -m 000 /vol
echo "/dev/xvdf /vol auto noatime 0 0" | sudo tee -a /etc/fstab
sudo mount /vol

edit your node.json file to change the following param to /vol/data
data_directory = '<%= node["postgresql"]["data_directory"] %> - default is /var/lib/pgsql/9.1/data

run chef-solo


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

##SSH keys - multiple based on server.

 Adapted from <http://www.karan.org/blog/index.php/2009/08/25/multiple-ssh-private-keys>

* grab the *.pem file (like from aws) copy it to your .ssh directory. chmod 600 it.
* cd ~/.ssh
* touch config
* chmod 600 config
* put the following contents in config:

Host *.compute-1.amazonaws.com
  IdentityFile ~/.ssh/somePrivateKey.pem
  User ec2-user
  
You're set. Any time you ssh to an amazon box, it will try that key. Any other place you ssh to will try your default id_rsa key.  
  
* generate the public key from a private key - ssh-keygen -y -f /path/to/private/key > publicKey.pub  
  

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

##resize a VirtualBox guest's hard drive to 50GB

* shut down the vm
* back it up
* VBoxManage modifyhd /root/VirtualBox\ VMs/ubuntu\ 12.04\ 64bit\ Server\ POSTGRES/ubuntu\ 12.04\ 64bit\ Server\ POSTGRES-disk1.vdi --resize 51200 
* mount an ubuntu iso as the CD or the gparted iso found here <http://gparted.sourceforge.net/download.php> and boot off it.
* use gpartd to resize both the device and the partition.
* shutdown and disconnect the iso
* start.
* if you're using lvm, then you're mounted to /dev/mapper which doesn't automatically notice the larger disk size. fix that by doing:
* lvextend -l +100%FREE /dev/mapper/ubuntu64bitServer-root
* resize2fs /dev/mapper/ubuntu64bitServer-root

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

* write a large file filled with zeros on a mac dd if=/dev/zero of=output.dat bs=1024 count=10000000
* say you want to run it in the background then watch it run.
* nohup dd if=/dev/zero of=zeros.dat bs=1024 count=10000000&
* then run watch -n 5 --differences ls -lah
* or you could run watch -n 5 kill -USR1 \<pid\>

* Reroute port 8080 to 80
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
then run
iptables-save or else the change will 
disappear after a reboot.

* Do the same thing except 8443 to 443
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 8443

* find current mecurial changeset id 
hg id -i

* install git flow, download curl -L -O https://raw.github.com/nvie/gitflow/develop/contrib/gitflow-installer.sh then run the installer
* use git flow (gitflow) git flow release track 1.2.0

* use ab (apache benchmark) to hammer a site.  apt-get install apache-utils then run something like ab -C JSESSIONID:7EA6B312FB939E02957BD4B5AA897165 -k -n 10 -c 10 -t 20 "https://192.168.1.10:8443/uspto/examinerAllowanceRate?art=&examiner_id=1424&includeContinuation=true&includeForeign=true&sampleReport=false"

* mount a ext3 or ext4 (or ntfs) drive on os x using fuse for ox and fuse-ext2
* install OSXFUSE i got 2.6.2 be sure to check the MACFUSE Compatability Layer option which shows up in the 4th step of the installation wizard.
* install fuse ext2-0.0.7 <http://sourceforge.net/projects/fuse-ext2/>
* connect the drive. use disk utility or run the command diskutil list to see what appears. it will look something like disk2s2
* make a new folder as a mount point
* fuse-ext2 /dev/disk2s2 /Volumes/mountpoint which will mount it readonly. if you need to write:
* fuse-ext2 -o force /dev/disk2s2 /Volumes/mountpoint
* I assume the method for ntfs is similar
* there will be icons for osxfuse and fuse ext2 in system preferences. use those to uninstall/upgrade.

* make a bootable usb ubuntu install disk from iso on os x - <http://www.ubuntu.com/download/desktop/create-a-usb-stick-on-mac-osx>

* do a word count inside eclipse
file search, select the file, enable regex and search for \\w+

* pretty print some json similarly, you can get a janky json pretty printer by doing:
*    curl -s http://some/json/url | python -m json.tool

* mdfind on os x is like locate on linux.

* hold option and click a position in the current line to move your cursor to that position.

* do a multiline (vertical) edit in eclipse.
select a block of text by placing your cursor where you want the edit to start and dragging straight down, option/command/A then edit away
remember option/command/A will throw you in block select mode. hit it again to turn it off.

* global find replace using xargs and sed works on os x 
find . -type f | xargs sed -i '' -e 's/juristat/boilerplate/g'

* keep just the end of each line that matches a regex:
sed -n -e 's/^.*New\ York\///p' newYorkCases.txt > newYorkCasesCleaned.txt

* use macvim as a quick diff between files:
mvim -d motions.jsp marketing.jsp 

* create a user in ubuntu

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

* set up elastic load balancer with a signed wildcard cert.

Buy a geotrust wildcard cert from namecheap.

openssl genrsa 2048 > juristatWildcard.pem

openssl req -new -key juristatWildcard.pem -out csrJuristatWildcard.pem  (no password!)

manage your ssl cert via namecheap. paste csrJuristatWildcard.pem into the box and go through the process where
they email you with the confirmation. Accept the confirmation. They then will send you an email with 2 certificates
attached as text called Webserver and Intermediary. Copy Webserver to a file called juristat509Server.pem and
Copy Intermediary to juristat509Intermediate.pem

in EC2, go to Load Balancers. click the one you want to add the cert. click the "listeners" tab.
add a https listener. click the ssl certificate column. give the new cert a good name. paste juristatWildcard.pem into
private key. paste juristat509Server.pem into Public Key Certificate. Paste juristat509Intermediate.pem into
Certificate Chain.

save all the files to somewhere central.

you're done.



##Dealing With Logrotate and rsyslog

* Here's a good how-to: <http://www.linuxinstead.com/blog/2012/05/27/haproxy-quick-setup/>


##HAProxy
* <http://www.linuxinstead.com/blog/2012/05/27/haproxy-quick-setup/>
* back up haproxy by logging into the machine and rsync -avz /etc/haproxy/haproxy.cfg jordan@192.168.1.4:/mnt/data/haproxy\<YYYYMMDD\>.cfg

##Graylog2

#### [Here are these instructions cleaned up:](graylog2setup.html)

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

#### using the Graylog (ami-2795f64e) AMI

* elasticip 54.225.110.210
* dns graylog.juristat.com
* m1.small
* graylog security group - 22, 80 and 12201 (UDP) are open.
* EBS vol-9f9d73c7 16GiB as /dev/sda1

Problem is it will crash and right now I can't even force-stop the instance.

##ElasticSearch

**this might be better <http://www.elasticsearch.org/tutorials/deploying-elasticsearch-with-chef-solo/>**

I used that to build the cookbooks. I ran :

knife solo cook ec2-54-242-218-239.compute-1.amazonaws.com nodes/elasticsearch.json 

to build it. Of course, when i did that, chef threw an error on cooking. elasticsearch won't start. i had to ssh to the box and rm some symbolic links and recreate for some reason:

rm /usr/local/bin/elasticsearch
rm /usr/local/bin/plugin
ln -s /usr/local/elasticsearch/bin/elasticsearch /usr/local/bin/elasticsearch
ln -s /usr/local/elasticsearch/bin/plugin /usr/local/bin/plugin

I had to run the commands in patches.sh
AND, i had to run bin/plugin -install elasticsearch/elasticsearch-cloud-aws/1.11.0 to get the full install working.

run service monit stop to pause monit.

again, the whole time I was using <http://www.elasticsearch.org/tutorials/deploying-elasticsearch-with-chef-solo/>


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

###delete an Elastic Search index, refresh, then create it.
curl -XDELETE 'http://ec2-54-242-218-239.compute-1.amazonaws.com:9200/juristat/'
curl -XPUT 'http://ec2-54-242-218-239.compute-1.amazonaws.com:9200/juristat/'  
curl -XPOST 'http://ec2-54-242-218-239.compute-1.amazonaws.com:9200/juristat/_refresh'

####set the index to ignore malformed dates when indexing

curl -XPOST 'localhost:9200/myindex/_close'
curl -XPUT http://localhost:9200/myindex/_settings  with "{"index": {"index.mapping.ignore_malformed":"true"}}"
curl -XPOST 'localhost:9200/myindex/_open'

BUT, that doesn't work. Instead, pull down the index's mapping, save it as /tmp/mapping.json 

curl -XGET http://localhost:9200/juristat/case/_mapping < /tmp/mapping.json

and replace every instance of:

{"type":"date","format":"dateOptionalTime"}

with 

{"type":"date","format":"dateOptionalTime", "null_value" : "null", "ignore_malformed":"true"}

and push it up with curl -XPUT http://localhost:9200/myindex/case/_mapping -d @mapping.json

now delete all the entries and try again.

curl -XDELETE 'http://localhost:9200/myindex/case/_query' -d '{"match_all" : { }}'

#### move an index from one machine to another.

I process a lot of stuff locally then push it up to the cloud. During that step, i also push new things to ES. Instead of reindexing into the cloud ES, I move it using a backup script. The process is

1. backup the local ES using a script which also creates a restore script. start with this and modify as necessary <https://gist.github.com/nherment/1939828> - (see deployDataToESandDatabase in /jordan/projects/code) REMOVE THE ALIAS before backing up... the alias will come along with the backup, so that's annoying. right?
2. copy the data created by the backup process to the remote server to /tmp/es-backups
3. run the restore script. 
3. make sure all the data files under /usr/local/var/data/elasticsearch/elasticsearch/nodes/0/indices/INDEX NAME have correct permissions. You might also have to make sure all the write.lock files under /usr/local/var/data/elasticsearch/elasticsearch/nodes/0/indices/juristat20130820/ are gone (find . -name write.lock -print) (i deleted them before fixing permissions so I don't know what will happen if you do not delete them)
4. wait patiently while the new ES instance processes the mess of data you threw at it. this can take a while and it may or may not make you really nervous.

the idea is you create a new index, push a mapping, then copy the indices files to the new server. After rebooting ES will pick up the new files and you'll be good.

Some things with that restore script... If you run backup a bunch of times, the contents of the script gets appended... that's a huge problem. READ THE SCRIPT AND MAKE SURE IT IS REASONABLE VEORE RUNNING IT.
Next, you'll want to make sure the elasticsearch start/stop command is correct for the system you're restoring to. in my case, i had to change it to service elasticsearch restart.

One thing I do not know


#### Elasticsearch Query Tutorial

Seems legit <http://okfnlabs.org/blog/2013/07/01/elasticsearch-query-tutorial.html>

##Elastic Beanstalk

* put a folder called .ebextensions in the root of your WAR. in there place YAML configuration files.
I use this to handle the config files for my app that live in /etc/APPNAME and /var/log/APPNAME

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
* now you have to have a uspto database. connection params are stored in the properties file
  


#### juristat - adding startup parameters
Juristat starts up and grabs a ton of parameters out of /etc/juristat/juristat.properties. If you want to
add something to there, you have to deal with it in 3 places.
1. add it to /etc/justistat/juristat.properties (REMEMBER to add it to that file in all your environemnts!)
2. add it to SystemSettings.java (you'll need getters and setters)
3. Add it to applicationContext.xml. this is where the value gets pulled from the properties file and set in
the SystemSettings object.

#### juristat - grab new case files

cd caseFiles2013-08-16-14-14-57
s3cmd -c ~/.s3cfg-juristat sync s3://juristat-cases-sequence-files/2013-08-16-14-14-57/ .
create a new elasticsearch index
run mapping file - curl -XPUT http://localhost:9200/juristat20130920/case/_mapping -d @mapping.json
create a new database
update caseloader to use the new directory, es index and database
run caseloader
generate es-backup (do ctrl-f to find those procs in this doc)
replicate the index in prod
drop the case tables in prod
mysqldump > mysql each table to prod
move the juristat es alias to the new es
restart tomcat


## mysql 
* redirect output to csv

SELECT * INTO OUTFILE '/tmp/result.csv'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n'
FROM dbCase;

* add an index to speed up findByStateCourtCodeLocationNumber

ALTER TABLE dbCase ADD INDEX covering_index (number,location,courtCode,state); 
ALTER TABLE dbCase_Party ADD INDEX covering_index (parties_PARTY_ID); to speed up the parties search. 23 seconds before. 19.8 seconds after...

* copy database or table to remote

mysqldump localDbName tableName -uUser -pPassword | mysql -h remote.com -u User -pPassword remoteDbName


##using amazon RDS 

I had some trouble getting hadoop map jobs to work with the mysqlTest databse, so I did this:
mysql -h mysqltest.cffbuilytz0u.us-east-1.rds.amazonaws.com -P 3306 -u postgres -p
use mysqlTest;
GRANT ALL ON `%`.* TO postgres@`%`;

solution found <http://www.fidian.com/problems-only-tyler-has/using-grant-all-with-amazons-mysql-rds> and here <https://sagebionetworks.jira.com/wiki/display/PLFM/Setting+up+AWS+RDS+(MySQL)+for+Synapse>

##Using pandoc
* Install it... dmg package, or available in distros apt-get, etc.
* if you are using a mac and plan to use latex or tex or generate a PDF, go [here](http://www.tug.org/mactex/morepackages.html) and download basictex. install it. open a command line and run sudo tlmgr update --self then run sudo tlmgr install dvipng (that's more for getting anki2 to run properly!) then you'll be all set for generating pdfs.
* Make a file, then run pandoc -s FILENAME -o file.html

##Using pandoc to create a 4x6 pdf (useful for notecards)

* pandoc -V geometry:paperwidth=4in -V geometry:paperheight=6in -V geometry:margin=.25in -o output.pdf input.md
* now make it smaller than 10pt font:
* pandoc -D latex > sixPtFont.latex
* add the following to sixPtTemplate.latex:
  \usepackage{scrextend}
  \changefontsizes[10pt]{6pt}
  \linespread{0.5}
* pandoc --template sixPtTemplate.latex -V geometry:paperwidth=4in -V geometry:paperheight=6in -V geometry:margin=.25in -o output.pdf input.md

this totally works until you md file has unicode in it... strip it out. I tried using iconv -f utf8 -t ASCII til.md > noUnicode.md but that didn't work... I should probably just set up pandoc's latex engine to properly handle unicode.

I wrote a bash script called command that is in /jordan/projects/code/pandocFourBySixCard that will do all the work for you.


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

#### Install a local jar and use it in your pom.

A coworker gave me a jar and said, use this. Ok...

mvn install:install-file -Dfile=/jordan/projects/code/juristat/src/main/lib/SubsequenceFinder-assembly-0.0.8-SNAPSHOT.jar\
                         -DgroupId=com.juristat \
                         -DartifactId=subsequencefinder \
                         -Dversion=0.0.8 \
                         -Dpackaging=jar

and your dependency will look like:

<dependency>
    <groupId>com.juristat</groupId>
    <artifactId>subsequencefinder</artifactId>
    <version>0.0.3</version>
</dependency>	

of course, you won't be able to build this anywhere else... MAKE A PROJECT AND DO THE RIGHT THING!

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
org.codehaus.cargo:cargo-maven2-plugin:redeploy in my pom. add what you need to the pom, then in jenkins under config project->build->Goals and options make sure to put org.codehaus.cargo:cargo-maven2-plugin:redeploy after site and package.

* if you need to modify settings.xml, find it in /etc/maven/settings.xml However, if you want a project specific settings file (i'm sure you do) follow this advice from stackoverflow - "Go to the 'Build' Section of the job and click "Advanced". There is a 'Settings File' option there. Specify the location your 'settings.xml' file."

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

##install and format a new drive on linux ubuntu unix whatever
* attach the drive via usb
* watch dmesg to see what device it ends up being, in my case today it was /dev/sdc
* OR you could use lshw -C disk to list all attached disks
* * sudo fdisk /dev/sdc
* l (list partitions)
* d (delete any partitions that are on there)
* n (create new parition)
* p (primary)
* 1 (one partition)
* w (write changes)
* q (quit)
* mkfs -t ext3 /dev/sdc1 (format an ext3 filesystem)
* 

##Install sbt on my mac
* download it
* unzip it to /usr/local/share
* nano .bash_profile to add /usr/local/share/sbt/bin to the path
* done

##Install 7zip on my mac from source
* download source tarball from sourceforge.
* cd to that directory, type make.
* cp target/7za /opt/bin
* run 7zip using 7za

##Install tmux on my mac
mkdir /jordan/projects/code/tmux
cd  /jordan/projects/code/tmux
curl -OL http://downloads.sourceforge.net/tmux/tmux-1.8.tar.gz
curl -OL https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz
tar xzf tmux-1.8.tar.gz
tar xzf libevent-2.0.21-stable.tar.gz

cd libevent-2.0.21-stable
./configure --prefix=/opt
make
sudo make install

cd ../tmux-1.8
LDFLAGS="-L/opt/lib" CPPFLAGS="-I/opt/include" LIBS="-lresolv" ./configure --prefix=/opt
make
sudo make install

You now have to run it using /opt/rin/tmux

##Install Pathogen and solarized into macvim (or vim for that matter)
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
add this to .vimrc: execute pathogen#infect()
$ cd ~/.vim/bundle
$ git clone git://github.com/altercation/vim-colors-solarized.git
add this to your .vimrc
syntax enable
set background=dark
colorscheme solarized

##Install ctags
mkdir ctags; cd ctags

:~/ctags $ tar xzvf ctags-5.8.tar.gz
:~/ctags $ cd ctags-5.8
:~/ctags/ctags-5.8 $ ./configure
:~/ctags/ctags-5.8 $ make
:~/ctags/ctags-5.8 $ sudo make install

##install tagbar (depends on ctags)

really just follow instructions from <http://thomashunter.name/blog/installing-vim-tagbar-with-macvim-in-os-x/>

then to use it hit esc \y <return> when you're in a file.

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


#using chef-solo with virtualbox
My notes are here <http://trickykegstands.com/virtualBoxVmsCloningHowTo.html>

#proxy

ssh -i ~/Downloads/proxy.pem -D 2001 ubuntu@

#bootstrap docs for older versions:
http://bootstrapdocs.com/v2.2.2/docs/base-css.html#forms

#Fun with text files
make a text file all lower case: tr '[:upper:]' '[:lower:]' < monsantoTitlesInDatabaseSortedNoQuotes.txt  > monsantoTitlesInDatabaseSortedNoQuotesUpcase.txt
compare two text files to see which lines only exist in the first file: comm -23 monsantoTitlesAllSorted.txt monsantoTitlesInDatabaseSortedNoQuotes.txt
remove all quotes from a file: sed s/\"//g monsantoTitlesInDatabaseSorted.txt > monsantoTitlesInDatabaseSortedNoQuotes.txt
put a comma at the end of every line of a file: sed "s/$/,/g" syngentaAppnos.txt  > syngentaAppnosWithComma.txt
remove all newlines from a file: tr -d '\n' < syngentaAppnosWithComma.txt >syngentaAppnosOneLine.txt
remove leading zeros from every line of a file sed -e 's/^[0]*//' boeingBobSorted.txt > boeingBobSortedStrippedLeading.csv
grep a file for every line that doesn't start with a match. here i was coming through an apache log file looking for ips that weren't mine grep -v '^216.43.16.195' access.log | grep -v '^127.0.0.1' | less +G
show lines from one file that are not present in the other file
comm -23 a.txt b.txt
By default, comm outputs 3 columns: left-only, right-only, both. The -1, -2 and -3 switches suppress these columns.


#Patent Data
<http://www.google.com/googlebooks/uspto-patents.html>
In CaseLoader's ConvertToJson, we have a program that extracts the XML from the PAIR files into JSON which is then shoved into elasticsearch.
In NodeThrowaway we have code that queries ES by assignee to figure out which companies have the most patents.

#So You Want to Start a Company

<http://www.sba.gov/content/follow-these-steps-starting-business>
<http://www.irs.gov/Businesses/Small-Businesses-&-Self-Employed/Checklist-for-Starting-a-Business>

* Get a Lawyer
* Get an Accountant
* Set up Quickbooks online
* Get an Address (small office? coworking space? ups box?)
* Name your company and select a DBA
* Create a company LLC/Inc. you probably want an LLC. put enough $ into it to get through the next steps.
* Get your federal id (Apply for EIN <http://www.irs.gov/Businesses/Small-Businesses-&-Self-Employed/Missouri-3>)
* Register in your state
* register/license in your city
* Start a bank account and open a credit card
* Buy/Transfer the domain into the company's name
* Trademark the name
* Create infrastructure. decide on a provider (aws? digital ocean? colocation) and create accounts. you can't beat route53, SES(maybe sendgrid, postmark),& S3. use chef or some variant. automate backup and script restores.
* private github or bitbucket
* Manage your keys.
* You'll want to run mysql, postgres, elasticsearch, web server, nagios, graylog
* Buy an SSL cert
* figure out deployment
* Bring up a social media server (website on a CMS which includes a blog, manage twitter, linked-in, vine, etc)
* figure out local computing and storage. probalby just need a few external drives and a rock solid plan. AUTOMATE BACKUPS.
* figure out your email addresses (google apps for businesses)
* figure out analytics (mixpanel, google analytics)
* figure out monitoring (pingdom, nagios, pagerduty, munin to keep things running)
* figure out versioning (bitbucket or github)
* figure out project management (pivitol tracker, basecamp, atlassian, redmine, time tracker like tick?)
* you will have a team soon. you'll need to communicate. google drive, a shared dropbox folder and hipchat (Asana?) will get you far.
* start tracking your metrics, automate it from the get-go.
* get a phone number (google voice?)i
* get office supplies like folders, dividers, tape, scissors, hole punch, binders, stamps, envelopes.
* get dry erase markers and a board if you need it.
* get a good printer/scanner
* Get support of local people ($, media, mentors)
* Write a terms of service
* Create a Stripe account
* Enable the ability to accept payment.
* learn how to invoice and set up a process
* enable user feedback, help, and support. (jira issue collector-like thing and phone/email support)
* hire a designer to make your logos and an initial design.
* Due Dilligence Package (cap table) automate cash flow analysis and accounting statements, integrate this with metrics.
* If you have employees or pay yourself a salary hire a payroll service 
* expense reporting, how do you manage that?
* automate the payment/calculation of quarterly taxes on income
* PR agency - pay one to get your name out.
* insurance, get it
* ...
* profit
* ...
* Visitor log in office

##how do you enable the ability to accept payment

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

Generator                                               $1000

lock picking tools                                       $100

Firstarter (flint/steel)                                  $10

Bug out bag and a four wheeler or dirt bike             $1500

red turtleneck, button down shirt (pink or blue,          $50
with some sort of texture), dark blue pants, 
awesome shoes.

-------------------------------------------------------------

Steel house inspired by the farnsworth house. Doable, but needs:

* railings
* sprinkler system
* security system including cameras. wired throughout
* hvac but still with radiant heat floors
* basement with garage like the olnick spanu house
* slate and black with wood ceilings and accents like the ben rose house
* steel is rusted then treated with phosphoric acid
* maybe a little more depth in the roof to allow for things like vents
* less glass for privacy, but preserve the golden ratio
* built off the edge of a ravine, more of the ravine than on it, though.
* it's a glass house, so not worth it unless there's a view.
* "one large room with freestanding elements taht provide differentiation within a free space"
* look at Crown Hall for inspiration.
* sound proofing and consider interior acoustics.
* column free with cantilevered perimeter.
* somehow make it awesome and livable. not sure how to do this (drafts, cold, heat) with all that glass.

-------------------------------------------------------------

* <http://forums.watchuseek.com/f39/breitling-navitimer-brief-history-most-famous-breitling-all-25057.html>

* regular cleaning
* landscaping and implement regular maintenance like aeration and edging.
* back porch and overhang (rodents)
* basement
* gutters
* car maintenance

* skid steer the yard
* gutters
* landscaping, 
* french drains
* mold remidiation
* get rid of mice

##Workflow for SOP's/checklists for System validation
installation steps
pre test setup
test
post test

##appliances
dishwasher model number is kuds30ixss1 - here's some parts online - [here](http://www.searspartsdirect.com/partsdirect/part-model/Kitchenaid-Parts/Dishwasher-Parts/Model-KUDS30IXSS1/0593/0130000/W1102063/00002?blt=06&prst=&shdMod=)

