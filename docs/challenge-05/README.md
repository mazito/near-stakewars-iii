
# NEAR StakeWars III - Challenge 05

- Challenge: **05**
- Autor: Mario A. Zito (mazito.shardnet.near) 
- Fecha: 10-Ago-2022
- Nodos: `idtcn2` (corriendo), `idtcn1`, `idtcn0`y `maz0` (suspendidos).

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

Aquí vamos entonces ! 

### Tareas 

- [Contratando un servidor dedicado](./01-Contratar-un-servidor-dedicado.md)

- [Acceder a nuestro servidor dedicado](./02-Accediendo-a-nuestro-servidor.md)

- [Instalar herramientas y nodo](./03-Instalar-herramientas-y-nodo.md)

- [Inicializar y sincronizar el nodo](./04-Inicializar-y-correr-el-nodo.md)

- [Configurar el nodo como un servicio](./05-Configurar-como-servicio.md).

- [Crear billetera en Shardnet](./06-Crear-billetera-en-shardnet.md)

- [Convertirse en validador](./07-Convertirse-en-validador.md)

- [Crear 'pool' y comenzar a validar](./08-Crear-pool-y-validar.md)

- [Renovar la propuesta](./09-Renovar-la%20propuesta-cada-hora.md) 

- [Logs y monitoreo](./10-Logs-y-monitoreo.md)

### Conclusiones

Hemos completado el **Challenge 05** hace ya algunos días y nuestro nodo está funcionando correctamente. Aquí damos nuestras conclusiones después de haber estado operando el nodo durante unos diez días:

- El paso a un servidor dedicado en IONOS ha sido un cambio sustancial, y hemos mantenido un uptime > 95 % desde que contratamos este servidor.
- El ancho de banda disponible es un factor crítico. Nuestro servidor dispone de una conexión de 1 Gbit/s exclusiva del mismo, sin límites de tráfico de entrada/salida. 
- En nuestra opinión el uso de una VPS no presenta ventajas frente a las opciones de servidores dedicados ("bare metal") existentes. En momentos de alto tráfico, una VPS que comparte recursos con otras VPS alojadas en el mismo hardware, puede perder bloques por congestión de tráfico de red en el alojamiento.
- Tanto IONOS como Hetzner demuestran funcionar en forma consistente, y ofrecen servidores dedicados de alta performance y costo razonable (entre 50 y 120 u$s/mes).  

Adjunto captura del [Scoreboard](https://openshards.io/shardnet-uptime-scoreboard/)

![](./images/Selecci%C3%B3n_085.png)

Donde vemos que ha estado funcionando 18 epochs sin perder ninguna, y con un uptime (al momento) del 96.46%.

