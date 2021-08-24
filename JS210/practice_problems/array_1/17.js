function lastElementOf(arr) {
  if (arr.length === 0) return undefined;
  return arr[arr.length - 1];
}

console.log(lastElementOf(['U', 'S', 'A']));  // returns "A"