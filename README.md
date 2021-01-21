# Jenkins-docker

Scripts para desplegar jenkins con docker-compose

## Steps to configure for ssl

To configure with ssl you should  make the following steps:
```bash
./prepare-nginx.sh <domainname> 
./init-letsencrypt.sh <domainname> <emailaddress>
```

Afer it, it automatically generates the certificates and launches the 
container via docker-compose. 

## Launch with docker-compose

If you want to launch manually the containers:
```bash
docker-compose up -d
```


