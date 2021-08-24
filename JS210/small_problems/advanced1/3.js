function transpose(arr) {
  let result = [];

  arr.forEach((subarray, lineIdx) => {
    subarray.forEach((val, colIdx) => {
      if (result[colIdx]) {
        result[colIdx][lineIdx] = val;
      } else {
        result[colIdx] = [val];
      }
    })
  })

  return result;
}

console.log(transpose([[1, 2, 3, 4]]));            // [[1], [2], [3], [4]]
console.log(transpose([[1], [2], [3], [4]]));      // [[1, 2, 3, 4]]
console.log(transpose(transpose([[1]])));                     // [[1]]

console.log(transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]));
// [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]