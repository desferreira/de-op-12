#!/bin/bash
sudo yum update -y

# Install helpers
sudo yum install yum-utils telnet make -y

# Install Java and Go
sudo yum install java-11-openjdk-devel go -y

# Install Docker
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

sudo usermod -aG docker ec2-user
sudo chmod 666 /var/run/docker.sock
sudo systemctl start docker
