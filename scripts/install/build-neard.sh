#!/bin/bash
# Build it !
export CURRENT=c1b047b8187accbf6bd16539feb7bb60185bdc38

cd ~/.nearcore

# Checkout to the commit needed, inidcated in
# [stakewars-iii/commit.md](https://github.com/near/stakewars-iii/blob/main/commit.md)
git fetch
git checkout $CURRENT

# Compile nearcore binary
cargo build -p neard --release --features shardnet
