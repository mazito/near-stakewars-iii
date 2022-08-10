# Challenge 06

> Create a cron task on the machine running node validator that allows ping to network automatically.

Despues de haber realizado el `ping` inicial para que se nos incluya en la ronda de validadores, deberemos renovar nuestra propuesta con cierta frecuencia para continuar estando en las rondas siguientes.

En nuestro caso, renovaremos nuestra propuesta cada 1 hora.

> De acuerdo al tiempo que dure una epoch se debe ajustar la frecuencia con que renovamos nuestra propuesta

**1**. Crearemos un script `renew_proposal.sh` que se ocupe de la renovación y además registre el resultado en un log `proposals.log`

~~~
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
~~~

**2.** Agregamos nuestro script a `crontab` para que se ejecute cada una hora:

~~~
crontab -e
~~~
~~~
# m h  dom mon dow   command
# renew proposal every 1 hour
0 */1  * * * sh /home/ubuntu/run/renew-proposal.sh
#
~~~

**3.** Aquí podemos ver nuestras últimas propuestas (exitosas):

![](./images/Selecci%C3%B3n_086.png)

![](./images/Selecci%C3%B3n_087.png)

