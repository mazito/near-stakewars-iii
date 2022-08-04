#!/bin/sh
export NEAR_ENV=shardnet
export LOGS=/home/ubuntu/logs/node-status.log
export POOLID=idtcn2
export ACCOUNTID=idtcn0

echo "---" >> $LOGS
date
near proposals | grep $POOLID  >> $LOGS
near validators current | grep $POOLID  >> $LOGS
near validators next | grep $POOLID  >> $LOGS

