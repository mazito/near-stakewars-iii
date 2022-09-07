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
ubuntu@idtcn3:~$ cat run/restore-near-data.sh 
#!/bin/bash
# Restore from latest backup 
