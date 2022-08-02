#!/bin/bash
# Install required NEAR client software

sudo apt update -y

# Install node
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -  
sudo apt install build-essential nodejs
PATH="$PATH"

# Check Node.js and npm version:
# Must be: v18.x.x
node -v

# Must be: 8.x.x
npm -v

# Install NEAR-CLI (NEAR Client tool)
sudo npm install -g near-cli

# Add "shardnet" to ENV vars when starting console
export NEAR_ENV=shardnet
echo 'export NEAR_ENV=shardnet' >> ~/.bashrc
