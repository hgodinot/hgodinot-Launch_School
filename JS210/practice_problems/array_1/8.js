let shift = arr => {
  let removed = arr[0];

  if (arr.length === 0) return undefined;
  
  for (let i = 0; i < arr.length; i += 1) {
    arr[i] = arr[i + 1];
  }

  arr.length -= 1;
  return removed;
}

let count = [1, 2, 3];
console.log(shift(count));           // 1
console.log(count);                  // [ 2, 3 ]