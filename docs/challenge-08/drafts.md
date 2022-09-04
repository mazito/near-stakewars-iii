CONTRACT_ID=mazito.shardnet.near

near deploy mazito.shardnet.near --wasmFile target/wasm32-unknown-unknown/release/contract.wasm

near call $CONTRACT_ID new '{"staking_pool_account_id": "idtcn2.factory.shardnet.near", "owner_id":"mazito.shardnet.near", "reward_receivers": [["maz661.shardnet.near", {"numerator": 3, "denominator":10}], ["maz66a.shardnet.near", {"numerator": 70, "denominator":100}]]}' --accountId $CONTRACT_ID

near call $CONTRACT_ID withdraw '{}' --accountId $CONTRACT_ID --gas 200000000000000

Call
~~~
CONTRACT_ID=mazito.shardnet.near

near call $CONTRACT_ID withdraw '{}' --accountId $CONTRACT_ID --gas 200000000000000
~~~

Response
~~~
Scheduling a call: mazito.shardnet.near.withdraw({})
Doing account.functionCall()
Retrying request to broadcast_tx_commit as it has timed out [
  'FAAAAG1heml0by5zaGFyZG5ldC5uZWFyAAFN3pfz3dVgcu2nmwp6G20nXJ1q+nlH0eZ4kct7cpIAiytGgJABAAAUAAAAbWF6aXRvLnNoYXJkbmV0Lm5lYXI0Nu+CHovHKHV3BLMjbIB2Noo1Nc5+sQuL6RMeooQubgEAAAACCAAAAHdpdGhkcmF3AgAAAHt9AID0IOa1AAAAAAAAAAAAAAAAAAAAAAAAAO9drjVECSZAo65myKYd4RALjinocznqRCWkz88Yr2BV8NHDNMAakBZIbAN9FnOn65dRVrgWthrsPyZHjbbjRgA='
]
Receipts: Fybe16wUyYqoP5frFYmNzxV97B9YMxFCroLMXEyt6JTk, As5FRqz8gx86TDG1V4vSMroJiCgFJVVYoaTsDXNXf2fS, 6KBZ3Bh3a6FNa9voUaa9XESBTuj7i8h3tQTzWXuRn5ef
	Log [mazito.shardnet.near]: Withdrawing from staking pool: 4700420154418694092055999455
Receipts: 91VJgFhED1GwVczo1JM84hMFmfZp86qGQLkJ9Xmt8bBZ, 8yDV2thxAhuFSG1TMrPNsCMCbvV5KL8Gk9ZuUB6TLpM4
	Log [mazito.shardnet.near]: @mazito.shardnet.near withdrawing 4700420154418694092055999455. New unstaked balance is 0
Receipts: Fv2BtiVX64W4qNP7nEi92p2aisCNUkko9ETZkBwkNoyA, DaKQ7XiQkymyiv7eKgWGwt1SEs9BvcjcaKf3n31UvSVt, 8UrxGYLj1196drRCdTKN5uQCJGWvHQADuLSdsQ9Ze36K, 9z6ohZT64qmXv8YCnZtsvGn2hmWtF3hLaWTy7qsemATx
	Log [mazito.shardnet.near]: Withdraw success! Received unstaked rewards: 4700420154418694092055999455
	Log [mazito.shardnet.near]: Sending 1410126046325608227616799836 to maz661.shardnet.near
	Log [mazito.shardnet.near]: Sending 3290294108093085864439199618 to maz66a.shardnet.near
	Log [mazito.shardnet.near]: Unstaking all from staking pool
Receipts: 9WJ3cACtLwg2fMQSEayPrkxAQF8S6GZKg9JJ6tLiFwkd, E1TrzHbYb9qKkshuKDk9YG86Taj7zvkQi8AY8JJw3JCX, FfyuQ5yEeYUGeWdGJ9vYvtQiZUKeL6LpTGCKa8UujqXd
	Log [mazito.shardnet.near]: @mazito.shardnet.near unstaking 2455695737621293402244298883. Spent 2256898101041865990280656807 staking shares. Total 2455695737621293402244298883 unstaked balance and 0 staking shares
	Log [mazito.shardnet.near]: Contract total staked balance is 107208689302743273131677688082. Total number of shares 98529750080896451674590199032
Transaction Id 64eLzuaWe4VQaEJTEhrhCHZiyTAVjbyhT6kXxAT3aK7P
To see the transaction in the transaction explorer, please open this url in your browser
https://explorer.shardnet.near.org/transactions/64eLzuaWe4VQaEJTEhrhCHZiyTAVjbyhT6kXxAT3aK7P
''
~~~


