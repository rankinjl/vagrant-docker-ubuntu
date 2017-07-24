# Shell script to provision ubuntu VM for Docker usage

sudo apt-get update
sudo apt-get install -y linux-image-extra-$(uname -r) \
	linux-image-extra-virtual \
	apt-transport-https ca-certificates curl software-properties-common

# Get Docker's official GPG key and verify key fingerprint
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
echo "0EBFCD88 fingerprint should be: 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88"

# Set up stable repo
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install Docker: daemon starts automatically
sudo apt-get update
sudo apt-get install -y docker-ce

# Install vagrant
wget -q https://releases.hashicorp.com/vagrant/1.8.5/vagrant_1.8.5_x86_64.deb
sudo dpkg -i vagrant_1.8.5_x86_64.deb
rm -f vagrant_1.8.5_x86_64.deb

# Add vagrant user to docker group --> sudo not needed to run commands
sudo gpasswd -a vagrant docker

#vagrant ssh
#cd /vagrant/Docker
#vagrant up
#docker exec myapachecontainer service apache2 restart