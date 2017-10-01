#!/usr/bin/env bash

set -e

sudo apt-get update
sudo apt-get install -y python-pip
sudo pip install ansible