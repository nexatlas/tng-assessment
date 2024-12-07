export const formatNumber = (number) => {
  return number?.toLocaleString();
};

export function truncateText(text, length) {
  let newText = text;
  if (text?.length > length) {
    newText = text?.slice(0, length);
    return newText + '...';
  }
  return newText;
}
