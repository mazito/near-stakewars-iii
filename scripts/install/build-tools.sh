#!/bin/bash

# Just in case ...
sudo apt update -y

# Install developer tools:
sudo apt install -y git binutils-dev libcurl4-openssl-dev zlib1g-dev libdw-dev libiberty-dev cmake gcc g++ python docker.io protobuf-compiler libssl-dev pkg-config clang llvm cargo

#Install Python pip:
sudo apt install -y python3-pip

#Set the configuration:
USER_BASE_BIN=$(python3 -m site --user-base)/bin
export PATH="$USER_BASE_BIN:$PATH"

# Install Building env
sudo apt install -y clang build-essential make

# Install Rust & Cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Source the environment
. $HOME/.cargo/env
