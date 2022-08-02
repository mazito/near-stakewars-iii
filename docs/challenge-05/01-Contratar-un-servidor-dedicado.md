
# Contratando un servidor dedicado en IONOS

### Porqué un servidor dedicado (bare metal)

Como comenté antes para entender mejor como se comporta un nodo validador en NEAR, y sus reales requerimientos de hardware, decidí probar ahora con un servidor dedicado. 

El proveedor elegido fue [IONOS: www.ionos.com](https://www.ionos.com/servers/dedicated-servers), porque encontré buenos comentarios en [Trustpilot](https://es.trustpilot.com/review/ionos.com). 

El equipo seleccionado fue:

![](images/Selecci%C3%B3n_002.png)

Que cumple ampliamente con los requerimientos mencionados en [Challenge 002 - Server Requirements](https://github.com/near/stakewars-iii/blob/main/challenges/002.md#server-requirements).

![](images/Selecci%C3%B3n_008.png)

Pasamos a definir las opciones para nuestro servidor: elegimos `Linux` con `Ubuntu 20.04` y la región `United States` (esto puede ser importante para quedar cerca de los nodos/peers más frecuentes, muchos de los cuales estan en USA). No puedo asegurarlo pero parece que este es un factor que afecta la producción de chunks/bloques si tienes demoras en la respuestas de tus otros nodos pares (peers) con los cuales estás emparejado. Puedes ver este [incidente reportado y respuestas](https://github.com/near/stakewars-iii/issues/65)

![](images/Selecci%C3%B3n_003.png)

Si esta todo correcto vamos al paso siguiente:

![](images/Selecci%C3%B3n_004.png)

Continuamos:

![](images/Selecci%C3%B3n_005.png)

Y ahora comenzamos a crear nuestra cuenta en IONOS, ingresando tus datos personales, dirección, etc.

![](images/Selecci%C3%B3n_006.png)

:hand: **¡Este paso es importante!** 

![](images/Selecci%C3%B3n_007.png)

Elegido el equipo y sus opciones, y creada nuestra cuenta en IONOS pasamos al pago del mismo, que no detallaremos aquí. **Como aspecto importante vale mencionar que IONOS no requiere un pago mensual, sino que cobra por el tiempo de uso**: de este modo, si nos arrepentimos y deseamos probar otra cosa, podemos hacerlo sin grandes costos. 

Una vez finalizada la verificación de la tarjeta de crédito (no se cargará nada a la misma hasta el fin del periódo mensual en base al uso realizado), recibiremos un correo parecido a esto:

![](images/Selecci%C3%B3n_009.png)

Con lo cual ya terminamos el proceso de contratación del servicio.

### Costo total mensual

El costo total a fin de mes debería ser aprox. de **70 U$S/mes**, costo muy razonable para un servidor dedicado de estas características:

- AMD Ryzen™ 5 PRO 3600
- 6 cores/12 threads x 3.6 GHz
- max. 4.2 GHz Boost
- 32 GB RAM DDR4 ECC
- 2 x 480 GB SSD NVMe (Raid 1)
- 1 Gbit/s external bandwidth
- Unlimited traffic
- Linux Ubuntu 20.04
- Data center location: United States
- $0.0903 /hour max. $65/month

Contratado nuestro servidor pasamos a la siguiente etapa: [Como accederlo desde nuestra PC de escritorio](./02-Accediendo-a-nuestro-servidor.md).
