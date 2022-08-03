
# NEAR StakeWars III

- Challenge: **05**
- Autor: Mario A .zito (mazito.shardnet.near) 
- Fecha: 2-Ago-2022
- Nodos: `idtcn2` (nuevo), `idtcn1` y `maz0`.

### Preliminares

Antes que nada, permítanme comentar que ya es el cuarto nodo que instalo, dos de estos nodos (`maz0` e `idtcn1`) estan funcionando desde los primeros días de las StakeWars, y también instalé uno en AWS que ya descarte por su alto costo. Aquí pretendo volcar la experiencia recopilada hasta el momento, y algunos trucos que aprendí en el camino.

#### Un aviso importante

> **Antes de continuar, y si aún no lo han hecho, es IMPRESCINDIBLE sumarse a Discord en el canal de NEAR [stake-wars-announcements](https://discord.com/channels/490367152054992913/999047336229617704) para mantenerse al tanto de cambios y novedades.**

#### Requisitos

Si bien no es imprescindible tener experiencia usando o administrando equipos bajo Linux, la dura realidad es que todo el software del nodo validador corre bajo Linux. Por ello, si nunca han usado Linux y desean participar, comiencen con algun tutorial de Linux primero y aprendan a usar algunos aspectos básicos:

- Uso de la consola y la línea de comandos
- Manejo de archivos y directorios 
- Actualizar e instalar software 
- Crear y editar archivos de configuración
- Crear y editar "scripts"
- Y algunas otras cosas que olvido pero que irán surgiendo luego ...

:warning: Esto es importante para no sobrecargar el [canal de soporte de las stake-wars](https://discord.com/channels/490367152054992913/999047336229617704) con preguntas MUY básicas (de las cuales he visto un montón) como por ejemplo _"¿Y cómo borro el directorio `data`?"_ **Se supone que si quieres administrar un nodo validador en NEAR, deberías ser capaz de buscar (googlear) y responder estas preguntas por tí mismo.**

### Contratar un servidor dedicado

Inicialmente comencé con dos servidores del proveedor Contabo (contabo.com). La experiencia no ha sido mala, pero supongo que el hecho de ser servidores virtuales compartidos (VPS) pueden tener algun efecto en momentos de mucho tráfico de red, y he notado que de repente se pierden "chunks". Todavía no esta clara la razón, y es algo que nos ha pasado a muchos que estamos participando. 

Pero ahora decidí probar con otro proveedor (IONOS) para evaluar alternativas a las ya tradicionales (AWS, GC, Azure, Hetzner). 

Aquí vamos entonces con la primer parte de este Challenge-005 [Contratando un servidor dedicado](./01-Contratar-un-servidor-dedicado.md)

### Accediendo a nuestro nuevo servidor

Ya tenemos nuestro servidor contratado. Ahora deberemos esperar unos minutos hasta que el servidor este disponible. Pero no demasiado, al menos en mi caso el proceso de la orden fue muy rápido (unos quince minutos aprox.)

Pasado ese tiempo, ya podemos comenzar y [Acceder a nuestro servidor dedicado](./02-Accediendo-a-nuestro-servidor.md)

> :hand: Si al ingresar al panel de control, notan que el status del servidor no está en verde, tal como se muestra aquí:
![](images/Selecci%C3%B3n_010.png)
deberán esperar un poco más de tiempo hasta que esté disponible. No se preocupen, en el mismo panel les irá indicando el % de avance.

### Instalar herramientas y contruir el nodo

Primero debo indicar que realizaré las tareas indicadas en las challenges en un orden un poco diferente, producto de que resulta más práctico realizar primero la instalación de todo el software y recién después proceder con los aspectos relacionados con el wallet y el pasar a convertirse en validador.

Para esta etapa, armé un conjunto de scripts que simplifican la instalación del nodo, sobre todo si es un proceso que debemos repetir más de una vez, ya que jecutar cada comando en forma individual resulta engorroso.

Los scripts en cuestión son:

- [scripts/install/update-and-needed.sh](../../scripts/install/update-and-needed.sh): actualiza el servidor e instala varias herramientas necesarias.

- [scripts/install/node-and-near-cli.sh](../../scripts/install/node-and-near-cli.sh): instala Nodejs y el cliente de NEAR.

- [scripts/install/build-tools.sh](../../scripts/install/build-tools.sh): instala las herramientas de desarrollo.

- [scripts/install/source-code.sh](../../scripts/install/source-code.sh): instala el codigo fuente de `nearcore`.

- [scripts/build-neard.sh](../../scripts/install/build-nerad.sh): compila el codigo usando el último commit recomendado.

- [scripts/install/initialize-workdir.sh](../../scripts/install/initialize-workdir.sh): inicializa el nodo y lo deja listo para comenzar a sincronizar con la red.

Pasamos entonces a [Instalar herramientas y nodo](./03-Instalar-herramientas-y-nodo.md)

### Inicializar y sincronizar el nodo

Habiendo completado la instalación y compilación del nodo, debemos inicializar su directorios de trabajo y sincronizarlo con el resto de la red.

Vayamos entonces a [Inicializar y sincronizar el nodo](./04-Inicializar-y-correr-el-nodo.md)


