sudo docker build -t jenkins.
sudo docker run --name jenkins-docker -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock jenkins


lsof -i:80
kill $(lsof -t -i:80)
kill -9 $(lsof -t -i:80)


sudo netstat -plten |grep "80"
ill -9 2647


export PATH="$HOME/.kubeadm-dind-cluster:$PATH"



#Installer et Configurer java  
wget https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
tar xvzf .tar
sudo mv jdk /usr/lib/jvm
cd /usr/lib/jvm
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.8.0_191/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.8.0_191/bin/javac 1
sudo update-alternatives --config java
sudo update-alternatives --config javac
choisir option 2
java -version
javac -version

#Installer et Configurer jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins
sudo usermod -a -G docker jenkins

I have Jenkins running in Docker and connected Jenkins is using Docker socket from host machine Ubuntu 16.04 via volume to /var/run/docker.sock.

For me solution was:

1) Inside Docker container of Jenkins (docker exec -it jenkins bash on host machine)

usermod -a -G docker jenkins
chmod 664 /var/run/docker.sock
service jenkins restart (or systemctl restart jenkins.service)
su jenkins
2) On host machine:

sudo service docker restart
664 means - read and write(but not execute) for owner and users from group.

#to change jenkins port
vim /etc/default/jenkins
HTTP_PORT=8088


echo "mfall ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/mfall