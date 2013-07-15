I looked into using vagrant, but I don't really want a bunch of VM's running locally. I want to build a dev environment on a server. So, vagrant is not the right choice. Instead, I want to be able to quickly spin up a dev vm, configure it, and use the shit out of it. Or, more likely, bring up a cloud of zookeepers or hadoop servers and use them. I have no interest in doing that by hand. So, I chose Chef to provision. Just need a little glue to get it working nicely with virtualbox and the raw ubuntu vm's I created. The end of this is I can use my cookbooks to spin up all these instances on ec2 using chef and skipping the virtualbox stuff I hacked together.

it started here - how to use knife-solo from a youtubevideo http://www.youtube.com/watch?v=1G6bd4b91RU

and the transcript which is better, overall, is at:

http://devops.mashion.net/2011/08/04/chef-solo-basics/

you have to install the knife-solo gem!!!!!

gem install knife-solo

see github.com/matschaffer/knife-solo  

use knife-solo to remotely install chef on a blank machine (using knife prepare) and lets you push your recipes to the machine using knife cook.

knife kitchen thisisadirectoryofcookbooks

cd thisisadirectoryofcookbooks

create a cookbook

knife cookbook create nginx -o cookbooks

creates a cookbook called nginx in cookbooks/nginx
look at cookbooks/nginx/recipes/default.rb

Now, we're using solo, so there is no server. we'd like to run our cookbooks on a remote server… so, to do that, knife provides a thing that will install ruby and chef so we can run chef-solo.

* note, i had to upgrade to ruby 1.9.1 (apt-get install ruby1.9.1 then update alternatives) then I had to gem install chef, gem install knife-solo and gem clean to get the versions working properly. I then had to change some commands in this document because chef solo's commands changed)

knife solo prepare user@servername   (WHY NOT USE BOOTSTRAP? I Don't know. feel free to look at http://wiki.opscode.com/display/chef/Client+Bootstrap+Fast+Start+Guide)

this will generate an empty node configuration under nodes/servername

this is where the run_list is… add recepies/nginx to the runlist. it should look like

{ "run_list": [ "recipe[nginx]" ] }

run the knife solo cook command to run the recipe on the server:

knife solo cook user@servername

that copies all cookbooks over and runs them on the server.



to review:

install chef using apt-get
install knife-solo using gem

create a project using knife kitchen

create a cookbook using knife cookbook create, then add packages and whatnot to that recipe

run knife prepare on the server you want to configure (this installs ruby and knife)

run knife cook to run the recipes. do this a lot. every time you update your cookbook you can cook..

COOKBOOKS:

package 'nginx'  (this will run apt-get to install that package…

service 'nginx' to start the service. the code looks like
service 'nginx' do
  supports [:status]
  action :start
end

here's a screencast about chef server:

http://www.youtube.com/watch?v=g_s8UFFowXI&NR=1&feature=endscreen

part 2
http://www.youtube.com/watch?v=gcapNn45dU8



THis is how you create a new VM and bootstrap it using virtualbox and my scripts to create a raw vm:

ssh to the 64bit server (the one that's hosting all the virtualbox vm's)

sudo su

cd /root

./clonevm VMNAME  (this will clone and start a relatively vanilla ubunutu vm. waits 30 seconds to boot up and returns the ip address.

cd firstKitchen

knife prepare jordan@newIp -P password (put password in single quotes if it has special chars)

nano nodes/newIp.json  and add whatever cookbooks you want to the run_list

knife cook jordan@newIp -P password  (this installs the recipes. will ask for password a bunch of times, anyway)




