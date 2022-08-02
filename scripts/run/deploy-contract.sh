
cd ~/nearcore
./target/release/neard --home ~/.near run

~~~
$ near call factory.shardnet.near create_staking_pool '{"staking_pool_id": "idtcn0", "owner_id": "idtcn0.shardnet.near", "stake_public_key": "ed25519:DYrA3pKS9SoKpXF7maSzjzSuZZ3CzYZRTUcDtdZok9V8", "reward_fee_fraction": {"numerator": 5, "denominator": 100},"code_hash":"DD428g9eqLL8fWUxv8QSpVFzyHi1Qd16P8ephYCTmMSZ"}' --accountId idtcn0.shardnet.near --amount=30 --gas=300000000000000

> near call factory.shardnet.near create_staking_pool '{"staking_pool_id": "idtcn0", "owner_id": "idtcn0.shardnet.near", "stake_public_key": "ed25519:DYrA3pKS9SoKpXF7maSzjzSuZZ3CzYZRTUcDtdZok9V8", "reward_fee_fraction": {"numerator": 5, "denominator": 100},"code_hash":"DD428g9eqLL8fWUxv8QSpVFzyHi1Qd16P8ephYCTmMSZ"}' --accountId idtcn0.shardnet.near --amount=30 --gas=300000000000000
Scheduling a call: factory.shardnet.near.create_staking_pool({"staking_pool_id": "idtcn0", "owner_id": "idtcn0.shardnet.near", "stake_public_key": "ed25519:DYrA3pKS9SoKpXF7maSzjzSuZZ3CzYZRTUcDtdZok9V8", "reward_fee_fraction": {"numerator": 5, "denominator": 100},"code_hash":"DD428g9eqLL8fWUxv8QSpVFzyHi1Qd16P8ephYCTmMSZ"}) with attached 30 NEAR
Doing account.functionCall()
Retrying request to broadcast_tx_commit as it has timed out [
  'FAAAAGlkdGNuMC5zaGFyZG5ldC5uZWFyAPnUFjcYR6H/3dp0jHPbe6XtnHkx4HOMNxUfqXikRXxABNqoJ8MAAAAVAAAAZmFjdG9yeS5zaGFyZG5ldC5uZWFycZiEKr7BOXSaEIcpNvSx3bnY2N3k7Al4VnGy6saK5KgBAAAAAhMAAABjcmVhdGVfc3Rha2luZ19wb29s+wAAAHsic3Rha2luZ19wb29sX2lkIjoiaWR0Y24wIiwib3duZXJfaWQiOiJpZHRjbjAuc2hhcmRuZXQubmVhciIsInN0YWtlX3B1YmxpY19rZXkiOiJlZDI1NTE5OkRZckEzcEtTOVNvS3BYRjdtYVN6anpTdVpaM0N6WVpSVFVjRHRkWm9rOVY4IiwicmV3YXJkX2ZlZV9mcmFjdGlvbiI6eyJudW1lcmF0b3IiOjUsImRlbm9taW5hdG9yIjoxMDB9LCJjb2RlX2hhc2giOiJERDQyOGc5ZXFMTDhmV1V4djhRU3BWRnp5SGkxUWQxNlA4ZXBoWUNUbU1TWiJ9AMBuMdkQAQAAAADe2AM8Qr/QGAAAAAAAAF9ZzoQ4ROfnKjOhAt06ozWCczRwhFRj9w0riD87rUTiFYcXpiBa37rlLP+FdXjJEXSFb7qIcaw934M+GxQ4vQU='
]
Receipts: 4pfQHL5M5zYTUhZ3v1ZQH2XBhSmQnCi3pLpdGaJBoLDt, JBdrnZhTWFYH3bkS7vT2uH6PY3CmTfzezVGWyR4DHCtt
	Log [factory.shardnet.near]: The staking pool @idtcn0.factory.shardnet.near was successfully created. Whitelisting...
Transaction Id Cdd2u9P3XXk5W96Aw9DSLesJRrXeYyE9caSJqnaA5MAV
To see the transaction in the transaction explorer, please open this url in your browser
https://explorer.shardnet.near.org/transactions/Cdd2u9P3XXk5W96Aw9DSLesJRrXeYyE9caSJqnaA5MAV
''
~~~

### Deposit
~~~
$ near call idtcn0.factory.shardnet.near deposit_and_stake --amount 5000 --accountId idtcn0.shardnet.near --gas=300000000000000

