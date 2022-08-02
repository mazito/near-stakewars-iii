#!/bin/bash
# Update and upgrade
sudo apt update -y
sudo apt upgrade -y

# Some very needed tools
sudo apt install ne -y
sudo apt install nload -y
sudo apt install htop -y
sudo apt install git -y
sudo apt install ccze -y

# Install AWSCLI (AWS client tool)
# we will need it latter to download latest snapshots and config
sudo apt install awscli -y
