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
