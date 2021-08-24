function missing(array) {
  let missingNumbers = [];

  for (let i = array[0]; i < array.slice(-1); i += 1) {
    if (!array.includes(i)) missingNumbers.push(i);
  }

  return missingNumbers;
}

console.log(missing([-3, -2, 1, 5]));                  // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4]));                    // []
console.log(missing([1, 5]));                          // [2, 3, 4]
console.log(missing([6]));                             // []