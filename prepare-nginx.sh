#!/bin/bash -x
#Creating directories 

if [ -z "$1" ]
  then
    echo "No domain name supplied replaced by localhost"
    HOSTNAME=localhost
  else
    HOSTNAME=$1
fi

mkdir -p ~/.nginx-config && sudo chown 0:0 ~/.nginx-config

nginx_certs=~/.nginx-certs
if [ !  -d "$nginx_certs" ]; 
  then
    mkdir -p ~/.nginx-certs && sudo chown 0:0 ~/.nginx-certs 
    sudo mkdir -p ~/.nginx-certs/www && sudo chown 0:0 ~/.nginx-certs/www
    sudo mkdir -p ~/.nginx-certs/conf && sudo chown 0:0 ~/.nginx-certs/conf
  else
    echo "Certificates folder is present. Skipping."
fi

cp nginx-reverse/000-certbot.conf.txt nginx-reverse/000-certbot.conf
cp nginx-reverse/001-letsencrypt.conf.txt nginx-reverse/001-letsencrypt.conf

sed -i "s/localhost/$HOSTNAME/" nginx-reverse/000-certbot.conf
sed -i "s/example.org/$HOSTNAME/" nginx-reverse/001-letsencrypt.conf

sudo cp nginx-reverse/reverse.conf ~/.nginx-config/ 
sudo cp nginx-reverse/000-certbot.conf ~/.nginx-config/
sudo cp nginx-reverse/001-letsencrypt.conf ~/.nginx-config/
