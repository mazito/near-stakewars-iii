# NEAR StakeWars III - Challenge-14

> In this challenge, participants will learn how to create, run, and modify the auto-backup node script.

> For this challenge, we recommend using Bash, however, Python can be used as well.

**IMPORTANT**: We will run and store this backups on the failvoer node (idtcn3).

### 1. Wasabi account

[Wasabi](https://wasabi.com/) is a cloud storage compatible with AWS S3 but more cost efficient per Gb stored.

We have opened an account in Wasabi, and created a private bucket `near-stakewars-iii` to store our backups.

### 2. Install `rclone`

We will use [Rclone](https://rclone.org/) to upload files to Wasabi.

Rclone is a cross-platform, command-line data synchronization application, similar to rsync, but focuses on cloud storage management.

Installation:
~~~
sudo apt install rclone
~~~

Configuration file `~/config/rclone/rclone.conf` for Wasabi bucket.
~~~
[wasabi]
type = s3
provider = Wasabi
env_auth = true
access_key_id = ******************************
secret_access_key = ****************************
region = us-east-1
endpoint = s3.wasabisys.com
location_constraint =
acl = private
server_side_encryption =
storage_class =
~~~

### 3. Script for backup and transfer to cloud script:

As we can see below, there is not much difference between compressed and uncompressed `tar` files. So the script will create an uncompressed tar file because it is much faster.

![](./Selecci%C3%B3n_005.png)

~~~
#!/bin/bash

# Set environment
# Caution: the backups and logs folders must already exist
export ROOT=/home/ubuntu
export DATA=$ROOT/.near/data
export BACKUPS=$ROOT/backups
export LOGF=$ROOT/logs/backups.log

# Stop failover service
sudo systemctl stop neard-failover 
wait
echo "NEAR Failover node was stopped" | ts >> $LOGF

# Remove previous files from backup folder
rm -vf $BACKUPS/* | ts >> $LOGF

# Create uncompressed tar file from current data dir and use DATE to stamp it
DATE=$(date +%Y-%m-%d)
TAR="near-data-$DATE.tar"
echo "Backup started" | ts >> $LOGF
cd $DATA
tar cvf $BACKUPS/$TAR ./
echo $TAR > $BACKUPS/latest
echo "Backup completed" | ts >> $LOGF

# Transfer to Wasabi bucket
echo "Start upload to Wasabi" | ts >> $LOGF
rclone -v copy $BACKUPS wasabi:near-stakewars-iii | ts >> $LOGF
echo "Upload to Wasabi completed" | ts >> $LOGF

# Restart failover node
sudo systemctl start neard-failover
echo "NEAR Failover node was started" | ts >> $LOGF
~~~

### 4. Running script and creating backup

After runnnig the script, we end with a tar file and a `latest` file containg the name of the last backup file.

![](./Selecci%C3%B3n_001.png)

Then will upload it to the Wasabi bucket:

![](./Selecci%C3%B3n_002.png)
![](./Selecci%C3%B3n_003.png)
![](./Selecci%C3%B3n_004.png)
![](./Selecci%C3%B3n_006.png)

### 5. Crontab for running at end of day

We add this script to `crontab` so it will run daily at 23:00.

![](./Selecci%C3%B3n_006.png)

### 6. Script for restoring backup files

A script for restoring the latest stored backup:
~~~
#!/bin/bash
# Restore from latest backup 

# Settings
export ROOT=/home/ubuntu
export DATA=$ROOT/.near/data
export BACKUPS=$ROOT/backups
export LOGF=$ROOT/logs/backups.log
export DATE=$(date +%Y-%m-%d)

# Stop failover service
sudo systemctl stop neard-failover 
wait
echo "NEAR Failover node was stopped" | ts >> $LOGF

# Remove previous DATA files
rm -vf $DATA/* | ts >> $LOGF

# Restore from latest tar file
echo "Restore started" | ts >> $LOGF
cd $DATA >> $LOGF
LATEST=$(cat $BACKUPS/latest)
echo $LATEST | ts >> $LOGF
tar xvf $BACKUPS/$LATEST >> $LOGF
echo "Restore completed" | ts >> $LOGF

# We can now restart the failover node
sudo systemctl start neard-failover
echo "NEAR Failover node was started" | ts >> $LOGF
~~~
