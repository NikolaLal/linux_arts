sudo apt-get -y update
sudo apt-get install -y $1
sudo apt-get -y update --fix-missing
sudo apt-get install -y $1

sudo echo "deb https://jfrog.bintray.com/artifactory-debs xenial main" | sudo tee -a /etc/apt/sources.list

sudo curl https://bintray.com/user/downloadSubjectPublicKey?username=jfrog | sudo apt-key add -

sudo apt-get update
sudo apt-get install jfrog-artifactory-oss

sudo systemctl start artifactory.service

if netstat -tulpen | grep 8081
then
	exit 0
fi
