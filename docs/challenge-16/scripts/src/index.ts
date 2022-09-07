import {
  NotifiClient,
  NotifiEnvironment,
  createAxiosInstance,
} from '@notifi-network/notifi-node';
import axios from 'axios';
import { config } from "dotenv";
import { getValidators } from './rpc-calls';
import { toNears } from './utils';

config({ path: ".env" });
const { 
  NOTIFI_SID, NOTIFI_SECRET, NOTIFI_TOPIC, 
  POOL_ID, 
  NODE_IP, RPC_PORT 
} = process.env;

const env: NotifiEnvironment = "Development";
const axiosInstance = createAxiosInstance(axios, env);
const client = new NotifiClient(axiosInstance);

async function run() {

  const { token, expiry } = await client.logIn({ 
    sid: NOTIFI_SID as string, 
    secret: NOTIFI_SECRET as string 
  });
  console.log("Logged in to Notify");

  // Get current and next epoch validators
  const data = await getValidators(
    NODE_IP as string, 
    RPC_PORT as string
  );

  const currentValidators = data.result.current_validators;
  const nextValidators = data.result.next_validators;
  const TOTAL_VALIDATORS_COUNT = currentValidators.length;
  const CHUNK_PRODUCERS_START = 101;

  // Seat price is calculated using the Stake of last validator in 'next' set
  const seatPrice = toNears(nextValidators[TOTAL_VALIDATORS_COUNT-1]?.stake);

  // Needed stake below which we only produce chunks and not blocks, 
  // is defined by the stake of the 101 validator in the 'next' set
  const chunkProducerSeatPrice = toNears(nextValidators[CHUNK_PRODUCERS_START]?.stake);

  console.log(`Current validators
    validators= ${TOTAL_VALIDATORS_COUNT} 
    seat price= ${seatPrice.toFixed(2)} $N
    chunks producers seat price= ${chunkProducerSeatPrice.toFixed(2)} $N
  `);

  // Get my current pool stake
  const validator = nextValidators.find((t: any) => t.account_id === POOL_ID);
  if (!validator) {
    console.log(`Pool: ${POOL_ID}} 
      Not validating
    `);
    return;
  }
  
  // Evaluate status and prepare message
  const staked = toNears(validator.stake);
  const status = staked < seatPrice ? 'WARNING' : 'OK (above seat price)';
  const chunksOnly = staked < chunkProducerSeatPrice;
  const message = `Pool: ${POOL_ID} ${status} 
    | Is validator
    | stake= ${staked.toFixed(2)} $N
    | ${status ? 'Above seat price ('+seatPrice.toFixed(2)+' $N)' : 'Upps ! Falled off the seat'}
    | ${chunksOnly ? 'Chunks only producer' : 'Will produce blocks'}
  `;
  console.log(message);

  // Broadcast message using Notifi with stake values
  await client.sendBroadcastMessage(token, {
    topicName: NOTIFI_TOPIC as string,
    variables: [
      { key: "subject", value: `Validator ${POOL_ID} ${status}` },
      { key: "message", value: message }
    ],
  });
}

try { 
  run();
}
catch(err) {
  console.log(err)
}
