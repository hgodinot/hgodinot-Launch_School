function shift(array) {
  if (array.length === 0) return undefined;
  return array.splice(0, 1).pop();
}

function unshift(array, ...args) {
  for (i = 0; i < args.length; i += 1) {
    array.splice(i, 0, args[i]);
  }

  return array.length;
}

console.log(shift([1, 2, 3]));                // 1
console.log(shift([]));                       // undefined
console.log(shift([[1, 2, 3], 4, 5]));        // [1, 2, 3]

console.log(unshift([1, 2, 3], 5, 6));        // 5
console.log(unshift([1, 2, 3]));              // 3
console.log(unshift([4, 5], [1, 2, 3]));      // 3

const testArray = [1, 2, 3];
console.log(shift(testArray));                // 1
console.log(testArray);                       // [2, 3]
  console.log(unshift(testArray, 5, 6, 7));           // 5
  console.log(testArray);                       // [5, 6, 7, 2, 3]

