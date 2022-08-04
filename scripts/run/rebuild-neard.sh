#!/bin/bash
# Build it !
export CURRENT=68bfa84ed1455f891032434d37ccad696e91e4f5

cd ~/nearcore

# Checkout to the commit needed, inidcated in
# [stakewars-iii/commit.md](https://github.com/near/stakewars-iii/blob/main/commit.md)
git fetch
git checkout $CURRENT

# Compile nearcore binary
cargo build -p neard --release --features shardnet
