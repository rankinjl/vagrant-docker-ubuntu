# vagrant-docker-ubuntu/Docker
Setting up a Docker Apache Web Server with Vagrant on Ubuntu

Edited by Jessica Rankins on 6/14/2017

ON SUCCESS:		See example web page in host browser at 127.0.0.1:8080

TO EXECUTE FROM INSIDE UBUNTU ENVIRONMENT (```vagrant ssh``` to get into Ubuntu VM):
- cd to directory with Vagrantfile and Dockerfile (/vagrant/Docker)
- ```vagrant up```
- ```docker exec myapachecontainer service apache2 restart```

GOALS:
- Use Vagrant and Docker to configure a Docker container in a Vagrantfile.
- Demonstrate Infrastructure as code principles (script configures 
		and provisions environments to ensure environment parity).
- Be able to provision a container with a script.
- Networking: Forwarded ports to VM from Web container: 80 to 8080 
		for apache webserver demonstration

SOME USEFUL COMMAND LINE COMMANDS:
- ```vagrant up [--provider=docker]``` to create/start the container 
		corresponding to the Vagrantfile in the current directory [by using
		Docker as the provider and not VirtualBox if it does not detect it]
- ```vagrant docker-exec [VMname] -- command to execute``` to run a 
		one-off command against a Docker container by containername
		(error if container not running) same as docker-run??
- ```vagrant docker-logs``` to see the logs of a running container
- ```vagrant reload [--provision]``` to reload container to include new 
		Vagrantfile commands [and reload provisions]
- ```vagrant destroy``` to shut down and deallocate resources corresponding 
		to container in this directory
- ```vagrant ssh``` to start ssh session into container in this directory 
		(end by typing ```logout```); Uses Git, private key provided by Vagrant

EXECUTION OF VAGRANTFILE COMMANDS:
- "name" in "config.vm.define 'name' do |n|" is the same as the
		"config" variable.
- Commands placed inside the "config.vm.define 'name' do |n|" are
		applied only to the defined container (name).
- Commands placed outside this command are done to all containers.
- Commands are executed outside-in, in the order listed in the
		Vagrantfile.
		