> Scheduling a call: idtcn0.factory.shardnet.near.deposit_and_stake() with attached 5,000 NEAR
Doing account.functionCall()
Retrying request to broadcast_tx_commit as it has timed out [
  'FAAAAGlkdGNuMC5zaGFyZG5ldC5uZWFyAPnUFjcYR6H/3dp0jHPbe6XtnHkx4HOMNxUfqXikRXxABtqoJ8MAAAAcAAAAaWR0Y24wLmZhY3Rvcnkuc2hhcmRuZXQubmVhciou+AiX7+jI3JIfAjQ+Bylmnco+g1PbpvNnSIKy0lK+AQAAAAIRAAAAZGVwb3NpdF9hbmRfc3Rha2UCAAAAe30AwG4x2RABAAAAAIgwgRIfL+cnEAAAAAAA12z9AHo+pPV+lb3h+YYQKzdmsmjg5pn8xIykMQrbSqVq+InG8pVTHtyUdzcaH9UVJGWTwzFFtqzXOYmeFQsxDg=='
]
Receipts: 6cgwBqWWvAbP6L1ojMoVBXZ9YjvzZxu3meStoNxqgpvp, 5Ld1RAg4zwyaVccLcGxgBNVWhcZVgDsrU6Te19mQxvJ8, 51rpJpqLjEMNAePAmWXqfgTxvGyqAFETni3pQCSTwwZn
	Log [idtcn0.factory.shardnet.near]: @idtcn0.shardnet.near deposited 5000000000000000000000000000. New unstaked balance is 5000000000000000000000000000
	Log [idtcn0.factory.shardnet.near]: @idtcn0.shardnet.near staking 5000000000000000000000000000. Received 5000000000000000000000000000 new staking shares. Total 0 unstaked balance and 5000000000000000000000000000 staking shares
	Log [idtcn0.factory.shardnet.near]: Contract total staked balance is 5029999999999999000000000000. Total number of shares 5029999999999999000000000000
Transaction Id H2d6w3GhrxVitbu7Uq5quRCnWAD1FTsvgBXhNxzdcGod
To see the transaction in the transaction explorer, please open this url in your browser
https://explorer.shardnet.near.org/transactions/H2d6w3GhrxVitbu7Uq5quRCnWAD1FTsvgBXhNxzdcGod
''
~~~

### Make proposal
~~~
$ near call idtcn0.factory.shardnet.near ping '{}' --accountId idtcn0.shardnet.near --gas=300000000000000

> Scheduling a call: idtcn0.factory.shardnet.near.ping({})
Doing account.functionCall()
Transaction Id BP7bSpjMZurvVi1cwaEjs69shfevJUue2ba1UPWkSpos
To see the transaction in the transaction explorer, please open this url in your browser
https://explorer.shardnet.near.org/transactions/BP7bSpjMZurvVi1cwaEjs69shfevJUue2ba1UPWkSpos
''
~~~

### Update Fee %
~~~
$ near call idtcn0.factory.shardnet.near update_reward_fee_fraction '{"reward_fee_fraction": {"numerator": 20, "denominator": 100}}' --accountId idtcn0.shardnet.near --gas=300000000000000

> Scheduling a call: idtcn0.factory.shardnet.near.update_reward_fee_fraction({"reward_fee_fraction": {"numerator": 20, "denominator": 100}})
Doing account.functionCall()
Transaction Id EgyS7KDkdFPnxyhwGmFw2VtE7eW8z8gaB3vHGZb7CUPD
To see the transaction in the transaction explorer, please open this url in your browser
https://explorer.shardnet.near.org/transactions/EgyS7KDkdFPnxyhwGmFw2VtE7eW8z8gaB3vHGZb7CUPD
''
~~~

near view idtcn0.factory.shardnet.near get_accounts '{"from_index": 0, "limit": 10}' --accountId idtcn0.shardnet.near


-----------------------------------------------------------------------------------------------------

# mazito

