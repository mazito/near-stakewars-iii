# Challenge-013

#### Description

In this challenge, participants will learn how to update their node, migrate keys, and set up a BACKUP node.

Please note that this challenge includes multiple parts:

- Best Practices: is an informational section that outlines the optimal way of updating a validator node (no points)
- Task: in this section, participants will learn how to migrate validator keys. Only this part of the challenge will be evaluated. (25 UNP & 10 DNP)

#### Acceptance Criteria

- Run a backup node
- Successfully migrate validator keys from the MAIN node to the BACKUP node

# Steps taken

- create scripts

## Running the backup node ###

### 1. Reserved validator and backup keys (idtcn3)**
![](./images/Selecci%C3%B3n_001.png)
![](./images/Selecci%C3%B3n_002.png)

### 2. The start script `run/start-as-backup.sh`**
~~~
#!/bin/bash
# Stops the node and disables the current keys replacing them 
# with the reserve keys so it can NOT run as validator 
# then restarts the node as backup

# stop it before doing anything
echo "\n$(date): Stopping neard now ..."
sudo systemctl stop neard
sudo systemctl status neard

# workdir
cd ~/.near

# copy the backup node key to assure we are not using the previous one
# dont need to preserve previous keys cause we already have them stored
echo "\n\n$(date): Deleting validator key and replacing node key ..."
cp -v ~/keys/backup/backup_node_key.json node_key.json
cat node_key.json | jq

# disable validator_key so it can not run as validator even if it restarts
rm -v inactive_validator_key.*
cp -v validator_key.json inactive_validator_key.json
rm -v validator_key.json

# we are done ... 
DATE=$(date)
echo "\n\n$(date): Restart neard now ..."
echo "$(date): Disabled as validator, node running as BACKUP"
sudo systemctl start neard
sudo systemctl status neard
~~~

### 3. Start as backup node

![](./images/Selecci%C3%B3n_004.png)

### 4. Check node_key

![](./images/Selecci%C3%B3n_006.png)

### 5. Running as backup node

![](./images/Selecci%C3%B3n_005.png)

![](./images/Selecci%C3%B3n_007.png)

---

## Stop current validator (idtcn2)

### 1. Check current validator keys

![](./images/Selecci%C3%B3n_008.png)

### 2. Stop node 



## Start as validator (idtcn3)
