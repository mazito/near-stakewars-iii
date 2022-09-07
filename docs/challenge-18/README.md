# NEAR StakeWars III - Challenge-19

> We believe that in stake war the success of building the community is as important as running validators. So in this challenge, we would like you guys to make video tutorials about NEAR stake war and publish your video to the Internet to benefit latecomers.

> The topic of your video could be anything related to stake war, here are some suggestions that you might consider:

> - A brief introduction of the NEAR nightshade sharding, chunk-only producer and stake war.
> - How to setup a NEAR validator on major cloud service providers. (Maybe a step-by-step tutorial of the first 4 stake war challenges)
> - Setting up a validator is easy, but how to make it stable and always up-to-date might require more efforts. Do you have any tips that could be shared with others?

> We actually encourage you guys to record the video in your own language so that we could cover audiences from different regions around the world.

# Video link (Loom)

[NEAR Stake Wars III - mariozito.near (7 September 2022)](https://www.loom.com/share/2862c971e1bc44cbbf394e33d15fafb7)

# Intro

- Gracias por la oportunidad
- Mi background (builder empresas y software)
- Proyecto en NEAR (Identicon con Leandro Manzanal)
- GRACIAS ! NEAR Hispano y OpenWeb Academy
- Porqué participar 
- Desafíos (no devops !) 

# Github

#### https://github.com/mazito/near-stakewars-iii

# Discord

#### Near

https://discord.gg/2sdgbxb6

- stake-wars

- stake-wars-announcement

#### Open Shards Alliance

https://discord.gg/XSGRWaKJ

- testnet-updates

- testnet-support

#### Open Web Academy

https://discord.gg/Kd5BJDzM

- office-hours

# Tips and tricks

### Comunidad

- La Web3 es acerca de la comunidad 
- La comunidad es un punto CRÍTICO
- Uso de los canales de Discord
- Participar y ayudar (reputación <=> feedback)
- Interacción directa (DM) con otros participantes

### Hardware

- Uso de nodos "bare metal" (1 Gbit/sec?, 8 Cores, 32Gb, 500Gb SSD)
- No sobrecargar el nodo (tener amplio margen RAM/Bandwidth/Disco/CPU)
- Proveedores confiables: Hetzner, IONOS, AWS (aunque caro !)

### Nodo

- Disponer de herramientas listas para usar (nload, bpytop, ...)
- Comparativas permanentes (sts, next, props, jou)
- Logs historicos (básicos)
- Hacer scripts para todo lo frecuente (install, run)
- Pero NO sobre automatizar
- Mantener un nodo testigo (dos validadores: testigo y principal)
- Mantener nodo en testnet (ultimamente)
- Mantener release actualizado ! Analizar cuando actualizar (cambios de protocolo)
- Jugar con "config.json" cambiando cantidad max de peers y conexiones (nodo testigo)
- Balance entre cantidad total de peers y eficiencia del nodo
- Uso del RPC propio (http:127.0.0.1:3030)
- Analizar siempre (http://74.208.151.236:3030/debug)
- Monitoreo (Grafana/Prometheus)
- Scoreboard y Explorer (relativo)
