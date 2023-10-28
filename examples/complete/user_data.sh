#!/bin/bash

cd /tmp
sudo yum update -y

# aarch64 / arm64 -> arm64. others -> amd64
arch=$(arch | grep -q ar && echo "arm64" || echo "amd64")
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_${arch}/amazon-ssm-agent.rpm

# install redis-cli 7.0
sudo dnf install -y gcc make
wget http://download.redis.io/releases/redis-7.0.0.tar.gz
tar xzf redis-7.0.0.tar.gz
cd redis-7.0.0
make
sudo cp src/redis-cli /usr/local/bin/
