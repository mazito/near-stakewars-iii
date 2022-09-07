import axios from "axios";

export async function getValidators(ip: string, port: string) {
  const url = `http://${ip}:${port}`;
  const response = await axios.post(url, {
    jsonrpc: "2.0",
    id: "dontcare",
    method: "validators",
    params: [null],
  });
  return response.data;
}
