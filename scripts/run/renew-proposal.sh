#!/bin/sh
# Ping call to renew Proposal added to crontab

export NEAR_ENV=shardnet
export LOGS=/home/ubuntu/logs
export POOLID=idtcn2
export ACCOUNTID=mazito.shardnet.near

echo "---" >> $LOGS/proposals.log
date >> $LOGS/proposals.log
near call $POOLID.factory.shardnet.near ping '{}' --accountId $ACCOUNTID --gas=300000000000000 >> $LOGS/proposals.log

# report general status when we renew
near proposals | grep $POOLID >> $LOGS/proposals.log
near validators current | grep $POOLID >> $LOGS/proposals.log
near validators next | grep $POOLID >> $LOGS/proposals.log
