#!/bin/bash

# Delete the old config.json file
rm ~/.near/config.json

# Download last version from AWS repo
wget -O ~/.near/config.json https://s3-us-west-1.amazonaws.com/build.nearprotocol.com/nearcore-deploy/shardnet/config.json

# Restart node
sudo systemctl restart neard


