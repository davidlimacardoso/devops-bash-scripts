# ABOUT THIS PROJECT

the purpose of this tutorial is a DevOps training, testing and executing scripts using bash on CentOs provisioned by vagrant about Oracle VirtualBox
Could be execute remote bash and loop commands through scriptbox vm in the another remote instances.

# Vagrant Example Commands

````
#vagrant
vagrant up

#Vagrant
vagrant reload scriptbox
vagrant ssh scriptbox

````
# Fix CentOS Repo 

````
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
````

### All Scripts is Created Inside /opt/scripts

# Set Remote Authenticate by User and Password (Legacy)
You can to set using tuneling ssh, but actually is not recomended.
### CentOS (web01 & web02)
````
#add user and password: devops 
adduser devops
passwd devops

#Set devops run root commands "devops  ALL=(ALL)       NOPASSWD: ALL" inside visudo
visudo
>>
## Allow root to run any commands anywhere
root    ALL=(ALL)       ALL
devops  ALL=(ALL)       NOPASSWD: ALL
````
### Ubuntu (web03)
Ubunto ssh isn't accessible using password of user, because is denied by default, you can to set *PasswordAuthentication* "no" for "yes" inside sshd_config:
````
vim /etc/ssh/sshd_config
>>
# To disable tunneled clear text passwords, change to no here!
PasswordAuthentication yes
...
systemctl restart ssh

````

````
#add user and password: devops 
adduser devops
passwd devops

#Set devops run root commands "devops  ALL=(ALL)       NOPASSWD: ALL" inside visudo
visudo
>>
## Allow root to run any commands anywhere
root    ALL=(ALL)       ALL
devops  ALL=(ALL)       NOPASSWD: ALL
````
# Set Remote Authenticate SSH Keys (Recomended)
You can to set using tuneling ssh by key pairs, is more recomended.
Let's to make inside scriptbox vm
### SCRIPTBOX
````
#Generate keys pairs
ssh-keygen

#Send keys to remote instances
ssh-copy-id devops@web01
ssh-copy-id devops@web02
ssh-copy-id devops@web03

#Test ssh remote connection 
ssh -i .ssh/id_rsa devops@web01 uptime
````
# Multi OS Web Setup
Tests executed inside ``/opt/scripts/remote_websetup``

Execute multiple commands to distinct ssh hosts:
````
for host in `cat remhosts` ; do ssh devops@$host uptime ; done
````

Distinct OS System have a trouble to execute commands, because each OS has your package source eg. CentOS has Yum package and Ubuntu has APT package source...

eg:
````
for host in `cat remhosts` ; do ssh devops@$host sudo yum install git -y ; done
...
Complete!
sudo: yum: command not found
````
**But this is easy to solve with batch conditional...**


# Multi OS Setup With Batch

````
../scripts/remote_websetup 
├── multios_websetup.sh   ----> Script to install packages
├── remhosts              ----> Hostname or IP SSH connect
├── testfile.txt          ----> File test do SCP sends
└── webdeploy.sh          ----> Script to send multios_websetup.multios_websetup by SCP sends and execute each ssh host
````

To deploy in multiple hosts, will use the following commands o scriptbox instance:

````
chmod +x webdeploy.sh
./webdeploy.sh
````

After check all IP hosts web01, web02 and web03 in web browser...
Can you to take at ``/etc/hosts``

````
cat /etc/hosts
...
127.0.1.1 scriptbox scriptbox
192.168.0.195 web01
192.168.0.117 web02
192.168.10.15 web03
````

***


# References
- https://visualpath.in/devopstutorials/devops
- Course: Udemy [DevOps Beginners to Advanced with Projects](https://www.udemy.com/course/decodingdevops/?couponCode=ST11MT91624B)
- Instructor: Imran Teli
- Github: [devopshydclub](https://github.com/devopshydclub)