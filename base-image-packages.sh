#!/bin/bash
: ${1?Error: A domain should be passed as agrument for registering cert ex: example.com}
echo STEP 1: update image

sudo yum update

echo STEP 2: install git

sudo yum install git

echo STEP 3: install nginx

sudo yum install nginx

echo STEP 4: install cert

wget https://dl.eff.org/certbot-auto
chmod a+x certbot-auto
sudo cp certbot-auto /usr/bin/

#pass domain name as cli agrument ex. ./base-image-packages.sh example.com 
sudo /usr/bin/certbot-auto --nginx -d $1 -d www.$1 --debug