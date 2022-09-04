#!/bin/bash

# Update and upgrade Linux release
sudo apt update -y
sudo apt upgrade -y

# This are needed and usefull tools
# we install them first

# Nice editor (you can use 'nano' too)
sudo apt install ne -y

# Network monitor
sudo apt install nload -y

# Process vieweres (similar to top)
sudo apt install htop -y
sudo snap install bpytop -y

# Git 
sudo apt install git -y

# Colorizer for logs
sudo apt install ccze -y

# AWSCLI (AWS client tool)
# we will need it latter to download latest snapshots and config
sudo apt install awscli -y