### Deploy contract ###
~~~
$ near call factory.shardnet.near create_staking_pool '{"staking_pool_id": "maz0", "owner_id": "mazito.shardnet.near", "stake_public_key": "ed25519:BC8AX8HEXhTXw8V2N6piQiAt9CkYQDe5HCJj4Zo2odSL", "reward_fee_fraction": {"numerator": 5, "denominator": 100},"code_hash":"DD428g9eqLL8fWUxv8QSpVFzyHi1Qd16P8ephYCTmMSZ"}' --accountId mazito.shardnet.near --amount=30 --gas=300000000000000
> Scheduling a call: factory.shardnet.near.create_staking_pool({"staking_pool_id": "maz0", "owner_id": "mazito.shardnet.near", "stake_public_key": "ed25519:BC8AX8HEXhTXw8V2N6piQiAt9CkYQDe5HCJj4Zo2odSL", "reward_fee_fraction": {"numerator": 5, "denominator": 100},"code_hash":"DD428g9eqLL8fWUxv8QSpVFzyHi1Qd16P8ephYCTmMSZ"}) with attached 30 NEAR
Doing account.functionCall()
Retrying request to broadcast_tx_commit as it has timed out [
  'FAAAAG1heml0by5zaGFyZG5ldC5uZWFyAH4n25/3imxpiEwTK5H3eE4EtEY/OjAs4wkwVjmQf75lgXfpGscAAAAVAAAAZmFjdG9yeS5zaGFyZG5ldC5uZWFynIFFq1WU/e8rVjOaT0uK1Sigy/rB5r6KZVP7HTiAEpkBAAAAAhMAAABjcmVhdGVfc3Rha2luZ19wb29s+QAAAHsic3Rha2luZ19wb29sX2lkIjoibWF6MCIsIm93bmVyX2lkIjoibWF6aXRvLnNoYXJkbmV0Lm5lYXIiLCJzdGFrZV9wdWJsaWNfa2V5IjoiZWQyNTUxOTpCQzhBWDhIRVhoVFh3OFYyTjZwaVFpQXQ5Q2tZUURlNUhDSmo0Wm8yb2RTTCIsInJld2FyZF9mZWVfZnJhY3Rpb24iOnsibnVtZXJhdG9yIjo1LCJkZW5vbWluYXRvciI6MTAwfSwiY29kZV9oYXNoIjoiREQ0MjhnOWVxTEw4ZldVeHY4UVNwVkZ6eUhpMVFkMTZQOGVwaFlDVG1NU1oifQDAbjHZEAEAAAAA3tgDPEK/0BgAAAAAAAC/R3qDcDjQkb3TUwxOdAFQ3gakyZgwp9TQequXuAsKviHmZfytzJcrKgT0ryjJep0x520kMGY7mRRnsL5WYU4B'
]
Receipts: 8gfj2tvTzPXqx8Tan9BAy1n9aLraL5L4tT9iHxwBoM6g, GQxS1JmMYo61uurPBj9ETkLP7XrRv8tYqbMvJqknz4a9
	Log [factory.shardnet.near]: The staking pool @maz0.factory.shardnet.near was successfully created. Whitelisting...
Transaction Id CNeBdexxc4g7cWouAGdYATvWt3xTJhVjsbH9QgUUft3k
To see the transaction in the transaction explorer, please open this url in your browser
https://explorer.shardnet.near.org/transactions/CNeBdexxc4g7cWouAGdYATvWt3xTJhVjsbH9QgUUft3k
''
~~~

### Deposit and stake ###
~~~
$ near call maz0.factory.shardnet.near deposit_and_stake --amount 1100 --accountId mazito.shardnet.near --gas=300000000000000
> Doing account.functionCall()
Retrying request to broadcast_tx_commit as it has timed out [
  'FAAAAG1heml0by5zaGFyZG5ldC5uZWFyAH4n25/3imxpiEwTK5H3eE4EtEY/OjAs4wkwVjmQf75lgnfpGscAAAAaAAAAbWF6MC5mYWN0b3J5LnNoYXJkbmV0Lm5lYXIGhX1Q2OOUyL2g6Z8fn4NJ4J03xmAHDatWbEmZRG2KLAEAAAACEQAAAGRlcG9zaXRfYW5kX3N0YWtlAgAAAHt9AMBuMdkQAQAAAADMD42YfA/mjQMAAAAAAK+PiioXGZB/H21raVlNzcsZxkKKq3Xp35NnmzGAf6DSyg6LMlqMzc8iUmmZ4dkqNcuFOEH7SPfrPJyzfDJvhgU='
]
Receipts: Ap1vYyuLkvzaCocrmRAkwLNjEEoozUQZjTW9FgNCj18J, 7vozNvsurbzzC1S1RuiesDrVnV5CdZFrukzwAakHbmcC, 6zwfVtamRUMvqHoZFZQ4if57sVu3m2Bg42Bc6yiK98MQ
	Log [maz0.factory.shardnet.near]: @mazito.shardnet.near deposited 1100000000000000000000000000. New unstaked balance is 1100000000000000000000000000
	Log [maz0.factory.shardnet.near]: @mazito.shardnet.near staking 1100000000000000000000000000. Received 1100000000000000000000000000 new staking shares. Total 0 unstaked balance and 1100000000000000000000000000 staking shares
	Log [maz0.factory.shardnet.near]: Contract total staked balance is 1129999999999999000000000000. Total number of shares 1129999999999999000000000000
Transaction Id 3zGwGSftNJ12QkFws8PZGfZACSmwCpt6saGU3m7JJnoQ
To see the transaction in the transaction explorer, please open this url in your browser
https://explorer.shardnet.near.org/transactions/3zGwGSftNJ12QkFws8PZGfZACSmwCpt6saGU3m7JJnoQ
''
~~~

### Proposal ###
~~~
$ near call maz0.factory.shardnet.near ping '{}' --accountId="mazito.shardnet.near" --gas=300000000000000

$ near proposals | grep maz0
~~~
