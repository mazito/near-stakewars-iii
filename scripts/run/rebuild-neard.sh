#!/bin/bash
# Build it !
export CURRENT=$(curl -s https://raw.githubusercontent.com/near/stakewars-iii/main/commit.md)

# Checkout to the commit needed, inidcated in
# [stakewars-iii/commit.md](https://github.com/near/stakewars-iii/blob/main/commit.md)
cd ~/nearcore
git fetch
git checkout $CURRENT

# Compile nearcore binary
cargo build -p neard --release --features shardnet

# Restart
sudo systemctl restart neard
sudo systemctl status neard
sudo journalctl -n 100 -f -u neard | ccze -A
