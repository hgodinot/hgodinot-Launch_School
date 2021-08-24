function matrixSums(arr) {
  return arr.map(subArr => subArr.reduce((acc, el) => acc + el));
}

console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]]));  // returns [15, 60, 12]

/*
Or the longer version:

function matrixSums(arr) {
  return arr.map(function(subAr) {
    return subAr.reduce(function(acc, el) {
      return acc + el;
    })
  })
}
*/
