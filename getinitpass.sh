#!/bin/bash -x
echo "Getting the initial pass for Jenkins"

CONTAINER_NAME=jenkins-blueocean
docker cp $CONTAINER_NAME:/var/jenkins_home/secrets/initialAdminPassword ./initpass

echo "Initial password for Jenkins"
cat initpass
