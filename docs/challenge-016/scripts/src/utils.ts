/** yoctoNear -> NEAR tokens*/
export function toNears(yoctoNear: number) {
  return Math.round(yoctoNear / 10e23) || NaN;
}
