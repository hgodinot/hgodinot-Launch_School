function merge(arr1 = [], arr2 = []) {
  let result = [];
  let copy1 = arr1.slice();
  let copy2 = arr2.slice();
  
  while (copy1.length > 0 && copy2.length > 0) {
    result.push(copy1[0] <= copy2[0] ? copy1.shift() : copy2.shift());
  }

  return result.concat(copy1.length === 0 ? copy2 : copy1);
}

function mergeSort(array) {
  let result = [];

  for (i = 0; i < array.length; i += 2) {
    result.push(array.slice(i, i + 2))
  }

  if (array.length % 2 === 1) array.push([array.slice(-1)])

  result = result.map(subarray => subarray.map(val => [val]))
                 .map(subarray => merge(subarray[0], subarray[1]));
  
  while (Array.isArray(result[1])) result.splice(0, 2, merge(result[0], result[1]));
  
  return result[0];
}


console.log(mergeSort([9, 5, 7, 1]));           // [1, 5, 7, 9]
console.log(mergeSort([5, 3]));                 // [3, 5]
console.log(mergeSort([6, 2, 7, 1, 4]));        // [1, 2, 4, 6, 7]

console.log(mergeSort(['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie']));
// ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]

console.log(mergeSort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]));
// [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]