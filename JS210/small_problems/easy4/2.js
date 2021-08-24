function union(...arr) {
  let result = [];

  arr.forEach(subarr => subarr.forEach(val => {
    if (!result.includes(val)) result.push(val);
  }));
  
  return result;
}

console.log(union([1, 3, 5], [3, 6, 9]));    // [1, 3, 5, 6, 9]
console.log(union([1, 3, 1, 5], [3, 6, 5, 9]));    // [1, 3, 5, 6, 9]