
### 1. Actualizar servidor e instalar herramientas necesaris

El script `update-and-needed.sh` actualiza todas las bibliotecas del servidor e instala varias herramientas necesarias:
~~~
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

# Process viewer (similar to top)
sudo apt install htop -y

# Git 
sudo apt install git -y

# Colorizer for logs
sudo apt install ccze -y

# AWSCLI (AWS client tool)
# we will need it latter to download latest snapshots and config
sudo apt install awscli -y
~~~

![](images/Selecci%C3%B3n_014.png)

![](images/Selecci%C3%B3n_012.png)

Y podemos verificar que el servidor esta actualizado y el software instalado:

![](images/Selecci%C3%B3n_015.png)

### Instala Nodejs y el cliente de NEAR 

El script  `node-and-near-cli.sh` contiene:
~~~
#!/bin/bash
# Install required NEAR client software

sudo apt update -y

# Install node
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -  
sudo apt install build-essential nodejs
PATH="$PATH"

# Check Node.js and npm version:
# Must be: v18.x.x
#node -v

# Must be: 8.x.x
#npm -v

# Install NEAR-CLI (NEAR Client tool)
sudo npm install -g near-cli

# Add "shardnet" to ENV vars when starting console
# so we dont need to do export every time we login
export NEAR_ENV=shardnet
echo 'export NEAR_ENV=shardnet' >> ~/.bashrc

# Source the environment so we activate the new ENV vars
. ~/.bashrc
~~~

Y finalmente agrega a las variables de ambiente la red sobre la cual estaremos operando: `export NEAR_ENV=shardnet`.

![](images/Selecci%C3%B3n_016.png)

![](images/Selecci%C3%B3n_017.png)

Y verificamos la instalación:

![](images/Selecci%C3%B3n_018.png)

![](images/Selecci%C3%B3n_019.png)

**Probamos algunos comandos útiles**

**>** Ver las propuestas presentadas para ingresar al conjunto de validadores,
~~~
near proposals
~~~
![](images/Selecci%C3%B3n_035.png)

**>** Ver los nodos que entrarán en la próxima ronda (epoch) de validación:
~~~
near validators next
~~~

![](images/Selecci%C3%B3n_036.png)

**>** Ver los nodos que estan actualmente validando:
~~~
near validators current
~~~
![](images/Selecci%C3%B3n_037.png)


### Instalar las herramientas de desarrollo

El script `install/build-tools.sh` instalará las herramientas de desarrollo.

~~~
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
~~~

Y finalmente deja configuradas las variables de ambiente necesarias para Cargo y Rust.

![](images/Selecci%C3%B3n_020.png)

![](images/Selecci%C3%B3n_021.png)

![](images/Selecci%C3%B3n_022.png)

Y verificamos lo instalado:

![](images/Selecci%C3%B3n_023.png)

### Instalar el codigo fuente de `nearcore` y compilar

El script `install/source-code.sh` copia el repositorio desde Github:

~~~
#!/bin/bash
cd ~

# Git clone
git clone https://github.com/near/nearcore
cd nearcore
git fetch
~~~

![](images/Selecci%C3%B3n_024.png)

![](images/Selecci%C3%B3n_025.png)

Ya podemos compilar el codigo, el script `install/build-neard.sh` contiene:

~~~
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
~~~

donde `CURRENT` contiene el último commit recomendado (que puede ser distinto al actual debido a cuando se creo este documento).

![](images/Selecci%C3%B3n_026.png)

La compilacion toma algún tiempo así que se paciente por favor:

![](images/Selecci%C3%B3n_027.png)
![](images/Selecci%C3%B3n_028.png)

Finalmente verificamos que `neard` haya quedado construido con el commit correcto:

![](images/Selecci%C3%B3n_029.png)

> :clap: ¡Felicitaciones! Si llegaste hasta aquí ya tenemos nuestro nodo listo para comenzar a correr.

---

Ahora podemos pasar a la siguiente etapa [Inicializar y sincronizar el nodo](./04-Inicializar-y-correr-el-nodo.md)

