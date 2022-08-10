# Convertirse en validador

Ahora sigue una serie de pasos que debemos dar con cuidado, ya que de su éxito depende que podamos ingresar al conjunto de validación.

**1. Login con la cuenta que sera la dueña del `staking pool`**

> **IMPORTANTE** Aquí usaremos nuestra cuenta `mazito.shardnet.near` con la cual ya hemos creado otros nodos. Lo hacemos así para participar con solamente una cuenta tal como lo solicitan las reglas.

~~~
near login
~~~

![](images/Selecci%C3%B3n_049.png)

Copiamos en nuestro navegador 
~~~
https://wallet.shardnet.near.org/login/?referrer=NEAR+CLI&public_key=ed25519%3A66H15Dz8YDrakVsvWcoQj5mS8Qrz5aBGKFErq4jnmkB&success_url=http%3A%2F%2F127.0.0.1%3A5000
~~~

Donde nos aparece la billetera para que autorizemos a `mazito.shardnet.near`:

![](images/Selecci%C3%B3n_050.png)

Y seguimos los pasos indicados:

![](images/Selecci%C3%B3n_051.png)

![](images/Selecci%C3%B3n_052.png)

![](images/Selecci%C3%B3n_053.png)

![](images/Selecci%C3%B3n_054.png)

Finalmente copiamos el nombre de nuestra cuenta en la consola de nuestro servidor:

![](images/Selecci%C3%B3n_055.png)

Y ya estamos logeados con nuestra cuenta. 

**2. Verificar la cuenta**

Veamos si en la carpeta `~/.near-credentiales/shardnet` aparece el archivo que contiene nuestras credenciales:
~~~
ls ~/.near-credentials/shardnet/
~~~

![](images/Selecci%C3%B3n_056.png)

¡Muy bien! Ya estamos logeados con nuestra cuenta en el servidor.


**3. Crear claves del validador**

> :hand: En este momento, necesitamos definir un nombre para nuestro `staking pool`. Este nombre es el POOLID y lo usaremos mucho de aquí en adelante. En mi caso, el nombre que he asignado es `idtcn2`. Por supuesto pueden definir el nombre que consideren más adecuado

Ahora **vamos a generar una nueva clave para el nodo validador, ya que este pool todavía no existe**. Esta clave sera la famosa `validator_key` que debe tener todo nodo validador para poder ingresar al conjunto de validadores.

Necesitamos el nombre del pool (POOLID) que en nuestro caso será `idtcn2`:
~~~
cd ~
near generate-key idtcn2
~~~
![](images/Selecci%C3%B3n_057.png)

Veamos si fue creada en la carpeta `~/.near-credentials/shardnet`:
![](images/Selecci%C3%B3n_058.png)

Y veamos su contenido:
![](images/Selecci%C3%B3n_059.png)

Como podemos ver, se ha creado un archivo `idtcn2.json` (el nombre de nuestro pool) y que contiene las claves del mismo.

**4. Copiar a ~/.near y retocar**

> :hand: Ahora debemos ser cuidadosos, ya que este paso es importante y ha generado muchos errores y preguntas en el Discord de consultas.

Copiamos nuestro archivo `idtcn2.json` a la carpeta `~/.near` PERO CON UN NUEVO NOMBRE, QUE DEBERÁ SER `validator_key.json`.

~~~
cp ~/.near-credentials/shardnet/idtcn2.json ~/.near/validator_key.json
~~~

Y ahora debemos modificar el archivo copiado, para lo cual abrimos el editor:
~~~
ne ~/.near/validator_key
~~~

Y lo modificamos de la siguiente manera:
![](images/Selecci%C3%B3n_060.png)

Veamos como debe quedar depues de las modificaciones:
![](images/Selecci%C3%B3n_061.png)

**5- Reiniciar el nodo**

Ya estamos en condiciones de volver a iniciar nuestro nodo.

~~~
# Restart it
sudo systemctl restart neard

# Check status
sudo systemctl restart neard
~~~
![](images/Selecci%C3%B3n_062.png)

Y veamos el log ahora:
![](images/Selecci%C3%B3n_063.png)

:clap: ¡Muy bien! Ya está nuestro nodo corriendo nuevamente.

---

Pasamos ahora a [Crear el staking pool para comenzar a validar](./08-Crear-pool-y-validar.md).
