let pop = arr => {
  if (arr.lenght === 0) return undefined;

  let removed = arr[arr.length - 1];
  arr.length = arr.length - 1;
  return removed;
}

let count = [1, 2, 3];
console.log(pop(count));             // 3
console.log(count);                  // [ 1, 2 ]

