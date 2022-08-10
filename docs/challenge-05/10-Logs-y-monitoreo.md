# Logs y monitoreo

Para terminar de configurar nuestro nodo validador debemos agregar algunos logs que nos permitan ver como se ha ido comportando nuestro nodo a lo largo del tiempo, así como analizar su comportamiento en un cierto momento del tiempo:

### Logs

**1.** Crearemos un directorio `logs` para contener nuestros logs:

~~~
mkdir ~/logs
~~~

**2.** Crearemos un script `node-status.sh` para tomar **el estado de nuestra propuesta, el estado del nodo mientras está validando y finalmente verificar si estamos en la próxima epoch**:

~~~
#!/bin/sh
export NEAR_ENV=shardnet
export LOGFILE=/home/ubuntu/logs/node-status.log
export POOLID=idtcn2
export ACCOUNTID=mazito.shardnet.near

echo "---" >> $LOGFILE
date >> $LOGFILE
near proposals | grep $POOLID >> $LOGFILE
near validators current | grep $POOLID >> $LOGFILE
near validators next | grep $POOLID >> $LOGFILE
~~~

**3.** Crearemos un script `compares.sh` para **comparar como está funcionando nuestro nodo frente a otros nodos (peers)** que consideramos "confiables":

~~~
#/!bin/bash
. /home/ubuntu/.env
export LOGFILE="$LOGS/compares.log"
DTS=$(date +"%Y-%m-%d %T")

echo "---\n$(date)" >> $LOGFILE
near validators current --nodeUrl http://127.0.0.1:3030 | grep seat  >> $LOGFILE
echo "Ours:" >> $LOGFILE
echo "|$DTS $(near validators current --nodeUrl http://127.0.0.1:3030 | grep idtcn2)" >> $LOGFILE
echo "|$DTS $(near validators current --nodeUrl http://127.0.0.1:3030 | grep maz0)">> $LOGFILE
echo "Others:" >> $LOGFILE
echo "|$DTS $(near validators current --nodeUrl http://127.0.0.1:3030 | grep xxx1)" >> $LOGFILE
echo "|$DTS $(near validators current --nodeUrl http://127.0.0.1:3030 | grep xxx2)" >> $LOGFILE
echo "|$DTS $(near validators current --nodeUrl http://127.0.0.1:3030 | grep xxx3)" >> $LOGFILE
echo "|$DTS $(near validators current --nodeUrl http://127.0.0.1:3030 | grep xxx4)" >> $LOGFILE
echo "|$DTS $(near validators current --nodeUrl http://127.0.0.1:3030 | grep xxx5)" >> $LOGFILE
~~~

**4**. Finalmente los agregamos a nuestro `crontab` para que ejecuten cada 10 minutos.
~~~
crontab -e
~~~
~~~
# check node status every 10 mins
*/10 * * * * sh /home/ubuntu/run/node-status.sh
# 
# compare with some other known nodes
*/10 * * * * sh /home/ubuntu/run/compares.sh
~~~

Podemos ver una parte del `node-status.log` aquí:

![](./images/Selecci%C3%B3n_074.png)

Y una parte del `compares.log` aquí:

![](./images/Selecci%C3%B3n_075.png)

### Monitoreo

Para monitorear el estado de CPU, RAM, disco y red utilizamos la herramienta `bpytop` (similar a `top` pero más visualmente atractiva) que hemos instalada al inicio. Dispone de varios modos de visualización:

**1.** Focalizado en CPU (cores y threads), memoria, discos y tráfico de red.

![](./images/Selecci%C3%B3n_078.png)

**2.** Focalizado en los procesos que están corriendo (vemos `neard` al principio de la lista)
![](./images/Selecci%C3%B3n_077.png)

De estas vistas concluimos que estamos dentro de lo esperado y con capacidad remanente, sin picos apreciables en ninguno de estos aspectos.

### Herramientas adicionales

Como herramientas adicionales para verificar el estado de nuestros nodo, instalaremos `jq` que nos permite extraer información de una respuesta JSON, tal como las que regresan los puntos RPC del nodo (http://localhost:3030/...):

~~~
sudo apt install curl jq
~~~

Y probaremos algunos comandos útiles:

**1**. Verificar la versión de nuestro nodo

curl -s http://127.0.0.1:3030/status | jq .version

![](./images/Selecci%C3%B3n_080.png)

**2:** Verificar quiens nos delegaron y el stake de cada uno:

~~~
near view idtcn2.factory.shardnet.near get_accounts '{"from_index": 0, "limit": 10}' --accountId mazito.shardnet.near
~~~

![](./images/Selecci%C3%B3n_081.png)

**3.** Verificar la razón por la cual fuimos eliminados de la lista de validadores:

~~~
curl -s -d '{"jsonrpc": "2.0", "method": "validators", "id": "dontcare", "params": [null]}' -H 'Content-Type: application/json' 127.0.0.1:3030 | jq -c '.result.prev_epoch_kickout[] | select(.account_id | contains ("idtcn2"))' | jq .reason
~~~

![](./images/Selecci%C3%B3n_082.png)
Que no devuelve nada ya que no fuimos "Kicked out".

**4.** Verificar 'chunks' producidos y esperados:

~~~
curl -r -s -d '{"jsonrpc": "2.0", "method": "validators", "id": "dontcare", "params": [null]}' -H 'Content-Type: application/json' 127.0.0.1:3030 | jq -c '.result.current_validators[] | select(.account_id | contains ("idtcn2"))'
~~~
![](./images/Selecci%C3%B3n_083.png)

Vemos que hemos producido todos los 'chunks' esperados y seguimos en carrera 🥳 ! 

---

