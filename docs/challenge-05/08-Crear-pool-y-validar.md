# Crear 'pool' y comenzar a validar

### 1. Crear el staking pool (create_staking_pool)

> :hand: ANTES de crear el pool, necesitamos un dato adicional, la `public_key` de nuestro nodo validador. Esta se encuentra en el archivo `~/.near/validator_key.json`, y lo extraeremos de allí.

~~~
cat ~/.near/validator_key.json
~~~
![](images/Selecci%C3%B3n_064.png)

Entonces, antes de crear el pool, veamos:

- El ID del pool (staking_pool_id) es `idtcn2`
- La clave pública del pool (stake_public_key) es `ed25519:FqJzDrtHgzWjp2rX4yupv44PRF6jZUygtwJD5oscdSce`
- El nombre completo del pool `idtcn2.factory.shardnet.near`
- La cuenta _dueña_ (owner_id) del pooles `mazito.shardner.near`
- La cuenta que firma la transacción (accountId) es también `mazito.shardner.near`
- El porcentaje que tomará (numerator) el pool es `20` %
- El monto que necesitamos tener disponible (amount) en la cuenta para crear es de `30` NEAR

Con estos datos ya podemos crear nuestro **staking  pool**:
~~~
near call factory.shardnet.near create_staking_pool '{"staking_pool_id": "idtcn2", "owner_id": "mazito.shardnet.near", "stake_public_key": "ed25519:FqJzDrtHgzWjp2rX4yupv44PRF6jZUygtwJD5oscdSce", "reward_fee_fraction": {"numerator": 20, "denominator": 100}, "code_hash":"DD428g9eqLL8fWUxv8QSpVFzyHi1Qd16P8ephYCTmMSZ"}' --accountId="mazito.shardnet.near" --amount=30 --gas=300000000000000
~~~

Podemos ver que el pool fue creado:
![](images/Selecci%C3%B3n_065.png)

Si vamos a [la transacción en Shardnet Explorer](https://explorer.shardnet.near.org/transactions/8RVAdK5iyLyY8ry9gM4Mpo9EtFc2YxXkbMBeNBqFxU5t) podemos ver que fue realizada y exitosa: 
![](images/Selecci%C3%B3n_066.png)


### 2. Cargar fondos en el pool (deposit_and_stake)

Teniendo nuestro pool ya creado, ahora debemos agregarle fondos. 

> :pray: Para saber cual es el monto mínimo que necesitamos depositar, debemos consultar el "precio del asiento" para ser aceptado en la mesa de los validadores.

Para ello, podemos consultar y filtrar:
~~~
near validators current | grep "seat price"
~~~
![](images/Selecci%C3%B3n_067.png)

Bueno, parece que ha crecido ! Actualmente es `988 NEAR`. Vamos a depositar un monto algo mayor para poder entrar en las siguientes rondas. 

Veamos los parámetros que vamos a enviar:

- El nombre completo del pool `idtcn2.factory.shardnet.near`
- La cuenta que firma la transacción (accountId) es `mazito.shardnet.near`
- El monto que depositaremos (amount) en la cuenta es de `2112` NEAR

Vamos a depositar ahora:
~~~
near call idtcn2.factory.shardnet.near deposit_and_stake --amount="2112" --accountId="mazito.shardnet.near" --gas=300000000000000
~~~
![](images/Selecci%C3%B3n_068.png)

Verificamos [la transacción en Shardnet Explorer](https://explorer.shardnet.near.org/transactions/GWBSKjfjYGx1PD1t6HKqS8CXV4byavD6WyvzXgh9L2w5):

![](images/Selecci%C3%B3n_069.png)

### 3. Hacer la propuesta (ping)

¡Ya estamos MUY cerca! Solo nos falta hacer la propuesta para que tengamos la oportunidad de validar en futuras rondas. 

Veamos los parámetros que vamos a enviar:

- El nombre completo del pool `idtcn2.factory.shardnet.near`
- La cuenta que firma la transacción (accountId) es `mazito.shardnet.near`

~~~
near call idtcn2.factory.shardnet.near ping '{}' --accountId="mazito.shardnet.near" --gas=300000000000000
~~~
![](images/Selecci%C3%B3n_070.png)

Verificamos [la transacción en Shardnet Explorer](https://explorer.shardnet.near.org/transactions/EpT5cDMiyPpPHTN2JR7CVV4EZ9PSGoJmM5xu4LxmmsKr):

![](images/Selecci%C3%B3n_071.png)


Podemos ver que nuestra propuesta fue aceptada mirando en la lista de propuestas:
~~~
near proposals
~~~
![](images/Selecci%C3%B3n_072.png)

### 4. Esperar las próximas rondas (epoch)

Veamos si nos van a incluir :pray: en la próxima ronda ...
~~~
near validators next | grep "idtcn2"
~~~
![](images/Selecci%C3%B3n_073.png)

> :cry: Efectivamente no estamos allí todavía. Pero no desesperemos porque esto es normal. NUNCA serás incluido inmediatamente después de la propuesta. En general deberás esperar una ronda más y luego, sin dudas (si el precio del asiento lo permite) comenzarás a validar.

---

Hemos llegado hasta aquí después de un largo viaje. Es momento que tomemos un pequeño descanso antes de dar algunos pasos adicionales que son necesarios para mantenernos en la lista de validadores. 

Después de ello veremos como [Renovar la propuesta cada hora](./09-Renovar-la%20propuesta-cada-hora.md)
