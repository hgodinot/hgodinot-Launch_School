function uniqueElements(arr) {
  let result = [];

  arr.forEach(function(val) {
    if (!result.includes(val)) result.push(val);
  })

  return result;
}

console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4]));  // returns [1, 2, 4, 3, 5]