
# Accediendo a nuestro servidor dedicado

Ya tenemos nuestro servidor contratado. Ahora deberemos esperar unos minutos hasta que el servidor este disponible. Pero no demasiado, al menos en mi caso el proceso de la orden fue muy rápido (unos quince minutos aprox.)

Debido a que este es un servidor "limpio" (bare metal), lo único que viene instalado es el Sistema operativo (Linux Ubuntu 20.04 en nuestro caso). Debemos entonces proceder a configurar el acceso al mismo.

Después de contratar, ya disponemos de nuestro panel de control al cual podemos ingresar en [login.ionos.com](https://login.ionos.com/) usando nuestras credenciales ingresadas al contratar:

![](images/Screenshot%20of%20Login%20-%20IONOS.jpg)

Después de algunas preguntas de seguridad (_recuerden guardar en lugar seguro los datos con los cuales crearon su cuenta, como el ZIP codes y otros, porque se los pregunta al momento de login_), nos lleva a una página de opciones:

![](images/ScreenshotofIONOSoptions.jpg)

Eligiendo la opción indicada, pasamos al Panel de control del servidor.

<br/>

### El panel de control ###

Este panel nos permite configurar muchos aspectos del funcionamiento de nuestro nuevo servidor:

![](images/Screenshot%20of%20Cloud%20Panel.jpg)

Probablemente debamos esperar unos minutos hasta que nuestro servidor este completamente disponible, pero es bastante rápido (unos 15 minutos aprox.). Seleccionando el servidor indicado, se abre una seccion con los detalles del mismo y acciones que podemos realizar (como parar el servidor o reiniciarlo):

![](images/Screenshot%20of%20Cloud%20Panel-2.jpg)

> :hand: Si al ingresar al panel de control, notan que el status del servidor no está en verde, tal como se muestra aquí:
![](images/Selecci%C3%B3n_010.png)
deberán esperar un poco más de tiempo hasta que esté disponible. No se preocupen, en el mismo panel les irá indicando el % de avance.

Los tres campos que nos importan por ahora son:

- `Host` la direccion IP pública de nuestro servidor.
- `root` es el usuario inicial con el cual se ha creado este servidor con permisos totales sobre el mismo.
- `Initial Password` es la contraseña inicial que nos han asignado y con la cual podremos ingresar al servidor.

> Nota: no explicaremos aquí como abrir una terminal/consola para operar desde la linea de comandos, ya que asumimos que alguien que pretende administrar un nodo validador debe tener al menos estos conocimientos mínimos. 

Abrimos una terminal para acceder a nuestro servidor y usamos `ssh` para ello:

![](images/Captura%20de%20pantalla%20de%202022-08-01%2023-05-28.png)

Y luego de ingresar la contraseña ya estamos en nuestro servidor !

![](images/Captura%20de%20pantalla%20de%202022-08-01%2023-08-00.png)

:clap: **Felicitaciones !** Pero aún nos queda algún trabajo para dejarlo en condiciones.

<br/>

### Crear un usuario adicional ###

Es una (muy) mala práctica trabajar dentro del servidor como usuario `root`, por lo cual crearemos un segundo usuario con permisos de administración. Lo llamaremos `ubuntu`. 

Los pasos son simples, y se describen bien en este tutorial [How To Create a New Sudo-enabled User on Ubuntu 20.04 [Quickstart]](https://www.digitalocean.com/community/tutorials/how-to-create-a-new-sudo-enabled-user-on-ubuntu-20-04-quickstart)

**1.** Dentro ya de la consola de nuestro servidor, ingresamos:
  ~~~
  $ adduser ubuntu
  ~~~
  donde nos preguntará la contraseña para dicho usuario:
  ~~~
  Enter new UNIX password: ...
  Retype new UNIX password: ...
  ~~~
  y (si todo está bien) responderá:
  ~~~
  passwd: password updated successfully
  ~~~

**2.** Luego, para dar permisos de administrador a este usuario, ingresamos en consola:
~~~
$ usermod -aG sudo ubuntu
~~~

**3.** Listo ! Salimos del servidor haciendo `exit` en la consola, y ya en la consola de nuestra PC podemos ingresar con nuestro nuevo usuario y contraseña:

~~~~
$ ssh ubuntu@74.123.123.123
~~~~

Ya estamos en nuestro servidor y listos para comenzar a armar nuestro nodo validador.

![](images/Captura%20de%20pantalla%20de%202022-08-01%2023-22-57.png)

> Para terminar de configurar correctamente nuestro servidor, deberíamos implementar el acceso via clave pública (ssh). No lo explicaremos aquí, pero este es un buen tutorial: [How To Set up SSH Keys on a Linux / Unix System](https://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/)

<br/>

### Pasos finales ###

**1. Habilitar puertos 3030 y 24567**

Finalmente debemos habilitar algunos puertos que son usados por el nodo validador, ya que el servidor viene inicialmente solo con los puertos `22 (ssh)`, `80 (hhtp)` y `443 (https)` habilitados.

Para ello en el Panel de control debemos abrir la solapa `Network` luego `Firewall Policies` y finalmente elegir nuestro servidor:

![](images/Screenshot%20of%20Cloud%20Panel-firewall.jpg)

Esto nos permite agregar los puertos `3030 (RPC)` y `24567 (peers)`que son usados por el nodo. Deberán quedar como se muestra más abajo:

![](images/Screenshot%20of%20Cloud%20Panel-ports.jpg)

**2. Cambia el nombre de tus servidor**

Resulta práctico asignar un nombre a tu servidor. De este modo si tienes más de un nodo corriendo te indicará siempre dentro de que nodo estás trabajando. El nombre elegido por mi para este nodo es `itdcn2`. 

Dentro de la consola de tu servidor haz:
~~~
$ sudo hostnamectl set-hostname idtcn2
~~~

Luego de ello, debes salir del servidor y volver a ingresar. Veamos como se verá ahora la consola del servidor:

![](images/Selecci%C3%B3n_001.png)

> :clap: **¡Muy bien!** Ya tienes tu servidor dedicado en marcha.

---

Ya estás listo para la próxima etapa [Instalar las herramientas y armar nuestro nodo validador](./03-Instalar-herramientas-y-nodo.md)
