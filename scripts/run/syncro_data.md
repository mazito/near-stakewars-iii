Español

1. primero parar el run porque hay que sincronizar de otro modo
2. luego  en .near hace mv data data2
3. despues bajarse `sudo apt install awscli`
4. `cd .near`
5. bajarse data `aws s3 --no-sign-request cp s3://build.openshards.io/stakewars/shardnet/data.tar.gz .`
6. descomprimir `tar -xzvf data.tar.gz`
7. largar neard `~/nearcore/target/release/neard --home ~/.near run`
8. luego de esto sincroniza muuuuucho mas rapido
9. despues de eso deploy contract , stake y ping

The steps now:
1. stop the running neard: `sudo systemctl stop neard`
2. download AWSCLI: `sudo apt install awscli`
3. `cd ~/.near` 
4. `mv data data2`
5. download: `aws s3 --no-sign-request cp s3://build.openshards.io/stakewars/shardnet/data.tar.gz .`
6. unzip: `tar -xzvf data.tar.gz`
7. start: `~/nearcore/target/release/neard --home ~/.near run`
8. after that synchro will be muuuuhc faster
9. after that deploy contract , stake and ping

