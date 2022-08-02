#!/bin/sh
# Ping call to renew Proposal added to crontab

export NEAR_ENV=shardnet
export LOGS=/home/ubuntu/logs
export POOLID=idtcn0
export ACCOUNTID=idtcn0

echo "---"
date
near proposals | grep $POOLID
near validators current | grep $POOLID
near validators next | grep $POOLID
