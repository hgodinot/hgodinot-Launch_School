let concat = (arr1, arr2) => {
  let concatArray = [];
  
  [arr1, arr2].forEach(function(arr) {
    for (let i = 0; i < arr.length; i += 1 ) {
      concatArray.push(arr[i]);
    }
  })

  return concatArray;
}


console.log(concat([1, 2, 3], [4, 5, 6]));       // [ 1, 2, 3, 4, 5, 6 ]
console.log(concat([1, 2, 3, 3.5], [4, 5, 6]));
console.log(concat([1, 2, 3], [4, 5, 6, 7]));
