#!/usr/bin/env bash

echo "packer: nginx"
sudo mkdir -p /var/log/nginx
sudo chown $INSTANCE_USER /var/log/nginx
sudo chmod -R 755 /var/log/nginx
sudo apt-get install nginx -y