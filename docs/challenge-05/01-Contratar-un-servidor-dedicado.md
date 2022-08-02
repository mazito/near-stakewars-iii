
# Contratando un servidor dedicado en IONOS

### Porqué un servidor dedicado (bare metal)

Como comenté antes para entender mejor como se comporta un nodo validador en NEAR, y sus reales requerimientos de hardware, decidí probar ahora con un servidor dedicado. 

El proveedor elegido fue [IONOS](https://www.ionos.com/servers/dedicated-servers), porque encontré buenos comentarios en [Trustpilot](https://es.trustpilot.com/review/ionos.com). 

El equipo seleccionado fue:

![](images/Screenshot%20of%20AMD%20Servers%20_%20Ryzen%20Pro%20and%20Epyc%20_%20IONOS.jpg)

Que cumple ampliamente con los requerimientos mencionados en [Challenge 002 - Server Requirements](https://github.com/near/stakewars-iii/blob/main/challenges/002.md#server-requirements).

Y para finalizar la configuración, elegimos `Linux` con `Ubuntu 20.04` y la región `United States` (esto puede ser importante para quedar cerca de los nodos/peers más frecuentes, muchos de los cuales estan en USA). No puedo asegurarlo pero parece que este es un factor que afecta la producción de chunks/bloques si tienes demoras en la respuestas de tus otros nodos pares (peers) con los cuales estás emparejado. Puedes ver este [incidente reportado y respuestas](https://github.com/near/stakewars-iii/issues/65)

![](images/Screenshot%20of%20https___www.ionos.com_server-configurator___sendingdata%3D1%26cart.action%3Dadd-bundle%26cart.bundle%3Dtariff-bmc-arl-32-ssd-bundle%26packageselecti%20....jpg)

Elegido el equipo y sus opciones pasamos al pago del mismo, que no detallaremos aquí. **Como aspecto importante vale mencionar que IONOS no requiere un pago mensual, sino que cobra por el tiempo de uso**: de este modo, si nos arrepentimos y deseamos probar otra cosa, podemos hacerlo sin grandes costos. 

Una vez finalizada la verificación de la tarjeta de crédito (no se cargará nada a la misma hasta el fin del periódo mensual en base al uso realizado), recibiremos un correo parecido a esto:

![](images/Screenshot%20of%20Your%20Contract%20Confirmation%20-%20mazito.v2%40gmail.com%20-%20Gmail.jpg), con lo cual ya terminamos el proceso de contratación del servicio.

### Costo total mensual

El costo total a fin de mes debería ser aprox. de **70 U$S/mes**, costo muy razonable para un servidor dedicado de estas características:

- AMD Ryzen™ 5 PRO 3600
- 6 cores/12 threads x 3.6 GHz
- max. 4.2 GHz Boost
- 32 GB RAM DDR4 ECC
- 2 x 480 GB SSD NVMe (Raid 1)
- Linux Ubuntu 20.04
- Data center location: United States
- $0.0903 /hour max. $65/month

Contratado nuestro servidor pasamos a lo siguiente, como accederlo desde nuestra PC de escritorio.
