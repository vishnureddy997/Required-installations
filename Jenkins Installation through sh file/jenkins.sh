#! /bin/bash
sudo apt-get update
sudo apt-get install default-jre -y
java --version
sudo apt-get update
sudo apt-get install default-jdk -y
javac --version
sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt install jenkins -y
sudo systemctl start jenkins