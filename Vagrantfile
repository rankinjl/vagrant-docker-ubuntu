# -*- mode: ruby -*-
# vi: set ft=ruby :
# Example Ubuntu VM for Docker edited by Jessica Rankins 6/14/2017


  # All Vagrant configuration is done below. The "2" in Vagrant.configure
  # is the configuration version.
Vagrant.configure("2") do |config|
  
  config.vm.network "forwarded_port", guest: 8080, host: 8080, id: "Web"
  config.vm.box = "ubuntu/trusty64"
  	  
  config.vm.define "UbuntuDockerBox" do |ubuntu|
    ubuntu.vm.provider :virtualbox do |vb|
	  vb.name = "UbuntuBox"
	  #vb.gui = true
      vb.customize ["modifyvm", :id, "--description", "This is a ubuntu VM to be used for Vagrant-Docker examples."]
    end
	ubuntu.vm.provision :shell, path: "vagrantdockervmsetup.sh"
  end 
  
  config.vm.post_up_message = "Successfully started Ubuntu VM.
  		See example web page in host browser at 127.0.0.1:8080

		TO GET THINGS UP AND RUNNING:
		vagrant ssh
		cd /vagrant/Docker
		vagrant up
		docker exec myapachecontainer service apache2 restart"

end    # End configuring