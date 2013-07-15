This is how my setup works

1 somewhat vanilla VM who I use as the machine I clone every single time. that vm has a user named jordan and NO mac address associated with eth0 (See persistent net rules). The VM host that brings up all these vm's has the private key for jordan. so, it can ssh right in. the vanilla guy has virtualbox guest tools.

a script called clonevm that takes in a unique vm name (for box managing) and a mac address.

my dhcp server is set up to assign static ip addresses to specific mac addresses. Specifically, i set up:

00:00:00:00:00:30 -> 192.168.1.30
00:00:00:00:00:31 -> 192.168.1.31
->
00:00:00:00:00:50 -> 192.168.1.50

so I can bring up 21 VM's which will basically get a static ip address.

the clone script will create the vm, start it, and verify the IP address (just by echoing it out and writing it to a file called newIp)

there is a deletevm script that takes in the unique name


basically, bring up a usable box on a specific ip by saying

command   VM Name      mac address
./clonevm 192.168.1.30 000000000030

//TODO: would be nice to just take in the IP address and grab the last 2 digits and create the mac address off that. bash-fu I cannot accomplish

NOW, we want to configure the node using chef. see usingKnifeSolo.txt for my notes on how to set up knife, chef, and knife-solo

cd /root/firstKitchen

knife solo prepare jordan@192.168.1.30 -P ''  //put the password in there if you don't want to be prompted. having the public key only gets you so far.

knife solo cook jordan@192.168.1.30 nodes/webDb.json -P '' //again, the password. the nodes/<?>j.son will give your server the right flavor.


//this is a good tutorial for chef http://www.jasongrimes.org/2012/06/provisioning-a-lamp-stack-with-chef-vagrant-and-ec2-2-of-3/
and also http://www.jasongrimes.org/2012/06/deploying-a-lamp-application-with-chef-vagrant-and-ec2-3-of-3/ 

I need to eventually use a chef server. use those sites to learn how, including creating users, and all the stuff I really need to do.. ugh.

to start, we need a chef-repo do it by
git clone git://github.com/opscode/chef-repo.git
then you can
knife cookbook site install apache2
knife cookbook site install postgresql
knife cookbook site install tomcat

BUT, you can't use that and use knife-solo at the same time (i think) because that requires you to pull it from git. knife-solo requires you to create it using "knife kitchen"

So, get your cookbooks that way, then copy them too your kitchen list of cookbooks. Do you all your work in the kitchen..


If you want to write a recipe that downloads some source and tries to build it, here is some advice on what/how to do that:
<http://stackoverflow.com/questions/8530593/chef-install-and-update-programs-from-source>


this is a better postresql setup:
https://github.com/coroutine/chef-postgresql.git

you have to set the postgres user's password if you want to use it because chef-postgres doesn't do it.

log into the database server. run
sudo -u postgres psql template1
ALTER USER postgres with encrypted password 'your_password';

check your connection using psql -h localhost -U postgres template1

ZOOKEEPER:

https://github.com/phillip/chef-zookeeper  is the one i pulled. 





Remember any time you start up the VM from which you clone (the vanilla VM) you have to get rid of the file that remembers the mac address. otherwise networking on eth0 will not come up:

when you create a VM that you're going to use for cloning. BE SURE TO DELTET

/etc/udev/rules.d/*-persistent-net.rules

because that associates the mac address with eth0. if it doesn't exist, it just finds the current mac address and uses that..

sudo rm /etc/udev/rules.d/70-persistent-net.rules 


if you want to list running vas, do this:

VBoxManage list runningvms