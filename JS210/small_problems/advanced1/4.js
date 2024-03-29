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

let rotate90 = arr => transpose(arr).map(subArray => subArray.reverse());

const matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6],
];

const matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8],
];

const newMatrix1 = rotate90(matrix1);
const newMatrix2 = rotate90(matrix2);
const newMatrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))));

console.log(newMatrix1);      // [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
console.log(newMatrix2);      // [[5, 3], [1, 7], [0, 4], [8, 2]]
console.log(newMatrix3);      // `matrix2` --> [[3, 7, 4, 2], [5, 1, 0, 8]]