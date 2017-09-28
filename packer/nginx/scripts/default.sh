#!/usr/bin/env bash

set -e

#Updating dependencies
sudo apt-get update
sudo apt-get install -y curl
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y unzip