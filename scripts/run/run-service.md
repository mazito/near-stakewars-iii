
# Instalar `neard`como servicio

Abrir archivo
```
sudo ne /etc/systemd/system/neard.service
```

Copiar en el archivo y guardar
```
[Unit]
Description=NEARd Daemon Service

[Service]
Type=simple
User=ubuntu
#Group=near
WorkingDirectory=/home/ubuntu/.near
ExecStart=/home/ubuntu/nearcore/target/release/neard run
# @MAZ - infamous patch because log goes to stderr
#StandardOutput=file:/home/ubuntu/.near/neard.log
#StandardError=file:/home/ubuntu/.near/nearderror.log
Restart=on-failure
RestartSec=30
KillSignal=SIGINT
TimeoutStopSec=45
KillMode=mixed

[Install]
WantedBy=multi-user.target
```

Para habilitar el `neard` como servicio:
```
sudo systemctl enable neard
```

Arrancar el servicio;
```
sudo systemctl start neard
```

Parar el servicio;
```
sudo systemctl stop neard
```

If you need to make a change to service because of an error in the file. It has to be reloaded:
```
sudo systemctl daemon-reload
```

Watch logs
```
sudo journalctl -n 100 -f -u neard
```

Make log output in pretty print
```
sudo apt install ccze
```

View Logs with color
```
sudo journalctl -n 100 -f -u neard | ccze -A
```

# Crontab

Para repetir el Ping cada hora, crear el script `renew_propsal.sh`
~~~
#!/bin/sh
# Ping call to renew Proposal added to crontab

export NEAR_ENV=shardnet
export LOGS=/home/ubuntu/logs
export POOLID=idtcn0
export ACCOUNTID=idtcn0

echo "---" >> $LOGS/all.log
date >> $LOGS/all.log
near call $POOLID.factory.shardnet.near ping '{}' --accountId $ACCOUNTID.shardnet.near --gas=300000000000000 >> $LOGS/all.log
near proposals | grep $POOLID >> $LOGS/all.log
near validators current | grep $POOLID >> $LOGS/all.log
near validators next | grep $POOLID >> $LOGS/all.log
```

Luego para agregar al `crontab`
```
crontab -e
```

Y luego agregar la linea:
```
0 */1  * * * sh /home/ubuntu/renew_proposal.sh
```
