#!/bin/bash

# NOTE: This script must be run with sudo

USERNAME="ryan"
DOMAIN="ryantest.southeastasia.cloudapp.azure.com"
MAIL="mycloud2019@outlook.com"

# Install Docker-CE
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update

sudo apt-get -y install docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker $USERNAME



# Install Nginx
sudo apt-get install nginx -y


# Install Cert-Bot
sudo apt-get update
sudo apt-get install software-properties-common -y
sudo add-apt-repository universe -y
sudo add-apt-repository ppa:certbot/certbot -y
sudo apt-get update
sudo apt-get install certbot python-certbot-nginx -y

# Install certficate
sudo certbot --nginx --non-interactive -d $DOMAIN -m $MAIL


# Config Nginx
sudo ln -s /home/$USERNAME/data/docs /var/www/html/docs
sed  "s/dreamway.southeastasia.cloudapp.azure.com/$DOMAIN/g" /home/$USERNAME/data/nginx/default > /tmp/nginx.default
sudo cp /tmp/nginx.default /etc/nginx/sites-available/default
rm /tmp/nginx.default
sudo cp /home/$USERNAME/data/nginx/.htpasswd /etc/nginx/.htpasswd
sudo systemctl restart nginx



# Install Shadow-Socks
sudo add-apt-repository ppa:max-c-lv/shadowsocks-libev -y
sudo apt-get update
sudo apt install shadowsocks-libev -y
sudo cp /home/$USERNAME/data/shadowsocks/config.json /etc/shadowsocks-libev/config.json
sudo systemctl restart shadowsocks-libev


