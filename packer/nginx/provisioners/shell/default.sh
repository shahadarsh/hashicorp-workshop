#!/usr/bin/env bash

set -e

sudo apt-get update
sudo apt-get install -y python-pip
sudo pip install ansible

sudo curl -L https://github.com/aelsabbahy/goss/releases/download/v0.3.5/goss-linux-amd64 -o /usr/local/bin/goss
sudo chmod +rx /usr/local/bin/goss
