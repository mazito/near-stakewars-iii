# NEAR StakeWars III - Challenge-16

> Connect a node validator for sending notifications through Notifi.

> Notifi Network is a notifications provider for web3. In this challenge, you will test yourself on using the Notifi API to communicate when your staking is going lower than seat price.

### 1. Get credentials for Notifi service

Using the [Notifi network](https://notifi.network/) Discord we got the credentials:

![](./Selecci%C3%B3n_000.png)

### 2. Create the script for monitoring stake and seat price

The code will make an RPC call to the `validators` endpoint, and will:

- Login to Notifi service.
- Get the list of current validators.
- Get the list of next epoch validators.
- Calculate the next epoch seat price.
- Calculate the next epoch max seat price for chunk only producers.
- Get the current stake of this pool **idtcn2**.
- Evaluate if we are validating, if we are above seat price and if wer are a chunk only producer.
- Broadcast the message.

The code can be found in the `./scripts` folder.

Must install and build it before running it:
~~~
cd ./scripts
node i
npm run build
~~~

### 3. Test it sending notifications

Run the script:

![](./Selecci%C3%B3n_004.png)

### 4. Check received emails

![](./Selecci%C3%B3n_001.png)

![](./Selecci%C3%B3n_002.png)


### 5. Add to crontab

Create a script to run it every hour `run/notifi-stake.sh`:
~~~
#!/bin/bash
cd ~/notifi-integration
node build/index.js
~~~

And finally add it to crontab:
~~~
# Notifi stake
0 */1  * * * sh /home/ubuntu/run/notifi-stake.sh
~~~
![](./Selecci%C3%B3n_003.png)

