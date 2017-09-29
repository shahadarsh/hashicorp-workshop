#!/usr/bin/env bash
set -e

echo "Installing dependencies..."
sudo apt-get update -y
sudo apt-get install -y unzip

echo "Fetching Consul..."
CONSUL=0.9.0
cd /tmp
wget https://releases.hashicorp.com/consul/${CONSUL}/consul_${CONSUL}_linux_amd64.zip -O consul.zip --quiet

echo "Installing Consul..."
unzip consul.zip >/dev/null
chmod +x consul
sudo mv consul /usr/local/bin/consul
sudo mkdir -p /opt/consul/data

# Read from the file we created
SERVER_COUNT=$(cat /tmp/consul-server-count | tr -d '\n')
CONSUL_JOIN=$(cat /tmp/consul-server-addr | tr -d '\n')

# Write the flags to a temporary file
cat >/tmp/consul_flags << EOF
CONSUL_FLAGS="-server -bootstrap-expect=3 -join=${CONSUL_JOIN} -data-dir=/opt/consul/data"
EOF

echo "Installing Upstart service..."
sudo mkdir -p /etc/consul.d
sudo mkdir -p /etc/service
sudo chown root:root /tmp/upstart.conf
sudo mv /tmp/upstart.conf /etc/init/consul.conf
sudo chmod 0644 /etc/init/consul.conf
sudo mv /tmp/consul_flags /etc/service/consul
sudo chmod 0644 /etc/service/consul
