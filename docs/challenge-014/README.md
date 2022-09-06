# Challenge-014

#### Description

In this challenge, participants will learn how to create, run, and modify the auto-backup node script.

For this challenge, we recommend using Bash, however, Python can be used as well.

#### Acceptance criteria

- Create a script for the auto-backup of your node
- Make a backup on your reserve node
- Modify the auto-backup script

# Steps taken

#### Wasabi account

[Wasabi](https://wasabi.com/) is a cloud storage compatible with AWS S3 but more cost efficient per Gb stored.

We have opened an account in Wasabi, and created a private bucket `near-stakewars-iii` to store our backups.

We will use [Rclone](https://rclone.org/) to upload files to Wasabi-

#### Install `rclone`

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

#### Create backup files

As we can see below, there is not much difference between compressed and uncompressed `tar` files. So we will create an uncompressed tar file because it is much faster.
![](./Selecci%C3%B3n_005.png)

~~~
#!/bin/bash

# Set environment
# Caution: the backups and logs folders must already exist
ROOT=/home/ubuntu
DATA=$ROOT/.near/data
BACKUPS=$ROOT/backups
LOGF=$ROOT/logs/backups.log

# Stop neard-failover service
sudo systemctl stop neard-failover 
wait
echo "NEAR Failover node was stopped" | ts >> $LOGF

# Remove previous files from backup folder
rm -rf $BACKUPS | ts >> $LOGF

# Create uncompressed tar file form current data dir and use DATE to stamp it
echo "Backup started" | ts >> $LOGF
DATE=$(date +%Y-%m-%d)
tar -cvf $BACKUPS/near-data-$DATE.tar $ROOT/.near/data/* | ts >> $LOGF
echo "near-data-$DATE.tar" > $BACKUPS/latest

echo "Backup completed" | ts >> $LOG

# Restar nerd-failover node
sudo systemctl start neard-failover
echo "NEAR Failover node was started" | ts >> $LOGF
~~~

#### Crontab for running at end of day

