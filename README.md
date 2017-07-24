# vagrant-docker-ubuntu

Setting up a Docker Apache Web Server using Vagrant on a Ubuntu VM (VirtualBox)
Edited by Jessica Rankins on 6/15/2017

GOALS:
- Use Vagrant and Docker to configure a Docker container in a Vagrantfile
		on a linux machine (Ubuntu)
- Demonstrate Infrastructure as code principles (script configures 
		and provisions environments to ensure environment parity)
- Networking: Forwarded ports to host from VM from Web container: 
		80 to 8080 to 8080 for apache webserver demonstration on linux
		
PREREQUISITES: ON WINDOWS HOST COMPUTER, HAD TO:
- Install VirtualBox (any version should work)
- Install Git for Windows (version 2.12.2.windows.1)
- Install Vagrant (version 1.9.4)
	
TO EXECUTE:
- cd to directory with Vagrantfile for Ubuntu VM (in this directory)
- make sure you have a "Docker" folder with a public-html folder, 
		Dockerfile, Vagrantfile for the Apache container
- ```vagrant up```
- after successful vagrant up, ```vagrant ssh``` into ubuntu VirtualBox VM
  - ```cd /vagrant/Docker```
	- ```vagrant up```
	- ```docker exec myapachecontainer service apache2 restart1```
- See example web page in Windows host browser at 127.0.0.1:8080
	
- When done, ```vagrant destroy``` in /vagrant/Docker to get rid of container
- ```exit``` from vagrant ssh
- ```vagrant destroy``` to get rid of Ubuntu VM
	
SOME USEFUL COMMAND LINE COMMANDS:
- ```vagrant up [--provider=docker]``` to create/start the container 
		corresponding to the Vagrantfile in the current directory [by using
		Docker as the provider and not VirtualBox if it does not detect it]
- ```vagrant docker-exec [VMname] -- command_to_execute``` to run a 
		one-off command against a Docker container by containername
		(error if container not running)
- ```vagrant docker-logs``` to see the logs of a running container
- ```vagrant reload [--provision]``` to reload container to include new 
		Vagrantfile commands [and reload provisions]
- ```vagrant destroy``` to shut down and deallocate resources corresponding 
		to container in this directory
- ```vagrant ssh``` to start ssh session into container in this directory 
		(end by typing "logout"); Uses Git, private key provided by Vagrant
		(Ubuntu VM supports ssh, but container does not)

EXECUTION OF VAGRANTFILE COMMANDS:
- "name" in "config.vm.define 'name' do |n|" is the same as the
		"config" variable.
- Commands placed inside the "config.vm.define 'name' do |n|" are
		applied only to the defined container (name).
- Commands placed outside this command are done to all containers.
- Commands are executed outside-in, in the order listed in the
		Vagrantfile.
	
