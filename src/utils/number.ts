export const formatNumber = (num: number) => {
  let value = "";
  if (num / 1000000000 > 1) {
    value = `${(num / 1000000000).toLocaleString()}b`;
  } else if (num / 1000000 > 1) {
    value = `${(num / 1000000).toLocaleString()}m`;
  } else if (num / 1000 > 1) {
    value = `${(num / 1000).toLocaleString()}k`;
  } else {
    value = `${num.toLocaleString()}`;
  }
  return value;
};
