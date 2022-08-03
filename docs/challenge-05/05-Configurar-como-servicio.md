## Configurar el nodo como un servicio

Por ahora, nuestro nodo fue iniciado en la consola y quedo corriendo allí mientras termina de sincronizar. 

Pero esto no es práctico ya que si debemos reiniciar (reboot) el servidro es necesario inixar el nodo manualmente y otras varias desventajas.

Para ello, procederemos a instalarlo como un servicio (daemon) controlado por `systemd` que es el sistema de administración de servicios de Linux.

**1. Crear el archivo de configuración del servicio `neard`**

En la carpeta `/etc/systemd/system` vamos a crear un archivo `neard.service`. Comenzamos abriendo el editor:
~~~
sudo ne /etc/systemd/system/neard.service
~~~

Y una vez abierto copiamos lo siguiente:
~~~
[Unit]
Description=NEARd Daemon Service

[Service]
Type=simple
User=ubuntu
#Group=near
WorkingDirectory=/home/ubuntu/.near
ExecStart=/home/ubuntu/nearcore/target/release/neard --home /home/ubuntu/.near run
Restart=on-failure
RestartSec=30
KillSignal=SIGINT
TimeoutStopSec=45
KillMode=mixed

[Install]
WantedBy=multi-user.target
~~~

Guardamos el archivo y verificamos:

![](images/Selecci%C3%B3n_038.png)

<br/>

**2. Parar el nodo si esta corriendo en la terminal**

Este es un error muy común de mucha gente que inicia el nodo como servicio mientras todavía esta corriendo en la terminal y esto genera un error al tratar de abrir la base de datos.

Por lo tanto: **MUY IMPORTANTE: parar primero el nodo si todavía está corriendo en la terminal**

![](images/Selecci%C3%B3n_039.png)

<br/>

**3. Ahora podemos iniciar el servicio**

Comenzamos por habilitar el `neard` como servicio:
```
sudo systemctl enable neard
```

Ahora ya podemos arrancar el servicio;
```
sudo systemctl start neard
```

Y para conocer el status de nuestro servicio
~~~
sudo systemctl status neard
~~~

Como resultado:

![](images/Selecci%C3%B3n_040.png)

Vemos que nuestro nodo inicio correctamente.

<br/>

**4. Como ver el log generado por el nodo**

Para ver el log (colorizado además) debemos usar `journalctl`. Para ello:
~~~
sudo journalctl -n 100 -f -u neard | ccze -A
~~~

Veamos:

![](images/Selecci%C3%B3n_041.png)



**5. Detener el servicio**

Si por algún motivo debemos detener el servicio:
~~~
sudo systemctl stop neard
~~~

O si hay que hacer algún cambio al servicio debido a algún error en el archivo de configuración, debemos recagarlo:
~~~
sudo systemctl daemon-reload
~~~

---

Finalmente tenemos nuestro nodo corriendo correctamente. Nuestro próximo objetivo es comenzar a validar, para lo cual primero debemos [Crear nuestra billetera en Shardnet](./06-Crear-billetera-en-shardnet.md)
