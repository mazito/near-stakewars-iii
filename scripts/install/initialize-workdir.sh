#!/bin/bash

cd ~/nearcore

# Init the working directory
./target/release/neard --home ~/.near init --chain-id shardnet --download-genesis

# Delete the old config.json file
rm ~/.near/config.json

# Download last version from AWS repo
wget -O ~/.near/config.json https://s3-us-west-1.amazonaws.com/build.nearprotocol.com/nearcore-deploy/shardnet/config.json

# Delete old genesis file
rm ~/.near/genesis.json

# Download last version from AWS repo
wget -O ~/.near/genesis.json https://s3-us-west-1.amazonaws.com/build.nearprotocol.com/nearcore-deploy/shardnet/genesis.json
