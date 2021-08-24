function transpose(arr) {
  let result = [[], [], []];

  arr.forEach((subarray, lineIdx) => {
    subarray.forEach((val, colIdx) => {
      result[colIdx][lineIdx] = val;
    })
  })

  return result;
}

const matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
];

const newMatrix = transpose(matrix);

console.log(newMatrix);      // [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
console.log(matrix);         // [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
