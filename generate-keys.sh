#!/bin/bash -x

if [ -z "$1" ]
  then
    echo "No domain name supplied replaced by localhost"
    KEY_NAME=localhost
  else
    KEY_NAME=$1
fi

# Generating keys inside the container
sudo docker exec -it jenkins-blueocean ssh-keygen -t rsa /var/jenkins_home/.ssh/KEY_NAME -C jenkins

# Copying the keys to the host machine
mkdir -p .generated
sudo docker cp jenkins-blueocean:/var/jenkins_home/.ssh/KEY_NAME.pub .generated/
