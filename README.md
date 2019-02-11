The user jenkins needs to be added to the group docker

sudo usermod -a -G docker jenkins

Then restart Jenkins.

credentials: 
1-	mouhamedfall
password
github

2-	mouhamedfall
password
dockerhub

Manage Jenkins:

Global tool configuration:

jdk:
java
/usr/lib/jvm/java-8-openjdk-amd64

maven:
/usr/share/maven

add plugin maven invoke etc...

MyFirstJob
GitHub
choose project 


build trigger 1mn





kubectl --kubeconfig .kube/config  get nodes